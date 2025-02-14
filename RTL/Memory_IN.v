`include "CNN_defines.vh"

module Memory_IN#
(
	parameter WIDTH=256,
	parameter DEPTH=8,
	parameter log2_DEPTH=3
)

(
    input clk,
    input rst_n,
    input start,
    input [log2_DEPTH-1:0] num_of_dat,
    
    output reg [WIDTH-1:0]dat_out,
    output reg dat_out_vld,
    output reg done
);
wire cnt_done;
reg [WIDTH-1:0] memory[DEPTH-1:0];

reg working;
always @(posedge clk or negedge rst_n)
if(~rst_n)
	working<=1'b0;
else
	if(start)
		working<=1'b1;
	else
		if(cnt_done)
			working<=1'b0;


reg [log2_DEPTH-1:0]cnt;
wire cnt_is_max_now=(cnt==num_of_dat);
wire cnt_will_update_now=working;
always @(posedge clk or negedge rst_n)
if(~rst_n)
    cnt<='d0;
else
    if(cnt_will_update_now)
    begin
        if(cnt_is_max_now)
            cnt<='d0;
        else
            cnt<=cnt+'d1;
    end

assign cnt_done=cnt_is_max_now&cnt_will_update_now;
    
always @(posedge clk or negedge rst_n)
if(~rst_n)
	dat_out<=0;
else
    dat_out<=memory[cnt];

wire dat_out_vld_d0;
assign dat_out_vld_d0=working;

always @(posedge clk or negedge rst_n)
if(~rst_n)
	dat_out<=0;
else
    dat_out_vld<=dat_out_vld_d0;

always @(posedge clk or negedge rst_n)
if(~rst_n)
	done<=0;
else
    done<=cnt_done;
            
endmodule
