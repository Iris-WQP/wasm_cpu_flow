module sram_sp_8192x64 (Q, CLK, CEN, GWEN, A, D, STOV, EMA, EMAW, EMAS, RET1N, WABL,
    WABLM);

  output [63:0] Q; //read data
  input  CLK;
  input  CEN; //low enable
  input  GWEN; //low write enable
  input [12:0] A; //addr
  input [63:0] D; //write data

  // useless for github version
  input  STOV;
  input [2:0] EMA;
  input [1:0] EMAW;
  input  EMAS;
  input  RET1N;
  input  WABL;
  input [1:0] WABLM;  

//   wire read_en;
//   wire write_en;
  reg [63:0] read_data;
  wire [63:0] write_data;
  reg [63:0] fake_sram [8191:0]; 

  assign Q = read_data;
  assign write_data = D;
//   assign read_en = (~CEN) & GWEN;
//   assign write_en = (~CEN) & (~GWEN);

  always@(posedge CLK)begin
    if(~CEN)begin
        if(GWEN)begin //read enable
            read_data <= fake_sram[A];
        end else begin //write enable
            fake_sram[A] <= write_data;
        end
    end 
  end

endmodule