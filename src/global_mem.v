// `timescale 1ns / 1ps
`include "src/wasm_defines.vh"
module global_mem #    //only one bram install all data
             (   parameter ADDR_WIDTH = `log2_bram_depth_in,
                 parameter DATA_WIDTH = `bram_in_width,
                 parameter      DEPTH = `bram_depth_in)
             (
                input clk,
                //read port
                input [ADDR_WIDTH-1:0] rd_addr,
                output reg [DATA_WIDTH-1:0] rd_data,
                //write port
                input we,     //wr_req_vld
                input [ADDR_WIDTH-1:0] wr_addr,
                input [DATA_WIDTH-1:0] wr_data
//                //debug
//                ,output  [DATA_WIDTH-1:0] bram_sample_0,                
//                output  [DATA_WIDTH-1:0] bram_sample_1              
                );

    (*ram_style="block"*)reg [DATA_WIDTH-1:0] bram [0:DEPTH-1];
//    assign bram_sample_0 = bram[0];
//    assign bram_sample_1 = bram[1];

    //read
    always@(*)
    begin
            rd_data <= bram[rd_addr];
    end
    
    //write
    always @(posedge clk)
    begin
        if(we)begin
            bram[wr_addr]<=wr_data;
        end
    end
endmodule

