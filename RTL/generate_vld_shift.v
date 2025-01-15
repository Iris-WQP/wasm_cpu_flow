// `include "RTL/CNN_defines.vh"

module generate_vld_shift #
(
	parameter DATA_WIDTH=256,
	parameter DEPTH=16
)
(
    input clk,
    input rst_n,

    input [DATA_WIDTH-1:0]data_in,
    output [DATA_WIDTH-1:0]data_out
);

reg [DATA_WIDTH-1:0]dat_reg[DEPTH-1:0];

assign data_out=dat_reg[DEPTH-1];

always@(posedge clk or negedge rst_n) 
if(~rst_n)
    dat_reg[0]<=0;
else
    dat_reg[0]<=data_in;
        
genvar i;
generate
    for(i=1;i<DEPTH;i=i+1) 
    begin:shift
    
        always@(posedge clk or negedge rst_n) 
        if(~rst_n)
            dat_reg[i]<=0;
        else
            dat_reg[i]<=dat_reg[i-1];
    end
endgenerate

endmodule
