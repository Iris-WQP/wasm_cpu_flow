// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VTB_WASM_TOP__Syms.h"


VL_ATTR_COLD void VTB_WASM_TOP___024root__trace_init_sub__TOP__0(VTB_WASM_TOP___024root* vlSelf, VerilatedVcd* tracep) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root__trace_init_sub__TOP__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->pushPrefix("TB_WASM_TOP", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+315,0,"clk",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+316,0,"rst_n",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+67,0,"INSTR_ERROR",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+68,0,"instr_finish",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+69,0,"stack_full",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+319,0,"read_pointer",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+320,0,"ALUResult",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+321,0,"stack_empty",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+70,0,"clk_cnt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->pushPrefix("u_wasm_top", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+315,0,"i_clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+316,0,"i_rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+67,0,"o_INSTR_ERROR",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+68,0,"o_instr_finish",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+69,0,"o_stack_full",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+71,0,"ALUResult",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+72,0,"stack_empty",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+73,0,"Instr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 71,0);
    tracep->declBit(c+76,0,"Instr_vld",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+77,0,"read_pointer_shift_minusone",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+78,0,"shift_vld",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+79,0,"pop_num",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+80,0,"push_select",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+81,0,"ALUControl",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBit(c+82,0,"store_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+83,0,"load_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+84,0,"local_set",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+85,0,"local_get",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+86,0,"constant",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+87,0,"read_pointer",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+88,0,"jump_en",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+89,0,"jump_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+90,0,"hlt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+317,0,"load_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+318,0,"local_mem_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+91,0,"load_vld",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+92,0,"push_num",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+1,0,"push_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declArray(c+93,0,"pop_window",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBit(c+322,0,"wr_req_vld",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+323,0,"write_pointer_shift_minusone",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declArray(c+324,0,"wr_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 255,0);
    tracep->declBus(c+109,0,"A_store_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+110,0,"B_offset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+111,0,"C",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->pushPrefix("u_alu", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+109,0,"A",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+110,0,"B",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+111,0,"C",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+81,0,"ALUControl",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+71,0,"ALUResult",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+112,0,"C_out",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+113,0,"sum",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+114,0,"eqz",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+115,0,"eq",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+116,0,"ne",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+117,0,"lt_u",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+118,0,"gt_u",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+119,0,"lt_s",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+120,0,"gt_s",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->popPrefix();
    tracep->pushPrefix("u_ctrl_unit", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+315,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+316,0,"rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+87,0,"read_pointer",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declArray(c+73,0,"Instr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 71,0);
    tracep->declBit(c+76,0,"Instr_vld",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+77,0,"read_pointer_shift_minusone",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+78,0,"shift_vld",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+67,0,"INSTR_ERROR",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+88,0,"jump_en",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+89,0,"jump_addr",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+92,0,"push_num",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+79,0,"pop_num",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+80,0,"push_select",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+81,0,"ALUControl",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBit(c+82,0,"store_en",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+83,0,"load_en",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+84,0,"local_set",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+85,0,"local_get",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+86,0,"constant",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+90,0,"hlt",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+68,0,"instr_finish",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+90,0,"jump_hlt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+121,0,"instr_pointer_state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+332,0,"module_head",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+333,0,"section_head",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+334,0,"vector_head",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+335,0,"vector_content",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->pushPrefix("global_variables", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declBus(c+336+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 31,0);
    }
    tracep->popPrefix();
    tracep->pushPrefix("global_var_type", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declBus(c+352+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 7,0);
    }
    tracep->popPrefix();
    tracep->pushPrefix("local_variables", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declBus(c+368+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 31,0);
    }
    tracep->popPrefix();
    tracep->declQuad(c+122,0,"LEB128_in",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 35,0);
    tracep->declBus(c+86,0,"LEB128_decode",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+124,0,"LEB128_byte_cnt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+125,0,"section_type",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+126,0,"section_length",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+127,0,"vector_num",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+128,0,"vector_cnt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+129,0,"type_decode",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("para_num_reg", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 32; ++i) {
        tracep->declBus(c+130+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 3,0);
    }
    tracep->popPrefix();
    tracep->pushPrefix("retu_num_reg", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 32; ++i) {
        tracep->declBus(c+162+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 3,0);
    }
    tracep->popPrefix();
    tracep->declBus(c+194,0,"function_num_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+195,0,"function_num_left",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->pushPrefix("function_type_list", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declArray(c+196+i*3,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 71,0);
    }
    tracep->popPrefix();
    tracep->pushPrefix("function_addr_list", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 32; ++i) {
        tracep->declBus(c+244+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 7,0);
    }
    tracep->popPrefix();
    tracep->declBus(c+276,0,"start_function_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declBus(c+277,0,"function_addr_list0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+278,0,"function_addr_list1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->pushPrefix("global_mem", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 8; ++i) {
        tracep->declBus(c+384+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 31,0);
    }
    tracep->popPrefix();
    tracep->declBit(c+279,0,"function_num_flag",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+280,0,"code_pre_read",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+281,0,"function_store_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->pushPrefix("u_decode", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declQuad(c+122,0,"LEB128_in",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 35,0);
    tracep->declBus(c+86,0,"uint32_out",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+124,0,"byte_cnt",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBit(c+282,0,"en1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+283,0,"en2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+284,0,"en3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+285,0,"en4",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("dt", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 4; ++i) {
        tracep->declBus(c+286+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, true,(i+0), 6,0);
    }
    tracep->popPrefix();
    tracep->declBus(c+290,0,"dt_4",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->pushPrefix("u_instr_mem_ctrl", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+392,0,"ADDR_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+392,0,"DATA_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+393,0,"DEPTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+315,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+316,0,"rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+78,0,"shift_vld",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+90,0,"hlt",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+78,0,"re",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+77,0,"read_pointer_shift_minusone",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declArray(c+73,0,"rd_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 71,0);
    tracep->declBit(c+76,0,"rd_data_vld",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+322,0,"we",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+323,0,"write_pointer_shift_minusone",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 4,0);
    tracep->declArray(c+324,0,"wr_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 255,0);
    tracep->declBit(c+88,0,"jump_en",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+89,0,"jump_addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+291,0,"instr_finish",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+87,0,"read_pointer_out",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+292,0,"read_pointer",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+293,0,"working",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+294,0,"forward",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+295,0,"write_pointer",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->popPrefix();
    tracep->pushPrefix("u_line_memory", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+394,0,"ADDR_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+395,0,"DATA_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+396,0,"DEPTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+315,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+71,0,"addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+83,0,"re",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+317,0,"rd_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+91,0,"rd_data_vld",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+82,0,"we",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+109,0,"wr_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->pushPrefix("bram", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declBus(c+51+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 31,0);
    }
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->pushPrefix("u_local_mem", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+394,0,"ADDR_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+395,0,"DATA_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+396,0,"DEPTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+315,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+86,0,"addr",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+318,0,"rd_data",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+84,0,"we",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+109,0,"wr_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->pushPrefix("bram", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declBus(c+35+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 31,0);
    }
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->pushPrefix("u_stack", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+315,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+316,0,"rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+92,0,"push_num",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+79,0,"pop_num",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+1,0,"push_data",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declArray(c+93,0,"pop_window",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBit(c+69,0,"stack_full",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+72,0,"stack_empty",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+93,0,"stack_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+296,0,"stack_reg_after_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declArray(c+2,0,"stack_reg_after_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBus(c+312,0,"pointer",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+313,0,"pointer_after_pop",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declBus(c+314,0,"pointer_after_push",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 3,0);
    tracep->declArray(c+18,0,"push_mid_state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 543,0);
    tracep->popPrefix();
    tracep->popPrefix();
    tracep->popPrefix();
}

VL_ATTR_COLD void VTB_WASM_TOP___024root__trace_init_top(VTB_WASM_TOP___024root* vlSelf, VerilatedVcd* tracep) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root__trace_init_top\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    VTB_WASM_TOP___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void VTB_WASM_TOP___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
VL_ATTR_COLD void VTB_WASM_TOP___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VTB_WASM_TOP___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VTB_WASM_TOP___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void VTB_WASM_TOP___024root__trace_register(VTB_WASM_TOP___024root* vlSelf, VerilatedVcd* tracep) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root__trace_register\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    tracep->addConstCb(&VTB_WASM_TOP___024root__trace_const_0, 0U, vlSelf);
    tracep->addFullCb(&VTB_WASM_TOP___024root__trace_full_0, 0U, vlSelf);
    tracep->addChgCb(&VTB_WASM_TOP___024root__trace_chg_0, 0U, vlSelf);
    tracep->addCleanupCb(&VTB_WASM_TOP___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void VTB_WASM_TOP___024root__trace_const_0_sub_0(VTB_WASM_TOP___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void VTB_WASM_TOP___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root__trace_const_0\n"); );
    // Init
    VTB_WASM_TOP___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VTB_WASM_TOP___024root*>(voidSelf);
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    VTB_WASM_TOP___024root__trace_const_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void VTB_WASM_TOP___024root__trace_const_0_sub_0(VTB_WASM_TOP___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root__trace_const_0_sub_0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullCData(oldp+319,(vlSelfRef.TB_WASM_TOP__DOT__read_pointer),8);
    bufp->fullIData(oldp+320,(vlSelfRef.TB_WASM_TOP__DOT__ALUResult),32);
    bufp->fullBit(oldp+321,(vlSelfRef.TB_WASM_TOP__DOT__stack_empty));
    bufp->fullBit(oldp+322,(0U));
    bufp->fullCData(oldp+323,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__write_pointer_shift_minusone),5);
    bufp->fullWData(oldp+324,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__wr_data),256);
    bufp->fullCData(oldp+332,(0U),2);
    bufp->fullCData(oldp+333,(1U),2);
    bufp->fullCData(oldp+334,(2U),2);
    bufp->fullCData(oldp+335,(3U),2);
    bufp->fullIData(oldp+336,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[0]),32);
    bufp->fullIData(oldp+337,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[1]),32);
    bufp->fullIData(oldp+338,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[2]),32);
    bufp->fullIData(oldp+339,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[3]),32);
    bufp->fullIData(oldp+340,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[4]),32);
    bufp->fullIData(oldp+341,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[5]),32);
    bufp->fullIData(oldp+342,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[6]),32);
    bufp->fullIData(oldp+343,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[7]),32);
    bufp->fullIData(oldp+344,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[8]),32);
    bufp->fullIData(oldp+345,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[9]),32);
    bufp->fullIData(oldp+346,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[10]),32);
    bufp->fullIData(oldp+347,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[11]),32);
    bufp->fullIData(oldp+348,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[12]),32);
    bufp->fullIData(oldp+349,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[13]),32);
    bufp->fullIData(oldp+350,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[14]),32);
    bufp->fullIData(oldp+351,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[15]),32);
    bufp->fullCData(oldp+352,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[0]),8);
    bufp->fullCData(oldp+353,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[1]),8);
    bufp->fullCData(oldp+354,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[2]),8);
    bufp->fullCData(oldp+355,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[3]),8);
    bufp->fullCData(oldp+356,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[4]),8);
    bufp->fullCData(oldp+357,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[5]),8);
    bufp->fullCData(oldp+358,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[6]),8);
    bufp->fullCData(oldp+359,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[7]),8);
    bufp->fullCData(oldp+360,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[8]),8);
    bufp->fullCData(oldp+361,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[9]),8);
    bufp->fullCData(oldp+362,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[10]),8);
    bufp->fullCData(oldp+363,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[11]),8);
    bufp->fullCData(oldp+364,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[12]),8);
    bufp->fullCData(oldp+365,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[13]),8);
    bufp->fullCData(oldp+366,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[14]),8);
    bufp->fullCData(oldp+367,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[15]),8);
    bufp->fullIData(oldp+368,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[0]),32);
    bufp->fullIData(oldp+369,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[1]),32);
    bufp->fullIData(oldp+370,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[2]),32);
    bufp->fullIData(oldp+371,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[3]),32);
    bufp->fullIData(oldp+372,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[4]),32);
    bufp->fullIData(oldp+373,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[5]),32);
    bufp->fullIData(oldp+374,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[6]),32);
    bufp->fullIData(oldp+375,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[7]),32);
    bufp->fullIData(oldp+376,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[8]),32);
    bufp->fullIData(oldp+377,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[9]),32);
    bufp->fullIData(oldp+378,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[10]),32);
    bufp->fullIData(oldp+379,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[11]),32);
    bufp->fullIData(oldp+380,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[12]),32);
    bufp->fullIData(oldp+381,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[13]),32);
    bufp->fullIData(oldp+382,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[14]),32);
    bufp->fullIData(oldp+383,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[15]),32);
    bufp->fullIData(oldp+384,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_mem[0]),32);
    bufp->fullIData(oldp+385,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_mem[1]),32);
    bufp->fullIData(oldp+386,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_mem[2]),32);
    bufp->fullIData(oldp+387,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_mem[3]),32);
    bufp->fullIData(oldp+388,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_mem[4]),32);
    bufp->fullIData(oldp+389,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_mem[5]),32);
    bufp->fullIData(oldp+390,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_mem[6]),32);
    bufp->fullIData(oldp+391,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_mem[7]),32);
    bufp->fullIData(oldp+392,(8U),32);
    bufp->fullIData(oldp+393,(0x100U),32);
    bufp->fullIData(oldp+394,(4U),32);
    bufp->fullIData(oldp+395,(0x20U),32);
    bufp->fullIData(oldp+396,(0x10U),32);
}

