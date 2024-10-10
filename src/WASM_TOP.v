// `timescale 1ns / 1ps

`include "src/CtrlUnit.v"
`include "src/InstrMemCtrl.v"
`include "src/LineMemory.v"
`include "src/ALU.v"
`include "src/StackExtend.v"
`include "src/local_mem.v"
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
    wire [`bram_in_width-1:0] local_mem_data;
    wire load_vld;
    //stack
    wire push_num;
    reg [`st_width-1:0] push_data;
    wire [`pop_num_max*`st_width-1:0] pop_window;

    always@(*)begin
        case(push_select)
            2'b00: push_data = ALUResult;
            2'b01: push_data = load_data;
            2'b10: push_data = constant;
            2'b11: push_data = local_mem_data;//for local/global memory
        endcase
    end
    
    
    
    CtrlUnit u_ctrl_unit (
        .clk(i_clk),
        .rst_n(i_rst_n),
        .read_pointer(read_pointer),
        .Instr(Instr),
        .Instr_vld(Instr_vld),
        .read_pointer_shift_minusone(read_pointer_shift_minusone),
        .shift_vld(shift_vld),
        .INSTR_ERROR(o_INSTR_ERROR),
        .jump_en(jump_en),
        .jump_addr(jump_addr),
        .push_num(push_num),
        .pop_num(pop_num),
        .push_select(push_select),
        .ALUControl(ALUControl),
        .store_en(store_en),
        .load_en(load_en),
        .local_set(local_set),
        .local_get(local_get),
        .constant(constant),
        .hlt(hlt),
        .instr_finish(o_instr_finish)
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
                .read_pointer_out(read_pointer)
                // .instr_finish(o_instr_finish)
        // //debug
        //         ,
        //         .read_pointer(read_pointer),
        //         .write_pointer(write_pointer)
                );      

    //ALU
    wire [`st_width-1:0] A_store_data;    
    wire [`st_width-1:0] B_pop_window;    
    wire [`st_width-1:0] C_pop_window;
    wire [`st_width-1:0] B_offset = (store_en|load_en)? constant: ((local_set|local_get)? `st_width'd0:B_pop_window);
    
    ALU u_alu(
    .A(A_store_data),
    .B(B_offset),
    .C(C_pop_window),
    .ALUControl(ALUControl),
    .ALUResult(ALUResult)
    );      

    StackExtend u_stack_extend (
        .clk(i_clk),
        .rst_n(i_rst_n),
        .push_num(push_num),
        .push_data(push_data),
        .pop_num(pop_num),
        .stack_exceed_push(o_stack_exceed),
        .stack_exceed_pop(o_stack_empty_pop),
        .pop_window_A(A_store_data),
        .pop_window_B(B_pop_window),
        .pop_window_C(C_pop_window)
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
    .wr_data(A_store_data)
);

    local_mem #(`log2_bram_depth_in,
                 `bram_in_width,
                 `bram_depth_in) 
    u_local_mem 
    (
        .clk(i_clk),
        .addr(constant),        
        .we(local_set),
        .wr_data(A_store_data),
        .rd_data(local_mem_data)
    );

endmodule
