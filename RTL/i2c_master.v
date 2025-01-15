module i2c_master (clk, rstn, scl, sda,	isda, cont);
input	clk, rstn;
output	reg	scl, sda;
input	isda;
input	cont;

reg		wr_ph;
reg		start;
reg	[7:0]	dev_adr;
reg	[7:0]	reg_adr;
reg	[7:0]	reg_wdata;
reg	[7:0]	reg_rdata;
reg		next;

initial begin
wr_ph = 1'b0;
start = 1'b0;
reg_adr = 8'h0;
reg_wdata = 8'h0;
end

parameter S_IDLE = 4'h0,
	  S_STR  = 4'h1,
	  S_DEVA = 4'h2,
	  S_REGA = 4'h3,
	  S_WDAT = 4'h4,
	  S_RDAT = 4'h5,
	  S_RDATC= 4'h6,
	  S_STP  = 4'h7;
reg	[3:0]	i2c_cs, i2c_ns;
reg	[5:0]	bit_cnt;
reg	[3:0]	rec_bit;	// Received bit counter
reg		snd_dat;
reg		read_ph;	// 0 : Register address phase, 1 : data read back phase

always @(posedge clk or negedge rstn) begin
if (!rstn)	begin i2c_cs <= S_IDLE; scl <= 1'b1; sda <= 1'b1; bit_cnt <= 6'h0; read_ph <= 1'b0;	end
else begin
i2c_ns <= i2c_cs;
if (i2c_cs!=i2c_ns)	begin bit_cnt <= 6'h0; end
else	begin	bit_cnt <= bit_cnt + 6'h1;	end
next <= 1'b0;
case (i2c_cs)
S_IDLE : begin
	 sda <= 1'b1;	scl <= 1'b1;
	 if (start || read_ph) begin	i2c_cs <= S_STR; sda <= 1'b0; scl <= 1'b1; end
	end
