`timescale 1ns / 1ps
`include "src/wasm_defines.vh"
`include "src/WASM_TOP.v"
module TB_WASM_TOP;

    // Parameters
    parameter CLK_period = 2; // 50 MHz

    // Signals
    reg clk;
    reg rst_n;
    wire INSTR_ERROR;
    wire instr_finish;
    wire stack_full;
    wire [`instr_log2_bram_depth-1:0] read_pointer;
    wire [31:0] ALUResult;
    wire stack_empty;

    //generate .vcd
    initial
    begin
        $dumpfile("wave.vcd");
        $dumpvars(0);
    end


    // Instantiate the Unit Under Test (UUT)
    WASM_TOP u_wasm_top (
        .i_clk(clk),
        .i_rst_n(rst_n),
        .o_INSTR_ERROR(INSTR_ERROR),
        .o_instr_finish(instr_finish),
        .o_stack_full(stack_full)
        
        // //debug
        // ,
        // .read_pointer(read_pointer),
        // .ALUResult(ALUResult),
        // .stack_empty(stack_empty)
    );

    initial begin
        clk = 0;
        rst_n = 1;
        #2 rst_n = 0;
        #2 rst_n = 1;
    end   
    
    initial begin 
        #1000
        $finish;
    end

    always #(CLK_period/2) clk = ~clk; // Generate clock signal

endmodule