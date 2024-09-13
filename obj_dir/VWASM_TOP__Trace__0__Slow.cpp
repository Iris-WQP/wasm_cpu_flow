// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VWASM_TOP__Syms.h"


VL_ATTR_COLD void VWASM_TOP___024root__trace_init_sub__TOP__0(VWASM_TOP___024root* vlSelf, VerilatedVcd* tracep) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root__trace_init_sub__TOP__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->declBit(c+229,0,"i_clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+230,0,"i_rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+231,0,"o_INSTR_ERROR",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+232,0,"o_instr_finish",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+233,0,"o_stack_full",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("WASM_TOP", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+229,0,"i_clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+230,0,"i_rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+231,0,"o_INSTR_ERROR",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+232,0,"o_instr_finish",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+233,0,"o_stack_full",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+17,0,"ALUResult",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+18,0,"stack_empty",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+19,0,"Instr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 71,0);
    tracep->declBit(c+22,0,"Instr_vld",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+23,0,"read_pointer_shift_minusone",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+24,0,"shift_vld",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+25,0,"pop_num",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+26,0,"push_select",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+27,0,"ALUControl",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBit(c+28,0,"store_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+29,0,"load_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+30,0,"local_set",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+31,0,"local_get",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+32,0,"constant",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+234,0,"load_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+235,0,"local_mem_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+33,0,"load_vld",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+34,0,"push_num",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+179,0,"push_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declArray(c+35,0,"pop_window",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 95,0);
    tracep->declBit(c+236,0,"wr_req_vld",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+237,0,"write_pointer_shift_minusone",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declArray(c+238,0,"wr_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 255,0);
    tracep->declBus(c+38,0,"A_store_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+39,0,"B_offset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+40,0,"C",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->pushPrefix("u_alu", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+38,0,"A",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+39,0,"B",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+40,0,"C",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+27,0,"ALUControl",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+17,0,"ALUResult",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+41,0,"C_out",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+42,0,"sum",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+43,0,"eqz",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+44,0,"eq",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+45,0,"ne",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+46,0,"lt_u",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+47,0,"gt_u",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+48,0,"lt_s",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+49,0,"gt_s",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->popPrefix();
    tracep->pushPrefix("u_ctrl_unit", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+229,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+230,0,"rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+19,0,"Instr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 71,0);
    tracep->declBit(c+22,0,"Instr_vld",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+23,0,"read_pointer_shift_minusone",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBit(c+24,0,"shift_vld",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+231,0,"INSTR_ERROR",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+34,0,"push_num",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+25,0,"pop_num",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+26,0,"push_select",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+27,0,"ALUControl",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBit(c+28,0,"store_en",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+29,0,"load_en",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+30,0,"local_set",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+31,0,"local_get",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+32,0,"constant",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+232,0,"instr_finish",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+50,0,"instr_pointer_state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+246,0,"module_head",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+247,0,"section_head",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+248,0,"vector_head",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+249,0,"vector_content",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->pushPrefix("global_variables", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declBus(c+250+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 31,0);
    }
    tracep->popPrefix();
    tracep->pushPrefix("global_var_type", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declBus(c+266+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 7,0);
    }
    tracep->popPrefix();
    tracep->pushPrefix("local_variables", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declBus(c+282+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 31,0);
    }
    tracep->popPrefix();
    tracep->declQuad(c+51,0,"LEB128_in",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 35,0);
    tracep->declBus(c+32,0,"LEB128_decode",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+53,0,"LEB128_byte_cnt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+54,0,"section_type",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+55,0,"section_length",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+56,0,"vector_num",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+57,0,"vector_cnt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+58,0,"type_decode",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("para_num_reg", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 8; ++i) {
        tracep->declBus(c+59+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 7,0);
    }
    tracep->popPrefix();
    tracep->pushPrefix("retu_num_reg", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 8; ++i) {
        tracep->declBus(c+67+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 7,0);
    }
    tracep->popPrefix();
    tracep->declBus(c+75,0,"function_num_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->pushPrefix("function_type_list", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declArray(c+76+i*3,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 71,0);
    }
    tracep->popPrefix();
    tracep->pushPrefix("function_addr_list", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 32; ++i) {
        tracep->declBus(c+298+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 5,0);
    }
    tracep->popPrefix();
    tracep->declBus(c+124,0,"para_num_reg0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+125,0,"retu_num_reg0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declArray(c+126,0,"function_type_list0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 71,0);
    tracep->declBus(c+129,0,"function_store_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->pushPrefix("u_decode", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declQuad(c+51,0,"LEB128_in",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 35,0);
    tracep->declBus(c+32,0,"uint32_out",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+53,0,"byte_cnt",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+130,0,"en1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+131,0,"en2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+132,0,"en3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+133,0,"en4",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("dt", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 4; ++i) {
        tracep->declBus(c+134+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, true,(i+0), 6,0);
    }
    tracep->popPrefix();
    tracep->declBus(c+138,0,"dt_4",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->pushPrefix("u_instr_mem_ctrl", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+330,0,"ADDR_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+331,0,"DATA_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+332,0,"DEPTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+229,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+230,0,"rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+24,0,"shift_vld",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+24,0,"re",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+23,0,"read_pointer_shift_minusone",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declArray(c+19,0,"rd_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 71,0);
    tracep->declBit(c+22,0,"rd_data_vld",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+236,0,"we",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+237,0,"write_pointer_shift_minusone",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declArray(c+238,0,"wr_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 255,0);
    tracep->declBit(c+139,0,"instr_finish",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+140,0,"working",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+141,0,"forward",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+142,0,"read_pointer",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 5,0);
    tracep->declBus(c+143,0,"write_pointer",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 5,0);
    tracep->popPrefix();
    tracep->pushPrefix("u_line_memory", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+333,0,"ADDR_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+334,0,"DATA_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+335,0,"DEPTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+229,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+17,0,"addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+29,0,"re",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+234,0,"rd_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+33,0,"rd_data_vld",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+28,0,"we",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+38,0,"wr_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->pushPrefix("bram", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declBus(c+1+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 31,0);
    }
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->pushPrefix("u_local_mem", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+333,0,"ADDR_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+334,0,"DATA_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+335,0,"DEPTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+229,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+32,0,"addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+235,0,"rd_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+30,0,"we",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+38,0,"wr_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->pushPrefix("bram", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declBus(c+213+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 31,0);
    }
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->pushPrefix("u_stack", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+229,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+230,0,"rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+34,0,"push_num",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+25,0,"pop_num",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+179,0,"push_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declArray(c+35,0,"pop_window",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 95,0);
    tracep->declBit(c+233,0,"stack_full",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+18,0,"stack_empty",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+144,0,"stack_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+160,0,"stack_reg_after_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+180,0,"stack_reg_after_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+176,0,"pointer",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+177,0,"pointer_after_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+178,0,"pointer_after_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declArray(c+196,0,"push_mid_state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 543,0);
    tracep->popPrefix();
    tracep->popPrefix();
}

VL_ATTR_COLD void VWASM_TOP___024root__trace_init_top(VWASM_TOP___024root* vlSelf, VerilatedVcd* tracep) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root__trace_init_top\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    VWASM_TOP___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void VWASM_TOP___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
VL_ATTR_COLD void VWASM_TOP___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VWASM_TOP___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VWASM_TOP___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void VWASM_TOP___024root__trace_register(VWASM_TOP___024root* vlSelf, VerilatedVcd* tracep) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root__trace_register\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    tracep->addConstCb(&VWASM_TOP___024root__trace_const_0, 0U, vlSelf);
    tracep->addFullCb(&VWASM_TOP___024root__trace_full_0, 0U, vlSelf);
    tracep->addChgCb(&VWASM_TOP___024root__trace_chg_0, 0U, vlSelf);
    tracep->addCleanupCb(&VWASM_TOP___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void VWASM_TOP___024root__trace_const_0_sub_0(VWASM_TOP___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void VWASM_TOP___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root__trace_const_0\n"); );
    // Init
    VWASM_TOP___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VWASM_TOP___024root*>(voidSelf);
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    VWASM_TOP___024root__trace_const_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void VWASM_TOP___024root__trace_const_0_sub_0(VWASM_TOP___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root__trace_const_0_sub_0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullBit(oldp+236,(0U));
    bufp->fullCData(oldp+237,(vlSelfRef.WASM_TOP__DOT__write_pointer_shift_minusone),5);
    bufp->fullWData(oldp+238,(vlSelfRef.WASM_TOP__DOT__wr_data),256);
    bufp->fullCData(oldp+246,(0U),2);
    bufp->fullCData(oldp+247,(1U),2);
    bufp->fullCData(oldp+248,(2U),2);
    bufp->fullCData(oldp+249,(3U),2);
    bufp->fullIData(oldp+250,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[0]),32);
    bufp->fullIData(oldp+251,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[1]),32);
    bufp->fullIData(oldp+252,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[2]),32);
    bufp->fullIData(oldp+253,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[3]),32);
    bufp->fullIData(oldp+254,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[4]),32);
    bufp->fullIData(oldp+255,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[5]),32);
    bufp->fullIData(oldp+256,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[6]),32);
    bufp->fullIData(oldp+257,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[7]),32);
    bufp->fullIData(oldp+258,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[8]),32);
    bufp->fullIData(oldp+259,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[9]),32);
    bufp->fullIData(oldp+260,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[10]),32);
    bufp->fullIData(oldp+261,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[11]),32);
    bufp->fullIData(oldp+262,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[12]),32);
    bufp->fullIData(oldp+263,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[13]),32);
    bufp->fullIData(oldp+264,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[14]),32);
    bufp->fullIData(oldp+265,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[15]),32);
    bufp->fullCData(oldp+266,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[0]),8);
    bufp->fullCData(oldp+267,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[1]),8);
    bufp->fullCData(oldp+268,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[2]),8);
    bufp->fullCData(oldp+269,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[3]),8);
    bufp->fullCData(oldp+270,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[4]),8);
    bufp->fullCData(oldp+271,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[5]),8);
    bufp->fullCData(oldp+272,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[6]),8);
    bufp->fullCData(oldp+273,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[7]),8);
    bufp->fullCData(oldp+274,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[8]),8);
    bufp->fullCData(oldp+275,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[9]),8);
    bufp->fullCData(oldp+276,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[10]),8);
    bufp->fullCData(oldp+277,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[11]),8);
    bufp->fullCData(oldp+278,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[12]),8);
    bufp->fullCData(oldp+279,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[13]),8);
    bufp->fullCData(oldp+280,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[14]),8);
    bufp->fullCData(oldp+281,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[15]),8);
    bufp->fullIData(oldp+282,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[0]),32);
    bufp->fullIData(oldp+283,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[1]),32);
    bufp->fullIData(oldp+284,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[2]),32);
    bufp->fullIData(oldp+285,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[3]),32);
    bufp->fullIData(oldp+286,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[4]),32);
    bufp->fullIData(oldp+287,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[5]),32);
    bufp->fullIData(oldp+288,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[6]),32);
    bufp->fullIData(oldp+289,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[7]),32);
    bufp->fullIData(oldp+290,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[8]),32);
    bufp->fullIData(oldp+291,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[9]),32);
    bufp->fullIData(oldp+292,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[10]),32);
    bufp->fullIData(oldp+293,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[11]),32);
    bufp->fullIData(oldp+294,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[12]),32);
    bufp->fullIData(oldp+295,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[13]),32);
    bufp->fullIData(oldp+296,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[14]),32);
    bufp->fullIData(oldp+297,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[15]),32);
    bufp->fullCData(oldp+298,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[0]),6);
    bufp->fullCData(oldp+299,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[1]),6);
    bufp->fullCData(oldp+300,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[2]),6);
    bufp->fullCData(oldp+301,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[3]),6);
    bufp->fullCData(oldp+302,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[4]),6);
    bufp->fullCData(oldp+303,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[5]),6);
    bufp->fullCData(oldp+304,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[6]),6);
    bufp->fullCData(oldp+305,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[7]),6);
    bufp->fullCData(oldp+306,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[8]),6);
    bufp->fullCData(oldp+307,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[9]),6);
    bufp->fullCData(oldp+308,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[10]),6);
    bufp->fullCData(oldp+309,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[11]),6);
    bufp->fullCData(oldp+310,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[12]),6);
    bufp->fullCData(oldp+311,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[13]),6);
    bufp->fullCData(oldp+312,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[14]),6);
    bufp->fullCData(oldp+313,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[15]),6);
    bufp->fullCData(oldp+314,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[16]),6);
    bufp->fullCData(oldp+315,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[17]),6);
    bufp->fullCData(oldp+316,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[18]),6);
    bufp->fullCData(oldp+317,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[19]),6);
    bufp->fullCData(oldp+318,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[20]),6);
    bufp->fullCData(oldp+319,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[21]),6);
    bufp->fullCData(oldp+320,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[22]),6);
    bufp->fullCData(oldp+321,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[23]),6);
    bufp->fullCData(oldp+322,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[24]),6);
    bufp->fullCData(oldp+323,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[25]),6);
    bufp->fullCData(oldp+324,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[26]),6);
    bufp->fullCData(oldp+325,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[27]),6);
    bufp->fullCData(oldp+326,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[28]),6);
    bufp->fullCData(oldp+327,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[29]),6);
    bufp->fullCData(oldp+328,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[30]),6);
    bufp->fullCData(oldp+329,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[31]),6);
    bufp->fullIData(oldp+330,(6U),32);
    bufp->fullIData(oldp+331,(8U),32);
    bufp->fullIData(oldp+332,(0x40U),32);
    bufp->fullIData(oldp+333,(4U),32);
    bufp->fullIData(oldp+334,(0x20U),32);
    bufp->fullIData(oldp+335,(0x10U),32);
}