S_STR  : begin
	if (bit_cnt==6'h1) begin i2c_cs <= S_DEVA; sda <= 1'b0; scl <= 1'b0; end
	end
S_DEVA : begin 
	if (bit_cnt==6'h23)	begin
	  if (wr_ph)	i2c_cs <= S_REGA;
	  else begin
	    if (read_ph) i2c_cs <= S_RDAT;
	    else	i2c_cs <= S_REGA;
	  end
	end
	if (bit_cnt[1:0]==2'b00)	sda <= snd_dat;	
	if (bit_cnt[1:0]==2'b01)	scl <= 1'b1;
	else if (bit_cnt[1:0]==2'b11)	scl <= 1'b0;
	end
S_REGA : begin 
	if (bit_cnt==6'h23) begin
	  if (wr_ph)		i2c_cs <= S_WDAT;
	  else	begin		i2c_cs <= S_STP; read_ph <= 1'b1;	end
	end
	if (bit_cnt[1:0]==2'b00)	sda <= snd_dat;	
	if (bit_cnt[1:0]==2'b01)	scl <= 1'b1;
	else if (bit_cnt[1:0]==2'b11)	scl <= 1'b0;
	end
S_WDAT : begin 
	if (bit_cnt==6'h1E) begin	i2c_cs <= S_STP;	end
	if (bit_cnt[1:0]==2'b00)	sda <= snd_dat;	
	if (bit_cnt[1:0]==2'b01)	scl <= 1'b1;
	else if (bit_cnt[1:0]==2'b11)	scl <= 1'b0;
	end
S_RDAT : begin 
	sda <= 1'b1;
	if (bit_cnt==6'h23) begin
	  if (cont)	i2c_cs <= S_RDATC;
	  else	begin	i2c_cs <= S_STP;	read_ph <= 1'b0;	end
	end
	if (bit_cnt[1:0]==2'b01)	scl <= 1'b1;
	else if (bit_cnt[1:0]==2'b11)	scl <= 1'b0;
	end
S_RDATC: begin
	i2c_cs <= S_RDAT;
	sda <= 1'b1;	scl <= 1'b0;
	end
S_STP	: begin
	scl <= 1'b1; sda <= 1'b0;
	if (bit_cnt==6'h0)	next <= 1'b1;
	if (bit_cnt[1:0]==2'b01) begin
	  sda <= 1'b1;
	  i2c_cs <= S_IDLE;	end
	end
endcase
end
end

always @(*)
case (i2c_cs)
S_DEVA : begin
        if (!bit_cnt[5]) begin
	  snd_dat = (bit_cnt[4:2]==3'h0) ? dev_adr[7] :
		(bit_cnt[4:2]==3'h1) ? dev_adr[6] :
		(bit_cnt[4:2]==3'h2) ? dev_adr[5] :
		(bit_cnt[4:2]==3'h3) ? dev_adr[4] :
		(bit_cnt[4:2]==3'h4) ? dev_adr[3] :
		(bit_cnt[4:2]==3'h5) ? dev_adr[2] :
		(bit_cnt[4:2]==3'h6) ? dev_adr[1] : !wr_ph && read_ph;
	end
	else begin snd_dat = 1'b1;	end
	end
S_REGA : begin
        if (!bit_cnt[5]) begin
	  snd_dat = (bit_cnt[4:2]==3'h0) ? reg_adr[7] :
		(bit_cnt[4:2]==3'h1) ? reg_adr[6] :
		(bit_cnt[4:2]==3'h2) ? reg_adr[5] :
		(bit_cnt[4:2]==3'h3) ? reg_adr[4] :
		(bit_cnt[4:2]==3'h4) ? reg_adr[3] :
		(bit_cnt[4:2]==3'h5) ? reg_adr[2] :
		(bit_cnt[4:2]==3'h6) ? reg_adr[1] : reg_adr[0];
	 end
	else begin snd_dat = 1'b1;	end
	end
S_WDAT : begin
        if (!bit_cnt[5]) begin
	  snd_dat = (bit_cnt[4:2]==3'h0) ? reg_wdata[7] :
		(bit_cnt[4:2]==3'h1) ? reg_wdata[6] :
		(bit_cnt[4:2]==3'h2) ? reg_wdata[5] :
		(bit_cnt[4:2]==3'h3) ? reg_wdata[4] :
		(bit_cnt[4:2]==3'h4) ? reg_wdata[3] :
		(bit_cnt[4:2]==3'h5) ? reg_wdata[2] :
		(bit_cnt[4:2]==3'h6) ? reg_wdata[1] : reg_wdata[0];
	 end
	else begin snd_dat = 1'b1;	end
	end
S_STP  : begin snd_dat = 1'b1;	end
endcase

always @(posedge scl) begin
if (i2c_cs==S_REGA)	rec_bit <= 4'h0;
else if (i2c_cs==S_RDAT) begin	rec_bit <= rec_bit + 4'h1; end
case (rec_bit)
4'h0 : reg_rdata[7] <= isda;
4'h1 : reg_rdata[6] <= isda;
4'h2 : reg_rdata[5] <= isda;
4'h3 : reg_rdata[4] <= isda;
4'h4 : reg_rdata[3] <= isda;
4'h5 : reg_rdata[2] <= isda;
4'h6 : reg_rdata[1] <= isda;
4'h7 : reg_rdata[0] <= isda;
endcase
end

task i2creg_write;
input	[6:0]	device_adr;
input	[7:0]	register_adr;
input	[7:0]	wr_data;
begin
wr_ph = 1'b1;
dev_adr[7:1] = device_adr;
reg_adr = register_adr;
reg_wdata = wr_data;
start = 1;
@(negedge scl);
start = 0;
@(posedge next);
#100;
end
endtask

task i2creg_read;
input	[6:0]	device_adr;
input	[7:0]	register_adr;
output	[7:0]	rd_data;
begin
wr_ph = 1'b0;
dev_adr[7:1] = device_adr;
reg_adr = register_adr;
start = 1;
@(negedge scl);
start = 0;
repeat(2) @(posedge next);
rd_data = reg_rdata;
#100;
end
endtask

endmodule
