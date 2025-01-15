`include "src/sram_sp512x32.v"
`define T 2 

module tb_sram();

    wire [31:0] Q;  // output data
    reg CLK;
    reg CEN;
    reg GWEN; // 0write 1read
    reg [8:0] A;
    reg [31:0] D;
    reg STOV; 
    reg [2:0] EMA; 
    reg [1:0] EMAW; 
    reg  EMAS;
    reg  RET1N;
    reg  WABL;
    reg [1:0] WABLM;
    
    always #(`T/2) CLK = ~CLK; // Generate clock signal  

    initial begin
        CLK = 1;
        CEN = 0;
        GWEN = 0;
        A = 0;
        D = 0;
        STOV = 0;
        EMA = 3'b011;    //extra margin adjustment, 011
        EMAW = 2'b01;   //01
        EMAS = 0;
        RET1N = 1;
        WABL = 0;
        WABLM = 0;

        #2 A = 9'd0; D = 32'd5;
        $display("Write 0x%x to address 0x%x", D, A);
        #2 A = 9'd1; D = 32'd6;
        $display("Write 0x%x to address 0x%x", D, A);
        #2 A = 9'd2; D = 32'd7;
        $display("Write 0x%x to address 0x%x", D, A);
        #2 GWEN = 1; A = 9'd0; 
        $display("Read data 0x%x at address 0x%x", Q, A);
        #2 GWEN = 1; A = 9'd2;
        $display("Read data 0x%x at address 0x%x", Q, A);
        #2 GWEN = 1; A = 9'd1;
        $display("Read data 0x%x at address 0x%x", Q, A);

        #2
         $finish;

    end

    initial
    begin
        $dumpfile("wave_sram.vcd");
        $dumpvars(0);
    end

 sram_sp512x32 u_sram_sp512x32 (Q, CLK, CEN, GWEN, A, D, STOV, EMA, EMAW, EMAS, RET1N, WABL, WABLM);


endmodule