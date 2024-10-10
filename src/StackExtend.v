// `timescale 1ns / 1ps
`include "src/wasm_defines.vh"
/*reg stack, local memory stack, and control stack*/ 
 module StackExtend(   
        input clk,
        input rst_n,
        input push_num, //0 or 1
        input [3:0] pop_num, 
        input [`st_width-1:0] push_data,

        //pop windows for ALU
        output [`st_width-1:0] pop_window_A,
        output [`st_width-1:0] pop_window_B,
        output [`st_width-1:0] pop_window_C,

        output stack_exceed_pop,
        output stack_exceed_push
    );
    
    reg [`st_width-1:0] extend_stack [`st_depth-1:0];
    reg [`st_log2_depth:0] top_pointer;
    wire [`st_log2_depth:0] top_after_pop;
    wire [`st_log2_depth:0] top_after_push;
    assign stack_exceed_pop = top_pointer < pop_num;
    assign stack_exceed_push = (top_after_pop + push_num) > `st_depth;
    assign top_after_pop = stack_exceed_pop? 'd0 : (top_pointer - pop_num);
    assign top_after_push = stack_exceed_push? `st_depth : (top_after_pop + push_num);
    
    assign pop_window_A = (top_pointer < 'd1)? `st_width'dZ : extend_stack[top_pointer-'d1];
    assign pop_window_B = (top_pointer < 'd2)? `st_width'dZ : extend_stack[top_pointer-'d2];
    assign pop_window_C = (top_pointer < 'd3)? `st_width'dZ : extend_stack[top_pointer-'d3];

    always@(posedge clk or negedge rst_n)begin 
        if(~rst_n)begin
            top_pointer <= 'd0;
        end else begin
                top_pointer <= top_after_push;
                if (push_num) begin
                    extend_stack[top_after_pop] <= push_data;
                end
        end
    end


    

endmodule

//another choice: push first--posedge; pop next--negedge
