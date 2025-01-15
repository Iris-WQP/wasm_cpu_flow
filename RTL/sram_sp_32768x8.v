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
//       Instance Name:              sram_sp_32768x8
//       Words:                      32768
//       Bits:                       8
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
//       Creation Date:  Fri Nov 15 15:45:43 2024
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

module datapath_latch_sram_sp_32768x8 (CLK,Q_update,D_update,SE,SI,D,DFTRAMBYP,mem_path,XQ,Q);
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
endmodule // datapath_latch_sram_sp_32768x8

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
module sram_sp_32768x8 (VDDCE, VDDPE, VSSE, Q, CLK, CEN, GWEN, A, D, STOV, EMA, EMAW,
    EMAS, RET1N, WABL, WABLM);
`else
module sram_sp_32768x8 (Q, CLK, CEN, GWEN, A, D, STOV, EMA, EMAW, EMAS, RET1N, WABL,
    WABLM);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 8;
  parameter WORDS = 32768;
  parameter MUX = 16;
  parameter MEM_WIDTH = 128; // redun block size 16, 64 on left, 64 on right
  parameter MEM_HEIGHT = 2048;
  parameter WP_SIZE = 8 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 1;
  parameter ROWS = 2048;

  output [7:0] Q;
  input  CLK;
  input  CEN;
  input  GWEN;
  input [14:0] A;
  input [7:0] D;
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
  reg [127:0] mem [0:2047];
  reg [127:0] row, row_t;
  reg LAST_CLK;
  reg [127:0] row_mask;
  reg [127:0] new_data;
  reg [127:0] data_out;
  reg [7:0] readLatch0;
  reg [7:0] shifted_readLatch0;
  wire [7:0] Q_int;
  reg [7:0] Q_int_delayed;
  reg XQ, Q_update;
  reg XD_sh, D_sh_update;
  wire [7:0] D_int_bmux;
  reg [7:0] mem_path;
  reg [7:0] mem_path_d;
  reg [7:0] writeEnable;
  reg clk0_int;

  wire [7:0] Q_;
 wire  CLK_;
  wire  CEN_;
  reg  CEN_int;
  reg  CEN_p2;
  wire  GWEN_;
  reg  GWEN_int;
  wire [14:0] A_;
  reg [14:0] A_int;
  wire [7:0] D_;
  reg [7:0] D_int;
  reg [7:0] XD_int;
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
  assign A_[12] = A[12];
  assign A_[13] = A[13];
  assign A_[14] = A[14];
  assign D_[0] = D[0];
  assign D_[1] = D[1];
  assign D_[2] = D[2];
  assign D_[3] = D[3];
  assign D_[4] = D[4];
  assign D_[5] = D[5];
  assign D_[6] = D[6];
  assign D_[7] = D[7];
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
     sram_sp_32768x8_error_injection u1(.CLK(CLK_), .Q_out(Q_), .A(A_int), .CEN(CEN_int), .GWEN(GWEN_int), .WEN(GWEN_int), .Q_in(Q_int));
  `else
  assign `ARM_UD_SEQ Q_ = (RET1N_ | pre_charge_st) & ~corrupt_power ? ((STOV_ ? (Q_int_delayed) : (Q_int))) : {8{1'bx}};
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
	reg [14:0] Atemp;
  begin
	$readmemb(filename, memld);
     if (CEN_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  wordtemp = memld[i];
	  Atemp = i;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {8{1'b1}};
        row_mask =  ( {15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, wordtemp[7], 15'b000000000000000, wordtemp[6],
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
	reg [14:0] Atemp;
  begin
	dump_file_desc = $fopen(filename_dump);
     if (CEN_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  Atemp = i;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {8{1'b1}};
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[112], data_out[96], data_out[80], data_out[64], data_out[48],
          data_out[32], data_out[16], data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path_d = {shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
          shifted_readLatch0[4], shifted_readLatch0[3], shifted_readLatch0[2], shifted_readLatch0[1],
          shifted_readLatch0[0]};
   	$fdisplay(dump_file_desc, "%b", mem_path_d);
  end
  	end
    $fclose(dump_file_desc);
  end
  endtask

task loadaddr;
	input [14:0] load_addr;
	input [7:0] load_data;
	reg [BITS-1:0] wordtemp;
	reg [14:0] Atemp;
  begin
     if (CEN_ === 1'b1) begin
	  wordtemp = load_data;
	  Atemp = load_addr;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {8{1'b1}};
        row_mask =  ( {15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, wordtemp[7], 15'b000000000000000, wordtemp[6],
          15'b000000000000000, wordtemp[5], 15'b000000000000000, wordtemp[4], 15'b000000000000000, wordtemp[3],
          15'b000000000000000, wordtemp[2], 15'b000000000000000, wordtemp[1], 15'b000000000000000, wordtemp[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
  	end
  end
  endtask

task dumpaddr;
	output [7:0] dump_data;
	input [14:0] dump_addr;
	reg [BITS-1:0] wordtemp;
	reg [14:0] Atemp;
  begin
     if (CEN_ === 1'b1) begin
	  Atemp = dump_addr;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {8{1'b1}};
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[112], data_out[96], data_out[80], data_out[64], data_out[48],
          data_out[32], data_out[16], data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path_d = {shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
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
        D_int = {8{1'bx}};
        failedWrite(0);
      end
    if (^WABLM_int === 1'bx)
      begin
        D_int = {8{1'bx}};
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
      if (row_address > 2047)
        row = {128{1'bx}};
      else
        row = mem[row_address];
        writeEnable = ~ {8{GWEN_int}};
      if (GWEN_int !== 1'b1) begin
        row_mask =  ( {15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, D_int[7], 15'b000000000000000, D_int[6],
          15'b000000000000000, D_int[5], 15'b000000000000000, D_int[4], 15'b000000000000000, D_int[3],
          15'b000000000000000, D_int[2], 15'b000000000000000, D_int[1], 15'b000000000000000, D_int[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
      end else begin
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[112], data_out[96], data_out[80], data_out[64], data_out[48],
          data_out[32], data_out[16], data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path = {shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
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
      Q_int_delayed = {8{1'bx}};
      CEN_int = 1'bx;
      GWEN_int = 1'bx;
      A_int = {15{1'bx}};
      D_int = {8{1'bx}};
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
      Q_int_delayed = {8{1'bx}};
      CEN_int = 1'bx;
      GWEN_int = 1'bx;
      A_int = {15{1'bx}};
      D_int = {8{1'bx}};
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
       XD_int = {8{1'b0}};
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
         Q_int_delayed = {8{1'bx}};
    readWrite;
    end else if (CLK_ === 1'b0 && LAST_CLK === 1'b1) begin
      Q_int_delayed = Q_int;
      Q_update = 1'b0;
      D_sh_update = 1'b0;
      XQ = 1'b0;
       XD_int = {8{1'b0}};
    end
  end
    LAST_CLK = CLK_;
  end

  assign D_int_bmux = D_;

  datapath_latch_sram_sp_32768x8 uDQ0 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(1'b0), .D(D_int_bmux[0]), .DFTRAMBYP(1'b0), .mem_path(mem_path[0]), .XQ(XQ|XD_int[0]|1'b0), .Q(Q_int[0]));
  datapath_latch_sram_sp_32768x8 uDQ1 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[0]), .D(D_int_bmux[1]), .DFTRAMBYP(1'b0), .mem_path(mem_path[1]), .XQ(XQ|XD_int[1]), .Q(Q_int[1]));
  datapath_latch_sram_sp_32768x8 uDQ2 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[1]), .D(D_int_bmux[2]), .DFTRAMBYP(1'b0), .mem_path(mem_path[2]), .XQ(XQ|XD_int[2]), .Q(Q_int[2]));
  datapath_latch_sram_sp_32768x8 uDQ3 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[2]), .D(D_int_bmux[3]), .DFTRAMBYP(1'b0), .mem_path(mem_path[3]), .XQ(XQ|XD_int[3]), .Q(Q_int[3]));
  datapath_latch_sram_sp_32768x8 uDQ4 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[5]), .D(D_int_bmux[4]), .DFTRAMBYP(1'b0), .mem_path(mem_path[4]), .XQ(XQ|XD_int[4]), .Q(Q_int[4]));
  datapath_latch_sram_sp_32768x8 uDQ5 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[6]), .D(D_int_bmux[5]), .DFTRAMBYP(1'b0), .mem_path(mem_path[5]), .XQ(XQ|XD_int[5]), .Q(Q_int[5]));
  datapath_latch_sram_sp_32768x8 uDQ6 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[7]), .D(D_int_bmux[6]), .DFTRAMBYP(1'b0), .mem_path(mem_path[6]), .XQ(XQ|XD_int[6]), .Q(Q_int[6]));
  datapath_latch_sram_sp_32768x8 uDQ7 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(1'b0), .D(D_int_bmux[7]), .DFTRAMBYP(1'b0), .mem_path(mem_path[7]), .XQ(XQ|XD_int[7]|1'b0), .Q(Q_int[7]));


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
module sram_sp_32768x8 (VDDCE, VDDPE, VSSE, Q, CLK, CEN, GWEN, A, D, STOV, EMA, EMAW,
    EMAS, RET1N, WABL, WABLM);
`else
module sram_sp_32768x8 (Q, CLK, CEN, GWEN, A, D, STOV, EMA, EMAW, EMAS, RET1N, WABL,
    WABLM);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 8;
  parameter WORDS = 32768;
  parameter MUX = 16;
  parameter MEM_WIDTH = 128; // redun block size 16, 64 on left, 64 on right
  parameter MEM_HEIGHT = 2048;
  parameter WP_SIZE = 8 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 1;
  parameter ROWS = 2048;

  output [7:0] Q;
  input  CLK;
  input  CEN;
  input  GWEN;
  input [14:0] A;
  input [7:0] D;
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
  reg [127:0] mem [0:2047];
  reg [127:0] row, row_t;
  reg LAST_CLK;
  reg [127:0] row_mask;
  reg [127:0] new_data;
  reg [127:0] data_out;
  reg [7:0] readLatch0;
  reg [7:0] shifted_readLatch0;
  wire [7:0] Q_int;
  reg [7:0] Q_int_delayed;
  reg XQ, Q_update;
  reg XD_sh, D_sh_update;
  wire [7:0] D_int_bmux;
  reg [7:0] mem_path;
  reg [7:0] mem_path_d;
  reg [7:0] writeEnable;

  reg NOT_CEN, NOT_GWEN, NOT_A14, NOT_A13, NOT_A12, NOT_A11, NOT_A10, NOT_A9, NOT_A8;
  reg NOT_A7, NOT_A6, NOT_A5, NOT_A4, NOT_A3, NOT_A2, NOT_A1, NOT_A0, NOT_D7, NOT_D6;
  reg NOT_D5, NOT_D4, NOT_D3, NOT_D2, NOT_D1, NOT_D0, NOT_STOV, NOT_EMA2, NOT_EMA1;
  reg NOT_EMA0, NOT_EMAW1, NOT_EMAW0, NOT_EMAS, NOT_RET1N, NOT_WABL, NOT_WABLM1, NOT_WABLM0;
  reg NOT_CLK_PER, NOT_CLK_MINH, NOT_CLK_MINL;
  reg clk0_int;

  wire [7:0] Q_;
 wire  CLK_;
 wire  dCLK;
  wire  CEN_;
 wire  dCEN;
  reg  CEN_int;
  reg  CEN_p2;
  wire  GWEN_;
 wire  dGWEN;
  reg  GWEN_int;
  wire [14:0] A_;
 wire [14:0] dA;
  reg [14:0] A_int;
  wire [7:0] D_;
 wire [7:0] dD;
  reg [7:0] D_int;
  reg [7:0] XD_int;
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
  buf B8(CLK_, dCLK);
  buf B9(CEN_, dCEN);
  buf B10(GWEN_, dGWEN);
  buf B11(A_[0],dA[0]);
  buf B12(A_[1],dA[1]);
  buf B13(A_[2],dA[2]);
  buf B14(A_[3],dA[3]);
  buf B15(A_[4],dA[4]);
  buf B16(A_[5],dA[5]);
  buf B17(A_[6],dA[6]);
  buf B18(A_[7],dA[7]);
  buf B19(A_[8],dA[8]);
  buf B20(A_[9],dA[9]);
  buf B21(A_[10],dA[10]);
  buf B22(A_[11],dA[11]);
  buf B23(A_[12],dA[12]);
  buf B24(A_[13],dA[13]);
  buf B25(A_[14],dA[14]);
  buf B26(D_[0],dD[0]);
  buf B27(D_[1],dD[1]);
  buf B28(D_[2],dD[2]);
  buf B29(D_[3],dD[3]);
  buf B30(D_[4],dD[4]);
  buf B31(D_[5],dD[5]);
  buf B32(D_[6],dD[6]);
  buf B33(D_[7],dD[7]);
  buf B34(STOV_, dSTOV);
  buf B35(EMA_[0],dEMA[0]);
  buf B36(EMA_[1],dEMA[1]);
  buf B37(EMA_[2],dEMA[2]);
  buf B38(EMAW_[0],dEMAW[0]);
  buf B39(EMAW_[1],dEMAW[1]);
  buf B40(EMAS_, dEMAS);
  buf B41(RET1N_, dRET1N);
  buf B42(WABL_, dWABL);
  buf B43(WABLM_[0],dWABLM[0]);
  buf B44(WABLM_[1],dWABLM[1]);

