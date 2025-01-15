`include "RTL/CNN_defines.vh"

//(* use_dsp = "yes" *)
module Accumulation
(
	input clk,
	input rst_n,
    input [`log2_S-1:0]shift,

	input In_height_loop_end,
	input In_acc_loop_max,
	input In_acc_and_height_loop_end,
	
	input [`Tout*(`MAX_DW2+`log2_Tin)-1:0]dat_i,
	input dat_vld_i, 

	output dat_out_vld,
	output reg [`MAX_DW*`Tout-1:0]dat_out
);

reg [`Tout*(`MAX_DW2+`log2_Width_max)-1:0]acc_mem[`Acc_Height_Num-1:0];
reg [`Acc_Height_Num-1:0]ptr;

reg load_new_data;
reg [`Tout*(`MAX_DW2+`log2_Width_max)-1:0]adder_out;
wire [`Tout*(`MAX_DW2+`log2_Width_max)-1:0]adder_in_0=load_new_data?0:acc_mem[ptr];
wire [`Tout*(`MAX_DW2+`log2_Tin)-1:0]adder_in_1=dat_i;

integer i;

always @(*)
begin
    for(i=0;i<`Tout;i=i+1)
        adder_out[(`MAX_DW2+`log2_Width_max)*i+:(`MAX_DW2+`log2_Width_max)]=
        $signed(adder_in_0[(`MAX_DW2+`log2_Width_max)*i+:(`MAX_DW2+`log2_Width_max)])
        +$signed(adder_in_1[(`MAX_DW2+`log2_Tin)*i+:(`MAX_DW2+`log2_Tin)]);
end

always @(posedge clk or negedge rst_n)
if(~rst_n)
    load_new_data<=1'b1;
else
    if(In_acc_and_height_loop_end & dat_vld_i)
        load_new_data<=1'b1;
    else
        if(In_height_loop_end & dat_vld_i)
            load_new_data<=1'b0;

always @(posedge clk or negedge rst_n)
if(~rst_n)
    ptr<='d0;
else
    if(In_height_loop_end & dat_vld_i)
        ptr<='d0;
    else
        if(dat_vld_i)
            ptr<=ptr+'d1;

always @(posedge clk)
if(dat_vld_i)
    acc_mem[ptr]<=adder_out;


reg [`Tout*(`MAX_DW2+`log2_Width_max)-1:0]adder_out_d;
always @(posedge clk or negedge rst_n)
if(~rst_n)
	adder_out_d<=0;
else
	adder_out_d<=adder_out;
	
reg [`MAX_DW2+`log2_Width_max-1:0]tp[`Tout-1:0];
reg [`MAX_DW2+`log2_Width_max-1:0]tp1[`Tout-1:0];
reg [`MAX_DW2+`log2_Width_max-1:0]tp2[`Tout-1:0];
reg [1:0]round_dat[`Tout-1:0];
reg [`MAX_DW-1:0]tp_sat_8bit[`Tout-1:0];

always @(*)
begin
	for(i=0;i<`Tout;i=i+1)
	begin
		tp[i]=adder_out_d[(`MAX_DW2+`log2_Width_max)*i+:(`MAX_DW2+`log2_Width_max)];
		//right shift and round
        tp1[i]=$signed(tp[i])>>>shift[`log2_S-2:0];
        round_dat[i]=((shift!=0)&&(tp1[i]!={1'b0, {(`MAX_DW2+`log2_Width_max-1){1'b1}} }))?
                      {1'b0,tp[i][shift-1]}:0;
	end
end 

always @(posedge clk)
begin
	for(i=0;i<`Tout;i=i+1)
	begin
        tp2[i]<=$signed(tp1[i])+$signed(round_dat[i]);
	end
end 

always @(posedge clk)
begin
	for(i=0;i<`Tout;i=i+1)
	begin
        //tp2 is negetive and tp2[`MAX_DW2+`log2Tc-2:(`MAX_DW-1)] is not all 1, means tp2 < `MAX_DW'h8000(-2^(`MAX_DW-1))
        if( (tp2[i][`MAX_DW2+`log2_Width_max-1]) & (!(&tp2[i][(`MAX_DW2+`log2_Width_max-2):(`MAX_DW-1)])) ) 
            tp_sat_8bit[i]<={1'b1,{(`MAX_DW-1){1'b0}}};// sat to -2^(`MAX_DW-1)
        else
        begin
            if( (!tp2[i][`MAX_DW2+`log2_Width_max-1]) & (|tp2[i][(`MAX_DW2+`log2_Width_max-2):(`MAX_DW-1)]) ) //tp2 is positive and tp2>`MAX_DW2'h7fff
                tp_sat_8bit[i]<={1'b0,{(`MAX_DW-1){1'b1}}};//`MAX_DW'h7fff;
            else
                tp_sat_8bit[i]<=tp2[i][(`MAX_DW-1):0];    

        end
	end
end


always @(posedge clk)
begin
	for(i=0;i<`Tout;i=i+1)
        dat_out[`MAX_DW*i+:`MAX_DW]<=$signed(tp_sat_8bit[i]);
end      

generate_vld_shift #
(
	.DATA_WIDTH(1),
	.DEPTH(`Acc_Delay)
)out_vld
(
    .clk(clk),
    .rst_n(rst_n),

    .data_in(dat_vld_i&In_acc_loop_max),
    .data_out(dat_out_vld)
);


endmodule
