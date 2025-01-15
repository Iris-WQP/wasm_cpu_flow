`include "RTL/CNN_defines.vh"


module FSM
(
    input clk,
    input rst_n,
    
    input dat_vld,
    input wt_vld,
    input [`log2_Height_max-1:0]height,
    input [`log2_Width_max-`log2_Tin-1:0]Win_div_Tin,
    input [`log2_Width_max-`log2_Tin-1:0]Wout_div_Tout,
    
    output loop_height_start, 
    output loop_height_done,
    output loop_Win_div_Tin_max,
    output loop_Win_div_Tin_done,
    output Wout_div_Tout_done
);
 
    
reg [`log2_Height_max-1:0]h_cnt;
wire h_cnt_is_max_now=(h_cnt==height-1);
wire h_cnt_will_update_now=dat_vld;
always @(posedge clk or negedge rst_n)
if(~rst_n)
    h_cnt<='d0;
else
    if(h_cnt_will_update_now)
    begin
        if(h_cnt_is_max_now)
            h_cnt<='d0;
        else
            h_cnt<=h_cnt+'d1;
    end


reg [`log2_Width_max-1:0]Win_cnt;
wire Win_cnt_is_max_now=(Win_cnt==Win_div_Tin-1);
wire Win_cnt_will_update_now=h_cnt_is_max_now&h_cnt_will_update_now;
always @(posedge clk or negedge rst_n)
if(~rst_n)
    Win_cnt<='d0;
else
    if(Win_cnt_will_update_now)
    begin
        if(Win_cnt_is_max_now)
            Win_cnt<='d0;
        else
            Win_cnt<=Win_cnt+'d1;
    end


reg [`log2_Width_max-1:0]Wout_cnt;
wire Wout_cnt_is_max_now=(Wout_cnt==Wout_div_Tout-1);
wire Wout_cnt_will_update_now=Win_cnt_is_max_now&Win_cnt_will_update_now;
always @(posedge clk or negedge rst_n)
if(~rst_n)
    Wout_cnt<='d0;
else
    if(Wout_cnt_will_update_now)
    begin
        if(Wout_cnt_is_max_now)
            Wout_cnt<='d0;
        else
            Wout_cnt<=Wout_cnt+'d1;
    end
    
    
assign loop_height_start=(h_cnt==0)&dat_vld; 
assign loop_height_done=h_cnt_is_max_now&dat_vld; 
assign loop_Win_div_Tin_max=Win_cnt_is_max_now&dat_vld;

assign loop_Win_div_Tin_done=Win_cnt_is_max_now&Win_cnt_will_update_now;
assign Wout_div_Tout_done=Wout_cnt_is_max_now&Wout_cnt_will_update_now;
    
    
    
endmodule
