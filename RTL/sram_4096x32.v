/* verilog_memcomp Version: p1.0.14-EAC */
/* common_memcomp Version: p1.0.4-EAC */
/* lang compiler Version: 4.9.3-EAC Oct 11 2016 15:45:39 */
//
//       CONFIDENTIAL AND PROPRIETARY SOFTWARE OF ARM PHYSICAL IP, INC.
//      
//       Copyright (c) 1993 - 2024 ARM Physical IP, Inc.  All Rights Reserved.
//      
//       Use of this Software is subject to the terms and conditions of the
//       applicable license agreement with ARM Physical IP, Inc.
//       In addition, this Software is protected by patents, copyright law 
//       and international treaties.
//      
//       The copyright notice(s) in this Software does not indicate actual or
//       intended publication of this Software.
//
//      Verilog model for Synchronous Single-Port Ram
//
//       Instance Name:              sram_4096x32
//       Words:                      4096
//       Bits:                       32
//       Mux:                        16
//       Drive:                      6
//       Write Mask:                 Off
//       Write Thru:                 Off
//       Extra Margin Adjustment:    On
//       Redundany:                  Off
//       Test Muxes                  Off
//       Power Gating:               Off
//       Retention:                  On
//       Pipeline:                   Off
//       Read Disturb Test:	        Off
//       
//       Creation Date:  Wed Nov 20 11:00:08 2024
//       Version: 	r0p0
//
//      Modeling Assumptions: This model supports full gate level simulation
//          including proper x-handling and timing check behavior.  Unit
//          delay timing is included in the model. Back-annotation of SDF
//          (v3.0 or v2.1) is supported.  SDF can be created utilyzing the delay
//          calculation views provided with this generator and supported
//          delay calculators.  All buses are modeled [MSB:LSB].  All 
//          ports are padded with Verilog primitives.
//
//      Modeling Limitations: None.
//
//      Known Bugs: None.
//
//      Known Work Arounds: N/A
//
`timescale 1 ns/1 ps
`define ARM_MEM_PROP 1.000
`define ARM_MEM_RETAIN 1.000
`define ARM_MEM_PERIOD 3.000
`define ARM_MEM_WIDTH 1.000
`define ARM_MEM_SETUP 1.000
`define ARM_MEM_HOLD 0.500
`define ARM_MEM_COLLISION 3.000

