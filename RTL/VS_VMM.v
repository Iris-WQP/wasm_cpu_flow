`include "RTL/CNN_defines.vh"
`include "RTL/Single_MAC_array.v"
`include "RTL/generate_vld_shift.v"


module VS_VMM
(
	input clk,
    input rst_n,
    
    input [(`MAX_DW*`Tin)-1:0]i_dat,
    input [(`MAX_DW*`Tin*`Tout)-1:0]i_wt,
    
    output reg[(`MAX_DW2+`log2_Tin)*`Tout-1:0] o_dat
);

reg [(`MAX_DW*`Tin)-1:0]wt_reg[`Tout-1:0];
reg [(`MAX_DW*`Tin)-1:0]in_reg[`Tout-2:0];
wire [(`MAX_DW*`Tin)-1:0]input_transfer[`Tout-1:0];

wire [(`MAX_DW2+`log2_Tin)-1:0]dat_out[`Tout-1:0];
wire [(`MAX_DW2+`log2_Tin)-1:0]dat_out_after_shift[`Tout-1:0];

reg [(`MAX_DW*`Tin)-1:0] i_dat_reg;

always@(posedge clk or negedge rst_n)
    if(~rst_n) i_dat_reg <= 'd0;
    else i_dat_reg <= i_dat;


assign input_transfer[0] = i_dat_reg;

genvar i;
generate
    for(i=0;i<(`Tout-1);i=i+1)
    begin:i_Tout_minus_one

        assign input_transfer[i+1] = in_reg[i];

        always@(posedge clk or negedge rst_n)begin
            if(~rst_n)begin
                in_reg[i] <= 'd0;
            end else begin
                in_reg[i]<=input_transfer[i];
            end
        end

    end
endgenerate

generate
    for(i=0;i<`Tout;i=i+1)
    begin:i_Tout
        always@(*)
         wt_reg[i]=i_wt[i*(`MAX_DW*`Tin)+:`MAX_DW*`Tin];

        always@(*) o_dat[i*(`MAX_DW2+`log2_Tin)+:(`MAX_DW2+`log2_Tin)]=dat_out_after_shift[i];

        Single_MAC_array u_Single_MAC_array
        (
            .clk(clk),
            .wt(wt_reg[i]),
            .dat_in(input_transfer[i]),    
            .dat_out(dat_out[i])
        );

    end
endgenerate


assign dat_out_after_shift[`Tout-1] = dat_out[`Tout-1];

generate
    for(i=0;i<(`Tout-1);i=i+1)
    begin:col
        generate_vld_shift #
        (
        	.DATA_WIDTH(`MAX_DW2+`log2_Tin),
        	.DEPTH(`Tout-1-i)
        )u_generate_vld_shift
        (
            .clk(clk),
            .rst_n(rst_n),

            .data_in(dat_out[i]),
            .data_out(dat_out_after_shift[i])
        );
    end
endgenerate



endmodule
