module  ssram_sp_512x8  (
        output reg Q [7:0], 
        input CLK, 
        input CEN, 
        input GWEN, 
        input [8:0] A, 
        input [7:0] D,

        input STOV,
        input [2:0] EMA,
        input [1:0] EMAW,
        input EMAS,
        input WABL,
        input [1:0] WABLM,
        input RET1N       
        );   

    reg [7:0] mem [0:511];
    always @(posedge CLK) begin
        if(CEN) begin
            if(GWEN) begin
                Q <= mem[A];
            end
            else begin
                mem[A] <= D;
                Q <= 8'bXX;
            end
        end
    end


endmodule