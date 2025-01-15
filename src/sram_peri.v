 
 module sram_peri(
    input CLK,
    input rst_n,

    //write instruction channel
    input [7:0] read_pointer,  //start at 0

 );

    //for work_state
    parameter   instr_mem_in = 2'b00,
                working = 2'b01,
                pause = 2'b10,      //Reserved
                instr_finish = 2'b11;
 
    wire [63:0] Q;  //read output data
    reg CEN;
    reg GWEN; // 0write 1read
    reg [8:0] A;
    reg [63:0] D;
    reg STOV; 
    reg [2:0] EMA; 
    reg [1:0] EMAW; 
    reg  EMAS;
    reg  RET1N;
    reg  WABL;
    reg [1:0] WABLM;

    reg [127:0] instr_fifo;

    always @ (posedge CLK or negedge rst_n)begin
        if(~rst_n)begin
            CEN = 1'b0;
            GWEN = 1'b0;
            A = 9'b0;
            D = 64'b0;
            STOV = 0;
            EMA = 3'b011;    //extra margin adjustment, 011
            EMAW = 2'b01;   //01
            EMAS = 0;
            RET1N = 1;
            WABL = 0;
            WABLM = 0;
        end
    end
 
 sram_sp512x64 u_sram_sp512x64 (Q, CLK, CEN, GWEN, A, D, STOV, EMA, EMAW, EMAS, RET1N, WABL, WABLM);

 endmodule
