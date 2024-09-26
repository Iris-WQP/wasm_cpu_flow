`define WASM_MAGIC_VERSION 64'h000000016d736100

`define WIDTH 32

//stack
`define st_width `WIDTH         //here!!!!!!!
`define st_depth 16
`define st_depth_mius_1 15
`define st_log2_depth 4
`define imem_width 8

//local/global memory; bram
`define log2_bram_depth_in 4
`define bram_in_width `WIDTH    //here!!!!!!!
`define bram_depth_in 16

//instruction memory
`define instr_bram_width 8

`define instr_bram_depth 128
`define instr_log2_bram_depth 7

`define instr_read_width 72   //8 bit operand + 64bit opcode, window size
`define read_window_size (`instr_read_width/`instr_bram_width) //9
`define log_read_window_size 4

`define instr_write_width 256
`define write_window_size (`instr_write_width/`instr_bram_width) //32
`define log_write_window_size 5

`define shift_fill_zero 1//(`log_read_window_size-3)
`define pop_num_max 3

//function
`define func_num_max 32