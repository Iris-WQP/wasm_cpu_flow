// `timescale 1ns / 1ps
`include "src/wasm_defines.vh"
`include "src/WASM_TOP.v"
`define T 2 
module TB_WASM_TOP;

    // Signals
    reg clk=0;
    always #(`T/2) clk = ~clk; // Generate clock signal    
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

    initial begin
        rst_n = 1;
        #2 rst_n = 0;
        #2 rst_n = 1;
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
    reg [31:0] clk_cnt;


    initial begin
        $display("Loading test data");
        $readmemh("wasm_test_function_call_hex.txt", u_wasm_top.u_instr_mem_ctrl.bram);
    end

//    count clk from reset to instr_finish==1
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            clk_cnt <= 0;
        end else if (instr_finish == 1) begin
            $display("clk_cnt = %d", clk_cnt);
            $finish;
        end else begin
            clk_cnt <= clk_cnt + 1;
        end
    end
    
    initial begin 
        #1000
        $finish;
    end


endmodule