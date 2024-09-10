`timescale 1ns / 1ps
`include "src/wasm_defines.vh"
module local_mem #    //only one bram install all data
             (   parameter ADDR_WIDTH = `log2_bram_depth_in,
                 parameter DATA_WIDTH = `bram_in_width,
                 parameter      DEPTH = `bram_depth_in)
             (
                input clk,
                //read port
                // input [ADDR_WIDTH-1:0] addr,
                input [31:0] addr,
                output reg [DATA_WIDTH-1:0] rd_data,
                //write port
                input we,     //wr_req_vld
                input [DATA_WIDTH-1:0] wr_data      
                );

    (*ram_style="block"*)reg [DATA_WIDTH-1:0] bram [0:DEPTH-1];
//    assign bram_sample_0 = bram[0];
//    assign bram_sample_1 = bram[1];
    initial begin
            bram[0] <= 32'd10;
            bram[1] <= 32'd6; 
    end

    //read
    always@(*)
    begin
            rd_data = bram[addr];
    end
    
    //write
    always @(posedge clk)
    begin
        if(we)begin
            bram[addr]<=wr_data;
        end
    end
endmodule

