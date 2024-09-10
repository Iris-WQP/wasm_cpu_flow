`timescale 1ns / 1ps


module LEB128_uint32_decode(
            input [35:0] LEB128_in,
            output reg [31:0] uint32_out,
            output reg [2:0] byte_cnt
    );
    
    wire en1, en2, en3, en4;
    wire [6:0] dt [4:0]; //data from LEB128_in
    assign dt[0] = LEB128_in [6:0];
    assign dt[1] = LEB128_in [14:8];
    assign dt[2] = LEB128_in [22:16];
    assign dt[3] = LEB128_in [30:24];
    assign dt[4] = LEB128_in [35:32];

    assign en1 = LEB128_in[7];
    assign en2 = LEB128_in[15];
    assign en3 = LEB128_in[23];
    assign en4 = LEB128_in[31];
    
    always@(*) begin
        if(~LEB128_in[7]) begin
            uint32_out = {25'b0,dt[0]};
            byte_cnt = 1;
        end else begin
            if(~LEB128_in[15]) begin
                uint32_out = {18'b0, dt[1], dt[0]};
                byte_cnt = 2;
            end else begin
                if(~LEB128_in[23]) begin
                    uint32_out = {11'b0, dt[2], dt[1], dt[0]};
                    byte_cnt = 3;
                end else begin
                    if(~LEB128_in[31]) begin
                        uint32_out = {4'b0, dt[3], dt[2], dt[1], dt[0]};
                        byte_cnt = 4;
                    end else begin
                        uint32_out = {dt[4], dt[3], dt[2], dt[1], dt[0]};
                        byte_cnt = 5;
                    end
                end
            end
        end
    end
    
endmodule