VL_ATTR_COLD void VWASM_TOP___024root__trace_full_0_sub_0(VWASM_TOP___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void VWASM_TOP___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root__trace_full_0\n"); );
    // Init
    VWASM_TOP___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VWASM_TOP___024root*>(voidSelf);
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    VWASM_TOP___024root__trace_full_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void VWASM_TOP___024root__trace_full_0_sub_0(VWASM_TOP___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root__trace_full_0_sub_0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    VlWide<3>/*95:0*/ __Vtemp_1;
    VlWide<16>/*511:0*/ __Vtemp_5;
    VlWide<17>/*543:0*/ __Vtemp_8;
    // Body
    bufp->fullIData(oldp+1,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[0]),32);
    bufp->fullIData(oldp+2,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[1]),32);
    bufp->fullIData(oldp+3,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[2]),32);
    bufp->fullIData(oldp+4,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[3]),32);
    bufp->fullIData(oldp+5,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[4]),32);
    bufp->fullIData(oldp+6,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[5]),32);
    bufp->fullIData(oldp+7,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[6]),32);
    bufp->fullIData(oldp+8,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[7]),32);
    bufp->fullIData(oldp+9,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[8]),32);
    bufp->fullIData(oldp+10,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[9]),32);
    bufp->fullIData(oldp+11,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[10]),32);
    bufp->fullIData(oldp+12,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[11]),32);
    bufp->fullIData(oldp+13,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[12]),32);
    bufp->fullIData(oldp+14,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[13]),32);
    bufp->fullIData(oldp+15,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[14]),32);
    bufp->fullIData(oldp+16,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[15]),32);
    bufp->fullIData(oldp+17,(vlSelfRef.WASM_TOP__DOT__ALUResult),32);
    bufp->fullBit(oldp+18,((0U == (IData)(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer))));
    bufp->fullWData(oldp+19,(vlSelfRef.WASM_TOP__DOT__Instr),72);
    bufp->fullBit(oldp+22,(vlSelfRef.WASM_TOP__DOT__Instr_vld));
    bufp->fullCData(oldp+23,(vlSelfRef.WASM_TOP__DOT__read_pointer_shift_minusone),4);
    bufp->fullBit(oldp+24,(vlSelfRef.WASM_TOP__DOT__shift_vld));
    bufp->fullCData(oldp+25,(vlSelfRef.WASM_TOP__DOT__pop_num),2);
    bufp->fullCData(oldp+26,(vlSelfRef.WASM_TOP__DOT__push_select),2);
    bufp->fullCData(oldp+27,(vlSelfRef.WASM_TOP__DOT__ALUControl),5);
    bufp->fullBit(oldp+28,(vlSelfRef.WASM_TOP__DOT__store_en));
    bufp->fullBit(oldp+29,(vlSelfRef.WASM_TOP__DOT__load_en));
    bufp->fullBit(oldp+30,(vlSelfRef.WASM_TOP__DOT__local_set));
    bufp->fullBit(oldp+31,(((0x20U == (0xffU & vlSelfRef.WASM_TOP__DOT__Instr[0U])) 
                            & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1))));
    bufp->fullIData(oldp+32,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode),32);
    bufp->fullBit(oldp+33,(vlSelfRef.WASM_TOP__DOT__load_vld));
    bufp->fullBit(oldp+34,(vlSelfRef.WASM_TOP__DOT__push_num));
    __Vtemp_1[0U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U];
    __Vtemp_1[1U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[1U];
    __Vtemp_1[2U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[2U];
    bufp->fullWData(oldp+35,(__Vtemp_1),96);
    bufp->fullIData(oldp+38,(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U]),32);
    bufp->fullIData(oldp+39,(vlSelfRef.WASM_TOP__DOT__B_offset),32);
    bufp->fullIData(oldp+40,(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[2U]),32);
    bufp->fullBit(oldp+41,((1U & (IData)((1ULL & ((
                                                   (1U 
                                                    & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                    ? 
                                                   (1ULL 
                                                    + 
                                                    ((QData)((IData)(vlSelfRef.WASM_TOP__DOT__B_offset)) 
                                                     + 
                                                     (~ (QData)((IData)(
                                                                        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U])))))
                                                    : 
                                                   ((QData)((IData)(
                                                                    vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U])) 
                                                    + (QData)((IData)(vlSelfRef.WASM_TOP__DOT__B_offset)))) 
                                                  >> 0x20U))))));
    bufp->fullIData(oldp+42,(vlSelfRef.WASM_TOP__DOT__u_alu__DOT__sum),32);
    bufp->fullIData(oldp+43,((0U == vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U])),32);
    bufp->fullIData(oldp+44,(vlSelfRef.WASM_TOP__DOT__u_alu__DOT__eq),32);
    bufp->fullIData(oldp+45,((vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U] 
                              != vlSelfRef.WASM_TOP__DOT__B_offset)),32);
    bufp->fullIData(oldp+46,(vlSelfRef.WASM_TOP__DOT__u_alu__DOT__lt_u),32);
    bufp->fullIData(oldp+47,(vlSelfRef.WASM_TOP__DOT__u_alu__DOT__gt_u),32);
    bufp->fullIData(oldp+48,(vlSelfRef.WASM_TOP__DOT__u_alu__DOT__lt_s),32);
    bufp->fullIData(oldp+49,(vlSelfRef.WASM_TOP__DOT__u_alu__DOT__gt_s),32);
    bufp->fullCData(oldp+50,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state),2);
    bufp->fullQData(oldp+51,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in),36);
    bufp->fullCData(oldp+53,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt),3);
    bufp->fullCData(oldp+54,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type),8);
    bufp->fullIData(oldp+55,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_length),32);
    bufp->fullIData(oldp+56,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_num),32);
    bufp->fullIData(oldp+57,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt),32);
    bufp->fullBit(oldp+58,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__type_decode));
    bufp->fullCData(oldp+59,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[0]),8);
    bufp->fullCData(oldp+60,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[1]),8);
    bufp->fullCData(oldp+61,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[2]),8);
    bufp->fullCData(oldp+62,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[3]),8);
    bufp->fullCData(oldp+63,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[4]),8);
    bufp->fullCData(oldp+64,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[5]),8);
    bufp->fullCData(oldp+65,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[6]),8);
    bufp->fullCData(oldp+66,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[7]),8);
    bufp->fullCData(oldp+67,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[0]),8);
    bufp->fullCData(oldp+68,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[1]),8);
    bufp->fullCData(oldp+69,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[2]),8);
    bufp->fullCData(oldp+70,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[3]),8);
    bufp->fullCData(oldp+71,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[4]),8);
    bufp->fullCData(oldp+72,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[5]),8);
    bufp->fullCData(oldp+73,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[6]),8);
    bufp->fullCData(oldp+74,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[7]),8);
    bufp->fullCData(oldp+75,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_num_reg),8);
    bufp->fullWData(oldp+76,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[0]),72);
    bufp->fullWData(oldp+79,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[1]),72);
    bufp->fullWData(oldp+82,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[2]),72);
    bufp->fullWData(oldp+85,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[3]),72);
    bufp->fullWData(oldp+88,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[4]),72);
    bufp->fullWData(oldp+91,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[5]),72);
    bufp->fullWData(oldp+94,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[6]),72);
    bufp->fullWData(oldp+97,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[7]),72);
    bufp->fullWData(oldp+100,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[8]),72);
    bufp->fullWData(oldp+103,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[9]),72);
    bufp->fullWData(oldp+106,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[10]),72);
    bufp->fullWData(oldp+109,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[11]),72);
    bufp->fullWData(oldp+112,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[12]),72);
    bufp->fullWData(oldp+115,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[13]),72);
    bufp->fullWData(oldp+118,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[14]),72);
    bufp->fullWData(oldp+121,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[15]),72);
    bufp->fullCData(oldp+124,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg
                              [0U]),8);
    bufp->fullCData(oldp+125,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg
                              [0U]),8);
    bufp->fullWData(oldp+126,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list
                              [0U]),72);
    bufp->fullCData(oldp+129,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_store_addr),4);
    bufp->fullBit(oldp+130,((1U & (IData)((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                           >> 7U)))));
    bufp->fullBit(oldp+131,((1U & (IData)((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                           >> 0xfU)))));
    bufp->fullBit(oldp+132,((1U & (IData)((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                           >> 0x17U)))));
    bufp->fullBit(oldp+133,((1U & (IData)((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                           >> 0x1fU)))));
    bufp->fullCData(oldp+134,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[0]),7);
    bufp->fullCData(oldp+135,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[1]),7);
    bufp->fullCData(oldp+136,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[2]),7);
    bufp->fullCData(oldp+137,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[3]),7);
    bufp->fullCData(oldp+138,((0xfU & (IData)((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                               >> 0x20U)))),4);
    bufp->fullBit(oldp+139,(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__instr_finish));
    bufp->fullBit(oldp+140,(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__working));
    bufp->fullBit(oldp+141,(((~ (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__instr_finish)) 
                             & (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__working))));
    bufp->fullCData(oldp+142,(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer),6);
    bufp->fullCData(oldp+143,(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__write_pointer),6);
    bufp->fullWData(oldp+144,(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg),512);
    bufp->fullWData(oldp+160,(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop),512);
    bufp->fullCData(oldp+176,(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer),4);
    bufp->fullCData(oldp+177,(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer_after_pop),4);
    bufp->fullCData(oldp+178,((0xfU & ((IData)(vlSelfRef.WASM_TOP__DOT__push_num)
                                        ? ((0xfU > (IData)(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer_after_pop))
                                            ? ((IData)(1U) 
                                               + (IData)(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer_after_pop))
                                            : 0xfU)
                                        : (IData)(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer_after_pop)))),4);
    bufp->fullIData(oldp+179,(((2U & (IData)(vlSelfRef.WASM_TOP__DOT__push_select))
                                ? ((1U & (IData)(vlSelfRef.WASM_TOP__DOT__push_select))
                                    ? vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram
                                   [(0xfU & vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode)]
                                    : vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode)
                                : ((1U & (IData)(vlSelfRef.WASM_TOP__DOT__push_select))
                                    ? vlSelfRef.WASM_TOP__DOT__load_data
                                    : vlSelfRef.WASM_TOP__DOT__ALUResult))),32);
    if (vlSelfRef.WASM_TOP__DOT__push_num) {
        __Vtemp_5[0U] = ((2U & (IData)(vlSelfRef.WASM_TOP__DOT__push_select))
                          ? ((1U & (IData)(vlSelfRef.WASM_TOP__DOT__push_select))
                              ? vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram
                             [(0xfU & vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode)]
                              : vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode)
                          : ((1U & (IData)(vlSelfRef.WASM_TOP__DOT__push_select))
                              ? vlSelfRef.WASM_TOP__DOT__load_data
                              : vlSelfRef.WASM_TOP__DOT__ALUResult));
        __Vtemp_5[1U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0U];
        __Vtemp_5[2U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[1U];
        __Vtemp_5[3U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[2U];
        __Vtemp_5[4U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[3U];
        __Vtemp_5[5U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[4U];
        __Vtemp_5[6U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[5U];
        __Vtemp_5[7U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[6U];
        __Vtemp_5[8U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[7U];
        __Vtemp_5[9U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[8U];
        __Vtemp_5[0xaU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[9U];
        __Vtemp_5[0xbU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xaU];
        __Vtemp_5[0xcU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xbU];
        __Vtemp_5[0xdU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xcU];
        __Vtemp_5[0xeU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xdU];
        __Vtemp_5[0xfU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xeU];
    } else {
        __Vtemp_5[0U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0U];
        __Vtemp_5[1U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[1U];
        __Vtemp_5[2U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[2U];
        __Vtemp_5[3U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[3U];
        __Vtemp_5[4U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[4U];
        __Vtemp_5[5U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[5U];
        __Vtemp_5[6U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[6U];
        __Vtemp_5[7U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[7U];
        __Vtemp_5[8U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[8U];
        __Vtemp_5[9U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[9U];
        __Vtemp_5[0xaU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xaU];
        __Vtemp_5[0xbU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xbU];
        __Vtemp_5[0xcU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xcU];
        __Vtemp_5[0xdU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xdU];
        __Vtemp_5[0xeU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xeU];
        __Vtemp_5[0xfU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xfU];
    }
    bufp->fullWData(oldp+180,(__Vtemp_5),512);
    if (vlSelfRef.WASM_TOP__DOT__push_num) {
        __Vtemp_8[0U] = ((2U & (IData)(vlSelfRef.WASM_TOP__DOT__push_select))
                          ? ((1U & (IData)(vlSelfRef.WASM_TOP__DOT__push_select))
                              ? vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram
                             [(0xfU & vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode)]
                              : vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode)
                          : ((1U & (IData)(vlSelfRef.WASM_TOP__DOT__push_select))
                              ? vlSelfRef.WASM_TOP__DOT__load_data
                              : vlSelfRef.WASM_TOP__DOT__ALUResult));
        __Vtemp_8[1U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0U];
        __Vtemp_8[2U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[1U];
        __Vtemp_8[3U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[2U];
        __Vtemp_8[4U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[3U];
        __Vtemp_8[5U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[4U];
        __Vtemp_8[6U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[5U];
        __Vtemp_8[7U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[6U];
        __Vtemp_8[8U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[7U];
        __Vtemp_8[9U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[8U];
        __Vtemp_8[0xaU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[9U];
        __Vtemp_8[0xbU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xaU];
        __Vtemp_8[0xcU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xbU];
        __Vtemp_8[0xdU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xcU];
        __Vtemp_8[0xeU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xdU];
        __Vtemp_8[0xfU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xeU];
        __Vtemp_8[0x10U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xfU];
    } else {
        __Vtemp_8[0U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0U];
        __Vtemp_8[1U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[1U];
        __Vtemp_8[2U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[2U];
        __Vtemp_8[3U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[3U];
        __Vtemp_8[4U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[4U];
        __Vtemp_8[5U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[5U];
        __Vtemp_8[6U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[6U];
        __Vtemp_8[7U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[7U];
        __Vtemp_8[8U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[8U];
        __Vtemp_8[9U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[9U];
        __Vtemp_8[0xaU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xaU];
        __Vtemp_8[0xbU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xbU];
        __Vtemp_8[0xcU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xcU];
        __Vtemp_8[0xdU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xdU];
        __Vtemp_8[0xeU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xeU];
        __Vtemp_8[0xfU] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xfU];
        __Vtemp_8[0x10U] = 0U;
    }
    bufp->fullWData(oldp+196,(__Vtemp_8),544);
    bufp->fullIData(oldp+213,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[0]),32);
    bufp->fullIData(oldp+214,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[1]),32);
    bufp->fullIData(oldp+215,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[2]),32);
    bufp->fullIData(oldp+216,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[3]),32);
    bufp->fullIData(oldp+217,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[4]),32);
    bufp->fullIData(oldp+218,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[5]),32);
    bufp->fullIData(oldp+219,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[6]),32);
    bufp->fullIData(oldp+220,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[7]),32);
    bufp->fullIData(oldp+221,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[8]),32);
    bufp->fullIData(oldp+222,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[9]),32);
    bufp->fullIData(oldp+223,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[10]),32);
    bufp->fullIData(oldp+224,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[11]),32);
    bufp->fullIData(oldp+225,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[12]),32);
    bufp->fullIData(oldp+226,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[13]),32);
    bufp->fullIData(oldp+227,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[14]),32);
    bufp->fullIData(oldp+228,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[15]),32);
    bufp->fullBit(oldp+229,(vlSelfRef.i_clk));
    bufp->fullBit(oldp+230,(vlSelfRef.i_rst_n));
    bufp->fullBit(oldp+231,(vlSelfRef.o_INSTR_ERROR));
    bufp->fullBit(oldp+232,(vlSelfRef.o_instr_finish));
    bufp->fullBit(oldp+233,(vlSelfRef.o_stack_full));
    bufp->fullIData(oldp+234,(vlSelfRef.WASM_TOP__DOT__load_data),32);
    bufp->fullIData(oldp+235,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram
                              [(0xfU & vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode)]),32);
}
