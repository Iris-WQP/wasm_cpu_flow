// `timescale 1ns / 1ps
`include "RTL/wasm_defines.vh"
/*reg stack, local memory stack, and control stack*/ 
 module OperandStack(   
        input clk,
        input rst_n,
        input shift_vld,
        input push_num, //0 or 1
        input [3:0] pop_num, 
        input [`st_width-1:0] push_data,

        //pop windows for ALU
        output [`st_width-1:0] pop_window_A,
        output [`st_width-1:0] pop_window_B,
        output [`st_width-1:0] pop_window_C,

        output stack_exceed_pop,
        output stack_exceed_push,

        //control stack
        input call,
        input retu,
        input [7:0] allocate_local_memory_size,
        input [`st_log2_depth-1:0] function_stack_tag,
        output [`st_log2_depth:0] w_top_pointer,

        //local memory stack
        input [`st_log2_depth:0] l_addr,
        input local_set,
        // input [`st_width-1:0] local_set_data,
        output [`st_width-1:0] local_get_data
    );
    
    //operand stack
    reg [`st_width-1:0] extend_stack [`st_depth-1:0];
    reg [`st_log2_depth:0] top_pointer;
    wire [`st_log2_depth:0] top_after_pop;
    wire [`st_log2_depth:0] top_after_push;    
    
    assign top_after_pop = retu? function_stack_tag : (top_pointer - pop_num); 
    assign top_after_push = top_after_pop + (call? allocate_local_memory_size:push_num);

    assign stack_exceed_pop = top_pointer < pop_num;
    assign stack_exceed_push = (top_after_pop + push_num) > `st_depth;
    assign w_top_pointer = top_pointer;
    
    
    assign pop_window_A = (top_pointer < 'd1)? `st_width'd0 : extend_stack[top_pointer-'d1];
    assign pop_window_B = (top_pointer < 'd2)? `st_width'd0 : extend_stack[top_pointer-'d2];
    assign pop_window_C = (top_pointer < 'd3)? `st_width'd0 : extend_stack[top_pointer-'d3];
    
    assign local_get_data = extend_stack[l_addr];

    integer i;
    // for(i=0; i<`st_depth; i=i+1)begin
    //     always@(posedge clk or negedge rst_n)begin
    //         if(~rst_n)begin
    //             extend_stack[i] <= 'dZ;
    //         end
    //     end
    // end

    always@(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            top_pointer <= 'd0;
            for(i=0; i<`st_depth; i=i+1)
            begin: stack_init
                extend_stack[i] <= 'd0;
            end
        end else if(shift_vld) begin
            top_pointer <= top_after_push;
            if(local_set)begin
                extend_stack[l_addr] <= pop_window_A;
            end else if (push_num) begin
                extend_stack[top_after_pop] <= push_data;
            end
        end
    end

endmodule

//another choice: push first--posedge; pop next--negedge
