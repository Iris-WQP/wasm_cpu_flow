`timescale 1ns / 1ps
`include "src/wasm_defines.vh"
`include "src/LEB128_uint32_decode.v"

module CtrlUnit(
        input clk,
        input rst_n,
        
        input [`instr_read_width-1:0] Instr,
        input Instr_vld,
        output reg [`log_read_window_size:0] read_pointer_shift_minusone,
        output reg shift_vld,       //temporary useless
        output reg INSTR_ERROR,
        
        //to stack
        output reg push_num, //0 or 1
        output reg [1:0] pop_num, //0~3
        //push_select: 0~from ALU; 1~from memory; 2~from instr;
        output reg [1:0] push_select,
         
        //to ALU     
        output reg [3:0] ALUControl,
        
        //to Memory
        output store_en,
        output load_en,
        
        //to local memory
        output local_set,
        output local_get,
        
        //instants
        output [31:0] constant
    );

    reg continue;
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
    wire vector_content_finish;
    
    assign vector_content_finish = vector_cnt==(vector_num-1);
    
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
                    ALUControl = 4'bZZZZ;                      
                    end
            section_head: begin
                    read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};
                    pop_num = 2'd0;
                    push_num = 1'b0; 
                    push_select = 2'bZZ;   
                    ALUControl = 4'bZZZZ;                                      
            end
            vector_head: begin
                case (section_type)
                    8'h0a:begin
                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt} - 'd1;
                        pop_num = 2'd0;
                        push_num = 1'b0;
                        push_select = 2'bZZ;
                        ALUControl = 4'bZZZZ;                          
                    end
                    default:begin
                        read_pointer_shift_minusone = section_length - 32'd1;
                        pop_num = 2'd0;
                        push_num = 1'b0;
                        push_select = 2'bZZ;                        
                        ALUControl = 4'bZZZZ;                          
                    end
                endcase
            end
            vector_content: begin
                    case (section_type)
                        8'h0a:begin //Code section
                            case (Instr[7:0]) 
                                8'h01:begin //nop
                                    read_pointer_shift_minusone = `log_read_window_size'd0;
                                    pop_num = 2'd0;
                                    ALUControl = 4'bZZZZ;                                      
                                    push_num = 1'b0;
                                    push_select = 2'bZZ;                                    
                                end
                                8'h1a:begin //drop
                                    pop_num = 2'd1;
                                    push_num = 1'b0;
                                    push_select = 2'bZZ;                                      
                                    ALUControl = 4'bZZZZ;                                      
                                    read_pointer_shift_minusone = `log_read_window_size'd0;
                                end
                                8'h1b:begin //select
                                    pop_num = 2'd3;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b0100;
                                    read_pointer_shift_minusone = `log_read_window_size'd0;                                
                                end
                                8'h41:begin //i32.const
                                    pop_num = 2'd0;
                                    push_num = 1'b1; 
                                    push_select = 2'b10;//Instance_number
                                    ALUControl = 4'bZZZZ;  
                                    read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};
                                end
                                8'h45:begin //i32.eqz
                                    pop_num = 2'd1;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b0101;    
                                    read_pointer_shift_minusone = `log_read_window_size'd0;                                        
                                end
                                8'h46:begin //i32.eq
                                    pop_num = 2'd2;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b0110;    
                                    read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                end
                                8'h47:begin //i32.ne
                                    pop_num = 2'd1;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b1111;  
                                    read_pointer_shift_minusone = `log_read_window_size'd0;   
                                end   
                                8'h48:begin //i32.lt_s
                                    pop_num = 2'd2;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b1011;    
                                    read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                end          
                                8'h49:begin //i32.lt_u
                                    pop_num = 2'd2;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b0111;    
                                    read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                end  
                                8'h4a:begin //i32.gt_s
                                    pop_num = 2'd2;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b1100;    
                                    read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                end        
                                8'h4b:begin //i32.gt_u
                                    pop_num = 2'd2;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b1000;    
                                    read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                end
                                8'h4c:begin //i32.le_s
                                    pop_num = 2'd2;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b1101;    
                                    read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                end
                                8'h4d:begin //i32.le_u
                                    pop_num = 2'd2;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b1001;    
                                    read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                end
                                8'h4e:begin //i32.ge_s
                                    pop_num = 2'd2;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b1110;    
                                    read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                end
                                8'h4f:begin //i32.ge_u
                                    pop_num = 2'd2;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b1010;    
                                    read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                end                                                      
                                8'h6a:begin //i32.add
                                    pop_num = 2'd2;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b0000;    
                                    read_pointer_shift_minusone = `log_read_window_size'd0;   
                                end   
                                8'h6b:begin //i32.sub
                                    pop_num = 2'd2;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b0001;    
                                    read_pointer_shift_minusone = `log_read_window_size'd0; 
                                end    
                                8'h71:begin //i32.and
                                    pop_num = 2'd2;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b0010;    
                                    read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                end                 
                                8'h72:begin //i32.or
                                    pop_num = 2'd2;
                                    push_num = 1'b1;
                                    push_select = 2'b00; //ALU
                                    ALUControl = 4'b0011;    
                                    read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                end
                                8'h20:begin //local.get
                                    pop_num = 2'd0;
                                    push_num = 1'b1;
                                    push_select = 2'b11; //local mem
                                    ALUControl = 4'b0000; //add
                                    read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};                                         
                                end                                
                                8'h21:begin //local.set
                                    pop_num = 2'd1;
                                    push_num = 1'b0;
                                    push_select = 2'bZZ;
                                    ALUControl = 4'b0000; //add
                                    read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};                                         
                                end           
                                8'h22:begin //local.tee
                                    pop_num = 2'd0;
                                    push_num = 1'b0;
                                    push_select = 2'bZZ;
                                    ALUControl = 4'b0000; //add
                                    read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};                                         
                                end                                                                 
                                8'h28:begin //i32.load
                                    pop_num = 2'd1;
                                    push_num = 1'b1;
                                    push_select = 2'b10; //Memory
                                    ALUControl = 4'b0000; //add
                                    read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt} + 'd1;                                         
                                end                                
                                8'h36:begin //i32.store
                                    pop_num = 2'd2;
                                    push_num = 1'b0;
                                    push_select = 2'bZZ;
                                    ALUControl = 4'b0000; //add
                                    read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt} + 'd1;                                         
                                end                                                                              
                            endcase
                        end
                        default:begin
                            read_pointer_shift_minusone = 32'd0;
                        end
                    endcase
            end
        endcase
    end

    always@(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            instr_pointer_state <= module_head;
            INSTR_ERROR <= 1'd0;
            shift_vld <= 1'd1;
            section_length <= 32'd0;
            section_type <= 8'd0;
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
                    if(section_type==8'h0a) instr_pointer_state <= vector_content;
                    else instr_pointer_state <= section_head;
                end
                vector_content: begin
                    case (section_type)
                        8'h0a:begin //; section "Code" (10)
                            if(vector_content_finish) begin
                                vector_cnt <= 'd0;
                                instr_pointer_state <= section_head;
                            end
                            else begin 
                                vector_cnt <= vector_cnt + 'd1;
                                instr_pointer_state <= vector_content;
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