`ifdef POWER_PINS
  assign corrupt_power = bad_power;
`else
  assign corrupt_power = 1'b0;
`endif

  assign Q_ = (RET1N_ | pre_charge_st) & ~corrupt_power ? ((STOV_ ? (Q_int_delayed) : (Q_int))) : {8{1'bx}};

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
	reg [14:0] Atemp;
  begin
	$readmemb(filename, memld);
     if (CEN_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  wordtemp = memld[i];
	  Atemp = i;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {8{1'b1}};
        row_mask =  ( {15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, wordtemp[7], 15'b000000000000000, wordtemp[6],
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
	reg [14:0] Atemp;
  begin
	dump_file_desc = $fopen(filename_dump);
     if (CEN_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  Atemp = i;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {8{1'b1}};
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[112], data_out[96], data_out[80], data_out[64], data_out[48],
          data_out[32], data_out[16], data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path_d = {shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
          shifted_readLatch0[4], shifted_readLatch0[3], shifted_readLatch0[2], shifted_readLatch0[1],
          shifted_readLatch0[0]};
   	$fdisplay(dump_file_desc, "%b", mem_path_d);
  end
  	end
    $fclose(dump_file_desc);
  end
  endtask

task loadaddr;
	input [14:0] load_addr;
	input [7:0] load_data;
	reg [BITS-1:0] wordtemp;
	reg [14:0] Atemp;
  begin
     if (CEN_ === 1'b1) begin
	  wordtemp = load_data;
	  Atemp = load_addr;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {8{1'b1}};
        row_mask =  ( {15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, wordtemp[7], 15'b000000000000000, wordtemp[6],
          15'b000000000000000, wordtemp[5], 15'b000000000000000, wordtemp[4], 15'b000000000000000, wordtemp[3],
          15'b000000000000000, wordtemp[2], 15'b000000000000000, wordtemp[1], 15'b000000000000000, wordtemp[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
  	end
  end
  endtask

task dumpaddr;
	output [7:0] dump_data;
	input [14:0] dump_addr;
	reg [BITS-1:0] wordtemp;
	reg [14:0] Atemp;
  begin
     if (CEN_ === 1'b1) begin
	  Atemp = dump_addr;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {8{1'b1}};
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[112], data_out[96], data_out[80], data_out[64], data_out[48],
          data_out[32], data_out[16], data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path_d = {shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
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
        D_int = {8{1'bx}};
        failedWrite(0);
      end
    if (^WABLM_int === 1'bx)
      begin
        D_int = {8{1'bx}};
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
      if (row_address > 2047)
        row = {128{1'bx}};
      else
        row = mem[row_address];
        writeEnable = ~ {8{GWEN_int}};
      if (GWEN_int !== 1'b1) begin
        row_mask =  ( {15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, D_int[7], 15'b000000000000000, D_int[6],
          15'b000000000000000, D_int[5], 15'b000000000000000, D_int[4], 15'b000000000000000, D_int[3],
          15'b000000000000000, D_int[2], 15'b000000000000000, D_int[1], 15'b000000000000000, D_int[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
      end else begin
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[112], data_out[96], data_out[80], data_out[64], data_out[48],
          data_out[32], data_out[16], data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path = {shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
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
      Q_int_delayed = {8{1'bx}};
      CEN_int = 1'bx;
      GWEN_int = 1'bx;
      A_int = {15{1'bx}};
      D_int = {8{1'bx}};
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
      Q_int_delayed = {8{1'bx}};
      CEN_int = 1'bx;
      GWEN_int = 1'bx;
      A_int = {15{1'bx}};
      D_int = {8{1'bx}};
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
       XD_int = {8{1'b0}};
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
         Q_int_delayed = {8{1'bx}};
    readWrite;
    end else if (CLK_ === 1'b0 && LAST_CLK === 1'b1) begin
      Q_int_delayed = Q_int;
      Q_update = 1'b0;
      D_sh_update = 1'b0;
      XQ = 1'b0;
       XD_int = {8{1'b0}};
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
    	 mem_path = {8{1'bx}};
      Q_int_delayed = {8{1'bx}};
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

  datapath_latch_sram_sp_32768x8 uDQ0 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(1'b0), .D(D_int_bmux[0]), .DFTRAMBYP(1'b0), .mem_path(mem_path[0]), .XQ(XQ|XD_int[0]|1'b0), .Q(Q_int[0]));
  datapath_latch_sram_sp_32768x8 uDQ1 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[0]), .D(D_int_bmux[1]), .DFTRAMBYP(1'b0), .mem_path(mem_path[1]), .XQ(XQ|XD_int[1]), .Q(Q_int[1]));
  datapath_latch_sram_sp_32768x8 uDQ2 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[1]), .D(D_int_bmux[2]), .DFTRAMBYP(1'b0), .mem_path(mem_path[2]), .XQ(XQ|XD_int[2]), .Q(Q_int[2]));
  datapath_latch_sram_sp_32768x8 uDQ3 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[2]), .D(D_int_bmux[3]), .DFTRAMBYP(1'b0), .mem_path(mem_path[3]), .XQ(XQ|XD_int[3]), .Q(Q_int[3]));
  datapath_latch_sram_sp_32768x8 uDQ4 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[5]), .D(D_int_bmux[4]), .DFTRAMBYP(1'b0), .mem_path(mem_path[4]), .XQ(XQ|XD_int[4]), .Q(Q_int[4]));
  datapath_latch_sram_sp_32768x8 uDQ5 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[6]), .D(D_int_bmux[5]), .DFTRAMBYP(1'b0), .mem_path(mem_path[5]), .XQ(XQ|XD_int[5]), .Q(Q_int[5]));
  datapath_latch_sram_sp_32768x8 uDQ6 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[7]), .D(D_int_bmux[6]), .DFTRAMBYP(1'b0), .mem_path(mem_path[6]), .XQ(XQ|XD_int[6]), .Q(Q_int[6]));
  datapath_latch_sram_sp_32768x8 uDQ7 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(1'b0), .D(D_int_bmux[7]), .DFTRAMBYP(1'b0), .mem_path(mem_path[7]), .XQ(XQ|XD_int[7]|1'b0), .Q(Q_int[7]));


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
  always @ NOT_A14 begin
    A_int[14] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A13 begin
    A_int[13] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A12 begin
    A_int[12] = 1'bx;
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
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A14,,,dCLK,dA[14]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A13,,,dCLK,dA[13]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A12,,,dCLK,dA[12]);
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
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A14,,,dCLK,dA[14]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A13,,,dCLK,dA[13]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A12,,,dCLK,dA[12]);
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
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D7,,,dCLK,dD[7]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D6,,,dCLK,dD[6]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D5,,,dCLK,dD[5]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D4,,,dCLK,dD[4]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D3,,,dCLK,dD[3]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D2,,,dCLK,dD[2]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D1,,,dCLK,dD[1]);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D0,,,dCLK,dD[0]);
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
module sram_sp_32768x8 (VDDCE, VDDPE, VSSE, Q, CLK, CEN, GWEN, A, D, STOV, EMA, EMAW,
    EMAS, RET1N, WABL, WABLM);
`else
module sram_sp_32768x8 (Q, CLK, CEN, GWEN, A, D, STOV, EMA, EMAW, EMAS, RET1N, WABL,
    WABLM);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 8;
  parameter WORDS = 32768;
  parameter MUX = 16;
  parameter MEM_WIDTH = 128; // redun block size 16, 64 on left, 64 on right
  parameter MEM_HEIGHT = 2048;
  parameter WP_SIZE = 8 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 1;
  parameter ROWS = 2048;

  output [7:0] Q;
  input  CLK;
  input  CEN;
  input  GWEN;
  input [14:0] A;
  input [7:0] D;
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
  reg [127:0] mem [0:2047];
  reg [127:0] row, row_t;
  reg LAST_CLK;
  reg [127:0] row_mask;
  reg [127:0] new_data;
  reg [127:0] data_out;
  reg [7:0] readLatch0;
  reg [7:0] shifted_readLatch0;
  wire [7:0] Q_int;
  reg [7:0] Q_int_delayed;
  reg XQ, Q_update;
  reg XD_sh, D_sh_update;
  wire [7:0] D_int_bmux;
  reg [7:0] mem_path;
  reg [7:0] mem_path_d;
  reg [7:0] writeEnable;

  reg NOT_CEN, NOT_GWEN, NOT_A14, NOT_A13, NOT_A12, NOT_A11, NOT_A10, NOT_A9, NOT_A8;
  reg NOT_A7, NOT_A6, NOT_A5, NOT_A4, NOT_A3, NOT_A2, NOT_A1, NOT_A0, NOT_D7, NOT_D6;
  reg NOT_D5, NOT_D4, NOT_D3, NOT_D2, NOT_D1, NOT_D0, NOT_STOV, NOT_EMA2, NOT_EMA1;
  reg NOT_EMA0, NOT_EMAW1, NOT_EMAW0, NOT_EMAS, NOT_RET1N, NOT_WABL, NOT_WABLM1, NOT_WABLM0;
  reg NOT_CLK_PER, NOT_CLK_MINH, NOT_CLK_MINL;
  reg clk0_int;

  wire [7:0] Q_;
 wire  CLK_;
  wire  CEN_;
  reg  CEN_int;
  reg  CEN_p2;
  wire  GWEN_;
  reg  GWEN_int;
  wire [14:0] A_;
  reg [14:0] A_int;
  wire [7:0] D_;
  reg [7:0] D_int;
  reg [7:0] XD_int;
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

  buf B45(Q[0], Q_[0]);
  buf B46(Q[1], Q_[1]);
  buf B47(Q[2], Q_[2]);
  buf B48(Q[3], Q_[3]);
  buf B49(Q[4], Q_[4]);
  buf B50(Q[5], Q_[5]);
  buf B51(Q[6], Q_[6]);
  buf B52(Q[7], Q_[7]);
  buf B53(CLK_, CLK);
  buf B54(CEN_, CEN);
  buf B55(GWEN_, GWEN);
  buf B56(A_[0], A[0]);
  buf B57(A_[1], A[1]);
  buf B58(A_[2], A[2]);
  buf B59(A_[3], A[3]);
  buf B60(A_[4], A[4]);
  buf B61(A_[5], A[5]);
  buf B62(A_[6], A[6]);
  buf B63(A_[7], A[7]);
  buf B64(A_[8], A[8]);
  buf B65(A_[9], A[9]);
  buf B66(A_[10], A[10]);
  buf B67(A_[11], A[11]);
  buf B68(A_[12], A[12]);
  buf B69(A_[13], A[13]);
  buf B70(A_[14], A[14]);
  buf B71(D_[0], D[0]);
  buf B72(D_[1], D[1]);
  buf B73(D_[2], D[2]);
  buf B74(D_[3], D[3]);
  buf B75(D_[4], D[4]);
  buf B76(D_[5], D[5]);
  buf B77(D_[6], D[6]);
  buf B78(D_[7], D[7]);
  buf B79(STOV_, STOV);
  buf B80(EMA_[0], EMA[0]);
  buf B81(EMA_[1], EMA[1]);
  buf B82(EMA_[2], EMA[2]);
  buf B83(EMAW_[0], EMAW[0]);
  buf B84(EMAW_[1], EMAW[1]);
  buf B85(EMAS_, EMAS);
  buf B86(RET1N_, RET1N);
  buf B87(WABL_, WABL);
  buf B88(WABLM_[0], WABLM[0]);
  buf B89(WABLM_[1], WABLM[1]);

