// `timescale 1ns / 1ps


module LEB128_uint_decode(
            input [35:0] LEB128_in,
            output reg [31:0] uint32_out,
            output reg [2:0] byte_cnt,
            input LEB128_signed_decode
    );
    
    wire en1, en2, en3, en4;
    wire [6:0] dt [3:0]; //data from LEB128_in
    wire [3:0] dt_4;
    assign dt[0] = LEB128_in [6:0];
    assign dt[1] = LEB128_in [14:8];
    assign dt[2] = LEB128_in [22:16];
    assign dt[3] = LEB128_in [30:24];
    assign dt_4 = LEB128_in [35:32];

    assign en1 = LEB128_in[7];
    assign en2 = LEB128_in[15];
    assign en3 = LEB128_in[23];
    assign en4 = LEB128_in[31];
    
    always@(*) begin
        if(~LEB128_in[7]) begin
            uint32_out = (LEB128_in[6]&LEB128_signed_decode)? {{25{1'b1}},dt[0]} : {25'b0,dt[0]};
            byte_cnt = 1;
        end else begin
            if(~LEB128_in[15]) begin
                uint32_out = (LEB128_in[14]&LEB128_signed_decode)? {{18{1'b1}}, dt[1], dt[0]} : {18'b0, dt[1], dt[0]};
                byte_cnt = 2;
            end else begin
                if(~LEB128_in[23]) begin
                    uint32_out = (LEB128_in[22]&LEB128_signed_decode)? {{11{1'b1}}, dt[2], dt[1], dt[0]}:{11'b0, dt[2], dt[1], dt[0]};
                    byte_cnt = 3;
                end else begin
                    if(~LEB128_in[31]) begin
                        uint32_out = (LEB128_in[30]&LEB128_signed_decode)?{{4{1'b1}}, dt[3], dt[2], dt[1], dt[0]}:{4'b0, dt[3], dt[2], dt[1], dt[0]};
                        byte_cnt = 4;
                    end else begin
                        uint32_out = {dt_4, dt[3], dt[2], dt[1], dt[0]};
                        byte_cnt = 5;
                    end
                end
            end
        end
    end
    
endmodule
