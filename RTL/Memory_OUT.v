`include "CNN_defines.vh"

module Memory_OUT #
(
	parameter WIDTH=256,
	parameter DEPTH=8,
	parameter log2_DEPTH=3
)
(
	input clk,
	input rst_n,
    input [log2_DEPTH-1:0] dat_num,
    
	//Wr Port
	input dat_vld,
	input [WIDTH-1:0] dat,
	
	output reg done
);

reg [WIDTH-1:0] memory[DEPTH-1:0];

reg [log2_DEPTH-1:0] wr_addr;
wire wr_addr_is_max_now=(wr_addr==dat_num);
wire wr_addr_will_update_now=dat_vld;
always @(posedge clk or negedge rst_n)
if(~rst_n)
    wr_addr<='d0;
else
    if(wr_addr_will_update_now)
    begin
        if(wr_addr_is_max_now)
            wr_addr<='d0;
        else
            wr_addr<=wr_addr+'d1;
    end

always @(posedge clk)
if(dat_vld)
   memory[wr_addr]<=dat;

always @(posedge clk or negedge rst_n)
if(~rst_n)
    done<=1'b0;
else
    done<=wr_addr_is_max_now&wr_addr_will_update_now;
    
endmodule
