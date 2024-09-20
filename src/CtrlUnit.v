// `timescale 1ns / 1ps
`include "src/wasm_defines.vh"
`include "src/LEB128_uint32_decode.v"

module CtrlUnit(
        input clk,
        input rst_n,

        input [`instr_read_width-1:0] Instr,
        input Instr_vld,
        output reg [`log_read_window_size-1:0] read_pointer_shift_minusone,
        output reg shift_vld,       //temporary useless
        output reg INSTR_ERROR,
        
        //to stack
        output reg push_num, //0 or 1
        output reg [1:0] pop_num, //0~3
        //push_select: 0~from ALU; 1~from memory; 2~from instr;
        output reg [1:0] push_select,
         
        //to ALU     
        output reg [4:0] ALUControl,
        
        //to Memory
        output store_en,
        output load_en,
        
        //to local memory
        output local_set,
        output local_get,
        
        //instants
        output [31:0] constant,

        output reg instr_finish
    );

    reg [1:0] instr_pointer_state;
    parameter   module_head = 2'b00,
                section_head = 2'b01,
                vector_head = 2'b10,
                vector_content = 2'b11;

    //variables
    reg [`bram_in_width-1:0]global_variables[`bram_depth_in-1:0];
    reg [`instr_bram_width-1:0] global_var_type [`bram_depth_in-1:0];
    reg [`bram_in_width-1:0]local_variables[`bram_depth_in-1:0];
    
    //byte count decode
    wire [35:0] LEB128_in;
    wire [31:0] LEB128_decode;
    wire [2:0] LEB128_byte_cnt;
    
    //section head
    reg [7:0] section_type;
    reg [31:0] section_length;//(bytes)
    
    //vector head
    reg [31:0] vector_num;
    
    //code section vector content
    reg [31:0] vector_cnt;

    // type section decode
    reg type_decode; //0~decode parameter; 1~decode return
    //此处可以加tag
    reg [7:0] para_num_reg [7:0];   //parameter number of the function
    reg [7:0] retu_num_reg [7:0];   //return number of the function
    reg [7:0] function_num_reg ;     //function number
    reg [(`instr_read_width-1):0] function_type_list [15:0]; //function type list
    reg [(`instr_log2_bram_depth-1):0] function_addr_list [31:0];  //function pre reading
    //debug
    wire[7:0] para_num_reg0 = para_num_reg[0];
    wire[7:0] retu_num_reg0 = retu_num_reg[0];
    wire[(`instr_read_width-1):0] function_type_list0 = function_type_list[0];
    
    assign load_en = (Instr[7:0]==8'h28)&(section_type==8'h0a)&(instr_pointer_state==vector_content);
    assign store_en = (Instr[7:0]==8'h36)&(section_type==8'h0a)&(instr_pointer_state==vector_content);
    assign local_set = ((Instr[7:0]==8'h21)|(Instr[7:0]==8'h22))&(section_type==8'h0a)&(instr_pointer_state==vector_content);
    assign local_get = (Instr[7:0]==8'h20)&(section_type==8'h0a)&(instr_pointer_state==vector_content);
    
    assign LEB128_in = (instr_pointer_state==vector_head)? Instr[35:0]:Instr[43:8];
    assign constant = LEB128_decode;
    LEB128_uint32_decode u_decode(
            .LEB128_in(LEB128_in),
            .uint32_out(LEB128_decode),
            .byte_cnt(LEB128_byte_cnt)
    );
    
    //read_pointer_shift logic          
    always@(*) begin
        case (instr_pointer_state)
            module_head: begin
                    read_pointer_shift_minusone = `log_read_window_size'd7;
                    pop_num = 2'd0;
                    push_num = 1'b0;
                    push_select = 2'bZZ;
                    ALUControl = 5'bZZZZZ;                      
                    end
            section_head: begin
                    read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};
                    pop_num = 2'd0;
                    push_num = 1'b0; 
                    push_select = 2'bZZ;
                    ALUControl = 5'bZZZZZ;                                       
            end
            vector_head: begin
                case (section_type)
                    8'h0a, 8'h01, 8'h03:begin
                    // 8'h0a, 8'h01:begin
                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt} - 'd1;
                        pop_num = 2'd0;
                        push_num = 1'b0;
                        push_select = 2'bZZ;
                        ALUControl = 5'bZZZZZ;                          
                    end                   
                    default:begin
                        read_pointer_shift_minusone = {section_length - 32'd1};
                        //Warning-WIDTHTRUNC: Operator ASSIGN expects 4 bits on the Assign RHS, but Assign RHS's SUB generates 32 bits.
                        pop_num = 2'd0;
                        push_num = 1'b0;
                        push_select = 2'bZZ;                        
                        ALUControl = 5'bZZZZZ;                         
                    end
                endcase
            end
            vector_content: begin
                    case (section_type)
                    8'h01:begin
                        if(type_decode) begin
                            read_pointer_shift_minusone = Instr[(`log_read_window_size-1):0] + 'd0;
                            pop_num = 2'd0;
                            push_num = 1'b0;
                            push_select = 2'bZZ;                            
                            ALUControl = 5'bZZZZZ;                             
                        end
                        else begin
                            read_pointer_shift_minusone = Instr[(`log_read_window_size+7):8]+ 'd1;
                            // read_pointer_shift_minusone = Instr[15:8]+ 'd1;
                            pop_num = 2'd0;
                            push_num = 1'b0;
                            push_select = 2'bZZ;                            
                            ALUControl = 5'bZZZZZ;                             
                        end                        
                    end                     
                        8'h0a:begin //Code section
                            if(code_pre_read==1'b1)begin
                                read_pointer_shift_minusone = LEB128_byte_cnt + LEB128_decode - 'd1;        //存在截尾隐患
                                pop_num = 2'd0;
                                push_num = 1'b0;
                                push_select = 2'bZZ;
                                ALUControl = 5'bZZZZZ;                                                                 
                            end else begin
                                case (Instr[7:0]) 
                                    8'h01:begin //nop
                                        read_pointer_shift_minusone = `log_read_window_size'd0;
                                        pop_num = 2'd0;
                                        ALUControl = 5'bZZZZZ;                                     
                                        push_num = 1'b0;
                                        push_select = 2'bZZ;                                    
                                    end
                                    8'h1a:begin //drop
                                        pop_num = 2'd1;
                                        push_num = 1'b0;
                                        push_select = 2'bZZ;                                      
                                        ALUControl = 5'bZZZZZ;                                    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;
                                    end
                                    8'h1b:begin //select
                                        pop_num = 2'd3;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00100;
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                
                                    end
                                    8'h41:begin //i32.const
                                        pop_num = 2'd0;
                                        push_num = 1'b1; 
                                        push_select = 2'b10;//Instance_number
                                        ALUControl = 5'bZZZZZ;   
                                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};
                                    end
                                    8'h45:begin //i32.eqz
                                        pop_num = 2'd1;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00101;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                        
                                    end
                                    8'h46:begin //i32.eq
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00110;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end
                                    8'h47:begin //i32.ne
                                        pop_num = 2'd1;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01111;  
                                        read_pointer_shift_minusone = `log_read_window_size'd0;   
                                    end   
                                    8'h48:begin //i32.lt_s
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01011;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end          
                                    8'h49:begin //i32.lt_u
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00111;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end  
                                    8'h4a:begin //i32.gt_s
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01100;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end        
                                    8'h4b:begin //i32.gt_u
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01000;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end
                                    8'h4c:begin //i32.le_s
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01101;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end
                                    8'h4d:begin //i32.le_u
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01001;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end
                                    8'h4e:begin //i32.ge_s
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01110;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end
                                    8'h4f:begin //i32.ge_u
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01010;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end                                                      
                                    8'h6a:begin //i32.add
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00000;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;   
                                    end   
                                    8'h6b:begin //i32.sub
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00001;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0; 
                                    end    
                                    8'h71:begin //i32.and
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00010;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                    end                 
                                    8'h72:begin //i32.or
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00011;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                    end
                                    8'h20:begin //local.get
                                        pop_num = 2'd0;
                                        push_num = 1'b1;
                                        push_select = 2'b11; //local mem
                                        ALUControl = 5'b00000; //add
                                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};                                         
                                    end                                
                                    8'h21:begin //local.set
                                        pop_num = 2'd1;
                                        push_num = 1'b0;
                                        push_select = 2'bZZ;
                                        ALUControl = 5'b00000; //add
                                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};                                         
                                    end           
                                    8'h22:begin //local.tee
                                        pop_num = 2'd0;
                                        push_num = 1'b0;
                                        push_select = 2'bZZ;
                                        ALUControl = 5'b00000; //add
                                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};                                         
                                    end                                                                 
                                    8'h28:begin //i32.load
                                        pop_num = 2'd1;
                                        push_num = 1'b1;
                                        push_select = 2'b10; //Memory
                                        ALUControl = 5'b00000; //add
                                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt} + 'd1;                                         
                                    end                                
                                    8'h36:begin //i32.store
                                        pop_num = 2'd2;
                                        push_num = 1'b0;
                                        push_select = 2'bZZ;
                                        ALUControl = 5'b00000; //add
                                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt} + 'd1;                                         
                                    end             
                                    8'h74:begin //i32.shl
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b10000;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                    end
                                    8'h75:begin //i32.shr_s
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b10001;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                    end
                                    8'h76:begin //i32.shr_u
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b10010;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                    end
                                    8'h77:begin //i32.rotl
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b10011;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                    end
                                    8'h78:begin //i32.rotr
                                        pop_num = 2'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b10100;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                    end  
                                    default:begin
                                        read_pointer_shift_minusone = `log_read_window_size'd0;  
                                        pop_num = 2'd0;
                                        push_num = 1'b0;
                                        push_select = 2'bZZ;
                                        ALUControl = 5'bZZZZZ;
                                    end                           
                                endcase
                            end
                        end
                        default:begin
                            read_pointer_shift_minusone = `log_read_window_size'b0;
                        end
                    endcase
            end
        endcase
    end

     //two states of code section: 1~pre-read; 0~normal-read;
    reg code_pre_read;

    reg [3:0] function_store_addr;
    always@(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            instr_pointer_state <= module_head;
            INSTR_ERROR <= 1'd0;
            shift_vld <= 1'd1;
            section_length <= 32'd0;
            section_type <= 8'd0;
            type_decode <= 1'b0;
            vector_cnt <= 'd0;
            instr_finish <= 1'b0;
            function_store_addr <= 4'd0;
            code_pre_read <= 1'd0;
        end else begin
            case(instr_pointer_state)
                module_head: begin
                    if(Instr[63:0] == `WASM_MAGIC_VERSION) instr_pointer_state <= section_head;
                    else INSTR_ERROR <= 'd1;
                end
                section_head: begin
                    section_type <= Instr[7:0];
                    section_length <= LEB128_decode;
                    instr_pointer_state <= vector_head;
                end
                vector_head: begin
                    vector_num <= LEB128_decode;
                    if(section_type==8'h01)begin 
                        instr_pointer_state <= vector_content;
                    end else if (section_type==8'h03) begin 
                        instr_pointer_state <= vector_content;
                        function_num_reg <= Instr[7:0];
                    end else if (section_type==8'h0a) begin
                        instr_pointer_state <= vector_content;
                        code_pre_read <= 1'd1;
                    end else begin
                        instr_pointer_state <= section_head;
                    end
                end
                vector_content: begin
                    case (section_type)
                        8'h0a:begin //; section "Code" (10)
                            if(code_pre_read==1'b1)begin
                                if(vector_cnt==vector_num-1)begin
                                    instr_finish <= 1'b0;
                                    vector_cnt <= 'd0;
                                    function_addr_list[vector_cnt] <= Instr[35:0];
                                end
                                else begin
                                    vector_cnt <= vector_cnt + 1'b1;
                                end
                            end else if (code_pre_read==1'b0)begin
                                
                            end 

                            // if((vector_cnt==(vector_num-1))&(Instr[7:0]==8'h0b)) begin
                            if(Instr[7:0] == 8'h0b) begin
                                vector_cnt <= 'd0;
                                instr_pointer_state <= section_head;
                                instr_finish <= 1'b1;
                            end
                            else begin 
                                vector_cnt <= vector_cnt + 'd1;
                                // instr_pointer_state <= vector_content;
                            end
                        end
                        8'h01:begin //; section "Type" (1)
                            if(type_decode) begin
                                type_decode <= 1'b0;
                                retu_num_reg[vector_cnt] <= Instr[7:0];
                                if(vector_cnt==(vector_num-1)) begin
                                    vector_cnt <= 'd0;
                                    instr_pointer_state <= section_head;
                                end
                                else vector_cnt <= vector_cnt + 'd1;
                            end
                            else begin
                                type_decode <= 1'b1;
                                para_num_reg[vector_cnt] <= Instr[15:8];                                    
                            end
                        end
                        8'h03:begin //; section "Function" (3)
                            function_type_list[function_store_addr] <= Instr;
                            if(~((vector_cnt+`read_window_size)<(vector_num-1))) begin
                                vector_cnt <= 'd0;
                                instr_pointer_state <= section_head;
                                function_store_addr <= 4'd0;
                            end
                            else begin
                                vector_cnt <= vector_cnt + `read_window_size;
                                function_store_addr <= function_store_addr + 'd1;
                            end
                        end
                        default:begin
                            instr_pointer_state <= section_head;
                        end
                    endcase                
                end
            endcase
        end
    end
    
    
endmodule
