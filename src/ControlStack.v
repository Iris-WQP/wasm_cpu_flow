// `timescale 1ns / 1ps
`include "src/wasm_defines.vh"
/*reg stack, local memory stack, and control stack*/ 
module ControlStack(   
        input clk,
        input rst_n,
        input push, //0 or 1
        input pop, 
        input [`call_stack_width-1:0] push_data,
        output [`call_stack_width-1:0] top_data,
        output control_stack_left_one
    );

    reg [`log_call_stack_depth:0] top_pointer;
    wire [`log_call_stack_depth:0] top_after_pop;
    wire [`log_call_stack_depth:0] top_after_push;
    reg [`call_stack_width-1:0] control_stack [`call_stack_depth-1:0]; 
    assign control_stack_left_one = (top_pointer == 'd1);
    // [frame_type(2bit), retu_num(1bit), stack_pointer_tag(4bit), retu_addr(8bit)]
    /*          frame_type   retu_num        jump      pop
      call      01           from list       v         end/return
      loop      11           from ifvoid     v         end/br
      block     00           from ifvoid     x         end/br
      if        10           from ifvoid     x         end/br
    */

    assign top_data = (top_pointer < 'd1)? `call_stack_width'dZ : control_stack[top_pointer-'d1];
    assign top_after_pop = top_pointer-pop;
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

endmodule