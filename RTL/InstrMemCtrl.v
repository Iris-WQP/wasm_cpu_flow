// `timescale 1ns / 1ps
`include "RTL/wasm_defines.vh"
`include "RTL/sram_sp_32768x8.v"

module InstrMemCtrl #  
             (   parameter ADDR_WIDTH = `instr_log2_bram_depth,
                 parameter DATA_WIDTH = `instr_bram_width,
                 parameter      DEPTH = `instr_bram_depth)
             (
                input clk,
                input rst_n,
                input shift_vld, //shift vld = 0 之后的一个周期停
                input [7:0] EMA_EMAW,
                // input hlt,
                
                // input re,
                input [7:0] read_pointer_shift_minusone,
                output [`instr_read_width-1:0] rd_data_out,
                // //write port
                input wr_vld,     //wr_req_vld
                input [14:0] i_instr_mem_wr_addr,
                input [63:0] i_instr_mem_wr_data,

                //jump
                input jump_en,
                input [`instr_log2_bram_depth-1:0] jump_addr,
                output [ADDR_WIDTH-1:0] read_pointer_out,

                input [2:0] read_specific_addr,
                output [`instr_bram_width-1:0] read_specific_data   
            );

    reg [ADDR_WIDTH-1:0] read_pointer;
    wire [ADDR_WIDTH-1:0] next_read_pointer;
    reg [`instr_read_width-1:0] rd_data;
    reg Instr_Mem_working;
    assign read_specific_data = rd_data[8*read_specific_addr+:8];

    assign read_pointer_out = read_pointer;
    assign rd_data_out = rd_data;

    assign next_read_pointer =  (Instr_Mem_working)?
                                            ((shift_vld)? 
                                            ((jump_en)? jump_addr : (read_pointer + {2'b0, read_pointer_shift_minusone} + 'b1))
                                            : read_pointer)
                                            :'d0;
    

    //read pointer change in the cycle when shift_vld is high
    always@(posedge clk or negedge rst_n) begin
        if(~rst_n) begin  
            read_pointer <= 0;
        end else begin
            read_pointer <= next_read_pointer;
        end
    end

    //map virtual addr pointer to physic addr

    wire [2:0] col_addr;  //column addr 0~7
    wire [14:0] row_addr;  //row addr 0~511
    reg [2:0] reg_col_addr;
    wire [7:0] s_rdata [7:0];
    reg [14:0] s_raddr [7:0];
    reg [14:0] s_addr [7:0];
    reg [7:0] s_wdata [7:0];
    wire GWEN = ~wr_vld;
    assign row_addr = next_read_pointer/'d8;
    assign col_addr = next_read_pointer%'d8;

    always @(posedge clk) reg_col_addr <= col_addr;
    always @(posedge clk) Instr_Mem_working <= GWEN;

    integer j; 
    generate           
        always @(*) begin
            for(j=0;j<8;j=j+1)
            begin:tp_wt 
                s_addr[j] = wr_vld? i_instr_mem_wr_addr:s_raddr[j];
                s_wdata[j] = i_instr_mem_wr_data[j*8+:8];
            end 
        end 
    endgenerate 


    always @(*) begin
            case (reg_col_addr)
                3'd0:begin rd_data = {s_rdata[7],s_rdata[6],s_rdata[5],s_rdata[4],s_rdata[3],s_rdata[2],s_rdata[1],s_rdata[0]}; end
                3'd1:begin rd_data = {s_rdata[0],s_rdata[7],s_rdata[6],s_rdata[5],s_rdata[4],s_rdata[3],s_rdata[2],s_rdata[1]}; end
                3'd2:begin rd_data = {s_rdata[1],s_rdata[0],s_rdata[7],s_rdata[6],s_rdata[5],s_rdata[4],s_rdata[3],s_rdata[2]}; end
                3'd3:begin rd_data = {s_rdata[2],s_rdata[1],s_rdata[0],s_rdata[7],s_rdata[6],s_rdata[5],s_rdata[4],s_rdata[3]}; end
                3'd4:begin rd_data = {s_rdata[3],s_rdata[2],s_rdata[1],s_rdata[0],s_rdata[7],s_rdata[6],s_rdata[5],s_rdata[4]}; end
                3'd5:begin rd_data = {s_rdata[4],s_rdata[3],s_rdata[2],s_rdata[1],s_rdata[0],s_rdata[7],s_rdata[6],s_rdata[5]}; end
                3'd6:begin rd_data = {s_rdata[5],s_rdata[4],s_rdata[3],s_rdata[2],s_rdata[1],s_rdata[0],s_rdata[7],s_rdata[6]}; end
                3'd7:begin rd_data = {s_rdata[6],s_rdata[5],s_rdata[4],s_rdata[3],s_rdata[2],s_rdata[1],s_rdata[0],s_rdata[7]}; end
            endcase
            case(col_addr)
                3'd0: begin
                    s_raddr[0] = row_addr;
                    s_raddr[1] = row_addr;
                    s_raddr[2] = row_addr;
                    s_raddr[3] = row_addr;
                    s_raddr[4] = row_addr;
                    s_raddr[5] = row_addr;
                    s_raddr[6] = row_addr;
                    s_raddr[7] = row_addr;
                end
                3'd1: begin
                    s_raddr[0] = row_addr+'b1;
                    s_raddr[1] = row_addr;
                    s_raddr[2] = row_addr;
                    s_raddr[3] = row_addr;
                    s_raddr[4] = row_addr;
                    s_raddr[5] = row_addr;
                    s_raddr[6] = row_addr;
                    s_raddr[7] = row_addr;
                end                
                3'd2: begin
                    s_raddr[0] = row_addr+'b1;
                    s_raddr[1] = row_addr+'b1;
                    s_raddr[2] = row_addr;
                    s_raddr[3] = row_addr;
                    s_raddr[4] = row_addr;
                    s_raddr[5] = row_addr;
                    s_raddr[6] = row_addr;
                    s_raddr[7] = row_addr;
                end
                3'd3: begin
                    s_raddr[0] = row_addr+'b1;
                    s_raddr[1] = row_addr+'b1;
                    s_raddr[2] = row_addr+'b1;
                    s_raddr[3] = row_addr;
                    s_raddr[4] = row_addr;
                    s_raddr[5] = row_addr;
                    s_raddr[6] = row_addr;
                    s_raddr[7] = row_addr;
                end     
                3'd4: begin
                    s_raddr[0] = row_addr+'b1;
                    s_raddr[1] = row_addr+'b1;
                    s_raddr[2] = row_addr+'b1;
                    s_raddr[3] = row_addr+'b1;
                    s_raddr[4] = row_addr;
                    s_raddr[5] = row_addr;
                    s_raddr[6] = row_addr;
                    s_raddr[7] = row_addr;
                end
                3'd5: begin
                    s_raddr[0] = row_addr+'b1;
                    s_raddr[1] = row_addr+'b1;
                    s_raddr[2] = row_addr+'b1;
                    s_raddr[3] = row_addr+'b1;
                    s_raddr[4] = row_addr+'b1;
                    s_raddr[5] = row_addr;
                    s_raddr[6] = row_addr;
                    s_raddr[7] = row_addr;
                end
                3'd6: begin
                    s_raddr[0] = row_addr+'b1;
                    s_raddr[1] = row_addr+'b1;
                    s_raddr[2] = row_addr+'b1;
                    s_raddr[3] = row_addr+'b1;
                    s_raddr[4] = row_addr+'b1;
                    s_raddr[5] = row_addr+'b1;
                    s_raddr[6] = row_addr;
                    s_raddr[7] = row_addr;
                end
                3'd7: begin
                    s_raddr[0] = row_addr+'b1;
                    s_raddr[1] = row_addr+'b1;
                    s_raddr[2] = row_addr+'b1;
                    s_raddr[3] = row_addr+'b1;
                    s_raddr[4] = row_addr+'b1;
                    s_raddr[5] = row_addr+'b1;
                    s_raddr[6] = row_addr+'b1;
                    s_raddr[7] = row_addr;
                end
            endcase             
    end

    reg CEN; // low enable

    always@(posedge clk or negedge rst_n)begin
        if(~rst_n) CEN <= 1'b1;
        else CEN <= 1'b0;
    end

    sram_sp_32768x8 u_sram_sp_32768x8_0 (
        .Q(s_rdata[0]), 
        .CLK(clk), 
        .CEN(CEN), 
        .GWEN(GWEN), 
        .A(s_addr[0]), 
        .D(s_wdata[0]),
        .STOV(1'b0),
        .EMA(EMA_EMAW[6:4]),
        .EMAW(EMA_EMAW[1:0]),
        .EMAS(1'b0),
        .RET1N(1'b1)
        );    

    sram_sp_32768x8 u_sram_sp_32768x8_1 (
        .Q(s_rdata[1]), 
        .CLK(clk), 
        .CEN(CEN), 
        .GWEN(GWEN), 
        .A(s_addr[1]), 
        .D(s_wdata[1]),        
        .STOV(1'b0),
        .EMA(EMA_EMAW[6:4]),
        .EMAW(EMA_EMAW[1:0]),
        .EMAS(1'b0),
        .RET1N(1'b1));

    sram_sp_32768x8 u_sram_sp_32768x8_2 (
        .Q(s_rdata[2]), 
        .CLK(clk), 
        .CEN(CEN), 
        .GWEN(GWEN), 
        .A(s_addr[2]), 
        .D(s_wdata[2]),
        .STOV(1'b0),
        .EMA(EMA_EMAW[6:4]),
        .EMAW(EMA_EMAW[1:0]),
        .EMAS(1'b0),
        .RET1N(1'b1));

    sram_sp_32768x8 u_sram_sp_32768x8_3 (
        .Q(s_rdata[3]), 
        .CLK(clk), 
        .CEN(CEN), 
        .GWEN(GWEN), 
        .A(s_addr[3]), 
        .D(s_wdata[3]),
        .STOV(1'b0),
        .EMA(EMA_EMAW[6:4]),
        .EMAW(EMA_EMAW[1:0]),
        .EMAS(1'b0),
        .RET1N(1'b1));   

    sram_sp_32768x8 u_sram_sp_32768x8_4 (
        .Q(s_rdata[4]), 
        .CLK(clk), 
        .CEN(CEN), 
        .GWEN(GWEN), 
        .A(s_addr[4]), 
        .D(s_wdata[4]),
        .STOV(1'b0),
        .EMA(EMA_EMAW[6:4]),
        .EMAW(EMA_EMAW[1:0]),
        .EMAS(1'b0),
        .RET1N(1'b1)
        );          

    sram_sp_32768x8 u_sram_sp_32768x8_5 (
        .Q(s_rdata[5]), 
        .CLK(clk), 
        .CEN(CEN), 
        .GWEN(GWEN), 
        .A(s_addr[5]), 
        .D(s_wdata[5]),
        .STOV(1'b0),
        .EMA(EMA_EMAW[6:4]),
        .EMAW(EMA_EMAW[1:0]),
        .EMAS(1'b0),
        .RET1N(1'b1)      
        );          

    sram_sp_32768x8 u_sram_sp_32768x8_6 (
        .Q(s_rdata[6]), 
        .CLK(clk), 
        .CEN(CEN), 
        .GWEN(GWEN), 
        .A(s_addr[6]), 
        .D(s_wdata[6]),
        .STOV(1'b0),
        .EMA(EMA_EMAW[6:4]),
        .EMAW(EMA_EMAW[1:0]),
        .EMAS(1'b0),
        .RET1N(1'b1)       
        );          

    sram_sp_32768x8 u_sram_sp_32768x8_7 (
        .Q(s_rdata[7]), 
        .CLK(clk), 
        .CEN(CEN), 
        .GWEN(GWEN), 
        .A(s_addr[7]), 
        .D(s_wdata[7]),
        .STOV(1'b0),
        .EMA(EMA_EMAW[6:4]),
        .EMAW(EMA_EMAW[1:0]),
        .EMAS(1'b0),
        .RET1N(1'b1)    
        );         

endmodule 