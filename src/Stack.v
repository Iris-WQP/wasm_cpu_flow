// `timescale 1ns / 1ps
`include "src/wasm_defines.vh"

 module Stack(   
        input clk,
        input rst_n,
        input push_num, //0 or 1
        input [3:0] pop_num, //0~3
        input [`st_width-1:0] push_data,
        output [`pop_num_max*`st_width-1:0] pop_window,
        output stack_full,
        output stack_empty
    );
    
    reg [`st_depth*`st_width-1:0] stack_reg;
    wire [`st_depth*`st_width-1:0] stack_reg_after_pop;
    wire [`st_depth*`st_width-1:0] stack_reg_after_push;
    reg [`st_log2_depth-1:0] pointer;   //stack bottom
    wire [`st_log2_depth-1:0] pointer_after_pop;
    wire [`st_log2_depth-1:0] pointer_after_push;
    
    assign stack_full = (pointer == `st_depth_mius_1);
    assign stack_empty = (pointer == 'd0);
    assign pop_window = stack_reg[`pop_num_max*`st_width-1:0];
    
    assign stack_reg_after_pop = stack_reg>>(pop_num*`st_width);
    wire [(`st_width+`st_depth*`st_width-1):0] push_mid_state;
    assign push_mid_state =  push_num? {stack_reg_after_pop, push_data}:{{`st_width{1'b0}}, stack_reg_after_pop};
    assign stack_reg_after_push = push_mid_state[`st_depth*`st_width-1:0];
    
    assign pointer_after_pop = (pointer > pop_num) ? (pointer-pop_num) : 'd0;
    assign pointer_after_push = push_num?((pointer_after_pop < (`st_depth-1))? (pointer_after_pop+1) : (`st_depth-1)):pointer_after_pop;
    
    always@(posedge clk or negedge rst_n)begin 
        if(~rst_n)begin
            stack_reg <= 'd0;
            pointer <= 'd0;
        end else begin
                stack_reg <= stack_reg_after_push;
                pointer <= pointer_after_push;
        end
    end
endmodule

//another choice: push first--posedge; pop next--negedge
