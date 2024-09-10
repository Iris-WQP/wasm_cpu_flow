`timescale 1ns / 1ps
`include "src/wasm_defines.vh"
module ALU(
input [`st_width-1:0] A,
input [`st_width-1:0] B,
input [`st_width-1:0] C,
input [3:0] ALUControl,
output reg [31:0] ALUResult
);

reg C_out;
reg [31:0] sum;
wire [31:0] eqz = {31'd0, (A==32'd0)};
wire [31:0] eq = {31'd0, (A==B)};
wire [31:0] ne = {31'd0, ~(A==B)};
wire [31:0] lt_u = {31'd0, (B<A)};
wire [31:0] gt_u = {31'd0, (B>A)};
wire [31:0] lt_s = {31'd0, ((B[31]^A[31])? B[31]:lt_u)};
wire [31:0] gt_s = {31'd0, ((B[31]^A[31])? A[31]:gt_u)};
always@* begin
{C_out,sum} = (ALUControl[0])? (B+(~A)+1'b1):(A+B);
case(ALUControl)
    4'b0000, 4'b0001: ALUResult = sum;
    4'b0010: ALUResult = A&B;
    4'b0011: ALUResult = A|B;
    4'b0100: ALUResult = eqz[0]? B:C;
    4'b0101: ALUResult = eqz;
    4'b0110: ALUResult = eq;
    4'b0111: ALUResult = lt_u;//unsigned lt
    4'b1000: ALUResult = gt_u;//unsigned gt
    4'b1001: ALUResult = lt_u|eq;//unsigned le
    4'b1010: ALUResult = gt_u|eq;//unsigned ge
    4'b1011: ALUResult = lt_s;//signed lt
    4'b1100: ALUResult = gt_s;//signed gt
    4'b1101: ALUResult = lt_s|eq;//signed le
    4'b1110: ALUResult = gt_s|eq;//signed ge
    4'b1111: ALUResult = ne;
    default: ALUResult = 32'd0;
endcase
end

//assign ALUFlags[3] = ALUResult[31];
//assign ALUFlags[2] = ~(| ALUResult[31:0]);
//assign ALUFlags[1] = (~ALUControl[1]) & C_out;
//assign ALUFlags[0] = (~ALUControl[1])&(A[31]^sum[31])&(~(ALUControl[0]^A[31]^B[31]));

endmodule