module datapath_latch_sram_4096x32 (CLK,Q_update,D_update,SE,SI,D,DFTRAMBYP,mem_path,XQ,Q);
	input CLK,Q_update,D_update,SE,SI,D,DFTRAMBYP,mem_path,XQ;
	output Q;

	reg    D_int;
	reg    Q;

   //  Model PHI2 portion
   always @(CLK or SE or SI or D) begin
      if (CLK === 1'b0) begin
         if (SE===1'b1)
           D_int=SI;
         else if (SE===1'bx)
           D_int=1'bx;
         else
           D_int=D;
      end
   end

   // model output side of RAM latch
   always @(posedge Q_update or posedge D_update or mem_path or posedge XQ) begin
      if (XQ===1'b0) begin
         if (DFTRAMBYP===1'b1)
           Q=D_int;
         else
           Q=mem_path;
      end
      else
        Q=1'bx;
   end
endmodule // datapath_latch_sram_4096x32

// If ARM_UD_MODEL is defined at Simulator Command Line, it Selects the Fast Functional Model
`ifdef ARM_UD_MODEL

// Following parameter Values can be overridden at Simulator Command Line.

// ARM_UD_DP Defines the delay through Data Paths, for Memory Models it represents BIST MUX output delays.
`ifdef ARM_UD_DP
`else
`define ARM_UD_DP #0.001
`endif
// ARM_UD_CP Defines the delay through Clock Path Cells, for Memory Models it is not used.
`ifdef ARM_UD_CP
`else
`define ARM_UD_CP
`endif
// ARM_UD_SEQ Defines the delay through the Memory, for Memory Models it is used for CLK->Q delays.
`ifdef ARM_UD_SEQ
`else
`define ARM_UD_SEQ #0.01
`endif

`celldefine
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
module sram_4096x32 (VDDCE, VDDPE, VSSE, Q, CLK, CEN, GWEN, A, D, STOV, EMA, EMAW,
    EMAS, RET1N, WABL, WABLM);
`else
module sram_4096x32 (Q, CLK, CEN, GWEN, A, D, STOV, EMA, EMAW, EMAS, RET1N, WABL, WABLM);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 32;
  parameter WORDS = 4096;
  parameter MUX = 16;
  parameter MEM_WIDTH = 512; // redun block size 16, 256 on left, 256 on right
  parameter MEM_HEIGHT = 256;
  parameter WP_SIZE = 32 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 1;
  parameter ROWS = 256;

  output [31:0] Q;
  input  CLK;
  input  CEN;
  input  GWEN;
  input [11:0] A;
  input [31:0] D;
  input  STOV;
  input [2:0] EMA;
  input [1:0] EMAW;
  input  EMAS;
  input  RET1N;
  input  WABL;
  input [1:0] WABLM;
`ifdef POWER_PINS
  inout VDDCE;
  inout VDDPE;
  inout VSSE;
`endif

`ifdef POWER_PINS
  reg bad_VDDCE;
  reg bad_VDDPE;
  reg bad_VSSE;
  reg bad_power;
`endif
  wire corrupt_power;
  reg pre_charge_st;
  integer row_address;
  integer mux_address;
  initial row_address = 0;
  initial mux_address = 0;
  reg [511:0] mem [0:255];
  reg [511:0] row, row_t;
  reg LAST_CLK;
  reg [511:0] row_mask;
  reg [511:0] new_data;
  reg [511:0] data_out;
  reg [31:0] readLatch0;
  reg [31:0] shifted_readLatch0;
  wire [31:0] Q_int;
  reg [31:0] Q_int_delayed;
  reg XQ, Q_update;
  reg XD_sh, D_sh_update;
  wire [31:0] D_int_bmux;
  reg [31:0] mem_path;
  reg [31:0] mem_path_d;
  reg [31:0] writeEnable;
  reg clk0_int;

  wire [31:0] Q_;
 wire  CLK_;
  wire  CEN_;
  reg  CEN_int;
  reg  CEN_p2;
  wire  GWEN_;
  reg  GWEN_int;
  wire [11:0] A_;
  reg [11:0] A_int;
  wire [31:0] D_;
  reg [31:0] D_int;
  reg [31:0] XD_int;
  wire  STOV_;
  reg  STOV_int;
  wire [2:0] EMA_;
  reg [2:0] EMA_int;
  wire [1:0] EMAW_;
  reg [1:0] EMAW_int;
  wire  EMAS_;
  reg  EMAS_int;
  wire  RET1N_;
  reg  RET1N_int;
  wire  WABL_;
  reg  WABL_int;
  wire [1:0] WABLM_;
  reg [1:0] WABLM_int;

  assign Q[0] = Q_[0]; 
  assign Q[1] = Q_[1]; 
  assign Q[2] = Q_[2]; 
  assign Q[3] = Q_[3]; 
  assign Q[4] = Q_[4]; 
  assign Q[5] = Q_[5]; 
  assign Q[6] = Q_[6]; 
  assign Q[7] = Q_[7]; 
  assign Q[8] = Q_[8]; 
  assign Q[9] = Q_[9]; 
  assign Q[10] = Q_[10]; 
  assign Q[11] = Q_[11]; 
  assign Q[12] = Q_[12]; 
  assign Q[13] = Q_[13]; 
  assign Q[14] = Q_[14]; 
  assign Q[15] = Q_[15]; 
  assign Q[16] = Q_[16]; 
  assign Q[17] = Q_[17]; 
  assign Q[18] = Q_[18]; 
  assign Q[19] = Q_[19]; 
  assign Q[20] = Q_[20]; 
  assign Q[21] = Q_[21]; 
  assign Q[22] = Q_[22]; 
  assign Q[23] = Q_[23]; 
  assign Q[24] = Q_[24]; 
  assign Q[25] = Q_[25]; 
  assign Q[26] = Q_[26]; 
  assign Q[27] = Q_[27]; 
  assign Q[28] = Q_[28]; 
  assign Q[29] = Q_[29]; 
  assign Q[30] = Q_[30]; 
  assign Q[31] = Q_[31]; 
  assign CLK_ = CLK;
  assign CEN_ = CEN;
  assign GWEN_ = GWEN;
  assign A_[0] = A[0];
  assign A_[1] = A[1];
  assign A_[2] = A[2];
  assign A_[3] = A[3];
  assign A_[4] = A[4];
  assign A_[5] = A[5];
  assign A_[6] = A[6];
  assign A_[7] = A[7];
  assign A_[8] = A[8];
  assign A_[9] = A[9];
  assign A_[10] = A[10];
  assign A_[11] = A[11];
  assign D_[0] = D[0];
  assign D_[1] = D[1];
  assign D_[2] = D[2];
  assign D_[3] = D[3];
  assign D_[4] = D[4];
  assign D_[5] = D[5];
  assign D_[6] = D[6];
  assign D_[7] = D[7];
  assign D_[8] = D[8];
  assign D_[9] = D[9];
  assign D_[10] = D[10];
  assign D_[11] = D[11];
  assign D_[12] = D[12];
  assign D_[13] = D[13];
  assign D_[14] = D[14];
  assign D_[15] = D[15];
  assign D_[16] = D[16];
  assign D_[17] = D[17];
  assign D_[18] = D[18];
  assign D_[19] = D[19];
  assign D_[20] = D[20];
  assign D_[21] = D[21];
  assign D_[22] = D[22];
  assign D_[23] = D[23];
  assign D_[24] = D[24];
  assign D_[25] = D[25];
  assign D_[26] = D[26];
  assign D_[27] = D[27];
  assign D_[28] = D[28];
  assign D_[29] = D[29];
  assign D_[30] = D[30];
  assign D_[31] = D[31];
  assign STOV_ = STOV;
  assign EMA_[0] = EMA[0];
  assign EMA_[1] = EMA[1];
  assign EMA_[2] = EMA[2];
  assign EMAW_[0] = EMAW[0];
  assign EMAW_[1] = EMAW[1];
  assign EMAS_ = EMAS;
  assign RET1N_ = RET1N;
  assign WABL_ = WABL;
  assign WABLM_[0] = WABLM[0];
  assign WABLM_[1] = WABLM[1];

`ifdef POWER_PINS
  assign corrupt_power = bad_power;
`else
  assign corrupt_power = 1'b0;
`endif

   `ifdef ARM_FAULT_MODELING
     sram_4096x32_error_injection u1(.CLK(CLK_), .Q_out(Q_), .A(A_int), .CEN(CEN_int), .GWEN(GWEN_int), .WEN(GWEN_int), .Q_in(Q_int));
  `else
  assign `ARM_UD_SEQ Q_ = (RET1N_ | pre_charge_st) & ~corrupt_power ? ((STOV_ ? (Q_int_delayed) : (Q_int))) : {32{1'bx}};
  `endif

// If INITIALIZE_MEMORY is defined at Simulator Command Line, it Initializes the Memory with all ZEROS.
`ifdef INITIALIZE_MEMORY
  integer i;
  initial
  begin
    #0;
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'b0}};
  end
`endif
  always @ (EMA_) begin
  	if(EMA_ < 2) 
   	$display("Warning: Set Value for EMA doesn't match Default value 2 in %m at %0t", $time);
  end
  always @ (EMAW_) begin
  	if(EMAW_ < 0) 
   	$display("Warning: Set Value for EMAW doesn't match Default value 0 in %m at %0t", $time);
  end
  always @ (EMAS_) begin
  	if(EMAS_ < 0) 
   	$display("Warning: Set Value for EMAS doesn't match Default value 0 in %m at %0t", $time);
  end
	always @ (STOV_) begin
		if(CLK_ == 1'b1) begin
			XQ = 1'b1; Q_update = 1'b1;
			#0; Q_update = 1'b0;
			XQ = 1'b0;
		end
	end

  task failedWrite;
  input port_f;
  integer i;
  begin
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'bx}};
  end
  endtask

  function isBitX;
    input bitval;
    begin
      isBitX = ( bitval===1'bx || bitval===1'bz ) ? 1'b1 : 1'b0;
    end
  endfunction


task loadmem;
	input [1000*8-1:0] filename;
	reg [BITS-1:0] memld [0:WORDS-1];
	integer i;
	reg [BITS-1:0] wordtemp;
	reg [11:0] Atemp;
  begin
	$readmemb(filename, memld);
     if (CEN_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  wordtemp = memld[i];
	  Atemp = i;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {32{1'b1}};
        row_mask =  ( {15'b000000000000000, writeEnable[31], 15'b000000000000000, writeEnable[30],
          15'b000000000000000, writeEnable[29], 15'b000000000000000, writeEnable[28],
          15'b000000000000000, writeEnable[27], 15'b000000000000000, writeEnable[26],
          15'b000000000000000, writeEnable[25], 15'b000000000000000, writeEnable[24],
          15'b000000000000000, writeEnable[23], 15'b000000000000000, writeEnable[22],
          15'b000000000000000, writeEnable[21], 15'b000000000000000, writeEnable[20],
          15'b000000000000000, writeEnable[19], 15'b000000000000000, writeEnable[18],
          15'b000000000000000, writeEnable[17], 15'b000000000000000, writeEnable[16],
          15'b000000000000000, writeEnable[15], 15'b000000000000000, writeEnable[14],
          15'b000000000000000, writeEnable[13], 15'b000000000000000, writeEnable[12],
          15'b000000000000000, writeEnable[11], 15'b000000000000000, writeEnable[10],
          15'b000000000000000, writeEnable[9], 15'b000000000000000, writeEnable[8],
          15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, wordtemp[31], 15'b000000000000000, wordtemp[30],
          15'b000000000000000, wordtemp[29], 15'b000000000000000, wordtemp[28], 15'b000000000000000, wordtemp[27],
          15'b000000000000000, wordtemp[26], 15'b000000000000000, wordtemp[25], 15'b000000000000000, wordtemp[24],
          15'b000000000000000, wordtemp[23], 15'b000000000000000, wordtemp[22], 15'b000000000000000, wordtemp[21],
          15'b000000000000000, wordtemp[20], 15'b000000000000000, wordtemp[19], 15'b000000000000000, wordtemp[18],
          15'b000000000000000, wordtemp[17], 15'b000000000000000, wordtemp[16], 15'b000000000000000, wordtemp[15],
          15'b000000000000000, wordtemp[14], 15'b000000000000000, wordtemp[13], 15'b000000000000000, wordtemp[12],
          15'b000000000000000, wordtemp[11], 15'b000000000000000, wordtemp[10], 15'b000000000000000, wordtemp[9],
          15'b000000000000000, wordtemp[8], 15'b000000000000000, wordtemp[7], 15'b000000000000000, wordtemp[6],
          15'b000000000000000, wordtemp[5], 15'b000000000000000, wordtemp[4], 15'b000000000000000, wordtemp[3],
          15'b000000000000000, wordtemp[2], 15'b000000000000000, wordtemp[1], 15'b000000000000000, wordtemp[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
  	end
    end
  end
  endtask

task dumpmem;
	input [1000*8-1:0] filename_dump;
	integer i, dump_file_desc;
	reg [BITS-1:0] wordtemp;
	reg [11:0] Atemp;
  begin
	dump_file_desc = $fopen(filename_dump);
     if (CEN_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  Atemp = i;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {32{1'b1}};
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[496], data_out[480], data_out[464], data_out[448], data_out[432],
          data_out[416], data_out[400], data_out[384], data_out[368], data_out[352],
          data_out[336], data_out[320], data_out[304], data_out[288], data_out[272],
          data_out[256], data_out[240], data_out[224], data_out[208], data_out[192],
          data_out[176], data_out[160], data_out[144], data_out[128], data_out[112],
          data_out[96], data_out[80], data_out[64], data_out[48], data_out[32], data_out[16],
          data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path_d = {shifted_readLatch0[31], shifted_readLatch0[30], shifted_readLatch0[29],
          shifted_readLatch0[28], shifted_readLatch0[27], shifted_readLatch0[26], shifted_readLatch0[25],
          shifted_readLatch0[24], shifted_readLatch0[23], shifted_readLatch0[22], shifted_readLatch0[21],
          shifted_readLatch0[20], shifted_readLatch0[19], shifted_readLatch0[18], shifted_readLatch0[17],
          shifted_readLatch0[16], shifted_readLatch0[15], shifted_readLatch0[14], shifted_readLatch0[13],
          shifted_readLatch0[12], shifted_readLatch0[11], shifted_readLatch0[10], shifted_readLatch0[9],
          shifted_readLatch0[8], shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
          shifted_readLatch0[4], shifted_readLatch0[3], shifted_readLatch0[2], shifted_readLatch0[1],
          shifted_readLatch0[0]};
   	$fdisplay(dump_file_desc, "%b", mem_path_d);
  end
  	end
    $fclose(dump_file_desc);
  end
  endtask

task loadaddr;
	input [11:0] load_addr;
	input [31:0] load_data;
	reg [BITS-1:0] wordtemp;
	reg [11:0] Atemp;
  begin
     if (CEN_ === 1'b1) begin
	  wordtemp = load_data;
	  Atemp = load_addr;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {32{1'b1}};
        row_mask =  ( {15'b000000000000000, writeEnable[31], 15'b000000000000000, writeEnable[30],
          15'b000000000000000, writeEnable[29], 15'b000000000000000, writeEnable[28],
          15'b000000000000000, writeEnable[27], 15'b000000000000000, writeEnable[26],
          15'b000000000000000, writeEnable[25], 15'b000000000000000, writeEnable[24],
          15'b000000000000000, writeEnable[23], 15'b000000000000000, writeEnable[22],
          15'b000000000000000, writeEnable[21], 15'b000000000000000, writeEnable[20],
          15'b000000000000000, writeEnable[19], 15'b000000000000000, writeEnable[18],
          15'b000000000000000, writeEnable[17], 15'b000000000000000, writeEnable[16],
          15'b000000000000000, writeEnable[15], 15'b000000000000000, writeEnable[14],
          15'b000000000000000, writeEnable[13], 15'b000000000000000, writeEnable[12],
          15'b000000000000000, writeEnable[11], 15'b000000000000000, writeEnable[10],
          15'b000000000000000, writeEnable[9], 15'b000000000000000, writeEnable[8],
          15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, wordtemp[31], 15'b000000000000000, wordtemp[30],
          15'b000000000000000, wordtemp[29], 15'b000000000000000, wordtemp[28], 15'b000000000000000, wordtemp[27],
          15'b000000000000000, wordtemp[26], 15'b000000000000000, wordtemp[25], 15'b000000000000000, wordtemp[24],
          15'b000000000000000, wordtemp[23], 15'b000000000000000, wordtemp[22], 15'b000000000000000, wordtemp[21],
          15'b000000000000000, wordtemp[20], 15'b000000000000000, wordtemp[19], 15'b000000000000000, wordtemp[18],
          15'b000000000000000, wordtemp[17], 15'b000000000000000, wordtemp[16], 15'b000000000000000, wordtemp[15],
          15'b000000000000000, wordtemp[14], 15'b000000000000000, wordtemp[13], 15'b000000000000000, wordtemp[12],
          15'b000000000000000, wordtemp[11], 15'b000000000000000, wordtemp[10], 15'b000000000000000, wordtemp[9],
          15'b000000000000000, wordtemp[8], 15'b000000000000000, wordtemp[7], 15'b000000000000000, wordtemp[6],
          15'b000000000000000, wordtemp[5], 15'b000000000000000, wordtemp[4], 15'b000000000000000, wordtemp[3],
          15'b000000000000000, wordtemp[2], 15'b000000000000000, wordtemp[1], 15'b000000000000000, wordtemp[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
  	end
  end
  endtask

task dumpaddr;
	output [31:0] dump_data;
	input [11:0] dump_addr;
	reg [BITS-1:0] wordtemp;
	reg [11:0] Atemp;
  begin
     if (CEN_ === 1'b1) begin
	  Atemp = dump_addr;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {32{1'b1}};
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[496], data_out[480], data_out[464], data_out[448], data_out[432],
          data_out[416], data_out[400], data_out[384], data_out[368], data_out[352],
          data_out[336], data_out[320], data_out[304], data_out[288], data_out[272],
          data_out[256], data_out[240], data_out[224], data_out[208], data_out[192],
          data_out[176], data_out[160], data_out[144], data_out[128], data_out[112],
          data_out[96], data_out[80], data_out[64], data_out[48], data_out[32], data_out[16],
          data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path_d = {shifted_readLatch0[31], shifted_readLatch0[30], shifted_readLatch0[29],
          shifted_readLatch0[28], shifted_readLatch0[27], shifted_readLatch0[26], shifted_readLatch0[25],
          shifted_readLatch0[24], shifted_readLatch0[23], shifted_readLatch0[22], shifted_readLatch0[21],
          shifted_readLatch0[20], shifted_readLatch0[19], shifted_readLatch0[18], shifted_readLatch0[17],
          shifted_readLatch0[16], shifted_readLatch0[15], shifted_readLatch0[14], shifted_readLatch0[13],
          shifted_readLatch0[12], shifted_readLatch0[11], shifted_readLatch0[10], shifted_readLatch0[9],
          shifted_readLatch0[8], shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
          shifted_readLatch0[4], shifted_readLatch0[3], shifted_readLatch0[2], shifted_readLatch0[1],
          shifted_readLatch0[0]};
   	dump_data = mem_path_d;
  	end
  end
  endtask


  task readWrite;
  begin
    if (WABL_int === 1'bx)
      begin
        D_int = {32{1'bx}};
        failedWrite(0);
      end
    if (^WABLM_int === 1'bx)
      begin
        D_int = {32{1'bx}};
        failedWrite(0);
      end
    if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_int === 1'b0 && CEN_int === 1'b0) begin
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{(EMA_int), (EMAW_int), (EMAS_int)} === 1'bx) begin
  if(isBitX(EMAS_int)) begin 
        XQ = 1'b1; Q_update = 1'b1;
  end
  if(isBitX(EMAW_int)) begin 
      failedWrite(0);
  end
  if(isBitX(EMA_int)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
  end
    end else if (^{CEN_int, (STOV_int && !CEN_int), RET1N_int, WABL_int, WABLM_int} === 1'bx) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if ((A_int >= WORDS) && (CEN_int === 1'b0)) begin
        XQ = GWEN_int !== 1'b1 ? 1'b0 : 1'b1; Q_update = GWEN_int !== 1'b1 ? 1'b0 : 1'b1;
    end else if (CEN_int === 1'b0 && (^A_int) === 1'bx) begin
      if (GWEN_int !== 1'b1)
        failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (CEN_int === 1'b0) begin
      mux_address = (A_int & 4'b1111);
      row_address = (A_int >> 4);
      if (row_address > 255)
        row = {512{1'bx}};
      else
        row = mem[row_address];
        writeEnable = ~ {32{GWEN_int}};
      if (GWEN_int !== 1'b1) begin
        row_mask =  ( {15'b000000000000000, writeEnable[31], 15'b000000000000000, writeEnable[30],
          15'b000000000000000, writeEnable[29], 15'b000000000000000, writeEnable[28],
          15'b000000000000000, writeEnable[27], 15'b000000000000000, writeEnable[26],
          15'b000000000000000, writeEnable[25], 15'b000000000000000, writeEnable[24],
          15'b000000000000000, writeEnable[23], 15'b000000000000000, writeEnable[22],
          15'b000000000000000, writeEnable[21], 15'b000000000000000, writeEnable[20],
          15'b000000000000000, writeEnable[19], 15'b000000000000000, writeEnable[18],
          15'b000000000000000, writeEnable[17], 15'b000000000000000, writeEnable[16],
          15'b000000000000000, writeEnable[15], 15'b000000000000000, writeEnable[14],
          15'b000000000000000, writeEnable[13], 15'b000000000000000, writeEnable[12],
          15'b000000000000000, writeEnable[11], 15'b000000000000000, writeEnable[10],
          15'b000000000000000, writeEnable[9], 15'b000000000000000, writeEnable[8],
          15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, D_int[31], 15'b000000000000000, D_int[30],
          15'b000000000000000, D_int[29], 15'b000000000000000, D_int[28], 15'b000000000000000, D_int[27],
          15'b000000000000000, D_int[26], 15'b000000000000000, D_int[25], 15'b000000000000000, D_int[24],
          15'b000000000000000, D_int[23], 15'b000000000000000, D_int[22], 15'b000000000000000, D_int[21],
          15'b000000000000000, D_int[20], 15'b000000000000000, D_int[19], 15'b000000000000000, D_int[18],
          15'b000000000000000, D_int[17], 15'b000000000000000, D_int[16], 15'b000000000000000, D_int[15],
          15'b000000000000000, D_int[14], 15'b000000000000000, D_int[13], 15'b000000000000000, D_int[12],
          15'b000000000000000, D_int[11], 15'b000000000000000, D_int[10], 15'b000000000000000, D_int[9],
          15'b000000000000000, D_int[8], 15'b000000000000000, D_int[7], 15'b000000000000000, D_int[6],
          15'b000000000000000, D_int[5], 15'b000000000000000, D_int[4], 15'b000000000000000, D_int[3],
          15'b000000000000000, D_int[2], 15'b000000000000000, D_int[1], 15'b000000000000000, D_int[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
      end else begin
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[496], data_out[480], data_out[464], data_out[448], data_out[432],
          data_out[416], data_out[400], data_out[384], data_out[368], data_out[352],
          data_out[336], data_out[320], data_out[304], data_out[288], data_out[272],
          data_out[256], data_out[240], data_out[224], data_out[208], data_out[192],
          data_out[176], data_out[160], data_out[144], data_out[128], data_out[112],
          data_out[96], data_out[80], data_out[64], data_out[48], data_out[32], data_out[16],
          data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path = {shifted_readLatch0[31], shifted_readLatch0[30], shifted_readLatch0[29],
          shifted_readLatch0[28], shifted_readLatch0[27], shifted_readLatch0[26], shifted_readLatch0[25],
          shifted_readLatch0[24], shifted_readLatch0[23], shifted_readLatch0[22], shifted_readLatch0[21],
          shifted_readLatch0[20], shifted_readLatch0[19], shifted_readLatch0[18], shifted_readLatch0[17],
          shifted_readLatch0[16], shifted_readLatch0[15], shifted_readLatch0[14], shifted_readLatch0[13],
          shifted_readLatch0[12], shifted_readLatch0[11], shifted_readLatch0[10], shifted_readLatch0[9],
          shifted_readLatch0[8], shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
          shifted_readLatch0[4], shifted_readLatch0[3], shifted_readLatch0[2], shifted_readLatch0[1],
          shifted_readLatch0[0]};
        	XQ = 1'b0; Q_update = 1'b1;
      end
    if (WABL_int === 1'bx) begin
        XQ = 1'b1; Q_update = 1'b1;
    end
    if (^WABLM_int === 1'bx) begin
        XQ = 1'b1; Q_update = 1'b1;
    end
      if( isBitX(GWEN_int) )  begin
        XQ = 1'b1; Q_update = 1'b1;
      end
    end
  end
  endtask
  always @ (CEN_ or CLK_) begin
  	if(CLK_ == 1'b0) begin
  		CEN_p2 = CEN_;
  	end
  end

`ifdef POWER_PINS
  always @ (VDDCE) begin
      if (VDDCE != 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDCE should be powered down after VDDPE, Illegal power down sequencing in %m at %0t", $time);
       end
        $display("In PowerDown Mode in %m at %0t", $time);
        failedWrite(0);
      end
      if (VDDCE == 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDPE should be powered up after VDDCE in %m at %0t", $time);
        $display("Illegal power up sequencing in %m at %0t", $time);
       end
        failedWrite(0);
      end
  end
`endif
`ifdef POWER_PINS
  always @ (RET1N_ or VDDPE or VDDCE or VSSE) begin
`else     
  always @ RET1N_ begin
`endif
`ifdef POWER_PINS
    if (RET1N_ == 1'b1 && RET1N_int == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 && pre_charge_st == 1'b1 && (CEN_ === 1'bx || CLK_ === 1'bx)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end
`else     
`endif
`ifdef POWER_PINS
`else     
      pre_charge_st = 0;
`endif
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_ === 1'b0 && CEN_p2 === 1'b0 ) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_ === 1'b1 && RET1N_int !== 1'bx && CEN_p2 === 1'b0 ) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end
`ifdef POWER_PINS
    if (RET1N_ == 1'b1 && VDDPE !== 1'b1) begin
        $display("Warning: Illegal value for VDDPE %b in %m at %0t", VDDPE, $time);
        failedWrite(0);
    end else if (RET1N_ == 1'b0 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st = 1;
    end else if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
      pre_charge_st = 0;
      if (VDDCE != 1'b1) begin
        failedWrite(0);
      end
`else     
    if (RET1N_ == 1'b0) begin
`endif
        XQ = 1'b1; Q_update = 1'b1;
      Q_int_delayed = {32{1'bx}};
      CEN_int = 1'bx;
      GWEN_int = 1'bx;
      A_int = {12{1'bx}};
      D_int = {32{1'bx}};
      STOV_int = 1'bx;
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      EMAS_int = 1'bx;
      RET1N_int = 1'bx;
      WABL_int = 1'bx;
      WABLM_int = {2{1'bx}};
`ifdef POWER_PINS
    end else if (RET1N_ == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st = 0;
      XQ = 1'b0;
    end else begin
      pre_charge_st = 0;
`else     
    end else begin
`endif
				#0;
if ($realtime != 0)  XQ = 1'b1;
        Q_update = 1'b1;
      Q_int_delayed = {32{1'bx}};
      CEN_int = 1'bx;
      GWEN_int = 1'bx;
      A_int = {12{1'bx}};
      D_int = {32{1'bx}};
      STOV_int = 1'bx;
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      EMAS_int = 1'bx;
      RET1N_int = 1'bx;
      WABL_int = 1'bx;
      WABLM_int = {2{1'bx}};
    end
    #0;
    RET1N_int = RET1N_;
        Q_update = 1'b0;
  end


  always @ CLK_ begin
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
`endif
`ifdef POWER_PINS
  if (RET1N_ == 1'b0) begin
`else     
  if (RET1N_ == 1'b0) begin
`endif
      // no cycle in retention mode
`ifdef POWER_PINS
    end else if ((VDDCE === 1'bx || VDDCE === 1'bz)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
  end else if (RET1N_ == 1'b1 && VDDPE !== 1'b1) begin
  end else if (VSSE !== 1'b0) begin
`endif
  end else begin
    if ((CLK_ === 1'bx || CLK_ === 1'bz) && RET1N_ !== 1'b0) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if ((CLK_ === 1'b1 || CLK_ === 1'b0) && LAST_CLK === 1'bx) begin
       D_sh_update = 1'b0;  XD_sh = 1'b0;
       XD_int = {32{1'b0}};
       XQ = 1'b0; Q_update = 1'b0; 
    end else if (CLK_ === 1'b1 && LAST_CLK === 1'b0) begin
      CEN_int = CEN_;
      STOV_int = STOV_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      EMAS_int = EMAS_;
      RET1N_int = RET1N_;
      WABL_int = WABL_;
      WABLM_int = WABLM_;
      if (CEN_int != 1'b1) begin
        GWEN_int = GWEN_;
        A_int = A_;
        D_int = D_;
      end
      clk0_int = 1'b0;
      CEN_int = CEN_;
      STOV_int = STOV_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      EMAS_int = EMAS_;
      RET1N_int = RET1N_;
      WABL_int = WABL_;
      WABLM_int = WABLM_;
      if (CEN_int != 1'b1) begin
        GWEN_int = GWEN_;
        A_int = A_;
        D_int = D_;
      end
      clk0_int = 1'b0;
      if (CEN_int === 1'b0 && GWEN_int === 1'b1) 
         Q_int_delayed = {32{1'bx}};
    readWrite;
    end else if (CLK_ === 1'b0 && LAST_CLK === 1'b1) begin
      Q_int_delayed = Q_int;
      Q_update = 1'b0;
      D_sh_update = 1'b0;
      XQ = 1'b0;
       XD_int = {32{1'b0}};
    end
  end
    LAST_CLK = CLK_;
  end

  assign D_int_bmux = D_;

  datapath_latch_sram_4096x32 uDQ0 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(1'b0), .D(D_int_bmux[0]), .DFTRAMBYP(1'b0), .mem_path(mem_path[0]), .XQ(XQ|XD_int[0]|1'b0), .Q(Q_int[0]));
  datapath_latch_sram_4096x32 uDQ1 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[0]), .D(D_int_bmux[1]), .DFTRAMBYP(1'b0), .mem_path(mem_path[1]), .XQ(XQ|XD_int[1]), .Q(Q_int[1]));
  datapath_latch_sram_4096x32 uDQ2 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[1]), .D(D_int_bmux[2]), .DFTRAMBYP(1'b0), .mem_path(mem_path[2]), .XQ(XQ|XD_int[2]), .Q(Q_int[2]));
  datapath_latch_sram_4096x32 uDQ3 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[2]), .D(D_int_bmux[3]), .DFTRAMBYP(1'b0), .mem_path(mem_path[3]), .XQ(XQ|XD_int[3]), .Q(Q_int[3]));
  datapath_latch_sram_4096x32 uDQ4 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[3]), .D(D_int_bmux[4]), .DFTRAMBYP(1'b0), .mem_path(mem_path[4]), .XQ(XQ|XD_int[4]), .Q(Q_int[4]));
  datapath_latch_sram_4096x32 uDQ5 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[4]), .D(D_int_bmux[5]), .DFTRAMBYP(1'b0), .mem_path(mem_path[5]), .XQ(XQ|XD_int[5]), .Q(Q_int[5]));
  datapath_latch_sram_4096x32 uDQ6 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[5]), .D(D_int_bmux[6]), .DFTRAMBYP(1'b0), .mem_path(mem_path[6]), .XQ(XQ|XD_int[6]), .Q(Q_int[6]));
  datapath_latch_sram_4096x32 uDQ7 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[6]), .D(D_int_bmux[7]), .DFTRAMBYP(1'b0), .mem_path(mem_path[7]), .XQ(XQ|XD_int[7]), .Q(Q_int[7]));
  datapath_latch_sram_4096x32 uDQ8 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[7]), .D(D_int_bmux[8]), .DFTRAMBYP(1'b0), .mem_path(mem_path[8]), .XQ(XQ|XD_int[8]), .Q(Q_int[8]));
  datapath_latch_sram_4096x32 uDQ9 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[8]), .D(D_int_bmux[9]), .DFTRAMBYP(1'b0), .mem_path(mem_path[9]), .XQ(XQ|XD_int[9]), .Q(Q_int[9]));
  datapath_latch_sram_4096x32 uDQ10 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[9]), .D(D_int_bmux[10]), .DFTRAMBYP(1'b0), .mem_path(mem_path[10]), .XQ(XQ|XD_int[10]), .Q(Q_int[10]));
  datapath_latch_sram_4096x32 uDQ11 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[10]), .D(D_int_bmux[11]), .DFTRAMBYP(1'b0), .mem_path(mem_path[11]), .XQ(XQ|XD_int[11]), .Q(Q_int[11]));
  datapath_latch_sram_4096x32 uDQ12 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[11]), .D(D_int_bmux[12]), .DFTRAMBYP(1'b0), .mem_path(mem_path[12]), .XQ(XQ|XD_int[12]), .Q(Q_int[12]));
  datapath_latch_sram_4096x32 uDQ13 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[12]), .D(D_int_bmux[13]), .DFTRAMBYP(1'b0), .mem_path(mem_path[13]), .XQ(XQ|XD_int[13]), .Q(Q_int[13]));
  datapath_latch_sram_4096x32 uDQ14 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[13]), .D(D_int_bmux[14]), .DFTRAMBYP(1'b0), .mem_path(mem_path[14]), .XQ(XQ|XD_int[14]), .Q(Q_int[14]));
  datapath_latch_sram_4096x32 uDQ15 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[14]), .D(D_int_bmux[15]), .DFTRAMBYP(1'b0), .mem_path(mem_path[15]), .XQ(XQ|XD_int[15]), .Q(Q_int[15]));
  datapath_latch_sram_4096x32 uDQ16 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[17]), .D(D_int_bmux[16]), .DFTRAMBYP(1'b0), .mem_path(mem_path[16]), .XQ(XQ|XD_int[16]), .Q(Q_int[16]));
  datapath_latch_sram_4096x32 uDQ17 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[18]), .D(D_int_bmux[17]), .DFTRAMBYP(1'b0), .mem_path(mem_path[17]), .XQ(XQ|XD_int[17]), .Q(Q_int[17]));
  datapath_latch_sram_4096x32 uDQ18 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[19]), .D(D_int_bmux[18]), .DFTRAMBYP(1'b0), .mem_path(mem_path[18]), .XQ(XQ|XD_int[18]), .Q(Q_int[18]));
  datapath_latch_sram_4096x32 uDQ19 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[20]), .D(D_int_bmux[19]), .DFTRAMBYP(1'b0), .mem_path(mem_path[19]), .XQ(XQ|XD_int[19]), .Q(Q_int[19]));
  datapath_latch_sram_4096x32 uDQ20 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[21]), .D(D_int_bmux[20]), .DFTRAMBYP(1'b0), .mem_path(mem_path[20]), .XQ(XQ|XD_int[20]), .Q(Q_int[20]));
  datapath_latch_sram_4096x32 uDQ21 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[22]), .D(D_int_bmux[21]), .DFTRAMBYP(1'b0), .mem_path(mem_path[21]), .XQ(XQ|XD_int[21]), .Q(Q_int[21]));
  datapath_latch_sram_4096x32 uDQ22 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[23]), .D(D_int_bmux[22]), .DFTRAMBYP(1'b0), .mem_path(mem_path[22]), .XQ(XQ|XD_int[22]), .Q(Q_int[22]));
  datapath_latch_sram_4096x32 uDQ23 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[24]), .D(D_int_bmux[23]), .DFTRAMBYP(1'b0), .mem_path(mem_path[23]), .XQ(XQ|XD_int[23]), .Q(Q_int[23]));
  datapath_latch_sram_4096x32 uDQ24 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[25]), .D(D_int_bmux[24]), .DFTRAMBYP(1'b0), .mem_path(mem_path[24]), .XQ(XQ|XD_int[24]), .Q(Q_int[24]));
  datapath_latch_sram_4096x32 uDQ25 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[26]), .D(D_int_bmux[25]), .DFTRAMBYP(1'b0), .mem_path(mem_path[25]), .XQ(XQ|XD_int[25]), .Q(Q_int[25]));
  datapath_latch_sram_4096x32 uDQ26 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[27]), .D(D_int_bmux[26]), .DFTRAMBYP(1'b0), .mem_path(mem_path[26]), .XQ(XQ|XD_int[26]), .Q(Q_int[26]));
  datapath_latch_sram_4096x32 uDQ27 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[28]), .D(D_int_bmux[27]), .DFTRAMBYP(1'b0), .mem_path(mem_path[27]), .XQ(XQ|XD_int[27]), .Q(Q_int[27]));
  datapath_latch_sram_4096x32 uDQ28 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[29]), .D(D_int_bmux[28]), .DFTRAMBYP(1'b0), .mem_path(mem_path[28]), .XQ(XQ|XD_int[28]), .Q(Q_int[28]));
  datapath_latch_sram_4096x32 uDQ29 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[30]), .D(D_int_bmux[29]), .DFTRAMBYP(1'b0), .mem_path(mem_path[29]), .XQ(XQ|XD_int[29]), .Q(Q_int[29]));
  datapath_latch_sram_4096x32 uDQ30 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[31]), .D(D_int_bmux[30]), .DFTRAMBYP(1'b0), .mem_path(mem_path[30]), .XQ(XQ|XD_int[30]), .Q(Q_int[30]));
  datapath_latch_sram_4096x32 uDQ31 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(1'b0), .D(D_int_bmux[31]), .DFTRAMBYP(1'b0), .mem_path(mem_path[31]), .XQ(XQ|XD_int[31]|1'b0), .Q(Q_int[31]));


// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
	always @ (VDDCE or VDDPE or VSSE) begin
		if (VDDCE === 1'bx || VDDCE === 1'bz) begin
			$display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
        XQ = 1'b1; Q_update = 1'b1;
			failedWrite(0);
			bad_VDDCE = 1'b1;
		end else begin
			bad_VDDCE = 1'b0;
		end
		if (RET1N_ == 1'b1 && VDDPE !== 1'b1) begin
			$display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
        XQ = 1'b1; Q_update = 1'b1;
			failedWrite(0);
			bad_VDDPE = 1'b1;
		end else begin
			bad_VDDPE = 1'b0;
		end
		if (VSSE !== 1'b0) begin
			$display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
        XQ = 1'b1; Q_update = 1'b1;
			failedWrite(0);
			bad_VSSE = 1'b1;
		end else begin
			bad_VSSE = 1'b0;
		end
		bad_power = bad_VDDCE | bad_VDDPE | bad_VSSE ;
	end
`endif

endmodule
`endcelldefine
`else
// If ARM_NEG_MODEL is defined at Simulator Command Line, it Selects the NEGATIVE Model
`ifdef ARM_NEG_MODEL

`celldefine
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
module sram_4096x32 (VDDCE, VDDPE, VSSE, Q, CLK, CEN, GWEN, A, D, STOV, EMA, EMAW,
    EMAS, RET1N, WABL, WABLM);
`else
module sram_4096x32 (Q, CLK, CEN, GWEN, A, D, STOV, EMA, EMAW, EMAS, RET1N, WABL, WABLM);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 32;
  parameter WORDS = 4096;
  parameter MUX = 16;
  parameter MEM_WIDTH = 512; // redun block size 16, 256 on left, 256 on right
  parameter MEM_HEIGHT = 256;
  parameter WP_SIZE = 32 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 1;
  parameter ROWS = 256;

  output [31:0] Q;
  input  CLK;
  input  CEN;
  input  GWEN;
  input [11:0] A;
  input [31:0] D;
  input  STOV;
  input [2:0] EMA;
  input [1:0] EMAW;
  input  EMAS;
  input  RET1N;
  input  WABL;
  input [1:0] WABLM;
`ifdef POWER_PINS
  inout VDDCE;
  inout VDDPE;
  inout VSSE;
`endif

`ifdef POWER_PINS
  reg bad_VDDCE;
  reg bad_VDDPE;
  reg bad_VSSE;
  reg bad_power;
`endif
  wire corrupt_power;
  reg pre_charge_st;
  integer row_address;
  integer mux_address;
  initial row_address = 0;
  initial mux_address = 0;
  reg [511:0] mem [0:255];
  reg [511:0] row, row_t;
  reg LAST_CLK;
  reg [511:0] row_mask;
  reg [511:0] new_data;
  reg [511:0] data_out;
  reg [31:0] readLatch0;
  reg [31:0] shifted_readLatch0;
  wire [31:0] Q_int;
  reg [31:0] Q_int_delayed;
  reg XQ, Q_update;
  reg XD_sh, D_sh_update;
  wire [31:0] D_int_bmux;
  reg [31:0] mem_path;
  reg [31:0] mem_path_d;
  reg [31:0] writeEnable;

  reg NOT_CEN, NOT_GWEN, NOT_A11, NOT_A10, NOT_A9, NOT_A8, NOT_A7, NOT_A6, NOT_A5;
  reg NOT_A4, NOT_A3, NOT_A2, NOT_A1, NOT_A0, NOT_D31, NOT_D30, NOT_D29, NOT_D28, NOT_D27;
  reg NOT_D26, NOT_D25, NOT_D24, NOT_D23, NOT_D22, NOT_D21, NOT_D20, NOT_D19, NOT_D18;
  reg NOT_D17, NOT_D16, NOT_D15, NOT_D14, NOT_D13, NOT_D12, NOT_D11, NOT_D10, NOT_D9;
  reg NOT_D8, NOT_D7, NOT_D6, NOT_D5, NOT_D4, NOT_D3, NOT_D2, NOT_D1, NOT_D0, NOT_STOV;
  reg NOT_EMA2, NOT_EMA1, NOT_EMA0, NOT_EMAW1, NOT_EMAW0, NOT_EMAS, NOT_RET1N, NOT_WABL;
  reg NOT_WABLM1, NOT_WABLM0;
  reg NOT_CLK_PER, NOT_CLK_MINH, NOT_CLK_MINL;
  reg clk0_int;

  wire [31:0] Q_;
 wire  CLK_;
 wire  dCLK;
  wire  CEN_;
 wire  dCEN;
  reg  CEN_int;
  reg  CEN_p2;
  wire  GWEN_;
 wire  dGWEN;
  reg  GWEN_int;
  wire [11:0] A_;
 wire [11:0] dA;
  reg [11:0] A_int;
  wire [31:0] D_;
 wire [31:0] dD;
  reg [31:0] D_int;
  reg [31:0] XD_int;
  wire  STOV_;
 wire  dSTOV;
  reg  STOV_int;
  wire [2:0] EMA_;
 wire [2:0] dEMA;
  reg [2:0] EMA_int;
  wire [1:0] EMAW_;
 wire [1:0] dEMAW;
  reg [1:0] EMAW_int;
  wire  EMAS_;
 wire  dEMAS;
  reg  EMAS_int;
  wire  RET1N_;
 wire  dRET1N;
  reg  RET1N_int;
  wire  WABL_;
 wire  dWABL;
  reg  WABL_int;
  wire [1:0] WABLM_;
 wire [1:0] dWABLM;
  reg [1:0] WABLM_int;

  buf B0(Q[0], Q_[0]);
  buf B1(Q[1], Q_[1]);
  buf B2(Q[2], Q_[2]);
  buf B3(Q[3], Q_[3]);
  buf B4(Q[4], Q_[4]);
  buf B5(Q[5], Q_[5]);
  buf B6(Q[6], Q_[6]);
  buf B7(Q[7], Q_[7]);
  buf B8(Q[8], Q_[8]);
  buf B9(Q[9], Q_[9]);
  buf B10(Q[10], Q_[10]);
  buf B11(Q[11], Q_[11]);
  buf B12(Q[12], Q_[12]);
  buf B13(Q[13], Q_[13]);
  buf B14(Q[14], Q_[14]);
  buf B15(Q[15], Q_[15]);
  buf B16(Q[16], Q_[16]);
  buf B17(Q[17], Q_[17]);
  buf B18(Q[18], Q_[18]);
  buf B19(Q[19], Q_[19]);
  buf B20(Q[20], Q_[20]);
  buf B21(Q[21], Q_[21]);
  buf B22(Q[22], Q_[22]);
  buf B23(Q[23], Q_[23]);
  buf B24(Q[24], Q_[24]);
  buf B25(Q[25], Q_[25]);
  buf B26(Q[26], Q_[26]);
  buf B27(Q[27], Q_[27]);
  buf B28(Q[28], Q_[28]);
  buf B29(Q[29], Q_[29]);
  buf B30(Q[30], Q_[30]);
  buf B31(Q[31], Q_[31]);
  buf B32(CLK_, dCLK);
  buf B33(CEN_, dCEN);
  buf B34(GWEN_, dGWEN);
  buf B35(A_[0],dA[0]);
  buf B36(A_[1],dA[1]);
  buf B37(A_[2],dA[2]);
  buf B38(A_[3],dA[3]);
  buf B39(A_[4],dA[4]);
  buf B40(A_[5],dA[5]);
  buf B41(A_[6],dA[6]);
  buf B42(A_[7],dA[7]);
  buf B43(A_[8],dA[8]);
  buf B44(A_[9],dA[9]);
  buf B45(A_[10],dA[10]);
  buf B46(A_[11],dA[11]);
  buf B47(D_[0],dD[0]);
  buf B48(D_[1],dD[1]);
  buf B49(D_[2],dD[2]);
  buf B50(D_[3],dD[3]);
  buf B51(D_[4],dD[4]);
  buf B52(D_[5],dD[5]);
  buf B53(D_[6],dD[6]);
  buf B54(D_[7],dD[7]);
  buf B55(D_[8],dD[8]);
  buf B56(D_[9],dD[9]);
  buf B57(D_[10],dD[10]);
  buf B58(D_[11],dD[11]);
  buf B59(D_[12],dD[12]);
  buf B60(D_[13],dD[13]);
  buf B61(D_[14],dD[14]);
  buf B62(D_[15],dD[15]);
  buf B63(D_[16],dD[16]);
  buf B64(D_[17],dD[17]);
  buf B65(D_[18],dD[18]);
  buf B66(D_[19],dD[19]);
  buf B67(D_[20],dD[20]);
  buf B68(D_[21],dD[21]);
  buf B69(D_[22],dD[22]);
  buf B70(D_[23],dD[23]);
  buf B71(D_[24],dD[24]);
  buf B72(D_[25],dD[25]);
  buf B73(D_[26],dD[26]);
  buf B74(D_[27],dD[27]);
  buf B75(D_[28],dD[28]);
  buf B76(D_[29],dD[29]);
  buf B77(D_[30],dD[30]);
  buf B78(D_[31],dD[31]);
  buf B79(STOV_, dSTOV);
  buf B80(EMA_[0],dEMA[0]);
  buf B81(EMA_[1],dEMA[1]);
  buf B82(EMA_[2],dEMA[2]);
  buf B83(EMAW_[0],dEMAW[0]);
  buf B84(EMAW_[1],dEMAW[1]);
  buf B85(EMAS_, dEMAS);
  buf B86(RET1N_, dRET1N);
  buf B87(WABL_, dWABL);
  buf B88(WABLM_[0],dWABLM[0]);
  buf B89(WABLM_[1],dWABLM[1]);

`ifdef POWER_PINS
  assign corrupt_power = bad_power;
`else
  assign corrupt_power = 1'b0;
`endif

  assign Q_ = (RET1N_ | pre_charge_st) & ~corrupt_power ? ((STOV_ ? (Q_int_delayed) : (Q_int))) : {32{1'bx}};

// If INITIALIZE_MEMORY is defined at Simulator Command Line, it Initializes the Memory with all ZEROS.
`ifdef INITIALIZE_MEMORY
  integer i;
  initial
  begin
    #0;
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'b0}};
  end
`endif
  always @ (EMA_) begin
  	if(EMA_ < 2) 
   	$display("Warning: Set Value for EMA doesn't match Default value 2 in %m at %0t", $time);
  end
  always @ (EMAW_) begin
  	if(EMAW_ < 0) 
   	$display("Warning: Set Value for EMAW doesn't match Default value 0 in %m at %0t", $time);
  end
  always @ (EMAS_) begin
  	if(EMAS_ < 0) 
   	$display("Warning: Set Value for EMAS doesn't match Default value 0 in %m at %0t", $time);
  end
	always @ (STOV_) begin
		if(CLK_ == 1'b1) begin
			XQ = 1'b1; Q_update = 1'b1;
			#0; Q_update = 1'b0;
			XQ = 1'b0;
		end
	end

  task failedWrite;
  input port_f;
  integer i;
  begin
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'bx}};
  end
  endtask

  function isBitX;
    input bitval;
    begin
      isBitX = ( bitval===1'bx || bitval===1'bz ) ? 1'b1 : 1'b0;
    end
  endfunction


task loadmem;
	input [1000*8-1:0] filename;
	reg [BITS-1:0] memld [0:WORDS-1];
	integer i;
	reg [BITS-1:0] wordtemp;
	reg [11:0] Atemp;
  begin
	$readmemb(filename, memld);
     if (CEN_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  wordtemp = memld[i];
	  Atemp = i;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {32{1'b1}};
        row_mask =  ( {15'b000000000000000, writeEnable[31], 15'b000000000000000, writeEnable[30],
          15'b000000000000000, writeEnable[29], 15'b000000000000000, writeEnable[28],
          15'b000000000000000, writeEnable[27], 15'b000000000000000, writeEnable[26],
          15'b000000000000000, writeEnable[25], 15'b000000000000000, writeEnable[24],
          15'b000000000000000, writeEnable[23], 15'b000000000000000, writeEnable[22],
          15'b000000000000000, writeEnable[21], 15'b000000000000000, writeEnable[20],
          15'b000000000000000, writeEnable[19], 15'b000000000000000, writeEnable[18],
          15'b000000000000000, writeEnable[17], 15'b000000000000000, writeEnable[16],
          15'b000000000000000, writeEnable[15], 15'b000000000000000, writeEnable[14],
          15'b000000000000000, writeEnable[13], 15'b000000000000000, writeEnable[12],
          15'b000000000000000, writeEnable[11], 15'b000000000000000, writeEnable[10],
          15'b000000000000000, writeEnable[9], 15'b000000000000000, writeEnable[8],
          15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, wordtemp[31], 15'b000000000000000, wordtemp[30],
          15'b000000000000000, wordtemp[29], 15'b000000000000000, wordtemp[28], 15'b000000000000000, wordtemp[27],
          15'b000000000000000, wordtemp[26], 15'b000000000000000, wordtemp[25], 15'b000000000000000, wordtemp[24],
          15'b000000000000000, wordtemp[23], 15'b000000000000000, wordtemp[22], 15'b000000000000000, wordtemp[21],
          15'b000000000000000, wordtemp[20], 15'b000000000000000, wordtemp[19], 15'b000000000000000, wordtemp[18],
          15'b000000000000000, wordtemp[17], 15'b000000000000000, wordtemp[16], 15'b000000000000000, wordtemp[15],
          15'b000000000000000, wordtemp[14], 15'b000000000000000, wordtemp[13], 15'b000000000000000, wordtemp[12],
          15'b000000000000000, wordtemp[11], 15'b000000000000000, wordtemp[10], 15'b000000000000000, wordtemp[9],
          15'b000000000000000, wordtemp[8], 15'b000000000000000, wordtemp[7], 15'b000000000000000, wordtemp[6],
          15'b000000000000000, wordtemp[5], 15'b000000000000000, wordtemp[4], 15'b000000000000000, wordtemp[3],
          15'b000000000000000, wordtemp[2], 15'b000000000000000, wordtemp[1], 15'b000000000000000, wordtemp[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
  	end
    end
  end
  endtask

task dumpmem;
	input [1000*8-1:0] filename_dump;
	integer i, dump_file_desc;
	reg [BITS-1:0] wordtemp;
	reg [11:0] Atemp;
  begin
	dump_file_desc = $fopen(filename_dump);
     if (CEN_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  Atemp = i;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {32{1'b1}};
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[496], data_out[480], data_out[464], data_out[448], data_out[432],
          data_out[416], data_out[400], data_out[384], data_out[368], data_out[352],
          data_out[336], data_out[320], data_out[304], data_out[288], data_out[272],
          data_out[256], data_out[240], data_out[224], data_out[208], data_out[192],
          data_out[176], data_out[160], data_out[144], data_out[128], data_out[112],
          data_out[96], data_out[80], data_out[64], data_out[48], data_out[32], data_out[16],
          data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path_d = {shifted_readLatch0[31], shifted_readLatch0[30], shifted_readLatch0[29],
          shifted_readLatch0[28], shifted_readLatch0[27], shifted_readLatch0[26], shifted_readLatch0[25],
          shifted_readLatch0[24], shifted_readLatch0[23], shifted_readLatch0[22], shifted_readLatch0[21],
          shifted_readLatch0[20], shifted_readLatch0[19], shifted_readLatch0[18], shifted_readLatch0[17],
          shifted_readLatch0[16], shifted_readLatch0[15], shifted_readLatch0[14], shifted_readLatch0[13],
          shifted_readLatch0[12], shifted_readLatch0[11], shifted_readLatch0[10], shifted_readLatch0[9],
          shifted_readLatch0[8], shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
          shifted_readLatch0[4], shifted_readLatch0[3], shifted_readLatch0[2], shifted_readLatch0[1],
          shifted_readLatch0[0]};
   	$fdisplay(dump_file_desc, "%b", mem_path_d);
  end
  	end
    $fclose(dump_file_desc);
  end
  endtask

task loadaddr;
	input [11:0] load_addr;
	input [31:0] load_data;
	reg [BITS-1:0] wordtemp;
	reg [11:0] Atemp;
  begin
     if (CEN_ === 1'b1) begin
	  wordtemp = load_data;
	  Atemp = load_addr;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {32{1'b1}};
        row_mask =  ( {15'b000000000000000, writeEnable[31], 15'b000000000000000, writeEnable[30],
          15'b000000000000000, writeEnable[29], 15'b000000000000000, writeEnable[28],
          15'b000000000000000, writeEnable[27], 15'b000000000000000, writeEnable[26],
          15'b000000000000000, writeEnable[25], 15'b000000000000000, writeEnable[24],
          15'b000000000000000, writeEnable[23], 15'b000000000000000, writeEnable[22],
          15'b000000000000000, writeEnable[21], 15'b000000000000000, writeEnable[20],
          15'b000000000000000, writeEnable[19], 15'b000000000000000, writeEnable[18],
          15'b000000000000000, writeEnable[17], 15'b000000000000000, writeEnable[16],
          15'b000000000000000, writeEnable[15], 15'b000000000000000, writeEnable[14],
          15'b000000000000000, writeEnable[13], 15'b000000000000000, writeEnable[12],
          15'b000000000000000, writeEnable[11], 15'b000000000000000, writeEnable[10],
          15'b000000000000000, writeEnable[9], 15'b000000000000000, writeEnable[8],
          15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, wordtemp[31], 15'b000000000000000, wordtemp[30],
          15'b000000000000000, wordtemp[29], 15'b000000000000000, wordtemp[28], 15'b000000000000000, wordtemp[27],
          15'b000000000000000, wordtemp[26], 15'b000000000000000, wordtemp[25], 15'b000000000000000, wordtemp[24],
          15'b000000000000000, wordtemp[23], 15'b000000000000000, wordtemp[22], 15'b000000000000000, wordtemp[21],
          15'b000000000000000, wordtemp[20], 15'b000000000000000, wordtemp[19], 15'b000000000000000, wordtemp[18],
          15'b000000000000000, wordtemp[17], 15'b000000000000000, wordtemp[16], 15'b000000000000000, wordtemp[15],
          15'b000000000000000, wordtemp[14], 15'b000000000000000, wordtemp[13], 15'b000000000000000, wordtemp[12],
          15'b000000000000000, wordtemp[11], 15'b000000000000000, wordtemp[10], 15'b000000000000000, wordtemp[9],
          15'b000000000000000, wordtemp[8], 15'b000000000000000, wordtemp[7], 15'b000000000000000, wordtemp[6],
          15'b000000000000000, wordtemp[5], 15'b000000000000000, wordtemp[4], 15'b000000000000000, wordtemp[3],
          15'b000000000000000, wordtemp[2], 15'b000000000000000, wordtemp[1], 15'b000000000000000, wordtemp[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
  	end
  end
  endtask

task dumpaddr;
	output [31:0] dump_data;
	input [11:0] dump_addr;
	reg [BITS-1:0] wordtemp;
	reg [11:0] Atemp;
  begin
     if (CEN_ === 1'b1) begin
	  Atemp = dump_addr;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {32{1'b1}};
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[496], data_out[480], data_out[464], data_out[448], data_out[432],
          data_out[416], data_out[400], data_out[384], data_out[368], data_out[352],
          data_out[336], data_out[320], data_out[304], data_out[288], data_out[272],
          data_out[256], data_out[240], data_out[224], data_out[208], data_out[192],
          data_out[176], data_out[160], data_out[144], data_out[128], data_out[112],
          data_out[96], data_out[80], data_out[64], data_out[48], data_out[32], data_out[16],
          data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path_d = {shifted_readLatch0[31], shifted_readLatch0[30], shifted_readLatch0[29],
          shifted_readLatch0[28], shifted_readLatch0[27], shifted_readLatch0[26], shifted_readLatch0[25],
          shifted_readLatch0[24], shifted_readLatch0[23], shifted_readLatch0[22], shifted_readLatch0[21],
          shifted_readLatch0[20], shifted_readLatch0[19], shifted_readLatch0[18], shifted_readLatch0[17],
          shifted_readLatch0[16], shifted_readLatch0[15], shifted_readLatch0[14], shifted_readLatch0[13],
          shifted_readLatch0[12], shifted_readLatch0[11], shifted_readLatch0[10], shifted_readLatch0[9],
          shifted_readLatch0[8], shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
          shifted_readLatch0[4], shifted_readLatch0[3], shifted_readLatch0[2], shifted_readLatch0[1],
          shifted_readLatch0[0]};
   	dump_data = mem_path_d;
  	end
  end
  endtask


  task readWrite;
  begin
    if (WABL_int === 1'bx)
      begin
        D_int = {32{1'bx}};
        failedWrite(0);
      end
    if (^WABLM_int === 1'bx)
      begin
        D_int = {32{1'bx}};
        failedWrite(0);
      end
    if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_int === 1'b0 && CEN_int === 1'b0) begin
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{(EMA_int), (EMAW_int), (EMAS_int)} === 1'bx) begin
  if(isBitX(EMAS_int)) begin 
        XQ = 1'b1; Q_update = 1'b1;
  end
  if(isBitX(EMAW_int)) begin 
      failedWrite(0);
  end
  if(isBitX(EMA_int)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
  end
    end else if (^{CEN_int, (STOV_int && !CEN_int), RET1N_int, WABL_int, WABLM_int} === 1'bx) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if ((A_int >= WORDS) && (CEN_int === 1'b0)) begin
        XQ = GWEN_int !== 1'b1 ? 1'b0 : 1'b1; Q_update = GWEN_int !== 1'b1 ? 1'b0 : 1'b1;
    end else if (CEN_int === 1'b0 && (^A_int) === 1'bx) begin
      if (GWEN_int !== 1'b1)
        failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (CEN_int === 1'b0) begin
      mux_address = (A_int & 4'b1111);
      row_address = (A_int >> 4);
      if (row_address > 255)
        row = {512{1'bx}};
      else
        row = mem[row_address];
        writeEnable = ~ {32{GWEN_int}};
      if (GWEN_int !== 1'b1) begin
        row_mask =  ( {15'b000000000000000, writeEnable[31], 15'b000000000000000, writeEnable[30],
          15'b000000000000000, writeEnable[29], 15'b000000000000000, writeEnable[28],
          15'b000000000000000, writeEnable[27], 15'b000000000000000, writeEnable[26],
          15'b000000000000000, writeEnable[25], 15'b000000000000000, writeEnable[24],
          15'b000000000000000, writeEnable[23], 15'b000000000000000, writeEnable[22],
          15'b000000000000000, writeEnable[21], 15'b000000000000000, writeEnable[20],
          15'b000000000000000, writeEnable[19], 15'b000000000000000, writeEnable[18],
          15'b000000000000000, writeEnable[17], 15'b000000000000000, writeEnable[16],
          15'b000000000000000, writeEnable[15], 15'b000000000000000, writeEnable[14],
          15'b000000000000000, writeEnable[13], 15'b000000000000000, writeEnable[12],
          15'b000000000000000, writeEnable[11], 15'b000000000000000, writeEnable[10],
          15'b000000000000000, writeEnable[9], 15'b000000000000000, writeEnable[8],
          15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, D_int[31], 15'b000000000000000, D_int[30],
          15'b000000000000000, D_int[29], 15'b000000000000000, D_int[28], 15'b000000000000000, D_int[27],
          15'b000000000000000, D_int[26], 15'b000000000000000, D_int[25], 15'b000000000000000, D_int[24],
          15'b000000000000000, D_int[23], 15'b000000000000000, D_int[22], 15'b000000000000000, D_int[21],
          15'b000000000000000, D_int[20], 15'b000000000000000, D_int[19], 15'b000000000000000, D_int[18],
          15'b000000000000000, D_int[17], 15'b000000000000000, D_int[16], 15'b000000000000000, D_int[15],
          15'b000000000000000, D_int[14], 15'b000000000000000, D_int[13], 15'b000000000000000, D_int[12],
          15'b000000000000000, D_int[11], 15'b000000000000000, D_int[10], 15'b000000000000000, D_int[9],
          15'b000000000000000, D_int[8], 15'b000000000000000, D_int[7], 15'b000000000000000, D_int[6],
          15'b000000000000000, D_int[5], 15'b000000000000000, D_int[4], 15'b000000000000000, D_int[3],
          15'b000000000000000, D_int[2], 15'b000000000000000, D_int[1], 15'b000000000000000, D_int[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
      end else begin
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[496], data_out[480], data_out[464], data_out[448], data_out[432],
          data_out[416], data_out[400], data_out[384], data_out[368], data_out[352],
          data_out[336], data_out[320], data_out[304], data_out[288], data_out[272],
          data_out[256], data_out[240], data_out[224], data_out[208], data_out[192],
          data_out[176], data_out[160], data_out[144], data_out[128], data_out[112],
          data_out[96], data_out[80], data_out[64], data_out[48], data_out[32], data_out[16],
          data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path = {shifted_readLatch0[31], shifted_readLatch0[30], shifted_readLatch0[29],
          shifted_readLatch0[28], shifted_readLatch0[27], shifted_readLatch0[26], shifted_readLatch0[25],
          shifted_readLatch0[24], shifted_readLatch0[23], shifted_readLatch0[22], shifted_readLatch0[21],
          shifted_readLatch0[20], shifted_readLatch0[19], shifted_readLatch0[18], shifted_readLatch0[17],
          shifted_readLatch0[16], shifted_readLatch0[15], shifted_readLatch0[14], shifted_readLatch0[13],
          shifted_readLatch0[12], shifted_readLatch0[11], shifted_readLatch0[10], shifted_readLatch0[9],
          shifted_readLatch0[8], shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
          shifted_readLatch0[4], shifted_readLatch0[3], shifted_readLatch0[2], shifted_readLatch0[1],
          shifted_readLatch0[0]};
        	XQ = 1'b0; Q_update = 1'b1;
      end
    if (WABL_int === 1'bx) begin
        XQ = 1'b1; Q_update = 1'b1;
    end
    if (^WABLM_int === 1'bx) begin
        XQ = 1'b1; Q_update = 1'b1;
    end
      if( isBitX(GWEN_int) )  begin
        XQ = 1'b1; Q_update = 1'b1;
      end
    end
  end
  endtask
  always @ (CEN_ or CLK_) begin
  	if(CLK_ == 1'b0) begin
  		CEN_p2 = CEN_;
  	end
  end

`ifdef POWER_PINS
  always @ (VDDCE) begin
      if (VDDCE != 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDCE should be powered down after VDDPE, Illegal power down sequencing in %m at %0t", $time);
       end
        $display("In PowerDown Mode in %m at %0t", $time);
        failedWrite(0);
      end
      if (VDDCE == 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDPE should be powered up after VDDCE in %m at %0t", $time);
        $display("Illegal power up sequencing in %m at %0t", $time);
       end
        failedWrite(0);
      end
  end
`endif
`ifdef POWER_PINS
  always @ (RET1N_ or VDDPE or VDDCE or VSSE) begin
`else     
  always @ RET1N_ begin
`endif
`ifdef POWER_PINS
    if (RET1N_ == 1'b1 && RET1N_int == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 && pre_charge_st == 1'b1 && (CEN_ === 1'bx || CLK_ === 1'bx)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end
`else     
`endif
`ifdef POWER_PINS
`else     
      pre_charge_st = 0;
`endif
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_ === 1'b0 && CEN_p2 === 1'b0 ) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_ === 1'b1 && RET1N_int !== 1'bx && CEN_p2 === 1'b0 ) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end
`ifdef POWER_PINS
    if (RET1N_ == 1'b1 && VDDPE !== 1'b1) begin
        $display("Warning: Illegal value for VDDPE %b in %m at %0t", VDDPE, $time);
        failedWrite(0);
    end else if (RET1N_ == 1'b0 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st = 1;
    end else if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
      pre_charge_st = 0;
      if (VDDCE != 1'b1) begin
        failedWrite(0);
      end
`else     
    if (RET1N_ == 1'b0) begin
`endif
        XQ = 1'b1; Q_update = 1'b1;
      Q_int_delayed = {32{1'bx}};
      CEN_int = 1'bx;
      GWEN_int = 1'bx;
      A_int = {12{1'bx}};
      D_int = {32{1'bx}};
      STOV_int = 1'bx;
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      EMAS_int = 1'bx;
      RET1N_int = 1'bx;
      WABL_int = 1'bx;
      WABLM_int = {2{1'bx}};
`ifdef POWER_PINS
    end else if (RET1N_ == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st = 0;
      XQ = 1'b0;
    end else begin
      pre_charge_st = 0;
`else     
    end else begin
`endif
				#0;
if ($realtime != 0)  XQ = 1'b1;
        Q_update = 1'b1;
      Q_int_delayed = {32{1'bx}};
      CEN_int = 1'bx;
      GWEN_int = 1'bx;
      A_int = {12{1'bx}};
      D_int = {32{1'bx}};
      STOV_int = 1'bx;
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      EMAS_int = 1'bx;
      RET1N_int = 1'bx;
      WABL_int = 1'bx;
      WABLM_int = {2{1'bx}};
    end
    #0;
    RET1N_int = RET1N_;
        Q_update = 1'b0;
  end


  always @ CLK_ begin
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
`endif
`ifdef POWER_PINS
  if (RET1N_ == 1'b0) begin
`else     
  if (RET1N_ == 1'b0) begin
`endif
      // no cycle in retention mode
`ifdef POWER_PINS
    end else if ((VDDCE === 1'bx || VDDCE === 1'bz)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
  end else if (RET1N_ == 1'b1 && VDDPE !== 1'b1) begin
  end else if (VSSE !== 1'b0) begin
`endif
  end else begin
    if ((CLK_ === 1'bx || CLK_ === 1'bz) && RET1N_ !== 1'b0) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if ((CLK_ === 1'b1 || CLK_ === 1'b0) && LAST_CLK === 1'bx) begin
       D_sh_update = 1'b0;  XD_sh = 1'b0;
       XD_int = {32{1'b0}};
       XQ = 1'b0; Q_update = 1'b0; 
    end else if (CLK_ === 1'b1 && LAST_CLK === 1'b0) begin
      CEN_int = CEN_;
      STOV_int = STOV_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      EMAS_int = EMAS_;
      RET1N_int = RET1N_;
      WABL_int = WABL_;
      WABLM_int = WABLM_;
      if (CEN_int != 1'b1) begin
        GWEN_int = GWEN_;
        A_int = A_;
        D_int = D_;
      end
      clk0_int = 1'b0;
      CEN_int = CEN_;
      STOV_int = STOV_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      EMAS_int = EMAS_;
      RET1N_int = RET1N_;
      WABL_int = WABL_;
      WABLM_int = WABLM_;
      if (CEN_int != 1'b1) begin
        GWEN_int = GWEN_;
        A_int = A_;
        D_int = D_;
      end
      clk0_int = 1'b0;
      if (CEN_int === 1'b0 && GWEN_int === 1'b1) 
         Q_int_delayed = {32{1'bx}};
    readWrite;
    end else if (CLK_ === 1'b0 && LAST_CLK === 1'b1) begin
      Q_int_delayed = Q_int;
      Q_update = 1'b0;
      D_sh_update = 1'b0;
      XQ = 1'b0;
       XD_int = {32{1'b0}};
    end
  end
    LAST_CLK = CLK_;
  end

  reg globalNotifier0;
  initial globalNotifier0 = 1'b0;

  always @ globalNotifier0 begin
    if ($realtime == 0) begin
    end else if (CEN_int === 1'bx || RET1N_int === 1'bx || (STOV_int && !CEN_int) === 1'bx || 
      WABLM_int[0] === 1'bx || WABLM_int[1] === 1'bx || WABL_int === 1'bx || clk0_int === 1'bx) begin
        XQ = 1'b1; Q_update = 1'b1;
    	 mem_path = {32{1'bx}};
      Q_int_delayed = {32{1'bx}};
      failedWrite(0);
    end else if (CEN_int === 1'b0 && (^A_int) === 1'bx) begin
        failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else begin
      #0;
      readWrite;
   end
      #0;
        XQ = 1'b0; Q_update = 1'b0;
    globalNotifier0 = 1'b0;
  end

  assign D_int_bmux = D_;

  datapath_latch_sram_4096x32 uDQ0 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(1'b0), .D(D_int_bmux[0]), .DFTRAMBYP(1'b0), .mem_path(mem_path[0]), .XQ(XQ|XD_int[0]|1'b0), .Q(Q_int[0]));
  datapath_latch_sram_4096x32 uDQ1 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[0]), .D(D_int_bmux[1]), .DFTRAMBYP(1'b0), .mem_path(mem_path[1]), .XQ(XQ|XD_int[1]), .Q(Q_int[1]));
  datapath_latch_sram_4096x32 uDQ2 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[1]), .D(D_int_bmux[2]), .DFTRAMBYP(1'b0), .mem_path(mem_path[2]), .XQ(XQ|XD_int[2]), .Q(Q_int[2]));
  datapath_latch_sram_4096x32 uDQ3 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[2]), .D(D_int_bmux[3]), .DFTRAMBYP(1'b0), .mem_path(mem_path[3]), .XQ(XQ|XD_int[3]), .Q(Q_int[3]));
  datapath_latch_sram_4096x32 uDQ4 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[3]), .D(D_int_bmux[4]), .DFTRAMBYP(1'b0), .mem_path(mem_path[4]), .XQ(XQ|XD_int[4]), .Q(Q_int[4]));
  datapath_latch_sram_4096x32 uDQ5 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[4]), .D(D_int_bmux[5]), .DFTRAMBYP(1'b0), .mem_path(mem_path[5]), .XQ(XQ|XD_int[5]), .Q(Q_int[5]));
  datapath_latch_sram_4096x32 uDQ6 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[5]), .D(D_int_bmux[6]), .DFTRAMBYP(1'b0), .mem_path(mem_path[6]), .XQ(XQ|XD_int[6]), .Q(Q_int[6]));
  datapath_latch_sram_4096x32 uDQ7 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[6]), .D(D_int_bmux[7]), .DFTRAMBYP(1'b0), .mem_path(mem_path[7]), .XQ(XQ|XD_int[7]), .Q(Q_int[7]));
  datapath_latch_sram_4096x32 uDQ8 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[7]), .D(D_int_bmux[8]), .DFTRAMBYP(1'b0), .mem_path(mem_path[8]), .XQ(XQ|XD_int[8]), .Q(Q_int[8]));
  datapath_latch_sram_4096x32 uDQ9 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[8]), .D(D_int_bmux[9]), .DFTRAMBYP(1'b0), .mem_path(mem_path[9]), .XQ(XQ|XD_int[9]), .Q(Q_int[9]));
  datapath_latch_sram_4096x32 uDQ10 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[9]), .D(D_int_bmux[10]), .DFTRAMBYP(1'b0), .mem_path(mem_path[10]), .XQ(XQ|XD_int[10]), .Q(Q_int[10]));
  datapath_latch_sram_4096x32 uDQ11 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[10]), .D(D_int_bmux[11]), .DFTRAMBYP(1'b0), .mem_path(mem_path[11]), .XQ(XQ|XD_int[11]), .Q(Q_int[11]));
  datapath_latch_sram_4096x32 uDQ12 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[11]), .D(D_int_bmux[12]), .DFTRAMBYP(1'b0), .mem_path(mem_path[12]), .XQ(XQ|XD_int[12]), .Q(Q_int[12]));
  datapath_latch_sram_4096x32 uDQ13 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[12]), .D(D_int_bmux[13]), .DFTRAMBYP(1'b0), .mem_path(mem_path[13]), .XQ(XQ|XD_int[13]), .Q(Q_int[13]));
  datapath_latch_sram_4096x32 uDQ14 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[13]), .D(D_int_bmux[14]), .DFTRAMBYP(1'b0), .mem_path(mem_path[14]), .XQ(XQ|XD_int[14]), .Q(Q_int[14]));
  datapath_latch_sram_4096x32 uDQ15 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[14]), .D(D_int_bmux[15]), .DFTRAMBYP(1'b0), .mem_path(mem_path[15]), .XQ(XQ|XD_int[15]), .Q(Q_int[15]));
  datapath_latch_sram_4096x32 uDQ16 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[17]), .D(D_int_bmux[16]), .DFTRAMBYP(1'b0), .mem_path(mem_path[16]), .XQ(XQ|XD_int[16]), .Q(Q_int[16]));
  datapath_latch_sram_4096x32 uDQ17 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[18]), .D(D_int_bmux[17]), .DFTRAMBYP(1'b0), .mem_path(mem_path[17]), .XQ(XQ|XD_int[17]), .Q(Q_int[17]));
  datapath_latch_sram_4096x32 uDQ18 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[19]), .D(D_int_bmux[18]), .DFTRAMBYP(1'b0), .mem_path(mem_path[18]), .XQ(XQ|XD_int[18]), .Q(Q_int[18]));
  datapath_latch_sram_4096x32 uDQ19 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[20]), .D(D_int_bmux[19]), .DFTRAMBYP(1'b0), .mem_path(mem_path[19]), .XQ(XQ|XD_int[19]), .Q(Q_int[19]));
  datapath_latch_sram_4096x32 uDQ20 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[21]), .D(D_int_bmux[20]), .DFTRAMBYP(1'b0), .mem_path(mem_path[20]), .XQ(XQ|XD_int[20]), .Q(Q_int[20]));
  datapath_latch_sram_4096x32 uDQ21 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[22]), .D(D_int_bmux[21]), .DFTRAMBYP(1'b0), .mem_path(mem_path[21]), .XQ(XQ|XD_int[21]), .Q(Q_int[21]));
  datapath_latch_sram_4096x32 uDQ22 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[23]), .D(D_int_bmux[22]), .DFTRAMBYP(1'b0), .mem_path(mem_path[22]), .XQ(XQ|XD_int[22]), .Q(Q_int[22]));
  datapath_latch_sram_4096x32 uDQ23 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[24]), .D(D_int_bmux[23]), .DFTRAMBYP(1'b0), .mem_path(mem_path[23]), .XQ(XQ|XD_int[23]), .Q(Q_int[23]));
  datapath_latch_sram_4096x32 uDQ24 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[25]), .D(D_int_bmux[24]), .DFTRAMBYP(1'b0), .mem_path(mem_path[24]), .XQ(XQ|XD_int[24]), .Q(Q_int[24]));
  datapath_latch_sram_4096x32 uDQ25 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[26]), .D(D_int_bmux[25]), .DFTRAMBYP(1'b0), .mem_path(mem_path[25]), .XQ(XQ|XD_int[25]), .Q(Q_int[25]));
  datapath_latch_sram_4096x32 uDQ26 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[27]), .D(D_int_bmux[26]), .DFTRAMBYP(1'b0), .mem_path(mem_path[26]), .XQ(XQ|XD_int[26]), .Q(Q_int[26]));
  datapath_latch_sram_4096x32 uDQ27 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[28]), .D(D_int_bmux[27]), .DFTRAMBYP(1'b0), .mem_path(mem_path[27]), .XQ(XQ|XD_int[27]), .Q(Q_int[27]));
  datapath_latch_sram_4096x32 uDQ28 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[29]), .D(D_int_bmux[28]), .DFTRAMBYP(1'b0), .mem_path(mem_path[28]), .XQ(XQ|XD_int[28]), .Q(Q_int[28]));
  datapath_latch_sram_4096x32 uDQ29 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[30]), .D(D_int_bmux[29]), .DFTRAMBYP(1'b0), .mem_path(mem_path[29]), .XQ(XQ|XD_int[29]), .Q(Q_int[29]));
  datapath_latch_sram_4096x32 uDQ30 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[31]), .D(D_int_bmux[30]), .DFTRAMBYP(1'b0), .mem_path(mem_path[30]), .XQ(XQ|XD_int[30]), .Q(Q_int[30]));
  datapath_latch_sram_4096x32 uDQ31 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(1'b0), .D(D_int_bmux[31]), .DFTRAMBYP(1'b0), .mem_path(mem_path[31]), .XQ(XQ|XD_int[31]|1'b0), .Q(Q_int[31]));


// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
	always @ (VDDCE or VDDPE or VSSE) begin
		if (VDDCE === 1'bx || VDDCE === 1'bz) begin
			$display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
        XQ = 1'b1; Q_update = 1'b1;
			failedWrite(0);
			bad_VDDCE = 1'b1;
		end else begin
			bad_VDDCE = 1'b0;
		end
		if (RET1N_ == 1'b1 && VDDPE !== 1'b1) begin
			$display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
        XQ = 1'b1; Q_update = 1'b1;
			failedWrite(0);
			bad_VDDPE = 1'b1;
		end else begin
			bad_VDDPE = 1'b0;
		end
		if (VSSE !== 1'b0) begin
			$display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
        XQ = 1'b1; Q_update = 1'b1;
			failedWrite(0);
			bad_VSSE = 1'b1;
		end else begin
			bad_VSSE = 1'b0;
		end
		bad_power = bad_VDDCE | bad_VDDPE | bad_VSSE ;
	end
`endif

  always @ NOT_CEN begin
    CEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_GWEN begin
    GWEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A11 begin
    A_int[11] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A10 begin
    A_int[10] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A9 begin
    A_int[9] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A8 begin
    A_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A7 begin
    A_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A6 begin
    A_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A5 begin
    A_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A4 begin
    A_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A3 begin
    A_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A2 begin
    A_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A1 begin
    A_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A0 begin
    A_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D31 begin
    D_int[31] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D30 begin
    D_int[30] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D29 begin
    D_int[29] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D28 begin
    D_int[28] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D27 begin
    D_int[27] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D26 begin
    D_int[26] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D25 begin
    D_int[25] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D24 begin
    D_int[24] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D23 begin
    D_int[23] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D22 begin
    D_int[22] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D21 begin
    D_int[21] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D20 begin
    D_int[20] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D19 begin
    D_int[19] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D18 begin
    D_int[18] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D17 begin
    D_int[17] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D16 begin
    D_int[16] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D15 begin
    D_int[15] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D14 begin
    D_int[14] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D13 begin
    D_int[13] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D12 begin
    D_int[12] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D11 begin
    D_int[11] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D10 begin
    D_int[10] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D9 begin
    D_int[9] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D8 begin
    D_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D7 begin
    D_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D6 begin
    D_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D5 begin
    D_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D4 begin
    D_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D3 begin
    D_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D2 begin
    D_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D1 begin
    D_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D0 begin
    D_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_STOV begin
    STOV_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMA2 begin
    EMA_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMA1 begin
    EMA_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMA0 begin
    EMA_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAW1 begin
    EMAW_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAW0 begin
    EMAW_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAS begin
    EMAS_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_RET1N begin
    RET1N_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WABL begin
    WABL_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WABLM1 begin
    WABLM_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WABLM0 begin
    WABLM_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end

  always @ NOT_CLK_PER begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLK_MINH begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLK_MINL begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end


  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;

  wire STOVeq1aWABLeq1aRET1Neq1, STOVeq1aWABLeq0aRET1Neq1, STOVeq0aRET1Neq1aCENeq0;
  wire STOVeq1aRET1Neq1aCENeq0, RET1Neq1, RET1Neq1aCENeq0aGWENeq0, RET1Neq1aCENeq0;
  wire RET1Neq1aGWENeq0aCENeq0;

  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;


  assign STOVeq1aWABLeq1aRET1Neq1 = STOV&&WABL&&RET1N;
  assign STOVeq1aWABLeq0aRET1Neq1 = STOV&&!WABL&&RET1N;
  assign STOVeq0aRET1Neq1aCENeq0 = !STOV&&RET1N&&!CEN;
  assign STOVeq1aRET1Neq1aCENeq0 = STOV&&RET1N&&!CEN;
  assign RET1Neq1aCENeq0aGWENeq0 = RET1N&&!CEN&&!GWEN;
  assign RET1Neq1aGWENeq0aCENeq0 = RET1N&&!GWEN&&!CEN;

  assign RET1Neq1 = RET1N;
  assign RET1Neq1aCENeq0 = RET1N&&!CEN;

  specify

    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);


   // Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $period(posedge CLK, `ARM_MEM_PERIOD, NOT_CLK_PER);
   `else
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq1aWABLeq1aRET1Neq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq1aWABLeq0aRET1Neq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
   `endif


   // Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $width(posedge CLK, `ARM_MEM_WIDTH, 0, NOT_CLK_MINH);
       $width(negedge CLK, `ARM_MEM_WIDTH, 0, NOT_CLK_MINL);
   `else
       $width(posedge CLK &&& STOVeq0aRET1Neq1aCENeq0, `ARM_MEM_WIDTH, 0, NOT_CLK_MINH);
       $width(posedge CLK &&& STOVeq1aRET1Neq1aCENeq0, `ARM_MEM_WIDTH, 0, NOT_CLK_MINH);
       $width(negedge CLK &&& STOVeq0aRET1Neq1aCENeq0, `ARM_MEM_WIDTH, 0, NOT_CLK_MINL);
       $width(negedge CLK &&& STOVeq1aRET1Neq1aCENeq0, `ARM_MEM_WIDTH, 0, NOT_CLK_MINL);
   `endif

    $setuphold(posedge CLK &&& RET1Neq1, posedge CEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_CEN,,,dCLK,dCEN);
    $setuphold(posedge CLK &&& RET1Neq1, negedge CEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_CEN,,,dCLK,dCEN);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge GWEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_GWEN,,,dCLK,dGWEN);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge GWEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_GWEN,,,dCLK,dGWEN);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A11,,,dCLK,dA[11]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A10,,,dCLK,dA[10]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A9,,,dCLK,dA[9]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A8,,,dCLK,dA[8]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A7,,,dCLK,dA[7]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A6,,,dCLK,dA[6]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A5,,,dCLK,dA[5]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A4,,,dCLK,dA[4]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A3,,,dCLK,dA[3]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A2,,,dCLK,dA[2]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A1,,,dCLK,dA[1]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A0,,,dCLK,dA[0]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A11,,,dCLK,dA[11]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A10,,,dCLK,dA[10]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A9,,,dCLK,dA[9]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A8,,,dCLK,dA[8]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A7,,,dCLK,dA[7]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A6,,,dCLK,dA[6]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A5,,,dCLK,dA[5]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A4,,,dCLK,dA[4]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A3,,,dCLK,dA[3]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A2,,,dCLK,dA[2]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A1,,,dCLK,dA[1]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A0,,,dCLK,dA[0]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D31,,,dCLK,dD[31]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D30,,,dCLK,dD[30]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D29,,,dCLK,dD[29]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D28,,,dCLK,dD[28]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D27,,,dCLK,dD[27]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D26,,,dCLK,dD[26]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D25,,,dCLK,dD[25]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D24,,,dCLK,dD[24]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D23,,,dCLK,dD[23]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D22,,,dCLK,dD[22]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D21,,,dCLK,dD[21]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D20,,,dCLK,dD[20]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D19,,,dCLK,dD[19]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D18,,,dCLK,dD[18]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D17,,,dCLK,dD[17]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D16,,,dCLK,dD[16]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D15,,,dCLK,dD[15]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D14,,,dCLK,dD[14]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D13,,,dCLK,dD[13]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D12,,,dCLK,dD[12]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D11,,,dCLK,dD[11]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D10,,,dCLK,dD[10]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D9,,,dCLK,dD[9]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D8,,,dCLK,dD[8]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D7,,,dCLK,dD[7]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D6,,,dCLK,dD[6]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D5,,,dCLK,dD[5]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D4,,,dCLK,dD[4]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D3,,,dCLK,dD[3]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D2,,,dCLK,dD[2]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D1,,,dCLK,dD[1]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D0,,,dCLK,dD[0]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D31,,,dCLK,dD[31]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D30,,,dCLK,dD[30]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D29,,,dCLK,dD[29]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D28,,,dCLK,dD[28]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D27,,,dCLK,dD[27]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D26,,,dCLK,dD[26]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D25,,,dCLK,dD[25]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D24,,,dCLK,dD[24]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D23,,,dCLK,dD[23]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D22,,,dCLK,dD[22]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D21,,,dCLK,dD[21]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D20,,,dCLK,dD[20]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D19,,,dCLK,dD[19]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D18,,,dCLK,dD[18]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D17,,,dCLK,dD[17]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D16,,,dCLK,dD[16]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D15,,,dCLK,dD[15]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D14,,,dCLK,dD[14]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D13,,,dCLK,dD[13]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D12,,,dCLK,dD[12]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D11,,,dCLK,dD[11]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D10,,,dCLK,dD[10]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D9,,,dCLK,dD[9]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D8,,,dCLK,dD[8]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D7,,,dCLK,dD[7]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D6,,,dCLK,dD[6]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D5,,,dCLK,dD[5]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D4,,,dCLK,dD[4]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D3,,,dCLK,dD[3]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D2,,,dCLK,dD[2]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D1,,,dCLK,dD[1]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D0,,,dCLK,dD[0]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge STOV, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_STOV,,,dCLK,dSTOV);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge STOV, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_STOV,,,dCLK,dSTOV);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA2,,,dCLK,dEMA[2]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA1,,,dCLK,dEMA[1]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA0,,,dCLK,dEMA[0]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA2,,,dCLK,dEMA[2]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA1,,,dCLK,dEMA[1]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA0,,,dCLK,dEMA[0]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMAW[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW1,,,dCLK,dEMAW[1]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMAW[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW0,,,dCLK,dEMAW[0]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMAW[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW1,,,dCLK,dEMAW[1]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMAW[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW0,,,dCLK,dEMAW[0]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMAS, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAS,,,dCLK,dEMAS);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMAS, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAS,,,dCLK,dEMAS);
    $setuphold(posedge CLK &&& RET1Neq1aGWENeq0aCENeq0, posedge WABL, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WABL,,,dCLK,dWABL);
    $setuphold(posedge CLK &&& RET1Neq1aGWENeq0aCENeq0, negedge WABL, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WABL,,,dCLK,dWABL);
    $setuphold(posedge CLK &&& RET1Neq1aGWENeq0aCENeq0, posedge WABLM[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WABLM1,,,dCLK,dWABLM[1]);
    $setuphold(posedge CLK &&& RET1Neq1aGWENeq0aCENeq0, posedge WABLM[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WABLM0,,,dCLK,dWABLM[0]);
    $setuphold(posedge CLK &&& RET1Neq1aGWENeq0aCENeq0, negedge WABLM[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WABLM1,,,dCLK,dWABLM[1]);
    $setuphold(posedge CLK &&& RET1Neq1aGWENeq0aCENeq0, negedge WABLM[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WABLM0,,,dCLK,dWABLM[0]);
    $setuphold(negedge RET1N, negedge CEN, 0.000, `ARM_MEM_HOLD, NOT_RET1N,,,dRET1N,dCEN);
    $setuphold(posedge RET1N, negedge CEN, 0.000, `ARM_MEM_HOLD, NOT_RET1N,,,dRET1N,dCEN);
    $setuphold(posedge CEN, posedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N,,,dCEN,dRET1N);
    $setuphold(posedge CEN, negedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N,,,dCEN,dRET1N);
  endspecify


endmodule
`endcelldefine
`else
`celldefine
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
module sram_4096x32 (VDDCE, VDDPE, VSSE, Q, CLK, CEN, GWEN, A, D, STOV, EMA, EMAW,
    EMAS, RET1N, WABL, WABLM);
`else
module sram_4096x32 (Q, CLK, CEN, GWEN, A, D, STOV, EMA, EMAW, EMAS, RET1N, WABL, WABLM);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 32;
  parameter WORDS = 4096;
  parameter MUX = 16;
  parameter MEM_WIDTH = 512; // redun block size 16, 256 on left, 256 on right
  parameter MEM_HEIGHT = 256;
  parameter WP_SIZE = 32 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 1;
  parameter ROWS = 256;

  output [31:0] Q;
  input  CLK;
  input  CEN;
  input  GWEN;
  input [11:0] A;
  input [31:0] D;
  input  STOV;
  input [2:0] EMA;
  input [1:0] EMAW;
  input  EMAS;
  input  RET1N;
  input  WABL;
  input [1:0] WABLM;
`ifdef POWER_PINS
  inout VDDCE;
  inout VDDPE;
  inout VSSE;
`endif

`ifdef POWER_PINS
  reg bad_VDDCE;
  reg bad_VDDPE;
  reg bad_VSSE;
  reg bad_power;
`endif
  wire corrupt_power;
  reg pre_charge_st;
  integer row_address;
  integer mux_address;
  initial row_address = 0;
  initial mux_address = 0;
  reg [511:0] mem [0:255];
  reg [511:0] row, row_t;
  reg LAST_CLK;
  reg [511:0] row_mask;
  reg [511:0] new_data;
  reg [511:0] data_out;
  reg [31:0] readLatch0;
  reg [31:0] shifted_readLatch0;
  wire [31:0] Q_int;
  reg [31:0] Q_int_delayed;
  reg XQ, Q_update;
  reg XD_sh, D_sh_update;
  wire [31:0] D_int_bmux;
  reg [31:0] mem_path;
  reg [31:0] mem_path_d;
  reg [31:0] writeEnable;

  reg NOT_CEN, NOT_GWEN, NOT_A11, NOT_A10, NOT_A9, NOT_A8, NOT_A7, NOT_A6, NOT_A5;
  reg NOT_A4, NOT_A3, NOT_A2, NOT_A1, NOT_A0, NOT_D31, NOT_D30, NOT_D29, NOT_D28, NOT_D27;
  reg NOT_D26, NOT_D25, NOT_D24, NOT_D23, NOT_D22, NOT_D21, NOT_D20, NOT_D19, NOT_D18;
  reg NOT_D17, NOT_D16, NOT_D15, NOT_D14, NOT_D13, NOT_D12, NOT_D11, NOT_D10, NOT_D9;
  reg NOT_D8, NOT_D7, NOT_D6, NOT_D5, NOT_D4, NOT_D3, NOT_D2, NOT_D1, NOT_D0, NOT_STOV;
  reg NOT_EMA2, NOT_EMA1, NOT_EMA0, NOT_EMAW1, NOT_EMAW0, NOT_EMAS, NOT_RET1N, NOT_WABL;
  reg NOT_WABLM1, NOT_WABLM0;
  reg NOT_CLK_PER, NOT_CLK_MINH, NOT_CLK_MINL;
  reg clk0_int;

  wire [31:0] Q_;
 wire  CLK_;
  wire  CEN_;
  reg  CEN_int;
  reg  CEN_p2;
  wire  GWEN_;
  reg  GWEN_int;
  wire [11:0] A_;
  reg [11:0] A_int;
  wire [31:0] D_;
  reg [31:0] D_int;
  reg [31:0] XD_int;
  wire  STOV_;
  reg  STOV_int;
  wire [2:0] EMA_;
  reg [2:0] EMA_int;
  wire [1:0] EMAW_;
  reg [1:0] EMAW_int;
  wire  EMAS_;
  reg  EMAS_int;
  wire  RET1N_;
  reg  RET1N_int;
  wire  WABL_;
  reg  WABL_int;
  wire [1:0] WABLM_;
  reg [1:0] WABLM_int;

  buf B90(Q[0], Q_[0]);
  buf B91(Q[1], Q_[1]);
  buf B92(Q[2], Q_[2]);
  buf B93(Q[3], Q_[3]);
  buf B94(Q[4], Q_[4]);
  buf B95(Q[5], Q_[5]);
  buf B96(Q[6], Q_[6]);
  buf B97(Q[7], Q_[7]);
  buf B98(Q[8], Q_[8]);
  buf B99(Q[9], Q_[9]);
  buf B100(Q[10], Q_[10]);
  buf B101(Q[11], Q_[11]);
  buf B102(Q[12], Q_[12]);
  buf B103(Q[13], Q_[13]);
  buf B104(Q[14], Q_[14]);
  buf B105(Q[15], Q_[15]);
  buf B106(Q[16], Q_[16]);
  buf B107(Q[17], Q_[17]);
  buf B108(Q[18], Q_[18]);
  buf B109(Q[19], Q_[19]);
  buf B110(Q[20], Q_[20]);
  buf B111(Q[21], Q_[21]);
  buf B112(Q[22], Q_[22]);
  buf B113(Q[23], Q_[23]);
  buf B114(Q[24], Q_[24]);
  buf B115(Q[25], Q_[25]);
  buf B116(Q[26], Q_[26]);
  buf B117(Q[27], Q_[27]);
  buf B118(Q[28], Q_[28]);
  buf B119(Q[29], Q_[29]);
  buf B120(Q[30], Q_[30]);
  buf B121(Q[31], Q_[31]);
  buf B122(CLK_, CLK);
  buf B123(CEN_, CEN);
  buf B124(GWEN_, GWEN);
  buf B125(A_[0], A[0]);
  buf B126(A_[1], A[1]);
  buf B127(A_[2], A[2]);
  buf B128(A_[3], A[3]);
  buf B129(A_[4], A[4]);
  buf B130(A_[5], A[5]);
  buf B131(A_[6], A[6]);
  buf B132(A_[7], A[7]);
  buf B133(A_[8], A[8]);
  buf B134(A_[9], A[9]);
  buf B135(A_[10], A[10]);
  buf B136(A_[11], A[11]);
  buf B137(D_[0], D[0]);
  buf B138(D_[1], D[1]);
  buf B139(D_[2], D[2]);
  buf B140(D_[3], D[3]);
  buf B141(D_[4], D[4]);
  buf B142(D_[5], D[5]);
  buf B143(D_[6], D[6]);
  buf B144(D_[7], D[7]);
  buf B145(D_[8], D[8]);
  buf B146(D_[9], D[9]);
  buf B147(D_[10], D[10]);
  buf B148(D_[11], D[11]);
  buf B149(D_[12], D[12]);
  buf B150(D_[13], D[13]);
  buf B151(D_[14], D[14]);
  buf B152(D_[15], D[15]);
  buf B153(D_[16], D[16]);
  buf B154(D_[17], D[17]);
  buf B155(D_[18], D[18]);
  buf B156(D_[19], D[19]);
  buf B157(D_[20], D[20]);
  buf B158(D_[21], D[21]);
  buf B159(D_[22], D[22]);
  buf B160(D_[23], D[23]);
  buf B161(D_[24], D[24]);
  buf B162(D_[25], D[25]);
  buf B163(D_[26], D[26]);
  buf B164(D_[27], D[27]);
  buf B165(D_[28], D[28]);
  buf B166(D_[29], D[29]);
  buf B167(D_[30], D[30]);
  buf B168(D_[31], D[31]);
  buf B169(STOV_, STOV);
  buf B170(EMA_[0], EMA[0]);
  buf B171(EMA_[1], EMA[1]);
  buf B172(EMA_[2], EMA[2]);
  buf B173(EMAW_[0], EMAW[0]);
  buf B174(EMAW_[1], EMAW[1]);
  buf B175(EMAS_, EMAS);
  buf B176(RET1N_, RET1N);
  buf B177(WABL_, WABL);
  buf B178(WABLM_[0], WABLM[0]);
  buf B179(WABLM_[1], WABLM[1]);

`ifdef POWER_PINS
  assign corrupt_power = bad_power;
`else
  assign corrupt_power = 1'b0;
`endif

   `ifdef ARM_FAULT_MODELING
     sram_4096x32_error_injection u1(.CLK(CLK_), .Q_out(Q_), .A(A_int), .CEN(CEN_int), .GWEN(GWEN_int), .WEN(GWEN_int), .Q_in(Q_int));
  `else
  assign Q_ = (RET1N_ | pre_charge_st) & ~corrupt_power ? ((STOV_ ? (Q_int_delayed) : (Q_int))) : {32{1'bx}};
  `endif

// If INITIALIZE_MEMORY is defined at Simulator Command Line, it Initializes the Memory with all ZEROS.
`ifdef INITIALIZE_MEMORY
  integer i;
  initial
  begin
    #0;
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'b0}};
  end
`endif
  always @ (EMA_) begin
  	if(EMA_ < 2) 
   	$display("Warning: Set Value for EMA doesn't match Default value 2 in %m at %0t", $time);
  end
  always @ (EMAW_) begin
  	if(EMAW_ < 0) 
   	$display("Warning: Set Value for EMAW doesn't match Default value 0 in %m at %0t", $time);
  end
  always @ (EMAS_) begin
  	if(EMAS_ < 0) 
   	$display("Warning: Set Value for EMAS doesn't match Default value 0 in %m at %0t", $time);
  end
	always @ (STOV_) begin
		if(CLK_ == 1'b1) begin
			XQ = 1'b1; Q_update = 1'b1;
			#0; Q_update = 1'b0;
			XQ = 1'b0;
		end
	end

  task failedWrite;
  input port_f;
  integer i;
  begin
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'bx}};
  end
  endtask

  function isBitX;
    input bitval;
    begin
      isBitX = ( bitval===1'bx || bitval===1'bz ) ? 1'b1 : 1'b0;
    end
  endfunction


task loadmem;
	input [1000*8-1:0] filename;
	reg [BITS-1:0] memld [0:WORDS-1];
	integer i;
	reg [BITS-1:0] wordtemp;
	reg [11:0] Atemp;
  begin
	$readmemb(filename, memld);
     if (CEN_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  wordtemp = memld[i];
	  Atemp = i;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {32{1'b1}};
        row_mask =  ( {15'b000000000000000, writeEnable[31], 15'b000000000000000, writeEnable[30],
          15'b000000000000000, writeEnable[29], 15'b000000000000000, writeEnable[28],
          15'b000000000000000, writeEnable[27], 15'b000000000000000, writeEnable[26],
          15'b000000000000000, writeEnable[25], 15'b000000000000000, writeEnable[24],
          15'b000000000000000, writeEnable[23], 15'b000000000000000, writeEnable[22],
          15'b000000000000000, writeEnable[21], 15'b000000000000000, writeEnable[20],
          15'b000000000000000, writeEnable[19], 15'b000000000000000, writeEnable[18],
          15'b000000000000000, writeEnable[17], 15'b000000000000000, writeEnable[16],
          15'b000000000000000, writeEnable[15], 15'b000000000000000, writeEnable[14],
          15'b000000000000000, writeEnable[13], 15'b000000000000000, writeEnable[12],
          15'b000000000000000, writeEnable[11], 15'b000000000000000, writeEnable[10],
          15'b000000000000000, writeEnable[9], 15'b000000000000000, writeEnable[8],
          15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, wordtemp[31], 15'b000000000000000, wordtemp[30],
          15'b000000000000000, wordtemp[29], 15'b000000000000000, wordtemp[28], 15'b000000000000000, wordtemp[27],
          15'b000000000000000, wordtemp[26], 15'b000000000000000, wordtemp[25], 15'b000000000000000, wordtemp[24],
          15'b000000000000000, wordtemp[23], 15'b000000000000000, wordtemp[22], 15'b000000000000000, wordtemp[21],
          15'b000000000000000, wordtemp[20], 15'b000000000000000, wordtemp[19], 15'b000000000000000, wordtemp[18],
          15'b000000000000000, wordtemp[17], 15'b000000000000000, wordtemp[16], 15'b000000000000000, wordtemp[15],
          15'b000000000000000, wordtemp[14], 15'b000000000000000, wordtemp[13], 15'b000000000000000, wordtemp[12],
          15'b000000000000000, wordtemp[11], 15'b000000000000000, wordtemp[10], 15'b000000000000000, wordtemp[9],
          15'b000000000000000, wordtemp[8], 15'b000000000000000, wordtemp[7], 15'b000000000000000, wordtemp[6],
          15'b000000000000000, wordtemp[5], 15'b000000000000000, wordtemp[4], 15'b000000000000000, wordtemp[3],
          15'b000000000000000, wordtemp[2], 15'b000000000000000, wordtemp[1], 15'b000000000000000, wordtemp[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
  	end
    end
  end
  endtask

task dumpmem;
	input [1000*8-1:0] filename_dump;
	integer i, dump_file_desc;
	reg [BITS-1:0] wordtemp;
	reg [11:0] Atemp;
  begin
	dump_file_desc = $fopen(filename_dump);
     if (CEN_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  Atemp = i;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {32{1'b1}};
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[496], data_out[480], data_out[464], data_out[448], data_out[432],
          data_out[416], data_out[400], data_out[384], data_out[368], data_out[352],
          data_out[336], data_out[320], data_out[304], data_out[288], data_out[272],
          data_out[256], data_out[240], data_out[224], data_out[208], data_out[192],
          data_out[176], data_out[160], data_out[144], data_out[128], data_out[112],
          data_out[96], data_out[80], data_out[64], data_out[48], data_out[32], data_out[16],
          data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path_d = {shifted_readLatch0[31], shifted_readLatch0[30], shifted_readLatch0[29],
          shifted_readLatch0[28], shifted_readLatch0[27], shifted_readLatch0[26], shifted_readLatch0[25],
          shifted_readLatch0[24], shifted_readLatch0[23], shifted_readLatch0[22], shifted_readLatch0[21],
          shifted_readLatch0[20], shifted_readLatch0[19], shifted_readLatch0[18], shifted_readLatch0[17],
          shifted_readLatch0[16], shifted_readLatch0[15], shifted_readLatch0[14], shifted_readLatch0[13],
          shifted_readLatch0[12], shifted_readLatch0[11], shifted_readLatch0[10], shifted_readLatch0[9],
          shifted_readLatch0[8], shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
          shifted_readLatch0[4], shifted_readLatch0[3], shifted_readLatch0[2], shifted_readLatch0[1],
          shifted_readLatch0[0]};
   	$fdisplay(dump_file_desc, "%b", mem_path_d);
  end
  	end
    $fclose(dump_file_desc);
  end
  endtask

task loadaddr;
	input [11:0] load_addr;
	input [31:0] load_data;
	reg [BITS-1:0] wordtemp;
	reg [11:0] Atemp;
  begin
     if (CEN_ === 1'b1) begin
	  wordtemp = load_data;
	  Atemp = load_addr;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {32{1'b1}};
        row_mask =  ( {15'b000000000000000, writeEnable[31], 15'b000000000000000, writeEnable[30],
          15'b000000000000000, writeEnable[29], 15'b000000000000000, writeEnable[28],
          15'b000000000000000, writeEnable[27], 15'b000000000000000, writeEnable[26],
          15'b000000000000000, writeEnable[25], 15'b000000000000000, writeEnable[24],
          15'b000000000000000, writeEnable[23], 15'b000000000000000, writeEnable[22],
          15'b000000000000000, writeEnable[21], 15'b000000000000000, writeEnable[20],
          15'b000000000000000, writeEnable[19], 15'b000000000000000, writeEnable[18],
          15'b000000000000000, writeEnable[17], 15'b000000000000000, writeEnable[16],
          15'b000000000000000, writeEnable[15], 15'b000000000000000, writeEnable[14],
          15'b000000000000000, writeEnable[13], 15'b000000000000000, writeEnable[12],
          15'b000000000000000, writeEnable[11], 15'b000000000000000, writeEnable[10],
          15'b000000000000000, writeEnable[9], 15'b000000000000000, writeEnable[8],
          15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, wordtemp[31], 15'b000000000000000, wordtemp[30],
          15'b000000000000000, wordtemp[29], 15'b000000000000000, wordtemp[28], 15'b000000000000000, wordtemp[27],
          15'b000000000000000, wordtemp[26], 15'b000000000000000, wordtemp[25], 15'b000000000000000, wordtemp[24],
          15'b000000000000000, wordtemp[23], 15'b000000000000000, wordtemp[22], 15'b000000000000000, wordtemp[21],
          15'b000000000000000, wordtemp[20], 15'b000000000000000, wordtemp[19], 15'b000000000000000, wordtemp[18],
          15'b000000000000000, wordtemp[17], 15'b000000000000000, wordtemp[16], 15'b000000000000000, wordtemp[15],
          15'b000000000000000, wordtemp[14], 15'b000000000000000, wordtemp[13], 15'b000000000000000, wordtemp[12],
          15'b000000000000000, wordtemp[11], 15'b000000000000000, wordtemp[10], 15'b000000000000000, wordtemp[9],
          15'b000000000000000, wordtemp[8], 15'b000000000000000, wordtemp[7], 15'b000000000000000, wordtemp[6],
          15'b000000000000000, wordtemp[5], 15'b000000000000000, wordtemp[4], 15'b000000000000000, wordtemp[3],
          15'b000000000000000, wordtemp[2], 15'b000000000000000, wordtemp[1], 15'b000000000000000, wordtemp[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
  	end
  end
  endtask

task dumpaddr;
	output [31:0] dump_data;
	input [11:0] dump_addr;
	reg [BITS-1:0] wordtemp;
	reg [11:0] Atemp;
  begin
     if (CEN_ === 1'b1) begin
	  Atemp = dump_addr;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {32{1'b1}};
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[496], data_out[480], data_out[464], data_out[448], data_out[432],
          data_out[416], data_out[400], data_out[384], data_out[368], data_out[352],
          data_out[336], data_out[320], data_out[304], data_out[288], data_out[272],
          data_out[256], data_out[240], data_out[224], data_out[208], data_out[192],
          data_out[176], data_out[160], data_out[144], data_out[128], data_out[112],
          data_out[96], data_out[80], data_out[64], data_out[48], data_out[32], data_out[16],
          data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path_d = {shifted_readLatch0[31], shifted_readLatch0[30], shifted_readLatch0[29],
          shifted_readLatch0[28], shifted_readLatch0[27], shifted_readLatch0[26], shifted_readLatch0[25],
          shifted_readLatch0[24], shifted_readLatch0[23], shifted_readLatch0[22], shifted_readLatch0[21],
          shifted_readLatch0[20], shifted_readLatch0[19], shifted_readLatch0[18], shifted_readLatch0[17],
          shifted_readLatch0[16], shifted_readLatch0[15], shifted_readLatch0[14], shifted_readLatch0[13],
          shifted_readLatch0[12], shifted_readLatch0[11], shifted_readLatch0[10], shifted_readLatch0[9],
          shifted_readLatch0[8], shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
          shifted_readLatch0[4], shifted_readLatch0[3], shifted_readLatch0[2], shifted_readLatch0[1],
          shifted_readLatch0[0]};
   	dump_data = mem_path_d;
  	end
  end
  endtask


  task readWrite;
  begin
    if (WABL_int === 1'bx)
      begin
        D_int = {32{1'bx}};
        failedWrite(0);
      end
    if (^WABLM_int === 1'bx)
      begin
        D_int = {32{1'bx}};
        failedWrite(0);
      end
    if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_int === 1'b0 && CEN_int === 1'b0) begin
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{(EMA_int), (EMAW_int), (EMAS_int)} === 1'bx) begin
  if(isBitX(EMAS_int)) begin 
        XQ = 1'b1; Q_update = 1'b1;
  end
  if(isBitX(EMAW_int)) begin 
      failedWrite(0);
  end
  if(isBitX(EMA_int)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
  end
    end else if (^{CEN_int, (STOV_int && !CEN_int), RET1N_int, WABL_int, WABLM_int} === 1'bx) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if ((A_int >= WORDS) && (CEN_int === 1'b0)) begin
        XQ = GWEN_int !== 1'b1 ? 1'b0 : 1'b1; Q_update = GWEN_int !== 1'b1 ? 1'b0 : 1'b1;
    end else if (CEN_int === 1'b0 && (^A_int) === 1'bx) begin
      if (GWEN_int !== 1'b1)
        failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (CEN_int === 1'b0) begin
      mux_address = (A_int & 4'b1111);
      row_address = (A_int >> 4);
      if (row_address > 255)
        row = {512{1'bx}};
      else
        row = mem[row_address];
        writeEnable = ~ {32{GWEN_int}};
      if (GWEN_int !== 1'b1) begin
        row_mask =  ( {15'b000000000000000, writeEnable[31], 15'b000000000000000, writeEnable[30],
          15'b000000000000000, writeEnable[29], 15'b000000000000000, writeEnable[28],
          15'b000000000000000, writeEnable[27], 15'b000000000000000, writeEnable[26],
          15'b000000000000000, writeEnable[25], 15'b000000000000000, writeEnable[24],
          15'b000000000000000, writeEnable[23], 15'b000000000000000, writeEnable[22],
          15'b000000000000000, writeEnable[21], 15'b000000000000000, writeEnable[20],
          15'b000000000000000, writeEnable[19], 15'b000000000000000, writeEnable[18],
          15'b000000000000000, writeEnable[17], 15'b000000000000000, writeEnable[16],
          15'b000000000000000, writeEnable[15], 15'b000000000000000, writeEnable[14],
          15'b000000000000000, writeEnable[13], 15'b000000000000000, writeEnable[12],
          15'b000000000000000, writeEnable[11], 15'b000000000000000, writeEnable[10],
          15'b000000000000000, writeEnable[9], 15'b000000000000000, writeEnable[8],
          15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, D_int[31], 15'b000000000000000, D_int[30],
          15'b000000000000000, D_int[29], 15'b000000000000000, D_int[28], 15'b000000000000000, D_int[27],
          15'b000000000000000, D_int[26], 15'b000000000000000, D_int[25], 15'b000000000000000, D_int[24],
          15'b000000000000000, D_int[23], 15'b000000000000000, D_int[22], 15'b000000000000000, D_int[21],
          15'b000000000000000, D_int[20], 15'b000000000000000, D_int[19], 15'b000000000000000, D_int[18],
          15'b000000000000000, D_int[17], 15'b000000000000000, D_int[16], 15'b000000000000000, D_int[15],
          15'b000000000000000, D_int[14], 15'b000000000000000, D_int[13], 15'b000000000000000, D_int[12],
          15'b000000000000000, D_int[11], 15'b000000000000000, D_int[10], 15'b000000000000000, D_int[9],
          15'b000000000000000, D_int[8], 15'b000000000000000, D_int[7], 15'b000000000000000, D_int[6],
          15'b000000000000000, D_int[5], 15'b000000000000000, D_int[4], 15'b000000000000000, D_int[3],
          15'b000000000000000, D_int[2], 15'b000000000000000, D_int[1], 15'b000000000000000, D_int[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
      end else begin
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[496], data_out[480], data_out[464], data_out[448], data_out[432],
          data_out[416], data_out[400], data_out[384], data_out[368], data_out[352],
          data_out[336], data_out[320], data_out[304], data_out[288], data_out[272],
          data_out[256], data_out[240], data_out[224], data_out[208], data_out[192],
          data_out[176], data_out[160], data_out[144], data_out[128], data_out[112],
          data_out[96], data_out[80], data_out[64], data_out[48], data_out[32], data_out[16],
          data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path = {shifted_readLatch0[31], shifted_readLatch0[30], shifted_readLatch0[29],
          shifted_readLatch0[28], shifted_readLatch0[27], shifted_readLatch0[26], shifted_readLatch0[25],
          shifted_readLatch0[24], shifted_readLatch0[23], shifted_readLatch0[22], shifted_readLatch0[21],
          shifted_readLatch0[20], shifted_readLatch0[19], shifted_readLatch0[18], shifted_readLatch0[17],
          shifted_readLatch0[16], shifted_readLatch0[15], shifted_readLatch0[14], shifted_readLatch0[13],
          shifted_readLatch0[12], shifted_readLatch0[11], shifted_readLatch0[10], shifted_readLatch0[9],
          shifted_readLatch0[8], shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
          shifted_readLatch0[4], shifted_readLatch0[3], shifted_readLatch0[2], shifted_readLatch0[1],
          shifted_readLatch0[0]};
        	XQ = 1'b0; Q_update = 1'b1;
      end
    if (WABL_int === 1'bx) begin
        XQ = 1'b1; Q_update = 1'b1;
    end
    if (^WABLM_int === 1'bx) begin
        XQ = 1'b1; Q_update = 1'b1;
    end
      if( isBitX(GWEN_int) )  begin
        XQ = 1'b1; Q_update = 1'b1;
      end
    end
  end
  endtask
  always @ (CEN_ or CLK_) begin
  	if(CLK_ == 1'b0) begin
  		CEN_p2 = CEN_;
  	end
  end

`ifdef POWER_PINS
  always @ (VDDCE) begin
      if (VDDCE != 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDCE should be powered down after VDDPE, Illegal power down sequencing in %m at %0t", $time);
       end
        $display("In PowerDown Mode in %m at %0t", $time);
        failedWrite(0);
      end
      if (VDDCE == 1'b1) begin
       if (VDDPE == 1'b1) begin
        $display("VDDPE should be powered up after VDDCE in %m at %0t", $time);
        $display("Illegal power up sequencing in %m at %0t", $time);
       end
        failedWrite(0);
      end
  end
`endif
`ifdef POWER_PINS
  always @ (RET1N_ or VDDPE or VDDCE or VSSE) begin
`else     
  always @ RET1N_ begin
`endif
`ifdef POWER_PINS
    if (RET1N_ == 1'b1 && RET1N_int == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1 && pre_charge_st == 1'b1 && (CEN_ === 1'bx || CLK_ === 1'bx)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end
`else     
`endif
`ifdef POWER_PINS
`else     
      pre_charge_st = 0;
`endif
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_ === 1'b0 && CEN_p2 === 1'b0 ) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if (RET1N_ === 1'b1 && RET1N_int !== 1'bx && CEN_p2 === 1'b0 ) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end
`ifdef POWER_PINS
    if (RET1N_ == 1'b1 && VDDPE !== 1'b1) begin
        $display("Warning: Illegal value for VDDPE %b in %m at %0t", VDDPE, $time);
        failedWrite(0);
    end else if (RET1N_ == 1'b0 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st = 1;
    end else if (RET1N_ == 1'b0 && VDDPE == 1'b0) begin
      pre_charge_st = 0;
      if (VDDCE != 1'b1) begin
        failedWrite(0);
      end
`else     
    if (RET1N_ == 1'b0) begin
`endif
        XQ = 1'b1; Q_update = 1'b1;
      Q_int_delayed = {32{1'bx}};
      CEN_int = 1'bx;
      GWEN_int = 1'bx;
      A_int = {12{1'bx}};
      D_int = {32{1'bx}};
      STOV_int = 1'bx;
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      EMAS_int = 1'bx;
      RET1N_int = 1'bx;
      WABL_int = 1'bx;
      WABLM_int = {2{1'bx}};
`ifdef POWER_PINS
    end else if (RET1N_ == 1'b1 && VDDCE == 1'b1 && VDDPE == 1'b1) begin
      pre_charge_st = 0;
      XQ = 1'b0;
    end else begin
      pre_charge_st = 0;
`else     
    end else begin
`endif
				#0;
if ($realtime != 0)  XQ = 1'b1;
        Q_update = 1'b1;
      Q_int_delayed = {32{1'bx}};
      CEN_int = 1'bx;
      GWEN_int = 1'bx;
      A_int = {12{1'bx}};
      D_int = {32{1'bx}};
      STOV_int = 1'bx;
      EMA_int = {3{1'bx}};
      EMAW_int = {2{1'bx}};
      EMAS_int = 1'bx;
      RET1N_int = 1'bx;
      WABL_int = 1'bx;
      WABLM_int = {2{1'bx}};
    end
    #0;
    RET1N_int = RET1N_;
        Q_update = 1'b0;
  end


  always @ CLK_ begin
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
`endif
`ifdef POWER_PINS
  if (RET1N_ == 1'b0) begin
`else     
  if (RET1N_ == 1'b0) begin
`endif
      // no cycle in retention mode
`ifdef POWER_PINS
    end else if ((VDDCE === 1'bx || VDDCE === 1'bz)) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
  end else if (RET1N_ == 1'b1 && VDDPE !== 1'b1) begin
  end else if (VSSE !== 1'b0) begin
`endif
  end else begin
    if ((CLK_ === 1'bx || CLK_ === 1'bz) && RET1N_ !== 1'b0) begin
      failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else if ((CLK_ === 1'b1 || CLK_ === 1'b0) && LAST_CLK === 1'bx) begin
       D_sh_update = 1'b0;  XD_sh = 1'b0;
       XD_int = {32{1'b0}};
       XQ = 1'b0; Q_update = 1'b0; 
    end else if (CLK_ === 1'b1 && LAST_CLK === 1'b0) begin
      CEN_int = CEN_;
      STOV_int = STOV_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      EMAS_int = EMAS_;
      RET1N_int = RET1N_;
      WABL_int = WABL_;
      WABLM_int = WABLM_;
      if (CEN_int != 1'b1) begin
        GWEN_int = GWEN_;
        A_int = A_;
        D_int = D_;
      end
      clk0_int = 1'b0;
      CEN_int = CEN_;
      STOV_int = STOV_;
      EMA_int = EMA_;
      EMAW_int = EMAW_;
      EMAS_int = EMAS_;
      RET1N_int = RET1N_;
      WABL_int = WABL_;
      WABLM_int = WABLM_;
      if (CEN_int != 1'b1) begin
        GWEN_int = GWEN_;
        A_int = A_;
        D_int = D_;
      end
      clk0_int = 1'b0;
      if (CEN_int === 1'b0 && GWEN_int === 1'b1) 
         Q_int_delayed = {32{1'bx}};
    readWrite;
    end else if (CLK_ === 1'b0 && LAST_CLK === 1'b1) begin
      Q_int_delayed = Q_int;
      Q_update = 1'b0;
      D_sh_update = 1'b0;
      XQ = 1'b0;
       XD_int = {32{1'b0}};
    end
  end
    LAST_CLK = CLK_;
  end

  reg globalNotifier0;
  initial globalNotifier0 = 1'b0;

  always @ globalNotifier0 begin
    if ($realtime == 0) begin
    end else if (CEN_int === 1'bx || RET1N_int === 1'bx || (STOV_int && !CEN_int) === 1'bx || 
      WABLM_int[0] === 1'bx || WABLM_int[1] === 1'bx || WABL_int === 1'bx || clk0_int === 1'bx) begin
        XQ = 1'b1; Q_update = 1'b1;
    	 mem_path = {32{1'bx}};
      Q_int_delayed = {32{1'bx}};
      failedWrite(0);
    end else if (CEN_int === 1'b0 && (^A_int) === 1'bx) begin
        failedWrite(0);
        XQ = 1'b1; Q_update = 1'b1;
    end else begin
      #0;
      readWrite;
   end
      #0;
        XQ = 1'b0; Q_update = 1'b0;
    globalNotifier0 = 1'b0;
  end

  assign D_int_bmux = D_;

  datapath_latch_sram_4096x32 uDQ0 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(1'b0), .D(D_int_bmux[0]), .DFTRAMBYP(1'b0), .mem_path(mem_path[0]), .XQ(XQ|XD_int[0]|1'b0), .Q(Q_int[0]));
  datapath_latch_sram_4096x32 uDQ1 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[0]), .D(D_int_bmux[1]), .DFTRAMBYP(1'b0), .mem_path(mem_path[1]), .XQ(XQ|XD_int[1]), .Q(Q_int[1]));
  datapath_latch_sram_4096x32 uDQ2 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[1]), .D(D_int_bmux[2]), .DFTRAMBYP(1'b0), .mem_path(mem_path[2]), .XQ(XQ|XD_int[2]), .Q(Q_int[2]));
  datapath_latch_sram_4096x32 uDQ3 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[2]), .D(D_int_bmux[3]), .DFTRAMBYP(1'b0), .mem_path(mem_path[3]), .XQ(XQ|XD_int[3]), .Q(Q_int[3]));
  datapath_latch_sram_4096x32 uDQ4 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[3]), .D(D_int_bmux[4]), .DFTRAMBYP(1'b0), .mem_path(mem_path[4]), .XQ(XQ|XD_int[4]), .Q(Q_int[4]));
  datapath_latch_sram_4096x32 uDQ5 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[4]), .D(D_int_bmux[5]), .DFTRAMBYP(1'b0), .mem_path(mem_path[5]), .XQ(XQ|XD_int[5]), .Q(Q_int[5]));
  datapath_latch_sram_4096x32 uDQ6 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[5]), .D(D_int_bmux[6]), .DFTRAMBYP(1'b0), .mem_path(mem_path[6]), .XQ(XQ|XD_int[6]), .Q(Q_int[6]));
  datapath_latch_sram_4096x32 uDQ7 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[6]), .D(D_int_bmux[7]), .DFTRAMBYP(1'b0), .mem_path(mem_path[7]), .XQ(XQ|XD_int[7]), .Q(Q_int[7]));
  datapath_latch_sram_4096x32 uDQ8 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[7]), .D(D_int_bmux[8]), .DFTRAMBYP(1'b0), .mem_path(mem_path[8]), .XQ(XQ|XD_int[8]), .Q(Q_int[8]));
  datapath_latch_sram_4096x32 uDQ9 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[8]), .D(D_int_bmux[9]), .DFTRAMBYP(1'b0), .mem_path(mem_path[9]), .XQ(XQ|XD_int[9]), .Q(Q_int[9]));
  datapath_latch_sram_4096x32 uDQ10 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[9]), .D(D_int_bmux[10]), .DFTRAMBYP(1'b0), .mem_path(mem_path[10]), .XQ(XQ|XD_int[10]), .Q(Q_int[10]));
  datapath_latch_sram_4096x32 uDQ11 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[10]), .D(D_int_bmux[11]), .DFTRAMBYP(1'b0), .mem_path(mem_path[11]), .XQ(XQ|XD_int[11]), .Q(Q_int[11]));
  datapath_latch_sram_4096x32 uDQ12 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[11]), .D(D_int_bmux[12]), .DFTRAMBYP(1'b0), .mem_path(mem_path[12]), .XQ(XQ|XD_int[12]), .Q(Q_int[12]));
  datapath_latch_sram_4096x32 uDQ13 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[12]), .D(D_int_bmux[13]), .DFTRAMBYP(1'b0), .mem_path(mem_path[13]), .XQ(XQ|XD_int[13]), .Q(Q_int[13]));
  datapath_latch_sram_4096x32 uDQ14 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[13]), .D(D_int_bmux[14]), .DFTRAMBYP(1'b0), .mem_path(mem_path[14]), .XQ(XQ|XD_int[14]), .Q(Q_int[14]));
  datapath_latch_sram_4096x32 uDQ15 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[14]), .D(D_int_bmux[15]), .DFTRAMBYP(1'b0), .mem_path(mem_path[15]), .XQ(XQ|XD_int[15]), .Q(Q_int[15]));
  datapath_latch_sram_4096x32 uDQ16 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[17]), .D(D_int_bmux[16]), .DFTRAMBYP(1'b0), .mem_path(mem_path[16]), .XQ(XQ|XD_int[16]), .Q(Q_int[16]));
  datapath_latch_sram_4096x32 uDQ17 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[18]), .D(D_int_bmux[17]), .DFTRAMBYP(1'b0), .mem_path(mem_path[17]), .XQ(XQ|XD_int[17]), .Q(Q_int[17]));
  datapath_latch_sram_4096x32 uDQ18 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[19]), .D(D_int_bmux[18]), .DFTRAMBYP(1'b0), .mem_path(mem_path[18]), .XQ(XQ|XD_int[18]), .Q(Q_int[18]));
  datapath_latch_sram_4096x32 uDQ19 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[20]), .D(D_int_bmux[19]), .DFTRAMBYP(1'b0), .mem_path(mem_path[19]), .XQ(XQ|XD_int[19]), .Q(Q_int[19]));
  datapath_latch_sram_4096x32 uDQ20 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[21]), .D(D_int_bmux[20]), .DFTRAMBYP(1'b0), .mem_path(mem_path[20]), .XQ(XQ|XD_int[20]), .Q(Q_int[20]));
  datapath_latch_sram_4096x32 uDQ21 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[22]), .D(D_int_bmux[21]), .DFTRAMBYP(1'b0), .mem_path(mem_path[21]), .XQ(XQ|XD_int[21]), .Q(Q_int[21]));
  datapath_latch_sram_4096x32 uDQ22 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[23]), .D(D_int_bmux[22]), .DFTRAMBYP(1'b0), .mem_path(mem_path[22]), .XQ(XQ|XD_int[22]), .Q(Q_int[22]));
  datapath_latch_sram_4096x32 uDQ23 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[24]), .D(D_int_bmux[23]), .DFTRAMBYP(1'b0), .mem_path(mem_path[23]), .XQ(XQ|XD_int[23]), .Q(Q_int[23]));
  datapath_latch_sram_4096x32 uDQ24 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[25]), .D(D_int_bmux[24]), .DFTRAMBYP(1'b0), .mem_path(mem_path[24]), .XQ(XQ|XD_int[24]), .Q(Q_int[24]));
  datapath_latch_sram_4096x32 uDQ25 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[26]), .D(D_int_bmux[25]), .DFTRAMBYP(1'b0), .mem_path(mem_path[25]), .XQ(XQ|XD_int[25]), .Q(Q_int[25]));
  datapath_latch_sram_4096x32 uDQ26 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[27]), .D(D_int_bmux[26]), .DFTRAMBYP(1'b0), .mem_path(mem_path[26]), .XQ(XQ|XD_int[26]), .Q(Q_int[26]));
  datapath_latch_sram_4096x32 uDQ27 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[28]), .D(D_int_bmux[27]), .DFTRAMBYP(1'b0), .mem_path(mem_path[27]), .XQ(XQ|XD_int[27]), .Q(Q_int[27]));
  datapath_latch_sram_4096x32 uDQ28 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[29]), .D(D_int_bmux[28]), .DFTRAMBYP(1'b0), .mem_path(mem_path[28]), .XQ(XQ|XD_int[28]), .Q(Q_int[28]));
  datapath_latch_sram_4096x32 uDQ29 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[30]), .D(D_int_bmux[29]), .DFTRAMBYP(1'b0), .mem_path(mem_path[29]), .XQ(XQ|XD_int[29]), .Q(Q_int[29]));
  datapath_latch_sram_4096x32 uDQ30 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[31]), .D(D_int_bmux[30]), .DFTRAMBYP(1'b0), .mem_path(mem_path[30]), .XQ(XQ|XD_int[30]), .Q(Q_int[30]));
  datapath_latch_sram_4096x32 uDQ31 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(1'b0), .D(D_int_bmux[31]), .DFTRAMBYP(1'b0), .mem_path(mem_path[31]), .XQ(XQ|XD_int[31]|1'b0), .Q(Q_int[31]));


// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
	always @ (VDDCE or VDDPE or VSSE) begin
		if (VDDCE === 1'bx || VDDCE === 1'bz) begin
			$display("Warning: Unknown value for VDDCE %b in %m at %0t", VDDCE, $time);
        XQ = 1'b1; Q_update = 1'b1;
			failedWrite(0);
			bad_VDDCE = 1'b1;
		end else begin
			bad_VDDCE = 1'b0;
		end
		if (RET1N_ == 1'b1 && VDDPE !== 1'b1) begin
			$display("Warning: Unknown value for VDDPE %b in %m at %0t", VDDPE, $time);
        XQ = 1'b1; Q_update = 1'b1;
			failedWrite(0);
			bad_VDDPE = 1'b1;
		end else begin
			bad_VDDPE = 1'b0;
		end
		if (VSSE !== 1'b0) begin
			$display("Warning: Unknown value for VSSE %b in %m at %0t", VSSE, $time);
        XQ = 1'b1; Q_update = 1'b1;
			failedWrite(0);
			bad_VSSE = 1'b1;
		end else begin
			bad_VSSE = 1'b0;
		end
		bad_power = bad_VDDCE | bad_VDDPE | bad_VSSE ;
	end
`endif

  always @ NOT_CEN begin
    CEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_GWEN begin
    GWEN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A11 begin
    A_int[11] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A10 begin
    A_int[10] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A9 begin
    A_int[9] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A8 begin
    A_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A7 begin
    A_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A6 begin
    A_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A5 begin
    A_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A4 begin
    A_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A3 begin
    A_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A2 begin
    A_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A1 begin
    A_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A0 begin
    A_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D31 begin
    D_int[31] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D30 begin
    D_int[30] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D29 begin
    D_int[29] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D28 begin
    D_int[28] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D27 begin
    D_int[27] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D26 begin
    D_int[26] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D25 begin
    D_int[25] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D24 begin
    D_int[24] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D23 begin
    D_int[23] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D22 begin
    D_int[22] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D21 begin
    D_int[21] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D20 begin
    D_int[20] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D19 begin
    D_int[19] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D18 begin
    D_int[18] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D17 begin
    D_int[17] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D16 begin
    D_int[16] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D15 begin
    D_int[15] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D14 begin
    D_int[14] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D13 begin
    D_int[13] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D12 begin
    D_int[12] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D11 begin
    D_int[11] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D10 begin
    D_int[10] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D9 begin
    D_int[9] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D8 begin
    D_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D7 begin
    D_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D6 begin
    D_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D5 begin
    D_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D4 begin
    D_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D3 begin
    D_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D2 begin
    D_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D1 begin
    D_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_D0 begin
    D_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_STOV begin
    STOV_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMA2 begin
    EMA_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMA1 begin
    EMA_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMA0 begin
    EMA_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAW1 begin
    EMAW_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAW0 begin
    EMAW_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAS begin
    EMAS_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_RET1N begin
    RET1N_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WABL begin
    WABL_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WABLM1 begin
    WABLM_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_WABLM0 begin
    WABLM_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end

  always @ NOT_CLK_PER begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLK_MINH begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLK_MINL begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end


  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1;
  wire STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1;

  wire STOVeq1aWABLeq1aRET1Neq1, STOVeq1aWABLeq0aRET1Neq1, STOVeq0aRET1Neq1aCENeq0;
  wire STOVeq1aRET1Neq1aCENeq0, RET1Neq1, RET1Neq1aCENeq0aGWENeq0, RET1Neq1aCENeq0;
  wire RET1Neq1aGWENeq0aCENeq0;

  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&!EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&!EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&!EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&!EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&!EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&!EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;
  assign STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1 = 
  !STOV&&!WABL&&RET1N&&EMA[2]&&EMA[1]&&EMA[0]&&EMAW[1]&&EMAW[0]&&EMAS;


  assign STOVeq1aWABLeq1aRET1Neq1 = STOV&&WABL&&RET1N;
  assign STOVeq1aWABLeq0aRET1Neq1 = STOV&&!WABL&&RET1N;
  assign STOVeq0aRET1Neq1aCENeq0 = !STOV&&RET1N&&!CEN;
  assign STOVeq1aRET1Neq1aCENeq0 = STOV&&RET1N&&!CEN;
  assign RET1Neq1aCENeq0aGWENeq0 = RET1N&&!CEN&&!GWEN;
  assign RET1Neq1aGWENeq0aCENeq0 = RET1N&&!GWEN&&!CEN;

  assign RET1Neq1 = RET1N;
  assign RET1Neq1aCENeq0 = RET1N&&!CEN;

  specify

    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b1 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b0 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b0 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b0)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[31] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[30] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[29] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[28] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[27] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[26] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[25] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[24] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[23] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[22] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[21] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[20] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[19] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[18] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[17] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[16] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[15] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[14] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[13] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[12] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[11] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[10] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[9] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[8] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[7] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[6] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[5] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[4] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[3] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[2] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[1] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);
    if (CEN == 1'b0 && RET1N == 1'b1 && GWEN == 1'b1 && WABL == 1'b0 && EMA[2] == 1'b1 && EMA[1] == 1'b1 && EMA[0] == 1'b1)
       (posedge CLK => (Q[0] : 1'b0)) = (`ARM_MEM_PROP, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP, `ARM_MEM_RETAIN, `ARM_MEM_PROP);


   // Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $period(posedge CLK, `ARM_MEM_PERIOD, NOT_CLK_PER);
   `else
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq1aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq0, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq0aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq0aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq0aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq0aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq0aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq0aWABLeq0aRET1Neq1aEMA2eq1aEMA1eq1aEMA0eq1aEMAW1eq1aEMAW0eq1aEMASeq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq1aWABLeq1aRET1Neq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
       $period(posedge CLK &&& STOVeq1aWABLeq0aRET1Neq1, `ARM_MEM_PERIOD, NOT_CLK_PER);
   `endif


   // Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $width(posedge CLK, `ARM_MEM_WIDTH, 0, NOT_CLK_MINH);
       $width(negedge CLK, `ARM_MEM_WIDTH, 0, NOT_CLK_MINL);
   `else
       $width(posedge CLK &&& STOVeq0aRET1Neq1aCENeq0, `ARM_MEM_WIDTH, 0, NOT_CLK_MINH);
       $width(posedge CLK &&& STOVeq1aRET1Neq1aCENeq0, `ARM_MEM_WIDTH, 0, NOT_CLK_MINH);
       $width(negedge CLK &&& STOVeq0aRET1Neq1aCENeq0, `ARM_MEM_WIDTH, 0, NOT_CLK_MINL);
       $width(negedge CLK &&& STOVeq1aRET1Neq1aCENeq0, `ARM_MEM_WIDTH, 0, NOT_CLK_MINL);
   `endif

    $setuphold(posedge CLK &&& RET1Neq1, posedge CEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_CEN);
    $setuphold(posedge CLK &&& RET1Neq1, negedge CEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_CEN);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge GWEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_GWEN);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge GWEN, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_GWEN);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A11);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A10);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A9);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A8);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A7);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A6);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A5);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A4);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A3);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A2);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A11);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A10);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A9);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A8);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A7);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A6);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A5);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A4);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A3);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A2);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D31);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D30);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D29);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D28);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D27);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D26);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D25);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D24);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D23);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D22);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D21);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D20);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D19);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D18);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D17);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D16);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D15);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D14);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D13);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D12);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D11);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D10);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D9);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D8);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D7);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D6);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D5);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D4);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D3);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D2);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[31], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D31);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[30], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D30);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[29], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D29);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[28], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D28);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[27], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D27);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[26], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D26);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[25], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D25);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[24], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D24);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[23], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D23);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[22], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D22);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[21], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D21);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[20], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D20);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[19], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D19);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[18], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D18);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[17], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D17);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[16], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D16);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[15], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D15);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D14);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D13);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D12);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[11], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D11);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[10], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D10);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[9], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D9);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[8], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D8);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D7);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D6);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D5);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D4);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D3);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D2);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, negedge D[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge STOV, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_STOV);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge STOV, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_STOV);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA2);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMA[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA2);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMA[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMA[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMA0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMAW[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMAW[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMAW[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMAW[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAW0);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge EMAS, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAS);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge EMAS, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_EMAS);
    $setuphold(posedge CLK &&& RET1Neq1aGWENeq0aCENeq0, posedge WABL, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WABL);
    $setuphold(posedge CLK &&& RET1Neq1aGWENeq0aCENeq0, negedge WABL, `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WABL);
    $setuphold(posedge CLK &&& RET1Neq1aGWENeq0aCENeq0, posedge WABLM[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WABLM1);
    $setuphold(posedge CLK &&& RET1Neq1aGWENeq0aCENeq0, posedge WABLM[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WABLM0);
    $setuphold(posedge CLK &&& RET1Neq1aGWENeq0aCENeq0, negedge WABLM[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WABLM1);
    $setuphold(posedge CLK &&& RET1Neq1aGWENeq0aCENeq0, negedge WABLM[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_WABLM0);
    $setuphold(negedge RET1N, negedge CEN, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge RET1N, negedge CEN, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CEN, posedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
    $setuphold(posedge CEN, negedge RET1N, 0.000, `ARM_MEM_HOLD, NOT_RET1N);
  endspecify


endmodule
`endcelldefine
`endif
`endif
`timescale 1ns/1ps
module sram_4096x32_error_injection (Q_out, Q_in, CLK, A, CEN, WEN, GWEN);
   output [31:0] Q_out;
   input [31:0] Q_in;
   input CLK;
   input [11:0] A;
   input CEN;
   input WEN;
   input GWEN;
   parameter LEFT_RED_COLUMN_FAULT = 2'd1;
   parameter RIGHT_RED_COLUMN_FAULT = 2'd2;
   parameter NO_RED_FAULT = 2'd0;
   reg [31:0] Q_out;
   reg entry_found;
   reg list_complete;
   reg [21:0] fault_table [255:0];
   reg [21:0] fault_entry;
initial
begin
   `ifdef DUT
      `define pre_pend_path TB.DUT_inst.CHIP
   `else
       `define pre_pend_path TB.CHIP
   `endif
   `ifdef ARM_NONREPAIRABLE_FAULT
      `pre_pend_path.SMARCHCHKBVCD_LVISION_MBISTPG_ASSEMBLY_UNDER_TEST_INST.MEM0_MEM_INST.u1.add_fault(12'd3718,5'd6,2'd1,2'd0);
   `endif
end
   task add_fault;
   //This task injects fault in memory
      input [11:0] address;
      input [4:0] bitPlace;
      input [1:0] fault_type;
      input [1:0] red_fault;
 
      integer i;
      reg done;
   begin
      done = 1'b0;
      i = 0;
      while ((!done) && i < 255)
      begin
         fault_entry = fault_table[i];
         if (fault_entry[0] === 1'b0 || fault_entry[0] === 1'bx)
         begin
            fault_entry[0] = 1'b1;
            fault_entry[2:1] = red_fault;
            fault_entry[4:3] = fault_type;
            fault_entry[9:5] = bitPlace;
            fault_entry[21:10] = address;
            fault_table[i] = fault_entry;
            done = 1'b1;
         end
         i = i+1;
      end
   end
   endtask
//This task removes all fault entries injected by user
task remove_all_faults;
   integer i;
begin
   for (i = 0; i < 256; i=i+1)
   begin
      fault_entry = fault_table[i];
      fault_entry[0] = 1'b0;
      fault_table[i] = fault_entry;
   end
end
endtask
task bit_error;
// This task is used to inject error in memory and should be called
// only from current module.
//
// This task injects error depending upon fault type to particular bit
// of the output
   inout [31:0] q_int;
   input [1:0] fault_type;
   input [4:0] bitLoc;
begin
   if (fault_type === 2'd0)
      q_int[bitLoc] = 1'b0;
   else if (fault_type === 2'd1)
      q_int[bitLoc] = 1'b1;
   else
      q_int[bitLoc] = ~q_int[bitLoc];
end
endtask
task error_injection_on_output;
// This function goes through error injection table for every
// read cycle and corrupts Q output if fault for the particular
// address is present in fault table
//
// If fault is redundant column is detected, this task corrupts
// Q output in read cycle
//
// If fault is repaired using repair bus, this task does not
// courrpt Q output in read cycle
//
   output [31:0] Q_output;
   reg list_complete;
   integer i;
   reg [5:0] FRA_reg;
   reg [7:0] row_address;
   reg [3:0] column_address;
   reg [4:0] bitPlace;
   reg [1:0] fault_type;
   reg [1:0] red_fault;
   reg valid;
   reg [4:0] msb_bit_calc;
begin
   entry_found = 1'b0;
   list_complete = 1'b0;
   i = 0;
   Q_output = Q_in;
   while(!list_complete)
   begin
      fault_entry = fault_table[i];
      {row_address, column_address, bitPlace, fault_type, red_fault, valid} = fault_entry;
      FRA_reg = row_address/4;
      i = i + 1;
      if (valid == 1'b1)
      begin
         if (red_fault === NO_RED_FAULT)
         begin
            if (row_address == A[11:4] && column_address == A[3:0])
            begin
               if (bitPlace < 16)
                  bit_error(Q_output,fault_type, bitPlace);
               else if (bitPlace >= 16 )
                  bit_error(Q_output,fault_type, bitPlace);
            end
         end
      end
      else
         list_complete = 1'b1;
      end
   end
   endtask
   always @ (Q_in or CLK or A or CEN or WEN or GWEN)
   begin
   if (CEN === 1'b0 && &WEN === 1'b1 && GWEN === 1'b1)
      error_injection_on_output(Q_out);
   else
      Q_out = Q_in;
   end
endmodule
