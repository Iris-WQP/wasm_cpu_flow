// `timescale 1ns / 1ps
`include "src/wasm_defines.vh"
/*reg stack, local memory stack, and control stack*/ 
module ControlStack(   
        input clk,
        input rst_n,
        input push, //0 or 1
        input pop, 
        input return,
        input [`call_stack_width-1:0] push_data,
        output [`call_stack_width-1:0] top_data,
        output control_stack_left_one,

        input function_call,
        output [`st_log2_depth-1:0] function_stack_tag
    );

    reg [`log_call_stack_depth:0] top_pointer;
    wire [`log_call_stack_depth:0] top_function_pointer;
    wire [`log_call_stack_depth:0] top_after_pop;
    wire [`log_call_stack_depth:0] top_after_push;
    reg [`call_stack_width-1:0] control_stack [`call_stack_depth-1:0]; 
    assign control_stack_left_one = (top_pointer == 'd1);
    assign function_stack_tag = control_stack[top_function_pointer][(`st_log2_depth+`instr_log2_bram_depth-1):`instr_log2_bram_depth];
    // [frame_type(2bit), retu_num(1bit), stack_pointer_tag(4bit), extra(8bit)]
    /*          frame_type   retu_num        jump      pop          extra
      call      01           from list       v         end/return   return_address
      loop      11           from ifvoid     v         end/br       return_address
      block     00           from ifvoid     x         end/br       None
      if        10           from ifvoid     x         end/br       None
    */

    assign top_data = return?  control_stack[top_function_pointer] : ((top_pointer < 'd1)? `call_stack_width'dZ : control_stack[top_pointer-'d1]);
    assign top_after_pop = return? top_function_pointer : (top_pointer-pop);
    assign top_after_push = top_after_pop+push;

    always@(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            top_pointer <= 'd0;
        end
        else begin
            top_pointer <= top_after_push;
            if (push) begin
                control_stack[top_after_pop] <= push_data;
            end
        end
    end

    //call stack
    wire function_return;
    reg [`log_call_stack_depth:0] function_pointer_list[(`func_num_max-1):0];
    reg [`log_pa_re_num_max-1:0] function_pointer_list_pointer;
    assign function_return = pop & (control_stack[top_after_pop][14:13] == 2'b01); //|return_instr;
    assign top_function_pointer = function_pointer_list[function_pointer_list_pointer-'d1];

    always@(posedge clk or negedge rst_n)begin
        if(~rst_n)begin
            function_pointer_list_pointer <= 'd0;
        end
        else begin
            function_pointer_list_pointer <= function_pointer_list_pointer+function_call-function_return;
            if (function_call) begin
                function_pointer_list[function_pointer_list_pointer] <= top_after_pop;
            end
        end
    end

endmodule