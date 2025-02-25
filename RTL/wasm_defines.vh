`define WASM_MAGIC_VERSION 64'h000000016d736100

`define WIDTH 64

//stack
`define st_width `WIDTH         //here!!!!!!!
`define st_depth 128
`define st_depth_mius_1 127
`define st_log2_depth 7
`define imem_width 8

//local/global memory; bram
`define log2_bram_depth_in 9
`define bram_in_width `WIDTH    //here!!!!!!!
`define bram_depth_in 512

//instruction memory
`define instr_bram_width 8

`define instr_bram_depth 262144
`define instr_log2_bram_depth 18

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
`define pa_re_num_max 128
`define log_pa_re_num_max 7

//call stack
//frame_type+retu_num+st_tag+instr_tag        
`define call_stack_width 28  //(3+`st_log2_depth+`instr_log2_bram_depth) 3+7+18=28
`define call_stack_depth 32
`define log_call_stack_depth 5

//global
`define global_width 32
`define global_num_max 8

//VS MVM
`define log2_S 5
`define log2_Width_max 10
`define log2_Height_max 10

`define MAX_DW    8                 // datawidth
`define MAX_log2DW   3

`define MAX_DW2 (`MAX_DW*2)

`define Tin 8
`define log2_Tin 3

`define Tout 8
`define log2_Tout 3

`define Acc_Delay 4
`define Acc_Height_Num 256
`define Tin_Acc_Delay `log2_Tin