`ifdef POWER_PINS
  assign corrupt_power = bad_power;
`else
  assign corrupt_power = 1'b0;
`endif

   `ifdef ARM_FAULT_MODELING
     sram_sp_32768x8_error_injection u1(.CLK(CLK_), .Q_out(Q_), .A(A_int), .CEN(CEN_int), .GWEN(GWEN_int), .WEN(GWEN_int), .Q_in(Q_int));
  `else
  assign Q_ = (RET1N_ | pre_charge_st) & ~corrupt_power ? ((STOV_ ? (Q_int_delayed) : (Q_int))) : {8{1'bx}};
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
	reg [14:0] Atemp;
  begin
	$readmemb(filename, memld);
     if (CEN_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  wordtemp = memld[i];
	  Atemp = i;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {8{1'b1}};
        row_mask =  ( {15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, wordtemp[7], 15'b000000000000000, wordtemp[6],
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
	reg [14:0] Atemp;
  begin
	dump_file_desc = $fopen(filename_dump);
     if (CEN_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  Atemp = i;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {8{1'b1}};
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[112], data_out[96], data_out[80], data_out[64], data_out[48],
          data_out[32], data_out[16], data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path_d = {shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
          shifted_readLatch0[4], shifted_readLatch0[3], shifted_readLatch0[2], shifted_readLatch0[1],
          shifted_readLatch0[0]};
   	$fdisplay(dump_file_desc, "%b", mem_path_d);
  end
  	end
    $fclose(dump_file_desc);
  end
  endtask

task loadaddr;
	input [14:0] load_addr;
	input [7:0] load_data;
	reg [BITS-1:0] wordtemp;
	reg [14:0] Atemp;
  begin
     if (CEN_ === 1'b1) begin
	  wordtemp = load_data;
	  Atemp = load_addr;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {8{1'b1}};
        row_mask =  ( {15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, wordtemp[7], 15'b000000000000000, wordtemp[6],
          15'b000000000000000, wordtemp[5], 15'b000000000000000, wordtemp[4], 15'b000000000000000, wordtemp[3],
          15'b000000000000000, wordtemp[2], 15'b000000000000000, wordtemp[1], 15'b000000000000000, wordtemp[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
  	end
  end
  endtask

task dumpaddr;
	output [7:0] dump_data;
	input [14:0] dump_addr;
	reg [BITS-1:0] wordtemp;
	reg [14:0] Atemp;
  begin
     if (CEN_ === 1'b1) begin
	  Atemp = dump_addr;
	  mux_address = (Atemp & 4'b1111);
      row_address = (Atemp >> 4);
      row = mem[row_address];
        writeEnable = {8{1'b1}};
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[112], data_out[96], data_out[80], data_out[64], data_out[48],
          data_out[32], data_out[16], data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path_d = {shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
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
        D_int = {8{1'bx}};
        failedWrite(0);
      end
    if (^WABLM_int === 1'bx)
      begin
        D_int = {8{1'bx}};
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
      if (row_address > 2047)
        row = {128{1'bx}};
      else
        row = mem[row_address];
        writeEnable = ~ {8{GWEN_int}};
      if (GWEN_int !== 1'b1) begin
        row_mask =  ( {15'b000000000000000, writeEnable[7], 15'b000000000000000, writeEnable[6],
          15'b000000000000000, writeEnable[5], 15'b000000000000000, writeEnable[4],
          15'b000000000000000, writeEnable[3], 15'b000000000000000, writeEnable[2],
          15'b000000000000000, writeEnable[1], 15'b000000000000000, writeEnable[0]} << mux_address);
        new_data =  ( {15'b000000000000000, D_int[7], 15'b000000000000000, D_int[6],
          15'b000000000000000, D_int[5], 15'b000000000000000, D_int[4], 15'b000000000000000, D_int[3],
          15'b000000000000000, D_int[2], 15'b000000000000000, D_int[1], 15'b000000000000000, D_int[0]} << mux_address);
        row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
        mem[row_address] = row;
      end else begin
        data_out = (row >> (mux_address));
        readLatch0 = {data_out[112], data_out[96], data_out[80], data_out[64], data_out[48],
          data_out[32], data_out[16], data_out[0]};
        shifted_readLatch0 = readLatch0;
        mem_path = {shifted_readLatch0[7], shifted_readLatch0[6], shifted_readLatch0[5],
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
      Q_int_delayed = {8{1'bx}};
      CEN_int = 1'bx;
      GWEN_int = 1'bx;
      A_int = {15{1'bx}};
      D_int = {8{1'bx}};
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
      Q_int_delayed = {8{1'bx}};
      CEN_int = 1'bx;
      GWEN_int = 1'bx;
      A_int = {15{1'bx}};
      D_int = {8{1'bx}};
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
       XD_int = {8{1'b0}};
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
         Q_int_delayed = {8{1'bx}};
    readWrite;
    end else if (CLK_ === 1'b0 && LAST_CLK === 1'b1) begin
      Q_int_delayed = Q_int;
      Q_update = 1'b0;
      D_sh_update = 1'b0;
      XQ = 1'b0;
       XD_int = {8{1'b0}};
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
    	 mem_path = {8{1'bx}};
      Q_int_delayed = {8{1'bx}};
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

  datapath_latch_sram_sp_32768x8 uDQ0 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(1'b0), .D(D_int_bmux[0]), .DFTRAMBYP(1'b0), .mem_path(mem_path[0]), .XQ(XQ|XD_int[0]|1'b0), .Q(Q_int[0]));
  datapath_latch_sram_sp_32768x8 uDQ1 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[0]), .D(D_int_bmux[1]), .DFTRAMBYP(1'b0), .mem_path(mem_path[1]), .XQ(XQ|XD_int[1]), .Q(Q_int[1]));
  datapath_latch_sram_sp_32768x8 uDQ2 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[1]), .D(D_int_bmux[2]), .DFTRAMBYP(1'b0), .mem_path(mem_path[2]), .XQ(XQ|XD_int[2]), .Q(Q_int[2]));
  datapath_latch_sram_sp_32768x8 uDQ3 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[2]), .D(D_int_bmux[3]), .DFTRAMBYP(1'b0), .mem_path(mem_path[3]), .XQ(XQ|XD_int[3]), .Q(Q_int[3]));
  datapath_latch_sram_sp_32768x8 uDQ4 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[5]), .D(D_int_bmux[4]), .DFTRAMBYP(1'b0), .mem_path(mem_path[4]), .XQ(XQ|XD_int[4]), .Q(Q_int[4]));
  datapath_latch_sram_sp_32768x8 uDQ5 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[6]), .D(D_int_bmux[5]), .DFTRAMBYP(1'b0), .mem_path(mem_path[5]), .XQ(XQ|XD_int[5]), .Q(Q_int[5]));
  datapath_latch_sram_sp_32768x8 uDQ6 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(Q_int[7]), .D(D_int_bmux[6]), .DFTRAMBYP(1'b0), .mem_path(mem_path[6]), .XQ(XQ|XD_int[6]), .Q(Q_int[6]));
  datapath_latch_sram_sp_32768x8 uDQ7 (.CLK(CLK), .Q_update(Q_update), .D_update(D_sh_update), .SE(1'b0), .SI(1'b0), .D(D_int_bmux[7]), .DFTRAMBYP(1'b0), .mem_path(mem_path[7]), .XQ(XQ|XD_int[7]|1'b0), .Q(Q_int[7]));


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
  always @ NOT_A14 begin
    A_int[14] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A13 begin
    A_int[13] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_A12 begin
    A_int[12] = 1'bx;
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
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A14);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A13);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, posedge A[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A12);
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
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[14], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A14);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[13], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A13);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0, negedge A[12], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_A12);
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
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[7], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D7);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[6], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D6);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[5], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D5);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[4], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D4);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[3], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D3);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[2], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D2);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[1], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D1);
    $setuphold(posedge CLK &&& RET1Neq1aCENeq0aGWENeq0, posedge D[0], `ARM_MEM_SETUP, `ARM_MEM_HOLD, NOT_D0);
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
module sram_sp_32768x8_error_injection (Q_out, Q_in, CLK, A, CEN, WEN, GWEN);
   output [7:0] Q_out;
   input [7:0] Q_in;
   input CLK;
   input [14:0] A;
   input CEN;
   input WEN;
   input GWEN;
   parameter LEFT_RED_COLUMN_FAULT = 2'd1;
   parameter RIGHT_RED_COLUMN_FAULT = 2'd2;
   parameter NO_RED_FAULT = 2'd0;
   reg [7:0] Q_out;
   reg entry_found;
   reg list_complete;
   reg [22:0] fault_table [2047:0];
   reg [22:0] fault_entry;
initial
begin
   `ifdef DUT
      `define pre_pend_path TB.DUT_inst.CHIP
   `else
       `define pre_pend_path TB.CHIP
   `endif
   `ifdef ARM_NONREPAIRABLE_FAULT
      `pre_pend_path.SMARCHCHKBVCD_LVISION_MBISTPG_ASSEMBLY_UNDER_TEST_INST.MEM0_MEM_INST.u1.add_fault(15'd7295,3'd6,2'd1,2'd0);
   `endif
end
   task add_fault;
   //This task injects fault in memory
      input [14:0] address;
      input [2:0] bitPlace;
      input [1:0] fault_type;
      input [1:0] red_fault;
 
      integer i;
      reg done;
   begin
      done = 1'b0;
      i = 0;
      while ((!done) && i < 2047)
      begin
         fault_entry = fault_table[i];
         if (fault_entry[0] === 1'b0 || fault_entry[0] === 1'bx)
         begin
            fault_entry[0] = 1'b1;
            fault_entry[2:1] = red_fault;
            fault_entry[4:3] = fault_type;
            fault_entry[7:5] = bitPlace;
            fault_entry[22:8] = address;
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
   for (i = 0; i < 2048; i=i+1)
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
   inout [7:0] q_int;
   input [1:0] fault_type;
   input [2:0] bitLoc;
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
   output [7:0] Q_output;
   reg list_complete;
   integer i;
   reg [8:0] FRA_reg;
   reg [10:0] row_address;
   reg [3:0] column_address;
   reg [2:0] bitPlace;
   reg [1:0] fault_type;
   reg [1:0] red_fault;
   reg valid;
   reg [2:0] msb_bit_calc;
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
            if (row_address == A[14:4] && column_address == A[3:0])
            begin
               if (bitPlace < 4)
                  bit_error(Q_output,fault_type, bitPlace);
               else if (bitPlace >= 4 )
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
