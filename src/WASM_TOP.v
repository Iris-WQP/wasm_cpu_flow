// `timescale 1ns / 1ps

`include "src/CtrlUnit.v"
`include "src/InstrMemCtrl.v"
`include "src/LineMemory.v"
`include "src/ALU.v"
`include "src/OperandStack.v"
`include "src/ControlStack.v"
// `include "src/VariableMemory.v"

module WASM_TOP(
    
        input i_clk,
        input i_rst_n,

        //three error signals
        output o_INSTR_ERROR,
        output o_stack_exceed,
        output o_stack_empty_pop,
        output o_instr_finish
        // //debug
        // ,
        // output [`instr_log2_bram_depth-1:0] read_pointer,
        // output [`instr_log2_bram_depth-1:0] write_pointer,
        // output wire [31:0] ALUResult,
        // output wire stack_empty    
    );
    
    //ctrl unit
    wire [31:0] ALUResult;
    wire stack_empty;
    wire [`instr_read_width-1:0] Instr;
    wire Instr_vld;
    wire [7:0] read_pointer_shift_minusone;
    wire shift_vld;
    wire [3:0] pop_num;
    wire [1:0] push_select;
    wire [4:0] ALUControl;
    wire store_en;
    wire load_en;
    wire local_set;
    wire local_get;
    wire [31:0] constant;
    wire [(`instr_log2_bram_depth-1):0] read_pointer;
    wire jump_en;
    wire [`instr_log2_bram_depth-1:0] jump_addr;
    wire hlt;

    //line memory
    wire [`bram_in_width-1:0] load_data;
    wire [`st_width-1:0] local_mem_data;
    wire load_vld;
    //stack
    wire push_num;
    reg [`st_width-1:0] push_data;
    wire [`pop_num_max*`st_width-1:0] pop_window;

    always@(*)begin
        case({end_instr, push_select})
            3'b100: push_data = A_pop_window;
            3'b000: push_data = ALUResult;
            3'b001: push_data = load_data;
            3'b010: push_data = constant;
            3'b011: push_data = local_mem_data;//for local/global memory
        endcase
    end

    //branch table support
    wire [`instr_log2_bram_depth-1:0] read_specific_addr;
    wire [31:0] br_table_offset;
    wire [`instr_bram_width-1:0] read_specific_data;
    assign br_table_offset = (A_pop_window < constant)? A_pop_window:constant;
    assign read_specific_addr = br_table_instr?(read_pointer+br_table_offset+LEB128_byte_cnt+'d1):`instr_bram_width'd0;

    //control stack
    wire control_stack_left_one;   //judge if the module is about to finish
    wire function_call; //instruction is call, jump, call stack push
    wire end_instr; //a function is finished, jump back, call stack pop
    wire operand_stack_tag_pop; //operand stack pop
    wire function_retu_num; //return parameter number, 0 or 1
    wire control_stack_push;
    reg [`call_stack_width-1:0] control_stack_push_data;
    wire [`call_stack_width-1:0] control_stack_top_data;
    wire [`st_log2_depth:0] operand_stack_top_pointer;
    wire [(`st_log2_depth-1):0] stack_pointer_tag;
    wire [(`log_pa_re_num_max-1):0] function_para_num;
    wire [7:0] allocate_local_memory_size;
    wire [`st_log2_depth-1:0] function_stack_tag;
    wire [`st_log2_depth-1:0] control_stack_tag;
    wire read_control_endjump;    
    wire [`instr_log2_bram_depth-1:0] return_addr_tag;
    wire read_retu_num;
    wire [2:0] LEB128_byte_cnt;
    wire [`instr_log2_bram_depth-1:0] pre_calu_return_addr;
    wire block_instr;
    wire loop_instr;
    wire if_instr;
    wire br_table_instr;
    wire control_retu_num;

    assign control_retu_num = ~(Instr[15:8]==8'h40);

    assign control_stack_tag = control_stack_top_data[(`st_log2_depth+`instr_log2_bram_depth-1):`instr_log2_bram_depth];
    assign return_addr_tag = control_stack_top_data[`instr_log2_bram_depth-1:0];
    assign read_retu_num = control_stack_top_data[`st_log2_depth+`instr_log2_bram_depth];
    assign read_control_endjump = control_stack_top_data[`st_log2_depth+`instr_log2_bram_depth+1];
    assign control_stack_push = function_call|block_instr|loop_instr|if_instr;
    assign stack_pointer_tag = operand_stack_top_pointer - function_para_num;
    always@(*)begin
        if(function_call)begin
            control_stack_push_data = {2'b01, function_retu_num, stack_pointer_tag, pre_calu_return_addr};
        end else if (block_instr)begin
            control_stack_push_data = {2'b00, control_retu_num, operand_stack_top_pointer[`st_log2_depth-1:0], `instr_log2_bram_depth'd0};
        end else if (loop_instr)begin
            control_stack_push_data = {2'b11, control_retu_num, operand_stack_top_pointer[`st_log2_depth-1:0], (read_pointer+`instr_log2_bram_depth'd2)};
        end else if (if_instr)begin
            control_stack_push_data = {2'b10, control_retu_num, {operand_stack_top_pointer[`st_log2_depth-1:0]-`st_log2_depth'd1}, `instr_log2_bram_depth'd0};
        end else begin
            control_stack_push_data = 'dZ;
        end
    end
    
    ControlStack u_control_stack(
        .clk(i_clk),
        .rst_n(i_rst_n),
        .push(control_stack_push),
        .pop(end_instr),
        .function_call(function_call),
        .function_stack_tag(function_stack_tag),
        .push_data(control_stack_push_data),
        .top_data(control_stack_top_data),
        .control_stack_left_one(control_stack_left_one)
    );
    
    CtrlUnit u_ctrl_unit (
        .clk(i_clk),
        .rst_n(i_rst_n),
        .read_pointer(read_pointer),
        .Instr(Instr),
        .Instr_vld(Instr_vld),
        .read_pointer_shift_minusone(read_pointer_shift_minusone),
        .shift_vld(shift_vld),
        .INSTR_ERROR(o_INSTR_ERROR),
        .jump_en_out(jump_en),
        .jump_addr(jump_addr),
        .push_num_out(push_num),
        .pop_num_out(pop_num),
        .push_select(push_select),
        .ALUControl(ALUControl),
        .ALUResult_0(ALUResult[0]),
        .store_en(store_en),
        .load_en(load_en),
        .local_set(local_set),
        .local_get(local_get),
        .constant(constant),
        .hlt(hlt),
        .instr_finish(o_instr_finish),
        .return_addr_tag(return_addr_tag),
        .control_stack_left_one(control_stack_left_one),
        .function_call(function_call),
        .block_instr(block_instr),
        .loop_instr(loop_instr),
        .if_instr(if_instr),
        .br_table_instr(br_table_instr),
        .end_instr(end_instr),
        .operand_stack_tag_pop(operand_stack_tag_pop),
        .read_retu_num(read_retu_num),
        .read_control_endjump(read_control_endjump),
        .function_retu_num(function_retu_num),
        .function_para_num(function_para_num),
        .allocate_local_memory_size(allocate_local_memory_size),
        .LEB128_byte_cnt(LEB128_byte_cnt),
        .pre_calu_return_addr(pre_calu_return_addr),
        .br_table_depth(read_specific_data)
    );

