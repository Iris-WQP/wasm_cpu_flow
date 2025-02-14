`include "RTL/CtrlUnit.v"
`include "RTL/InstrMemCtrl.v"
`include "RTL/LineMemory.v"
`include "RTL/ALU.v"
`include "RTL/OperandStack.v"
`include "RTL/ControlStack.v"
`include "RTL/VS_MVM_TOP.v"
`include "RTL/wasm_defines.vh"
`include "RTL/i2c_slave.v"

module WASM_TOP(
    
        input i_clk,
        input i_rst_n,

        output reg [2:0] o_ERROR,
        output [1:0] o_work_state,

        //line memory read channel
        input i_line_mem_rd_rdy,    //or you can call it request
        // output o_line_mem_rd_vld,
        input [8:0] i_line_mem_rd_addr,
        output [31:0] o_line_mem_rd_data,

        //instruction memory write channel
        output reg o_instr_mem_wr_rdy,
        input i_instr_mem_wr_vld,
        input [14:0] i_instr_mem_wr_addr,
        input [63:0] i_instr_mem_wr_data,
        input i_instr_mem_wr_finish  //new
        
        ,    

        //debug signals
        input i_scl,
        input i_sda,
        output o_sda,
        input i_debug_ena

    );

    //top state control
    reg [1:0] top_state;
    wire instr_finish;
    wire operand_stack_exceed;
    wire operand_stack_empty_pop;
    wire ctrl_shift_vld;
    reg bubble;
    wire o_INSTR_ERROR;
    wire shift_vld;
    parameter   instr_mem_in = 2'b00,
                working = 2'b01,
                finish_executing = 2'b11;

    //ctrl unit
    wire [31:0] ALUResult;
    wire stack_empty;
    wire [`instr_read_width-1:0] Instr;
    wire Instr_vld;
    wire [7:0] read_pointer_shift_minusone;
    wire [3:0] pop_num;
    wire [1:0] push_select;
    wire [4:0] ALUControl;
    wire store_en;
    wire load_en;
    wire local_set;
    wire local_get;
    wire global_get;
    wire global_set;
    wire mvm_start;
    wire global_init;
    wire [31:0] global_cnt;
    wire [7:0]global_offset_13_8;
    wire [7:0]global_offset_7_0;
    wire [7:0]EMA_EMAW;
    wire [31:0] global_offset;
    wire [31:0] constant;
    wire [(`instr_log2_bram_depth-1):0] read_pointer;
    wire jump_en;
    wire [`instr_log2_bram_depth-1:0] jump_addr;

    //operand stack window
    wire [`st_width-1:0] A_pop_window;
    wire [`st_width-1:0] B_pop_window;    
    wire [`st_width-1:0] C_pop_window;

    //line memory
    wire [`bram_in_width-1:0] load_data;
    wire [`st_width-1:0] local_mem_data;

    //stack
    wire push_num_from_ctrl;
    wire push_num;
    reg [`st_width-1:0] push_data;
    wire [`pop_num_max*`st_width-1:0] pop_window;

    //control stack
    wire control_stack_left_one;   //judge if the module is about to finish
    wire function_call; //instruction is call, jump, call stack push
    wire end_instr; 
    wire true_end; //a function is finished, jump back, call stack pop
    wire operand_stack_tag_pop; //operand stack pop
    wire function_retu_num; //return parameter number, 0 or 1
    wire control_stack_push;
    reg [`call_stack_width-1:0] control_stack_push_data;
    wire [`call_stack_width-1:0] control_stack_top_data;
    wire [1:0] control_stack_top_type;
    wire [`st_log2_depth:0] operand_stack_top_pointer;
    wire [(`st_log2_depth-1):0] stack_pointer_tag;
    wire [(`st_log2_depth-1):0] stack_pointer_tag_block;
    wire [(`log_pa_re_num_max-1):0] function_para_num;
    wire [7:0] allocate_local_memory_size;
    wire [`st_log2_depth-1:0] function_stack_tag;
    wire [`st_log2_depth-1:0] control_stack_tag;
    wire read_control_endjump;    
    wire [`instr_log2_bram_depth-1:0] return_addr_tag;
    wire read_retu_num;
    wire [2:0] LEB128_byte_cnt;
    wire [`instr_log2_bram_depth-1:0] pre_calu_return_addr;
    wire block_instr;
    wire block_hold;
    wire loop_instr;
    wire loop_fault_end;
    wire if_instr;
    wire br_table_instr;
    wire return_instr;
    wire control_retu_num;
    wire [1:0] instr_pointer_state_out;
    //write, depends on instr write method, useless for now.
    wire  wr_req_vld = 0;   
    wire [`log_write_window_size-1:0] write_pointer_shift_minusone;
    wire [`instr_write_width-1:0] wr_data;

    //ALU operands 
    wire [`st_width-1:0] A_ALU;
    wire [`st_width-1:0] B_ALU;

    //branch table support
    wire [2:0] read_specific_addr;
    wire [2:0] br_table_offset;
    wire [`instr_bram_width-1:0] read_specific_data;
    assign br_table_offset = (A_pop_window < constant)? A_pop_window:constant;
    assign read_specific_addr = br_table_offset+3'd2;

    //debugs
    wire [7:0] debug_reg_14 = {function_call, block_instr, loop_instr, if_instr, return_instr, control_retu_num, instr_pointer_state_out};
    wire [7:0] debug_reg_15 = control_stack_push_data[7:0];
    wire [7:0] debug_reg_16 = control_stack_push_data[15:8];
    wire [7:0] debug_reg_17 = control_stack_push_data[23:16];
    wire [7:0] debug_reg_18 = {LEB128_byte_cnt, block_hold, read_control_endjump, control_stack_push_data[26:24]};
    wire [7:0] debug_reg_20 = {pop_num[1:0],push_num,control_stack_push,true_end,control_stack_top_data[26:24]};
    wire [7:0] debug_reg_21;

    //top state control
    always@(*)begin
        o_ERROR = {o_INSTR_ERROR, operand_stack_exceed, operand_stack_empty_pop};
    end
    assign ctrl_shift_vld = ~((load_en|store_en|global_get|global_set|global_init)&(~bubble));
    assign shift_vld = ctrl_shift_vld & (top_state == working) & (~i_debug_ena);
    assign o_work_state = top_state;

    always@(posedge i_clk or negedge i_rst_n) begin
        if(~i_rst_n) begin
            bubble <= 1'b0;
        end else begin
            if(bubble) bubble <= 1'b0;
            else if (load_en|store_en|global_get|global_set|global_init) bubble <= 1'b1;
        end
    end

    always@(posedge i_clk or negedge i_rst_n)begin
        if (~i_rst_n) begin
            top_state <= instr_mem_in;
            o_instr_mem_wr_rdy <= 1'b1;
        end else begin
            case(top_state)
                instr_mem_in:begin
                    if(i_instr_mem_wr_finish)begin
                        top_state <= working;
                        o_instr_mem_wr_rdy <= 1'b0;
                    end
                end
                working:begin
                    if(instr_finish)begin
                        top_state <= finish_executing;
                    end
                end
            endcase
        end
    end

    //global
    assign global_offset = {18'd0,global_offset_13_8[5:0], global_offset_7_0};

    //ALU operands 
    assign A_ALU = (store_en|load_en|local_set|local_get|global_get|global_set)? constant : (global_init? global_cnt:A_pop_window);    
    assign B_ALU = (global_get|global_set|global_init)?global_offset:(((local_set|local_get)? function_stack_tag:(load_en? A_pop_window:B_pop_window)));

    //control stack
    assign push_num = (end_instr&loop_fault_end)? 1'b0:push_num_from_ctrl;
    assign control_retu_num = (Instr[15:8]==8'h40)? 1'b0 : ((Instr[15:8]==8'h7f|Instr[15:8]==8'h7d)? 1'b1 : function_retu_num);
    assign control_stack_top_type = control_stack_top_data[`st_log2_depth+`instr_log2_bram_depth+2:`st_log2_depth+`instr_log2_bram_depth+1];
    assign control_stack_tag = control_stack_top_data[(`st_log2_depth+`instr_log2_bram_depth-1):`instr_log2_bram_depth];
    assign return_addr_tag = control_stack_top_data[`instr_log2_bram_depth-1:0];
    assign read_retu_num = control_stack_top_data[`st_log2_depth+`instr_log2_bram_depth];
    assign read_control_endjump = (control_stack_top_type==2'b01)|((control_stack_top_type==2'b11)&block_hold);
    assign loop_fault_end = ((control_stack_top_type==2'b11)&block_hold);
    assign true_end = end_instr&(~loop_fault_end);
    assign control_stack_push = function_call|block_instr|loop_instr|if_instr;
    assign stack_pointer_tag = operand_stack_top_pointer - function_para_num;
    assign stack_pointer_tag_block = (Instr[15:8]==8'h40|Instr[15:8]==8'h7f|Instr[15:8]==8'h7d) ? operand_stack_top_pointer : (operand_stack_top_pointer - function_para_num);
    always@(*)begin
        if(function_call)begin
            control_stack_push_data = {2'b01, function_retu_num, stack_pointer_tag, pre_calu_return_addr};
        end else if (block_instr)begin
            control_stack_push_data = {2'b00, control_retu_num, stack_pointer_tag_block, `instr_log2_bram_depth'd0};
        end else if (loop_instr)begin
            control_stack_push_data = {2'b11, control_retu_num, stack_pointer_tag_block, (read_pointer+`instr_log2_bram_depth'd2)};
        end else if (if_instr)begin
            control_stack_push_data = {2'b10, control_retu_num, {stack_pointer_tag_block-`st_log2_depth'd1}, `instr_log2_bram_depth'd0};
        end else begin
            control_stack_push_data = 'd0;
        end
    end

    always@(*)begin
        case({(end_instr|return_instr), push_select})
            3'b100: push_data = A_pop_window;
            3'b001: push_data = load_data;//for line memory or global memory
            3'b010: push_data = constant;
            3'b011: push_data = local_mem_data;//for local memory
            default: push_data = ALUResult;  //3'b000
        endcase
    end
    
    ControlStack u_control_stack(
        .clk(i_clk),
        .rst_n(i_rst_n),
        .shift_vld(shift_vld),
        .push(control_stack_push),
        .pop(true_end),
        .retu(return_instr),
        .function_call(function_call),
        .function_stack_tag(function_stack_tag),
        .push_data(control_stack_push_data),
        .top_data(control_stack_top_data),
        .control_stack_left_one(control_stack_left_one)
    );
    
    CtrlUnit u_ctrl_unit (
        .clk(i_clk),
        .rst_n(i_rst_n),
        .cu_working(shift_vld),
        .read_pointer(read_pointer),
        .Instr(Instr),
        // .Instr_vld(Instr_vld),
        .read_pointer_shift_minusone(read_pointer_shift_minusone),
        // .ctrl_shift_vld(ctrl_shift_vld),
        .INSTR_ERROR(o_INSTR_ERROR),
        .jump_en_out(jump_en),
        .jump_addr(jump_addr),
        .push_num_out(push_num_from_ctrl),
        .pop_num_out(pop_num),
        .push_select(push_select),
        .ALUControl(ALUControl),
        .ALUResult_0(ALUResult[0]),
        .store_en(store_en),
        .load_en(load_en),
        .global_set(global_set),
        .global_get(global_get),
        .global_init(global_init),
        .global_cnt(global_cnt),
        .local_set(local_set),
        .local_get(local_get),
        .mvm_start(mvm_start),
        .constant(constant),
        .instr_finish(instr_finish),
        .return_addr_tag(return_addr_tag),
        .control_stack_left_one(control_stack_left_one),
        .function_call(function_call),
        .block_instr(block_instr),
        .loop_instr(loop_instr),
        .if_instr(if_instr),
        .br_table_instr(br_table_instr),
        .end_instr(end_instr),
        .return_instr(return_instr),
        .operand_stack_tag_pop(operand_stack_tag_pop),
        .read_retu_num(read_retu_num),
        .read_control_endjump(read_control_endjump),
        .function_retu_num(function_retu_num),
        .function_para_num(function_para_num),
        .allocate_local_memory_size(allocate_local_memory_size),
        .LEB128_byte_cnt(LEB128_byte_cnt),
        .pre_calu_return_addr(pre_calu_return_addr),
        .br_table_depth(read_specific_data),
        .instr_pointer_state_out (instr_pointer_state_out),
        .block_hold(block_hold),
        .section_type_out(debug_reg_21)
    );


InstrMemCtrl #
             (   .ADDR_WIDTH (`instr_log2_bram_depth),
                 .DATA_WIDTH (`instr_bram_width),
                 .DEPTH (`instr_bram_depth))
                 u_instr_mem_ctrl
             (
                .clk(i_clk),
                .rst_n(i_rst_n),
                .EMA_EMAW(EMA_EMAW),
                .shift_vld(shift_vld),
                .read_pointer_shift_minusone(read_pointer_shift_minusone),
                .rd_data_out(Instr),
                // //write port
                .wr_vld(i_instr_mem_wr_vld&o_instr_mem_wr_rdy),     //wr_req_vld
                .i_instr_mem_wr_addr(i_instr_mem_wr_addr),
                .i_instr_mem_wr_data(i_instr_mem_wr_data),
                //jump
                .jump_en(jump_en),
                .jump_addr(jump_addr),
                .read_pointer_out(read_pointer),
                //read specific addr
                .read_specific_addr(read_specific_addr),
                .read_specific_data(read_specific_data)
                // .instr_finish(instr_finish)
        // //debug
        //         ,
        //         .read_pointer(read_pointer),
        //         .write_pointer(write_pointer)
                );      


    ALU u_alu(
        .A(A_ALU),
        .B(B_ALU),
        .C(C_pop_window),
        .ALUControl(ALUControl),
        .ALUResult(ALUResult)
    );      

    OperandStack u_operand_stack (
        .clk(i_clk),
        .rst_n(i_rst_n),
        .shift_vld(shift_vld),
        .push_num(push_num),
        .push_data(push_data),
        .pop_num(pop_num),
        .stack_exceed_push(operand_stack_exceed),
        .stack_exceed_pop(operand_stack_empty_pop),
        .pop_window_A(A_pop_window),
        .pop_window_B(B_pop_window),
        .pop_window_C(C_pop_window),
        .call(function_call),
        .retu(operand_stack_tag_pop),
        .function_stack_tag(control_stack_tag),
        .w_top_pointer(operand_stack_top_pointer),
        .allocate_local_memory_size(allocate_local_memory_size),

        .l_addr(ALUResult[`st_log2_depth:0]),
        .local_set(local_set),
        // .local_set_data(A_pop_window),
        .local_get_data(local_mem_data)
    );

    wire line_memory_read_en = ((load_en|global_get)&(top_state==working))|(i_line_mem_rd_rdy&(top_state==finish_executing));
    wire line_memory_write_en = ((store_en|global_set|global_init)&(top_state==working));
    wire [13:0] line_memory_addr = (top_state==working)? ((load_en|store_en)? ALUResult[15:2]:ALUResult[13:0]) : {5'b11111, i_line_mem_rd_addr};
    wire [31:0] line_memory_write_data = global_init? constant : A_pop_window;
    assign o_line_mem_rd_data = (top_state==finish_executing)?load_data:'d0;

    LineMemory u_line_memory (
        .clk(i_clk),
        .addr(line_memory_addr),
        .EMA_EMAW(EMA_EMAW),
        .en((line_memory_read_en|line_memory_write_en)),
        .rdata(load_data),
        .we(line_memory_write_en&(top_state==working)&(~i_debug_ena)),
        .wdata(line_memory_write_data)
    );


    wire [`log2_S-1:0]shift;
    wire [`log2_Height_max-1:0]height;
    wire [`log2_Width_max-`log2_Tin-1:0]Win_div_Tin;
    wire [`log2_Width_max-`log2_Tin-1:0]Wout_div_Tout;
    wire [`MAX_DW*`Tin-1:0] i_feature_slice;
    wire i_feature_vld;
    wire [`MAX_DW*`Tin-1:0] i_weight_slice;
    wire i_weight_vld;
    wire [`MAX_DW*`Tout-1:0] vs_out;
    wire vs_out_vld;
    wire loop_height_done;

    assign shift = A_pop_window[28:24];
    assign height = A_pop_window[9:0];
    assign Win_div_Tin = A_pop_window[16:10];
    assign Wout_div_Tout = A_pop_window[23:17];
    

    VS_MVM_TOP u_MVM_TOP
    (
        .clk(i_clk), 
        .rst_n(i_rst_n),
        
        //32bit configuration from stack
        .shift(shift),
        .height(height),
        .Win_div_Tin(Win_div_Tin),
        .Wout_div_Tout(Wout_div_Tout),

        .i_dat(i_feature_slice), 
        .dat_vld(i_feature_vld),

        .i_wt(i_weight_slice),
        .wt_vld(i_weight_vld),

        .dat_out(vs_out),
        .dat_out_vld(vs_out_vld),
        .loop_height_done(loop_height_done)
    );


/*------------------------------------------------i2c------------------------------------------------*/
    
    i2c_slave i2cx	(
        .clk(i_clk)
        ,.rstn(i_rst_n)
        ,.I_DEV_ADR(7'h6C)
        ,.isda(i_sda)
        ,.osda(o_sda)
        ,.isck(i_scl)
        ,.reg00d ()
        ,.reg01d ()
        ,.reg02d ()
        ,.reg03d ()
        ,.reg04d ()
        ,.reg05d ()
        ,.reg06d ()
        ,.reg07d ()
        ,.reg08d ()
        ,.reg09d ()
        ,.reg0Ad ()
        ,.reg0Bd ()
        ,.reg0Cd ()
        ,.reg0Dd ()
        ,.reg0Ed ()
        ,.reg0Fd ()
        ,.reg10d ()
        ,.reg11d ()
        ,.reg12d ()
        ,.reg13d ()
        ,.reg14d ()
        ,.reg15d ()
        ,.reg16d ()
        ,.reg17d ()
        ,.reg18d ()
        ,.reg19d ()
        ,.reg1Ad ()
        ,.reg1Bd ()
        ,.reg1Cd ()
        ,.reg1Dd ()
        ,.reg1Ed ()
        ,.reg1Fd ()
        ,.reg20d ()
        ,.reg21d ()
        ,.reg22d ()
        ,.reg23d ()
        ,.reg24d ()
        ,.reg25d ()
        ,.reg26d ()
        ,.reg27d ()
        ,.reg28d ()
        ,.reg29d ()
        ,.reg2Ad ()
        ,.reg2Bd ()
        ,.reg2Cd ()
        ,.reg2Dd ()
        ,.reg2Ed ()
        ,.reg2Fd ()
        ,.reg30d (global_offset_13_8)//global_offset[13:8]	
        ,.reg31d (global_offset_7_0)//global_offset[7:0]
        ,.reg32d (EMA_EMAW)
        ,.reg33d ()
        ,.reg34d ()
        ,.reg35d ()
        ,.reg36d ()
        ,.reg37d ()
        ,.reg38d ()
        ,.reg39d ()
        ,.reg3Ad ()
        ,.reg3Bd ()
        ,.reg3Cd ()
        ,.reg3Dd ()
        ,.reg3Ed ()
        ,.reg3Fd ()
        ,.reg40d ()
        ,.reg41d ()
        ,.reg42d ()
        ,.reg43d ()
        ,.reg44d ()
        ,.reg45d ()
        ,.reg46d ()
        ,.reg47d ()
        ,.reg48d ()
        ,.reg49d ()
        ,.reg4Ad ()
        ,.reg4Bd ()
        ,.reg4Cd ()
        ,.reg4Dd ()
        ,.reg4Ed ()
        ,.reg4Fd ()
        ,.reg50d ()
        ,.reg51d ()
        ,.reg52d ()
        ,.reg53d ()
        ,.reg54d ()
        ,.reg55d ()
        ,.reg56d ()
        ,.reg57d ()
        ,.reg58d ()
        ,.reg59d ()
        ,.reg5Ad ()
        ,.reg5Bd ()
        ,.reg5Cd ()
        ,.reg5Dd ()
        ,.reg5Ed ()
        ,.reg5Fd ()
        ,.reg60d ()
        ,.reg61d ()
        ,.reg62d ()
        ,.reg63d ()
        ,.reg64d ()
        ,.reg65d ()
        ,.reg66d ()
        ,.reg67d ()
        ,.reg68d ()
        ,.reg69d ()
        ,.reg6Ad ()
        ,.reg6Bd ()
        ,.reg6Cd ()
        ,.reg6Dd ()
        ,.reg6Ed ()
        ,.reg6Fd ()
        ,.reg70d ()
        ,.reg71d ()
        ,.reg72d ()
        ,.reg73d ()
        ,.reg74d ()
        ,.reg75d ()
        ,.reg76d ()
        ,.reg77d ()
        ,.reg78d ()
        ,.reg79d ()
        ,.reg7Ad ()
        ,.reg7Bd ()
        ,.reg7Cd ()
        ,.reg7Dd ()
        ,.reg7Ed ()
        ,.reg7Fd ()
        ,.reg80d ()
        ,.reg81d ()
        ,.reg82d ()
        ,.reg83d ()
        ,.reg84d ()
        ,.reg85d ()
        ,.reg86d ()
        ,.reg87d ()
        ,.reg88d ()
        ,.reg89d ()
        ,.reg8Ad ()
        ,.reg8Bd ()
        ,.reg8Cd ()
        ,.reg8Dd ()
        ,.reg8Ed ()
        ,.reg8Fd ()
        ,.reg90d ()
        ,.reg91d ()
        ,.reg92d ()
        ,.reg93d ()
        ,.reg94d ()
        ,.reg95d ()
        ,.reg96d ()
        ,.reg97d ()
        ,.reg98d ()
        ,.reg99d ()
        ,.reg9Ad ()
        ,.reg9Bd ()
        ,.reg9Cd ()
        ,.reg9Dd ()
        ,.reg9Ed ()
        ,.reg9Fd ()
        ,.regA0d ()
        ,.regA1d ()
        ,.regA2d ()
        ,.regA3d ()
        ,.regA4d ()
        ,.regA5d ()
        ,.regA6d ()
        ,.regA7d ()
        ,.regA8d ()
        ,.regA9d ()
        ,.regAAd ()
        ,.regABd ()
        ,.regACd ()
        ,.regADd ()
        ,.regAEd ()
        ,.regAFd ()
        ,.regB0d ()
        ,.regB1d ()
        ,.regB2d ()
        ,.regB3d ()
        ,.regB4d ()
        ,.regB5d ()
        ,.regB6d ()
        ,.regB7d ()
        ,.regB8d ()
        ,.regB9d ()
        ,.regBAd ()
        ,.regBBd ()
        ,.regBCd ()
        ,.regBDd ()
        ,.regBEd ()
        ,.regBFd ()
        ,.regC0d ()
        ,.regC1d ()
        ,.regC2d ()
        ,.regC3d ()
        ,.regC4d ()
        ,.regC5d ()
        ,.regC6d ()
        ,.regC7d ()
        ,.regC8d ()
        ,.regC9d ()
        ,.regCAd ()
        ,.regCBd ()
        ,.regCCd ()
        ,.regCDd ()
        ,.regCEd ()
        ,.regCFd ()
        ,.regD0d ()
        ,.regD1d ()
        ,.regD2d ()
        ,.regD3d ()
        ,.regD4d ()
        ,.regD5d ()
        ,.regD6d ()
        ,.regD7d ()
        ,.regD8d ()
        ,.regD9d ()
        ,.regDAd ()
        ,.regDBd ()
        ,.regDCd ()
        ,.regDDd ()
        ,.regDEd ()
        ,.regDFd ()
        ,.regE0d ()
        ,.regE1d ()
        ,.regE2d ()
        ,.regE3d ()
        ,.regE4d ()
        ,.regE5d ()
        ,.regE6d ()
        ,.regE7d ()
        ,.regE8d ()
        ,.regE9d ()
        ,.regEAd ()
        ,.regEBd ()
        ,.regECd ()
        ,.regEDd ()
        ,.regEEd ()
        ,.regEFd ()
        ,.regF0d ()
        ,.regF1d ()
        ,.regF2d ()
        ,.regF3d ()
        ,.regF4d ()
        ,.regF5d ()
        ,.regF6d ()
        ,.regF7d ()
        ,.regF8d ()
        ,.regF9d ()
        ,.regFAd ()
        ,.regFBd ()
        ,.regFCd ()
        ,.regFDd ()
        ,.regFEd ()
        ,.regFFd ()
        ,.ireg02d (A_pop_window[ 7: 0])
        ,.ireg03d (A_pop_window[15: 8])
        ,.ireg04d (A_pop_window[23:16])
        ,.ireg05d (A_pop_window[31:24])
        ,.ireg06d (B_pop_window[ 7: 0])
        ,.ireg07d (B_pop_window[15: 8])
        ,.ireg08d (B_pop_window[23:16])
        ,.ireg09d (B_pop_window[31:24])
        ,.ireg0Ad (C_pop_window[ 7: 0])
        ,.ireg0Bd (C_pop_window[15: 8])
        ,.ireg0Cd (C_pop_window[23:16])
        ,.ireg0Dd (C_pop_window[31:24])
        ,.ireg0Ed (read_pointer[7:0])
        ,.ireg0Fd (read_pointer[15:8])
        ,.ireg10d ({5'b0, jump_en, read_pointer[17:16]})
        ,.ireg11d (read_pointer_shift_minusone)
        ,.ireg12d (Instr[7:0])
        ,.ireg13d (Instr[15:8])
        ,.ireg14d (debug_reg_14)
        ,.ireg15d (debug_reg_15)
        ,.ireg16d (debug_reg_16)
        ,.ireg17d (debug_reg_17)
        ,.ireg18d (debug_reg_18)
        ,.ireg19d (ALUResult[7:0])
        ,.ireg1Ad (ALUResult[15:8])
        ,.ireg1Bd (ALUResult[23:16])
        ,.ireg1Cd (ALUResult[31:24])
        ,.ireg1Dd (control_stack_top_data[7:0])
        ,.ireg1Ed (control_stack_top_data[15:8])
        ,.ireg1Fd (control_stack_top_data[23:16])
        ,.ireg20d (debug_reg_20)
        ,.ireg21d (debug_reg_21)
        ,.ireg22d ()
    );



endmodule
