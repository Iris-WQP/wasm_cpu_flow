// `timescale 1ns / 1ps
`include "src/wasm_defines.vh"

module InstrMemCtrl #  
             (   parameter ADDR_WIDTH = `instr_log2_bram_depth,
                 parameter DATA_WIDTH = `instr_bram_width,
                 parameter      DEPTH = `instr_bram_depth)
             (
                input clk,
                input rst_n,
                input shift_vld,
                input hlt,

                input [7:0] read_pointer_shift_minusone,
                output reg [`instr_read_width-1:0] rd_data,
                output reg rd_data_vld,

                //jump
                input jump_en,
                input [`instr_log2_bram_depth-1:0] jump_addr,
                
                output [ADDR_WIDTH-1:0] read_pointer_out,

                input [`instr_log2_bram_depth-1:0] read_specific_addr,
                output [`instr_bram_width-1:0] read_specific_data    
            );

    reg [ADDR_WIDTH-1:0] read_pointer;
    wire forward;
    // reg [DATA_WIDTH-1:0] bram [0:DEPTH-1];
    assign forward = (~hlt);
    assign read_specific_data = bram[read_specific_addr];
    assign read_pointer_out = (jump_en)?jump_addr:read_pointer;

    //read pointer change in the cycle when shift_vld is high
    always@(posedge clk or negedge rst_n) begin
        if(~rst_n) begin  
            read_pointer <= 0;
        end else begin
            if(shift_vld&forward)begin
                    read_pointer <= (jump_en)?(jump_addr + read_pointer_shift_minusone + 'b1):(read_pointer + {2'b0, read_pointer_shift_minusone} + 'b1);
            end
        end
    end

    // genvar i;
    // generate
    //     for(i=0;i<`read_window_size;i=i+1)
    //     begin: tp_rd
    //         always @(*) begin
    //             if(shift_vld)begin
    //                 rd_data[i*`instr_bram_width+:`instr_bram_width] = bram[read_pointer_out+i];    
    //                 rd_data_vld = 1'd1;          
    //             end else begin
    //                 rd_data = 'd0;
    //                 rd_data_vld = 1'd0;
    //             end                
    //         end
    //     end
    // endgenerate      

endmodule