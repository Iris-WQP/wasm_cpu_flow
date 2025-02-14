`include "RTL/CNN_defines.vh"
`include "RTL/Tin_acc.v"

module Single_MAC_array
(
	input clk,

    input [(`MAX_DW*`Tin)-1:0]dat_in,
    input [(`MAX_DW*`Tin)-1:0]wt,
    output [(`MAX_DW2+`log2_Tin)-1:0] dat_out
);

reg [`MAX_DW-1:0] tp_dat_in[`Tin-1:0];
reg [`MAX_DW-1:0] tp_wt_in[`Tin-1:0];
(* use_dsp="yes" *)reg [`MAX_DW2*`Tin-1:0] mul_dat;

genvar i;
generate
    for(i=0;i<`Tin;i=i+1)
    begin:split
        always@(*)
        begin
            tp_dat_in[i]<=dat_in[i*(`MAX_DW)+:`MAX_DW];
            tp_wt_in [i]<=wt[i*(`MAX_DW)+:`MAX_DW];
        end
    
        always@(posedge clk)
            mul_dat[i*(`MAX_DW2)+:`MAX_DW2] <= $signed(tp_dat_in[i]) * $signed(tp_wt_in[i]);
    end
endgenerate


Tin_acc #
(
	.DATA_WIDTH(`MAX_DW2)
)u_Tin_acc
(
	.clk(clk),
    .i_dat(mul_dat),
    .o_dat(dat_out)
);

endmodule
