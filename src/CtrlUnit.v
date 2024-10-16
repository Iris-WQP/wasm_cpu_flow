// `timescale 1ns / 1ps
`include "src/wasm_defines.vh"
`include "src/LEB128_uint32_decode.v"

module CtrlUnit(
        input clk,
        input rst_n,

        //connect instr_mem_ctrl
        input [(`instr_log2_bram_depth-1):0] read_pointer,
        input [`instr_read_width-1:0] Instr,
        input Instr_vld,
        output reg [7:0] read_pointer_shift_minusone,
        output reg shift_vld,       //temporary useless
        output reg INSTR_ERROR,
        output reg jump_en,
        output reg [(`instr_log2_bram_depth-1):0] jump_addr,
        
        //to stack
        output reg push_num, //0 or 1
        output reg [3:0] pop_num, //0~15
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
        output hlt,
        output reg instr_finish,

        //to call stack (control stack)
        input [`instr_log2_bram_depth-1:0] return_addr_tag,
        input control_stack_left_one,
        output function_call,
        output block_instr,
        output loop_instr,
        output end_instr,
        input read_retu_num,
        input read_control_endjump,
        output function_retu_num,  //0 or 1
        output [(`log_pa_re_num_max-1):0] function_para_num,
        output [7:0] allocate_local_memory_size,
        output [2:0] LEB128_byte_cnt,
        output [(`instr_log2_bram_depth-1):0] pre_calu_return_addr
    );

    // reg un_hlt;
    reg jump_hlt;
    assign hlt = jump_hlt;

    wire code_content_running;
    assign code_content_running = (section_type==8'h0a)&(instr_pointer_state==vector_content)&(~(|code_pre_read_state));

    reg [1:0] instr_pointer_state;
    parameter   module_head = 2'b00,
                section_head = 2'b01,
                vector_head = 2'b10,
                vector_content = 2'b11;

    //variables
    reg [`bram_in_width-1:0]global_variables[`bram_depth_in-1:0];
    reg [`instr_bram_width-1:0] global_var_type [`bram_depth_in-1:0];

    //byte count decode
    wire [35:0] LEB128_in;
    wire [31:0] LEB128_decode;
    // wire [2:0] LEB128_byte_cnt;
    
    //section head
    reg [7:0] section_type;
    reg [31:0] section_length;//(bytes)
    
    //vector head
    reg [31:0] vector_num;
    
    //code section vector content
    reg [31:0] vector_cnt;

    // type section decode
    reg type_decode; //0~decode parameter; 1~decode return

    // function
    wire function_content_start;
    assign function_content_start = (instr_pointer_state == vector_content)&(section_type==8'h0a)&(code_pre_read_state==2'b11)&(local_decl_count==local_decl_num)&(vector_cnt==(vector_num-1));
    reg [7:0] local_memory_sizes_list [(`func_num_max-1):0]; //local memory size list
    reg [(`log_pa_re_num_max-1):0] para_num_reg [(`func_num_max-1):0];   //parameter number of the function
    reg [(`func_num_max-1):0] retu_num_reg;   //return number of the function, 0 or 1.
    reg [(`log_func_num_max-1):0] function_num_reg ;     //function number
    wire [(`log_func_num_max-1):0] function_num_left;
    reg [(`instr_read_width-1):0] function_type_list [15:0]; //function type list
    reg [(`instr_log2_bram_depth-1):0] function_addr_list [(`func_num_max-1):0]; //这个list可能不够大
    reg [(`log_func_num_max-1):0] start_function_idx;
    assign allocate_local_memory_size =  function_content_start?  local_memory_sizes_list[start_function_idx] : local_memory_sizes_list[Instr[15:8]];
    wire [`instr_log2_bram_depth-1:0] pre_calu_return_addr = function_content_start? 'd0 : read_pointer+LEB128_byte_cnt+1'd1;

    //debug
    wire [(`instr_log2_bram_depth-1):0] function_addr_list0 = function_addr_list[0];
    wire [(`instr_log2_bram_depth-1):0] function_addr_list1 = function_addr_list[1];
    wire [7:0] local_memory_sizes_list_0 = local_memory_sizes_list[0];
    wire [7:0] local_memory_sizes_list_1 = local_memory_sizes_list[1];

    //global
    reg [(`global_width-1):0] global_mem [(`global_num_max-1):0];
    assign load_en = (Instr[7:0]==8'h28)&code_content_running;
    assign store_en = (Instr[7:0]==8'h36)&code_content_running;
    assign local_set = ((Instr[7:0]==8'h21)|(Instr[7:0]==8'h22))&code_content_running;
    assign local_get = (Instr[7:0]==8'h20)&code_content_running;
    
    assign LEB128_in = ((instr_pointer_state==vector_head)|(|code_pre_read_state))? Instr[35:0]:Instr[43:8];
    assign constant = LEB128_decode;
    LEB128_uint32_decode u_decode(
            .LEB128_in(LEB128_in),
            .uint32_out(LEB128_decode),
            .byte_cnt(LEB128_byte_cnt)
    );

    wire function_num_flag;
    assign function_num_left = function_num_reg - `read_window_size*function_store_addr;
    assign function_num_flag = (function_num_left < `read_window_size);
    
    //to control stack
    assign function_call = (code_content_running&(Instr[7:0]==8'h10))|function_content_start;
    assign end_instr = code_content_running&(Instr[7:0]==8'h0b);
    assign block_instr = code_content_running&(Instr[7:0]==8'h02);
    assign loop_instr = code_content_running&(Instr[7:0]==8'h03);    
    assign function_retu_num = function_content_start? 'b0:retu_num_reg[Instr[15:8]];
    assign function_para_num = function_content_start? 'b0:para_num_reg[Instr[15:8]];

    //local
    reg [2:0] local_decl_num;
    reg [2:0] local_decl_count;

    /*four states of code section: 
     01 ~ read length; 
     10 ~ read local decl count; 
     11 ~ read local type count;
     00 ~ normal-read;
     */
    reg [1:0] code_pre_read_state;

    //read_pointer_shift logic          
    always@(*) begin
        case (instr_pointer_state)
            module_head: begin
                    read_pointer_shift_minusone = 8'd7;
                    pop_num = 4'd0;
                    push_num = 1'b0;
                    push_select = 2'bZZ;
                    ALUControl = 5'bZZZZZ;                      
                    end
            section_head: begin
                    read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};
                    pop_num = 4'd0;
                    push_num = 1'b0; 
                    push_select = 2'bZZ;
                    ALUControl = 5'bZZZZZ;                                       
            end
            vector_head: begin
                case (section_type)
                    8'h0a, 8'h01, 8'h03:begin
                    // 8'h0a, 8'h01:begin
                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt} - 'd1;
                        pop_num = 4'd0;
                        push_num = 1'b0;
                        push_select = 2'bZZ;
                        ALUControl = 5'bZZZZZ;                          
                    end                   
                    default:begin
                        read_pointer_shift_minusone = {section_length - 32'd1};
                        //Warning-WIDTHTRUNC: Operator ASSIGN expects 4 bits on the Assign RHS, but Assign RHS's SUB generates 32 bits.
                        pop_num = 4'd0;
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
                                pop_num = 4'd0;
                                push_num = 1'b0;
                                push_select = 2'bZZ;                            
                                ALUControl = 5'bZZZZZ;                             
                            end
                            else begin
                                read_pointer_shift_minusone = Instr[(`log_read_window_size+7):8]+ 'd1;
                                // read_pointer_shift_minusone = Instr[15:8]+ 'd1;
                                pop_num = 4'd0;
                                push_num = 1'b0;
                                push_select = 2'bZZ;                            
                                ALUControl = 5'bZZZZZ;                             
                            end                        
                        end
                        8'h03:begin
                            read_pointer_shift_minusone = (function_num_flag? function_num_left: `read_window_size) - 1'd1;
                            pop_num = 4'd0;
                            push_num = 1'b0;
                            push_select = 2'bZZ;                            
                            ALUControl = 5'bZZZZZ;                             
                        end                     
                        8'h0a:begin //Code section
                            if(code_pre_read_state==2'b01)begin
                                read_pointer_shift_minusone = LEB128_byte_cnt - 'd1;
                                pop_num = 4'd0;
                                push_num = 1'b0;
                                push_select = 2'bZZ;
                                ALUControl = 5'bZZZZZ;   
                            end else if(code_pre_read_state==2'b10)begin
                                read_pointer_shift_minusone = LEB128_byte_cnt - 'd1;
                                pop_num = 4'd0;
                                push_num = 1'b0;
                                push_select = 2'bZZ;
                                ALUControl = 5'bZZZZZ;   
                            end else if(code_pre_read_state==2'b11)begin
                                read_pointer_shift_minusone = LEB128_byte_cnt + LEB128_decode - 'd1;
                                pop_num = 4'd0;
                                push_num = 1'b0;
                                push_select = 2'bZZ;
                                ALUControl = 5'bZZZZZ;                                                                                                                                
                            end else begin
                                case (Instr[7:0]) 
                                    8'h01:begin //nop
                                        read_pointer_shift_minusone = `log_read_window_size'd0;
                                        pop_num = 4'd0;
                                        ALUControl = 5'bZZZZZ;                                     
                                        push_num = 1'b0;
                                        push_select = 2'bZZ;                                    
                                    end
                                    8'h02, 8'h03:begin //block, loop
                                        pop_num = 4'd0;
                                        push_num = 1'b0;
                                        push_select = 2'bZZ;                                      
                                        ALUControl = 5'bZZZZZ;                                    
                                        read_pointer_shift_minusone = `log_read_window_size'd1;
                                    end
                                    8'h0b:begin //end, temp for function end
                                        pop_num = 4'd0;
                                        push_num = read_retu_num;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00000;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                        
                                    end    
                                    8'h0c:begin //br
                                        pop_num = 4'd0;
                                        push_num = 1'b0;
                                        push_select = 2'bZZ;                                   
                                        ALUControl = 5'bZZZZZ;                                   
                                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};
                                    end                                    
                                    8'h10:begin //call
                                        pop_num = 4'd0;
                                        push_num = 1'b0;
                                        push_select = 2'bZZ;
                                        ALUControl = 5'bZZZZZ;                                      
                                        read_pointer_shift_minusone = `log_read_window_size'd0;
                                        $display("call, addr=%h, pop_num=%d", read_pointer, pop_num);
                                    end
                                    8'h1a:begin //drop
                                        pop_num = 4'd1;
                                        push_num = 1'b0;
                                        push_select = 2'bZZ;                                      
                                        ALUControl = 5'bZZZZZ;                                    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;
                                    end
                                    8'h1b:begin //select
                                        pop_num = 4'd3;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00100;
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                
                                    end
                                    8'h41:begin //i32.const
                                        pop_num = 4'd0;
                                        push_num = 1'b1; 
                                        push_select = 2'b10;//Instance_number
                                        ALUControl = 5'bZZZZZ;   
                                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};
                                    end
                                    8'h45:begin //i32.eqz
                                        pop_num = 4'd1;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00101;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                        
                                    end
                                    8'h46:begin //i32.eq
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00110;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end
                                    8'h47:begin //i32.ne
                                        pop_num = 4'd1;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01111;  
                                        read_pointer_shift_minusone = `log_read_window_size'd0;   
                                    end   
                                    8'h48:begin //i32.lt_s
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01011;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end          
                                    8'h49:begin //i32.lt_u
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00111;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end  
                                    8'h4a:begin //i32.gt_s
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01100;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end        
                                    8'h4b:begin //i32.gt_u
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01000;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end
                                    8'h4c:begin //i32.le_s
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01101;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end
                                    8'h4d:begin //i32.le_u
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01001;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end
                                    8'h4e:begin //i32.ge_s
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01110;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end
                                    8'h4f:begin //i32.ge_u
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b01010;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                  
                                    end                                                      
                                    8'h6a:begin //i32.add
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        // $display("push_select=%b", push_select);
                                        ALUControl = 5'b00000;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;   
                                    end   
                                    8'h6b:begin //i32.sub
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00001;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0; 
                                    end    
                                    8'h71:begin //i32.and
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00010;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                    end                 
                                    8'h72:begin //i32.or
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b00011;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                    end
                                    8'h20:begin //local.get
                                        pop_num = 4'd0;
                                        push_num = 1'b1;
                                        push_select = 2'b11; //local mem
                                        ALUControl = 5'b00000; //add
                                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};                                         
                                    end                                
                                    8'h21:begin //local.set
                                        pop_num = 4'd1;
                                        push_num = 1'b0;
                                        push_select = 2'bZZ;
                                        ALUControl = 5'b00000; //add
                                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};                                         
                                    end           
                                    8'h22:begin //local.tee
                                        pop_num = 4'd0;
                                        push_num = 1'b0;
                                        push_select = 2'bZZ;
                                        ALUControl = 5'b00000; //add
                                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt};                                         
                                    end                                                                 
                                    8'h28:begin //i32.load
                                        pop_num = 4'd1;
                                        push_num = 1'b1;
                                        push_select = 2'b10; //Memory
                                        ALUControl = 5'b00000; //add
                                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt} + 'd1;                                         
                                    end                                
                                    8'h36:begin //i32.store
                                        pop_num = 4'd2;
                                        push_num = 1'b0;
                                        push_select = 2'bZZ;
                                        ALUControl = 5'b00000; //add
                                        read_pointer_shift_minusone = {`shift_fill_zero'b0, LEB128_byte_cnt} + 'd1;                                         
                                    end             
                                    8'h74:begin //i32.shl
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b10000;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                    end
                                    8'h75:begin //i32.shr_s
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b10001;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                    end
                                    8'h76:begin //i32.shr_u
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b10010;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                    end
                                    8'h77:begin //i32.rotl
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b10011;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                    end
                                    8'h78:begin //i32.rotr
                                        pop_num = 4'd2;
                                        push_num = 1'b1;
                                        push_select = 2'b00; //ALU
                                        ALUControl = 5'b10100;    
                                        read_pointer_shift_minusone = `log_read_window_size'd0;                                         
                                    end                                    
                                    default:begin
                                        read_pointer_shift_minusone = `log_read_window_size'd0;  
                                        pop_num = 4'd0;
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
            code_pre_read_state <= 2'd0;
            jump_en <= 1'b0;
            jump_addr <= 'd0;
            start_function_idx <= 8'd0;
            jump_hlt <= 1'b0;
            local_decl_count <= 2'd0;
            local_decl_num <= 2'd0;            
            // un_hlt <= 1'b0;
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
                    end else if (section_type==8'h08) begin
                        start_function_idx <= Instr[7:0];
                        instr_pointer_state <= section_head;                        
                    end else if (section_type==8'h0a) begin
                        instr_pointer_state <= vector_content;
                        code_pre_read_state <= 2'b01;
                    end else begin
                        instr_pointer_state <= section_head;
                    end
                end
                vector_content: begin
                    case (section_type)
                        8'h0a:begin //; section "Code" (10)
                            if(code_pre_read_state==2'b01)begin
                                function_addr_list[vector_cnt + 1'b1] <= read_pointer + LEB128_byte_cnt + LEB128_decode;
                                code_pre_read_state <= 2'b10;
                                local_memory_sizes_list[vector_cnt] <= 'd0;
                                jump_en <= 1'b0;
                            end else if(code_pre_read_state==2'b10)begin
                                local_decl_num <= Instr[2:0];
                                code_pre_read_state <= 2'b11;
                            end else if(code_pre_read_state==2'b11)begin
                                if(local_decl_count==local_decl_num)begin
                                    function_addr_list[vector_cnt] <= read_pointer;
                                    jump_en <= 1'b1;                                        
                                    if(vector_cnt==(vector_num-1))begin
                                        vector_cnt <= 'd0;
                                        code_pre_read_state <= 2'b00;
                                        // function_content_start <= 1'b1;
                                        if(start_function_idx == vector_cnt) begin
                                            jump_addr <= read_pointer;
                                        end else begin
                                            jump_addr <= function_addr_list[start_function_idx];
                                        end
                                    end else begin
                                        vector_cnt <= vector_cnt + 1'b1;
                                        code_pre_read_state <= 2'b01;
                                        jump_addr <= function_addr_list[vector_cnt + 1'b1];
                                    end
                                end else begin
                                    local_decl_count <= local_decl_count + 1'b1;
                                    local_memory_sizes_list[vector_cnt] <= local_memory_sizes_list[vector_cnt]+LEB128_decode;
                                end
                            end else begin //if (code_pre_read==2'b00)
                                // function_content_start <= 1'b0;
                                if(Instr[7:0] == 8'h00) begin //unreachable
                                    INSTR_ERROR <= 1'b1;
                                    instr_finish <= 1'b1;
                                end else if(Instr[7:0] == 8'h10) begin //call, jump to function index
                                    jump_en <= 1'b1;
                                    jump_addr <= function_addr_list[Instr[15:8]];
                                end else if(Instr[7:0] == 8'h0b) begin //end, temp for function end
                                    if(control_stack_left_one)begin
                                        instr_finish <= 1'b1;
                                    end else if (read_control_endjump) begin 
                                        jump_en <= 1'b1;
                                        jump_addr <= return_addr_tag;
                                    end else if(jump_en) jump_en <= 1'b0;
                                end else if(jump_en) jump_en <= 1'b0;
                            end
                        end
                        8'h01:begin //; section "Type" (1)
                            if(type_decode) begin
                                type_decode <= 1'b0;
                                retu_num_reg[vector_cnt] <= Instr[0];
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
