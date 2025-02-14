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

`define instr_bram_depth 256
`define instr_log2_bram_depth 8

`define instr_read_width 64   //8 bit operand + 56bit opcode, window size
`define read_window_size (`instr_read_width/`instr_bram_width) //8
`define log_read_window_size 3

`define instr_write_width 256
`define write_window_size (`instr_write_width/`instr_bram_width) //32
`define log_write_window_size 5

`define shift_fill_zero 1//(`log_read_window_size-3)
`define pop_num_max `pa_re_num_max

//function
`define func_num_max 32
`define log_func_num_max 5
`define pa_re_num_max 16
`define log_pa_re_num_max 4

//call stack
//frame_type+retu_num+st_tag+instr_tag        
`define call_stack_width 15  //(3+`st_log2_depth+`instr_log2_bram_depth) 3+4+8=15
`define call_stack_depth 8
`define log_call_stack_depth 3

//global
`define global_width 32
`define global_num_max 8