//depends on instr write method, useless for now.
wire  wr_req_vld = 0;   
wire [`log_write_window_size-1:0] write_pointer_shift_minusone;
wire [`instr_write_width-1:0] wr_data;

InstrMemCtrl #
             (   .ADDR_WIDTH (`instr_log2_bram_depth),
                 .DATA_WIDTH (`instr_bram_width),
                 .DEPTH (`instr_bram_depth))
                 u_instr_mem_ctrl
             (
                .clk(i_clk),
                .rst_n(i_rst_n),
                .shift_vld(shift_vld),
                .hlt(hlt),
                
                .re(shift_vld),
                .read_pointer_shift_minusone(read_pointer_shift_minusone),
                .rd_data(Instr),
                .rd_data_vld(Instr_vld),
                //write port
                .we(wr_req_vld),     //wr_req_vld
                .write_pointer_shift_minusone(write_pointer_shift_minusone),
                .wr_data(wr_data),
                //jump
                .jump_en(jump_en),
                .jump_addr(jump_addr),
                .instr_finish(),
                .read_pointer_out(read_pointer),
                //read specific addr
                .read_specific_addr(read_specific_addr),
                .read_specific_data(read_specific_data)
                // .instr_finish(o_instr_finish)
        // //debug
        //         ,
        //         .read_pointer(read_pointer),
        //         .write_pointer(write_pointer)
                );      

    //operand stack window
    wire [`st_width-1:0] A_pop_window;
    wire [`st_width-1:0] B_pop_window;    
    wire [`st_width-1:0] C_pop_window;

    //ALU operands 
    wire [`st_width-1:0] A_ALU;
    wire [`st_width-1:0] B_ALU;
    assign A_ALU = (store_en|load_en|local_set|local_get)? constant : A_pop_window;    
    assign B_ALU = (local_set|local_get)? function_stack_tag:B_pop_window;

    ALU u_alu(
    .A(A_ALU),
    .B(B_ALU),
    .C(C_pop_window),
    .ALUControl(ALUControl),
    .ALUResult(ALUResult)
    );      

    OperandStack u_operand_stack (
        .clk(i_clk),
        .rst_n(i_rst_n),
        .push_num(push_num),
        .push_data(push_data),
        .pop_num(pop_num),
        .stack_exceed_push(o_stack_exceed),
        .stack_exceed_pop(o_stack_empty_pop),
        .pop_window_A(A_pop_window),
        .pop_window_B(B_pop_window),
        .pop_window_C(C_pop_window),
        .call(function_call),
        .return(operand_stack_tag_pop),
        .function_stack_tag(control_stack_tag),
        .w_top_pointer(operand_stack_top_pointer),
        .allocate_local_memory_size(allocate_local_memory_size),

        .l_addr(ALUResult),
        .local_set(local_set),
        .local_set_data(A_pop_window),
        .local_get_data(local_mem_data)
    );

    LineMemory #(`log2_bram_depth_in,
                 `bram_in_width,
                 `bram_depth_in) 
    u_line_memory (
    .clk(i_clk),
    .addr(ALUResult),
    .re(load_en),
    .rd_data(load_data),
    .rd_data_vld(load_vld),
    .we(store_en),
    .wr_data(A_pop_window)
);

endmodule
