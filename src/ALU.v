// `timescale 1ns / 1ps
`include "src/wasm_defines.vh"
module ALU(
input [`st_width-1:0] A,
input [`st_width-1:0] B,
input [`st_width-1:0] C,
input [4:0] ALUControl,
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
    5'b00000, 5'b0001: ALUResult = sum;
    5'b00010: ALUResult = A&B;
    5'b00011: ALUResult = A|B;
    5'b00100: ALUResult = eqz[0]? B:C;
    5'b00101: ALUResult = eqz;
    5'b00110: ALUResult = eq;
    5'b00111: ALUResult = lt_u;//unsigned lt
    5'b01000: ALUResult = gt_u;//unsigned gt
    5'b01001: ALUResult = lt_u|eq;//unsigned le
    5'b01010: ALUResult = gt_u|eq;//unsigned ge
    5'b01011: ALUResult = lt_s;//signed lt
    5'b01100: ALUResult = gt_s;//signed gt
    5'b01101: ALUResult = lt_s|eq;//signed le
    5'b01110: ALUResult = gt_s|eq;//signed ge
    5'b01111: ALUResult = ne;
    // B shift left A bits 0x74
    5'b10000: ALUResult = B << A;
    // signed B shift right A bits 0x75
    5'b10001: ALUResult = B >>> A;
    // unsigned B shift right A bits 0x76
    5'b10010: ALUResult = B >> A;
    // i32 B rotate left A bits 0x77
    5'b10011: ALUResult = B << A | B >>> (32 - A);
    // i32 B rotate right A bits 0x78
    5'b10100: ALUResult = B >>> A | B << (32 - A);


    default: ALUResult = 32'd0;
endcase
end

//assign ALUFlags[3] = ALUResult[31];
//assign ALUFlags[2] = ~(| ALUResult[31:0]);
//assign ALUFlags[1] = (~ALUControl[1]) & C_out;
//assign ALUFlags[0] = (~ALUControl[1])&(A[31]^sum[31])&(~(ALUControl[0]^A[31]^B[31]));

endmodule