VL_ATTR_COLD void VTB_WASM_TOP___024root__trace_full_0_sub_0(VTB_WASM_TOP___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void VTB_WASM_TOP___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root__trace_full_0\n"); );
    // Init
    VTB_WASM_TOP___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VTB_WASM_TOP___024root*>(voidSelf);
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    VTB_WASM_TOP___024root__trace_full_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void VTB_WASM_TOP___024root__trace_full_0_sub_0(VTB_WASM_TOP___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root__trace_full_0_sub_0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    VlWide<16>/*511:0*/ __Vtemp_4;
    VlWide<17>/*543:0*/ __Vtemp_7;
    // Body
    bufp->fullIData(oldp+1,(((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select))
                              ? ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select))
                                  ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram
                                 [(0xfU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode)]
                                  : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode)
                              : ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select))
                                  ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_data
                                  : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUResult))),32);
    if (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num) {
        __Vtemp_4[0U] = ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select))
                          ? ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select))
                              ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram
                             [(0xfU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode)]
                              : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode)
                          : ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select))
                              ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_data
                              : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUResult));
        __Vtemp_4[1U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0U];
        __Vtemp_4[2U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[1U];
        __Vtemp_4[3U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[2U];
        __Vtemp_4[4U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[3U];
        __Vtemp_4[5U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[4U];
        __Vtemp_4[6U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[5U];
        __Vtemp_4[7U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[6U];
        __Vtemp_4[8U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[7U];
        __Vtemp_4[9U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[8U];
        __Vtemp_4[0xaU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[9U];
        __Vtemp_4[0xbU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xaU];
        __Vtemp_4[0xcU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xbU];
        __Vtemp_4[0xdU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xcU];
        __Vtemp_4[0xeU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xdU];
        __Vtemp_4[0xfU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xeU];
    } else {
        __Vtemp_4[0U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0U];
        __Vtemp_4[1U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[1U];
        __Vtemp_4[2U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[2U];
        __Vtemp_4[3U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[3U];
        __Vtemp_4[4U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[4U];
        __Vtemp_4[5U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[5U];
        __Vtemp_4[6U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[6U];
        __Vtemp_4[7U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[7U];
        __Vtemp_4[8U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[8U];
        __Vtemp_4[9U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[9U];
        __Vtemp_4[0xaU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xaU];
        __Vtemp_4[0xbU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xbU];
        __Vtemp_4[0xcU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xcU];
        __Vtemp_4[0xdU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xdU];
        __Vtemp_4[0xeU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xeU];
        __Vtemp_4[0xfU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xfU];
    }
    bufp->fullWData(oldp+2,(__Vtemp_4),512);
    if (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num) {
        __Vtemp_7[0U] = ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select))
                          ? ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select))
                              ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram
                             [(0xfU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode)]
                              : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode)
                          : ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select))
                              ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_data
                              : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUResult));
        __Vtemp_7[1U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0U];
        __Vtemp_7[2U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[1U];
        __Vtemp_7[3U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[2U];
        __Vtemp_7[4U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[3U];
        __Vtemp_7[5U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[4U];
        __Vtemp_7[6U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[5U];
        __Vtemp_7[7U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[6U];
        __Vtemp_7[8U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[7U];
        __Vtemp_7[9U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[8U];
        __Vtemp_7[0xaU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[9U];
        __Vtemp_7[0xbU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xaU];
        __Vtemp_7[0xcU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xbU];
        __Vtemp_7[0xdU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xcU];
        __Vtemp_7[0xeU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xdU];
        __Vtemp_7[0xfU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xeU];
        __Vtemp_7[0x10U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xfU];
    } else {
        __Vtemp_7[0U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0U];
        __Vtemp_7[1U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[1U];
        __Vtemp_7[2U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[2U];
        __Vtemp_7[3U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[3U];
        __Vtemp_7[4U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[4U];
        __Vtemp_7[5U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[5U];
        __Vtemp_7[6U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[6U];
        __Vtemp_7[7U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[7U];
        __Vtemp_7[8U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[8U];
        __Vtemp_7[9U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[9U];
        __Vtemp_7[0xaU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xaU];
        __Vtemp_7[0xbU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xbU];
        __Vtemp_7[0xcU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xcU];
        __Vtemp_7[0xdU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xdU];
        __Vtemp_7[0xeU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xeU];
        __Vtemp_7[0xfU] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xfU];
        __Vtemp_7[0x10U] = 0U;
    }
    bufp->fullWData(oldp+18,(__Vtemp_7),544);
    bufp->fullIData(oldp+35,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[0]),32);
    bufp->fullIData(oldp+36,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[1]),32);
    bufp->fullIData(oldp+37,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[2]),32);
    bufp->fullIData(oldp+38,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[3]),32);
    bufp->fullIData(oldp+39,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[4]),32);
    bufp->fullIData(oldp+40,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[5]),32);
    bufp->fullIData(oldp+41,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[6]),32);
    bufp->fullIData(oldp+42,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[7]),32);
    bufp->fullIData(oldp+43,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[8]),32);
    bufp->fullIData(oldp+44,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[9]),32);
    bufp->fullIData(oldp+45,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[10]),32);
    bufp->fullIData(oldp+46,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[11]),32);
    bufp->fullIData(oldp+47,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[12]),32);
    bufp->fullIData(oldp+48,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[13]),32);
    bufp->fullIData(oldp+49,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[14]),32);
    bufp->fullIData(oldp+50,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[15]),32);
    bufp->fullIData(oldp+51,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[0]),32);
    bufp->fullIData(oldp+52,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[1]),32);
    bufp->fullIData(oldp+53,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[2]),32);
    bufp->fullIData(oldp+54,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[3]),32);
    bufp->fullIData(oldp+55,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[4]),32);
    bufp->fullIData(oldp+56,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[5]),32);
    bufp->fullIData(oldp+57,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[6]),32);
    bufp->fullIData(oldp+58,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[7]),32);
    bufp->fullIData(oldp+59,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[8]),32);
    bufp->fullIData(oldp+60,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[9]),32);
    bufp->fullIData(oldp+61,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[10]),32);
    bufp->fullIData(oldp+62,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[11]),32);
    bufp->fullIData(oldp+63,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[12]),32);
    bufp->fullIData(oldp+64,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[13]),32);
    bufp->fullIData(oldp+65,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[14]),32);
    bufp->fullIData(oldp+66,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[15]),32);
    bufp->fullBit(oldp+67,(vlSelfRef.TB_WASM_TOP__DOT__INSTR_ERROR));
    bufp->fullBit(oldp+68,(vlSelfRef.TB_WASM_TOP__DOT__instr_finish));
    bufp->fullBit(oldp+69,((0xfU == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer))));
    bufp->fullIData(oldp+70,(vlSelfRef.TB_WASM_TOP__DOT__clk_cnt),32);
    bufp->fullIData(oldp+71,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUResult),32);
    bufp->fullBit(oldp+72,((0U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer))));
    bufp->fullWData(oldp+73,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr),72);
    bufp->fullBit(oldp+76,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr_vld));
    bufp->fullCData(oldp+77,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone),8);
    bufp->fullBit(oldp+78,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__shift_vld));
    bufp->fullCData(oldp+79,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num),4);
    bufp->fullCData(oldp+80,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select),2);
    bufp->fullCData(oldp+81,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl),5);
    bufp->fullBit(oldp+82,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__store_en));
    bufp->fullBit(oldp+83,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_en));
    bufp->fullBit(oldp+84,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__local_set));
    bufp->fullBit(oldp+85,(((0x20U == (0xffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) 
                            & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1))));
    bufp->fullIData(oldp+86,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode),32);
    bufp->fullCData(oldp+87,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer),8);
    bufp->fullBit(oldp+88,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en));
    bufp->fullCData(oldp+89,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_addr),8);
    bufp->fullBit(oldp+90,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__jump_hlt));
    bufp->fullBit(oldp+91,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_vld));
    bufp->fullBit(oldp+92,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num));
    bufp->fullWData(oldp+93,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg),512);
    bufp->fullIData(oldp+109,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U]),32);
    bufp->fullIData(oldp+110,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset),32);
    bufp->fullIData(oldp+111,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[2U]),32);
    bufp->fullBit(oldp+112,((1U & (IData)((1ULL & (
                                                   ((1U 
                                                     & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                                                     ? 
                                                    (1ULL 
                                                     + 
                                                     ((QData)((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset)) 
                                                      + 
                                                      (~ (QData)((IData)(
                                                                         vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U])))))
                                                     : 
                                                    ((QData)((IData)(
                                                                     vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U])) 
                                                     + (QData)((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset)))) 
                                                   >> 0x20U))))));
    bufp->fullIData(oldp+113,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__sum),32);
    bufp->fullIData(oldp+114,((0U == vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U])),32);
    bufp->fullIData(oldp+115,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__eq),32);
    bufp->fullIData(oldp+116,((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U] 
                               != vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset)),32);
    bufp->fullIData(oldp+117,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_u),32);
    bufp->fullIData(oldp+118,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_u),32);
    bufp->fullIData(oldp+119,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_s),32);
    bufp->fullIData(oldp+120,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_s),32);
    bufp->fullCData(oldp+121,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state),2);
    bufp->fullQData(oldp+122,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in),36);
    bufp->fullCData(oldp+124,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt),3);
    bufp->fullCData(oldp+125,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type),8);
    bufp->fullIData(oldp+126,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_length),32);
    bufp->fullIData(oldp+127,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_num),32);
    bufp->fullIData(oldp+128,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt),32);
    bufp->fullBit(oldp+129,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__type_decode));
    bufp->fullCData(oldp+130,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[0]),4);
    bufp->fullCData(oldp+131,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[1]),4);
    bufp->fullCData(oldp+132,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[2]),4);
    bufp->fullCData(oldp+133,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[3]),4);
    bufp->fullCData(oldp+134,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[4]),4);
    bufp->fullCData(oldp+135,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[5]),4);
    bufp->fullCData(oldp+136,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[6]),4);
    bufp->fullCData(oldp+137,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[7]),4);
    bufp->fullCData(oldp+138,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[8]),4);
    bufp->fullCData(oldp+139,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[9]),4);
    bufp->fullCData(oldp+140,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[10]),4);
    bufp->fullCData(oldp+141,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[11]),4);
    bufp->fullCData(oldp+142,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[12]),4);
    bufp->fullCData(oldp+143,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[13]),4);
    bufp->fullCData(oldp+144,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[14]),4);
    bufp->fullCData(oldp+145,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[15]),4);
    bufp->fullCData(oldp+146,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[16]),4);
    bufp->fullCData(oldp+147,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[17]),4);
    bufp->fullCData(oldp+148,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[18]),4);
    bufp->fullCData(oldp+149,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[19]),4);
    bufp->fullCData(oldp+150,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[20]),4);
    bufp->fullCData(oldp+151,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[21]),4);
    bufp->fullCData(oldp+152,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[22]),4);
    bufp->fullCData(oldp+153,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[23]),4);
    bufp->fullCData(oldp+154,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[24]),4);
    bufp->fullCData(oldp+155,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[25]),4);
    bufp->fullCData(oldp+156,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[26]),4);
    bufp->fullCData(oldp+157,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[27]),4);
    bufp->fullCData(oldp+158,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[28]),4);
    bufp->fullCData(oldp+159,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[29]),4);
    bufp->fullCData(oldp+160,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[30]),4);
    bufp->fullCData(oldp+161,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[31]),4);
    bufp->fullCData(oldp+162,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[0]),4);
    bufp->fullCData(oldp+163,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[1]),4);
    bufp->fullCData(oldp+164,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[2]),4);
    bufp->fullCData(oldp+165,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[3]),4);
    bufp->fullCData(oldp+166,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[4]),4);
    bufp->fullCData(oldp+167,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[5]),4);
    bufp->fullCData(oldp+168,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[6]),4);
    bufp->fullCData(oldp+169,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[7]),4);
    bufp->fullCData(oldp+170,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[8]),4);
    bufp->fullCData(oldp+171,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[9]),4);
    bufp->fullCData(oldp+172,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[10]),4);
    bufp->fullCData(oldp+173,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[11]),4);
    bufp->fullCData(oldp+174,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[12]),4);
    bufp->fullCData(oldp+175,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[13]),4);
    bufp->fullCData(oldp+176,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[14]),4);
    bufp->fullCData(oldp+177,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[15]),4);
    bufp->fullCData(oldp+178,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[16]),4);
    bufp->fullCData(oldp+179,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[17]),4);
    bufp->fullCData(oldp+180,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[18]),4);
    bufp->fullCData(oldp+181,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[19]),4);
    bufp->fullCData(oldp+182,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[20]),4);
    bufp->fullCData(oldp+183,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[21]),4);
    bufp->fullCData(oldp+184,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[22]),4);
    bufp->fullCData(oldp+185,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[23]),4);
    bufp->fullCData(oldp+186,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[24]),4);
    bufp->fullCData(oldp+187,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[25]),4);
    bufp->fullCData(oldp+188,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[26]),4);
    bufp->fullCData(oldp+189,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[27]),4);
    bufp->fullCData(oldp+190,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[28]),4);
    bufp->fullCData(oldp+191,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[29]),4);
    bufp->fullCData(oldp+192,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[30]),4);
    bufp->fullCData(oldp+193,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[31]),4);
    bufp->fullCData(oldp+194,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_reg),5);
    bufp->fullCData(oldp+195,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_left),5);
    bufp->fullWData(oldp+196,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[0]),72);
    bufp->fullWData(oldp+199,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[1]),72);
    bufp->fullWData(oldp+202,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[2]),72);
    bufp->fullWData(oldp+205,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[3]),72);
    bufp->fullWData(oldp+208,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[4]),72);
    bufp->fullWData(oldp+211,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[5]),72);
    bufp->fullWData(oldp+214,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[6]),72);
    bufp->fullWData(oldp+217,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[7]),72);
    bufp->fullWData(oldp+220,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[8]),72);
    bufp->fullWData(oldp+223,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[9]),72);
    bufp->fullWData(oldp+226,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[10]),72);
    bufp->fullWData(oldp+229,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[11]),72);
    bufp->fullWData(oldp+232,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[12]),72);
    bufp->fullWData(oldp+235,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[13]),72);
    bufp->fullWData(oldp+238,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[14]),72);
    bufp->fullWData(oldp+241,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[15]),72);
    bufp->fullCData(oldp+244,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[0]),8);
    bufp->fullCData(oldp+245,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[1]),8);
    bufp->fullCData(oldp+246,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[2]),8);
    bufp->fullCData(oldp+247,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[3]),8);
    bufp->fullCData(oldp+248,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[4]),8);
    bufp->fullCData(oldp+249,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[5]),8);
    bufp->fullCData(oldp+250,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[6]),8);
    bufp->fullCData(oldp+251,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[7]),8);
    bufp->fullCData(oldp+252,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[8]),8);
    bufp->fullCData(oldp+253,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[9]),8);
    bufp->fullCData(oldp+254,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[10]),8);
    bufp->fullCData(oldp+255,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[11]),8);
    bufp->fullCData(oldp+256,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[12]),8);
    bufp->fullCData(oldp+257,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[13]),8);
    bufp->fullCData(oldp+258,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[14]),8);
    bufp->fullCData(oldp+259,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[15]),8);
    bufp->fullCData(oldp+260,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[16]),8);
    bufp->fullCData(oldp+261,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[17]),8);
    bufp->fullCData(oldp+262,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[18]),8);
    bufp->fullCData(oldp+263,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[19]),8);
    bufp->fullCData(oldp+264,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[20]),8);
    bufp->fullCData(oldp+265,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[21]),8);
    bufp->fullCData(oldp+266,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[22]),8);
    bufp->fullCData(oldp+267,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[23]),8);
    bufp->fullCData(oldp+268,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[24]),8);
    bufp->fullCData(oldp+269,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[25]),8);
    bufp->fullCData(oldp+270,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[26]),8);
    bufp->fullCData(oldp+271,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[27]),8);
    bufp->fullCData(oldp+272,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[28]),8);
    bufp->fullCData(oldp+273,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[29]),8);
    bufp->fullCData(oldp+274,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[30]),8);
    bufp->fullCData(oldp+275,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[31]),8);
    bufp->fullCData(oldp+276,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__start_function_idx),5);
    bufp->fullCData(oldp+277,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list
                              [0U]),8);
    bufp->fullCData(oldp+278,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list
                              [1U]),8);
    bufp->fullBit(oldp+279,((9U > (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_left))));
    bufp->fullBit(oldp+280,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read));
    bufp->fullCData(oldp+281,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr),4);
    bufp->fullBit(oldp+282,((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                           >> 7U)))));
    bufp->fullBit(oldp+283,((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                           >> 0xfU)))));
    bufp->fullBit(oldp+284,((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                           >> 0x17U)))));
    bufp->fullBit(oldp+285,((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                           >> 0x1fU)))));
    bufp->fullCData(oldp+286,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[0]),7);
    bufp->fullCData(oldp+287,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[1]),7);
    bufp->fullCData(oldp+288,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[2]),7);
    bufp->fullCData(oldp+289,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[3]),7);
    bufp->fullCData(oldp+290,((0xfU & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                               >> 0x20U)))),4);
    bufp->fullBit(oldp+291,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__instr_finish));
    bufp->fullCData(oldp+292,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer),8);
    bufp->fullBit(oldp+293,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__working));
    bufp->fullBit(oldp+294,(((~ ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__instr_finish) 
                                 | (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__jump_hlt))) 
                             & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__working))));
    bufp->fullCData(oldp+295,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__write_pointer),8);
    bufp->fullWData(oldp+296,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop),512);
    bufp->fullCData(oldp+312,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer),4);
    bufp->fullCData(oldp+313,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop),4);
    bufp->fullCData(oldp+314,((0xfU & ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num)
                                        ? ((0xfU > (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop))
                                            ? ((IData)(1U) 
                                               + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop))
                                            : 0xfU)
                                        : (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop)))),4);
    bufp->fullBit(oldp+315,(vlSelfRef.TB_WASM_TOP__DOT__clk));
    bufp->fullBit(oldp+316,(vlSelfRef.TB_WASM_TOP__DOT__rst_n));
    bufp->fullIData(oldp+317,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_data),32);
    bufp->fullIData(oldp+318,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram
                              [(0xfU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode)]),32);
}
