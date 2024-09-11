`timescale 1ns / 1ps
`include "src/wasm_defines.vh"

module InstrMemCtrl #  
             (   parameter ADDR_WIDTH = `instr_log2_bram_depth,
                 parameter DATA_WIDTH = `instr_bram_width,
                 parameter      DEPTH = `instr_bram_depth)
             (
                input clk,
                input rst_n,
                input  shift_vld,
                
                input re,
                input [`log_read_window_size:0] read_pointer_shift_minusone,
                output reg [`instr_read_width-1:0] rd_data,
                output reg rd_data_vld,
                //write port
                input we,     //wr_req_vld
                input [`log_write_window_size-1:0] write_pointer_shift_minusone,
                input [`instr_write_width-1:0] wr_data,
                
                //judge if finish instrs
                output instr_finish

        // //debug
        //         ,
        //         output reg [ADDR_WIDTH-1:0] read_pointer,
        //         output reg [ADDR_WIDTH-1:0] write_pointer
            //  ,output  [DATA_WIDTH-1:0] bram_sample_0,                
            //  output  [DATA_WIDTH-1:0] bram_sample_1        
                          );
        //debug
            //  assign bram_sample_0 = bram[0];
            //  assign bram_sample_1 = bram[1];
            //  assign bram_sample_254 = bram[254];
            //  assign bram_sample_255 = bram[255];


    reg working;
    wire forward;
//    (*ram_style="block"*)
    reg [DATA_WIDTH-1:0] bram [0:DEPTH-1];
    reg [ADDR_WIDTH-1:0] read_pointer; 
    reg [ADDR_WIDTH-1:0] write_pointer;
    assign instr_finish = (read_pointer == write_pointer);
    assign forward = working&(~instr_finish);
    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) working <= 1'b1;
        else if(instr_finish) working <= 1'b0;
    end

    //write pointer change in the cycle after we is high
    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin  
//            write_pointer <= 0;
              write_pointer <= 'd52;
        end else begin
            if(we)begin
                write_pointer <= write_pointer + write_pointer_shift_minusone + 1;
            end
        end
    end

    //read pointer change in the cycle when shift_vld is high
    always@(posedge clk or negedge rst_n) begin
        if(~rst_n) begin  
            read_pointer <= 0;
        end else begin
            if(shift_vld&forward)begin
                    read_pointer <= read_pointer + read_pointer_shift_minusone + 1;
            end
        end
    end

    genvar j;  
    generate       //generate write              
        for(j=0;j<`write_window_size;j=j+1)
        begin:tp_wt    
            always @(*) begin
                if(we)begin
                    bram[write_pointer+j] <= wr_data[j*`instr_bram_width+:`instr_bram_width];
                end
            end
        end                        
    endgenerate

    genvar i;
    generate
        for(i=0;i<`read_window_size;i=i+1)
        begin: tp_rd
            always @(*) begin
                if(re)begin
                    rd_data[i*`instr_bram_width+:`instr_bram_width] = bram[read_pointer+i];    
                    rd_data_vld = 1'd1;          
                end else begin
                    rd_data = 'd0;
                    rd_data_vld = 1'd0;
                end                
            end
        end
    endgenerate      

// always@(posedge clk or negedge rst_n) begin
//     if(~rst_n) begin
//         bram[0]  <= 8'h00;
//         bram[1]  <= 8'h61;
//         bram[2]  <= 8'h73;
//         bram[3]  <= 8'h6d;                           
//         bram[4]  <= 8'h01;
//         bram[5]  <= 8'h00;
//         bram[6]  <= 8'h00;
//         bram[7]  <= 8'h00;                           
//         bram[8]  <= 8'h01;                                  
//         bram[9]  <= 8'h07;                                  
//         bram[10] <= 8'h01;                                  
//         bram[11] <= 8'h60;                                  
//         bram[12] <= 8'h02;                                  
//         bram[13] <= 8'h7f;                                  
//         bram[14] <= 8'h7f;                                  
//         bram[15] <= 8'h01;                                  
//         bram[16] <= 8'h7f;                                  
//         bram[17] <= 8'h03;                                  
//         bram[18] <= 8'h02;                                  
//         bram[19] <= 8'h01;                                  
//         bram[20] <= 8'h00;                               
//         bram[21] <= 8'h0a;                                  
//         bram[22] <= 8'h11;                                  
//         bram[23] <= 8'h01;                                  
//         bram[24] <= 8'h0f;                                  
//         bram[25] <= 8'h00;                                  
//         bram[26] <= 8'h41;                                  
//         bram[27] <= 8'hdd;
//         bram[28] <= 8'h01;                                
//         bram[29] <= 8'h20;                                  
//         bram[30] <= 8'h01;                                  
//         bram[31] <= 8'h6b;                                  
//         bram[32] <= 8'h20;                                  
//         bram[33] <= 8'h00;                                  
//         bram[34] <= 8'h4f;                                  
//         bram[35] <= 8'h45;                                  
//         bram[36] <= 8'h41;                                  
//         bram[37] <= 8'h04;                                  
//         bram[38] <= 8'h72;                                  
//         bram[39] <= 8'h0b;                                  
//         bram[40] <= 8'h00;                                  
//         bram[41] <= 8'h0a;                                  
//         bram[42] <= 8'h04;                                  
//         bram[43] <= 8'h6e;
//         bram[44] <= 8'h61;
//         bram[45] <= 8'h6d;
//         bram[46] <= 8'h65;                       
//         bram[47] <= 8'h02;                                  
//         bram[48] <= 8'h03;                                  
//         bram[49] <= 8'h01;                                  
//         bram[50] <= 8'h00;                                  
//         bram[51] <= 8'h00;       
//     end
// end


endmodule


