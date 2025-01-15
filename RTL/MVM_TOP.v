`include "CNN_defines.vh"


module MVM_TOP
(
	input clk,
	input rst_n,
	
    input [`log2_S-1:0]shift,
    input [`log2_Height_max-1:0]height,
    input [`log2_Width_max-`log2_Tin-1:0]Win_div_Tin,
    input [`log2_Width_max-`log2_Tin-1:0]Wout_div_Tout,
    
	input dat_vld,
	input [(`MAX_DW*`Tin)-1:0]i_dat,
	input wt_vld,
	input [(`MAX_DW*`Tin*`Tout)-1:0]i_wt,

	output dat_out_vld,
	output [`MAX_DW*`Tout-1:0]dat_out,
	output done
);
wire loop_height_start;
wire loop_height_done;
wire loop_Win_div_Tin_max;
wire loop_Win_div_Tin_done;
wire Wout_div_Tout_done;

wire vmm_out_vld;
wire [(`MAX_DW2+`log2_Tin)*`Tout-1:0] vmm_out;


FSM u_FSM
(
    .clk(clk),
    .rst_n(rst_n),
    .dat_vld(dat_vld),
    .wt_vld(wt_vld),
    
    .height(height),
    .Win_div_Tin(Win_div_Tin),
    .Wout_div_Tout(Wout_div_Tout),
   
    
    .loop_height_start(loop_height_start),
    .loop_height_done(loop_height_done),
    .loop_Win_div_Tin_max(loop_Win_div_Tin_max),
    .loop_Win_div_Tin_done(loop_Win_div_Tin_done),
    .Wout_div_Tout_done(Wout_div_Tout_done)
    
);

VMM u_VMM
(
    .clk(clk),
    .i_dat(i_dat),
    .i_wt(i_wt),
    
    .o_dat(vmm_out)
);

wire In_height_loop_end,In_acc_loop_max,In_acc_and_height_loop_end;


//添加阵列内加法树造成的延迟
generate_vld_shift #
(
	.DATA_WIDTH(4),
	.DEPTH(`Tin_Acc_Delay+1)
)vld
(
    .clk(clk),
    .rst_n(rst_n),

    .data_in({dat_vld,loop_height_done,loop_Win_div_Tin_max,loop_Win_div_Tin_done}),
    .data_out({vmm_out_vld, In_height_loop_end,In_acc_loop_max,In_acc_and_height_loop_end})
);


Accumulation u_Accumulation
(
    .clk(clk),
    .rst_n(rst_n),
    
    .shift(shift),
    .In_height_loop_end(In_height_loop_end),
    .In_acc_loop_max(In_acc_loop_max),
    .In_acc_and_height_loop_end(In_acc_and_height_loop_end),
    
    .dat_vld_i(vmm_out_vld),
    .dat_i(vmm_out),

    .dat_out_vld(dat_out_vld),
    .dat_out(dat_out)
);



endmodule
