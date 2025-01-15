`include "CNN_defines.vh"

module VMM
(
	input clk,
    
    input [(`MAX_DW*`Tin)-1:0]i_dat,
    input [(`MAX_DW*`Tin*`Tout)-1:0]i_wt,
    
    output reg[(`MAX_DW2+`log2_Tin)*`Tout-1:0] o_dat
);

reg [(`MAX_DW*`Tin)-1:0]wt_reg[`Tout-1:0];
genvar i;
generate
    for(i=0;i<`Tout;i=i+1)
    begin:wt_split
        always@(*)
            wt_reg[i]<=i_wt[i*(`MAX_DW*`Tin)+:`MAX_DW*`Tin];
    end
endgenerate


wire [(`MAX_DW2+`log2_Tin)-1:0]dat_out[`Tout-1:0];
generate
    for(i=0;i<`Tout;i=i+1)
    begin:col
        Single_MAC_array u_Single_MAC_array
        (
            .clk(clk),
            .wt(wt_reg[i]),
            .dat_in(i_dat),    
            .dat_out(dat_out[i])
        );
        
        always@(*)
            o_dat[i*(`MAX_DW2+`log2_Tin)+:(`MAX_DW2+`log2_Tin)]<=dat_out[i];
    end
endgenerate



endmodule
