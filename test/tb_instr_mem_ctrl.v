`timescale 1ns / 1ps
`include "wasm_defines.vh"
module tb_instr_mem_ctrl();
    // Parameters
    parameter ADDR_WIDTH = `instr_log2_bram_depth;
    parameter DATA_WIDTH = `instr_bram_width;
    parameter      DEPTH = `instr_bram_depth;

    // Signals
    reg clk;
    reg rst_n;
    reg shift_mode;
    reg mode_vld;
    reg re;
    wire [`instr_read_width-1:0] rd_data;
    wire rd_data_vld;
    reg we;
    reg [`instr_write_width-1:0] wr_data;
    wire instr_finish;
    wire [ADDR_WIDTH-1:0] read_pointer;
    wire [ADDR_WIDTH-1:0] write_pointer;

    // Instantiate the Unit Under Test (UUT)
    instr_mem_ctrl uut (
        .clk(clk),
        .rst_n(rst_n),
        .shift_mode(shift_mode),
        .mode_vld(mode_vld),
        .re(re),
        .rd_data(rd_data),
        .rd_data_vld(rd_data_vld),
        .we(we),
        .wr_data(wr_data),
        .instr_finish(instr_finish)
        //debug
        // ,
        // .read_pointer(read_pointer),
        // .write_pointer(write_pointer)
    );
    
    always begin
        #5 clk = ~clk;
    end    

    initial begin
        // Initialize Inputs
        clk <= 0;
        rst_n <= 0;
        re <= 0;
        we <= 0;
        wr_data <= 0;
        
        #10 rst_n <= 0;

        // Apply stimulus to the inputs
        we = 1;
        wr_data = 256'h200020016a0b;
        
//0000026: 20                                        ; local.get
//0000027: 00                                        ; local index
//0000028: 20                                        ; local.get
//0000029: 01                                        ; local index
//000002a: 6a                                        ; i32.add
//000002b: 0b                                        ; end

        // Wait for 100 ns
        #100;

        // Reset inputs
        re = 0;
        we = 0;
        wr_data = 0;

        // End the simulation
        $finish;
    end

endmodule









//(module
//  (func (export "addTwo") (param i32 i32) (result i32)
//    local.get 0
//    local.get 1
//    i32.add))


//0000000: 0061 736d                                 ; WASM_BINARY_MAGIC
//0000004: 0100 0000                                 ; WASM_BINARY_VERSION


//; section "Type" (1)
//0000008: 01                                        ; section code
//0000009: 00                                        ; section size (guess)
//000000a: 01                                        ; num types
//; func type 0
//000000b: 60                                        ; func
//000000c: 02                                        ; num params
//000000d: 7f                                        ; i32
//000000e: 7f                                        ; i32
//000000f: 01                                        ; num results
//0000010: 7f                                        ; i32
//0000009: 07                                        ; FIXUP section size


//; section "Function" (3)
//0000011: 03                                        ; section code
//0000012: 00                                        ; section size (guess)
//0000013: 01                                        ; num functions
//0000014: 00                                        ; function 0 signature index
//0000012: 02                                        ; FIXUP section size


//; section "Export" (7)
//0000015: 07                                        ; section code
//0000016: 00                                        ; section size (guess)
//0000017: 01                                        ; num exports
//0000018: 06                                        ; string length
//0000019: 6164 6454 776f                           addTwo  ; export name
//000001f: 00                                        ; export kind
//0000020: 00                                        ; export func index
//0000016: 0a                                        ; FIXUP section size


//; section "Code" (10)
//0000021: 0a                                        ; section code
//0000022: 00                                        ; section size (guess)
//0000023: 01                                        ; num functions
//; function body 0
//0000024: 00                                        ; func body size (guess)
//0000025: 00                                        ; local decl count
//0000026: 20                                        ; local.get
//0000027: 00                                        ; local index
//0000028: 20                                        ; local.get
//0000029: 01                                        ; local index
//000002a: 6a                                        ; i32.add
//000002b: 0b                                        ; end
//0000024: 07                                        ; FIXUP func body size
//0000022: 09                                        ; FIXUP section size


//; section "name"
//name
//000002c: 00                                        ; section code
//000002d: 00                                        ; section size (guess)
//000002e: 04                                        ; string length
//000002f: 6e61 6d65                                name  ; custom section name
//0000033: 02                                        ; local name type
//0000034: 00                                        ; subsection size (guess)
//0000035: 01                                        ; num functions
//0000036: 00                                        ; function index
//0000037: 00                                        ; num locals
//0000034: 03                                        ; FIXUP subsection size
//000002d: 0a                                        ; FIXUP section size