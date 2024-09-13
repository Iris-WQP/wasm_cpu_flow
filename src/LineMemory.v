// `timescale 1ns / 1ps
`include "src/wasm_defines.vh"
module LineMemory #    //only one bram install all data
             (   parameter ADDR_WIDTH = `log2_bram_depth_in,
                 parameter DATA_WIDTH = `bram_in_width,
                 parameter      DEPTH = `bram_depth_in)
             (
                input clk,
                input [31:0] addr,
                //read port
                input re,
                output reg [DATA_WIDTH-1:0] rd_data,
                output reg rd_data_vld,
                //write port
                input we,     //wr_req_vld
                input [DATA_WIDTH-1:0] wr_data
                );


    // (*ram_style="block"*)
    reg [DATA_WIDTH-1:0] bram [DEPTH-1:0];
    //read
    always@(*)
    begin
        if(re)begin
            rd_data = bram[addr];
            rd_data_vld = 1;
        end
        else begin
            rd_data = 0;
            rd_data_vld = 0;
        end
    end
    //write
    always @(posedge clk)
    begin
        if(we)begin
            bram[addr]<=wr_data;
        end
    end
endmodule

