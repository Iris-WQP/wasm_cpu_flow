// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VTB_WASM_TOP__Syms.h"


void VTB_WASM_TOP___024root__trace_chg_0_sub_0(VTB_WASM_TOP___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void VTB_WASM_TOP___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root__trace_chg_0\n"); );
    // Init
    VTB_WASM_TOP___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VTB_WASM_TOP___024root*>(voidSelf);
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    VTB_WASM_TOP___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

void VTB_WASM_TOP___024root__trace_chg_0_sub_0(VTB_WASM_TOP___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root__trace_chg_0_sub_0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    VlWide<16>/*511:0*/ __Vtemp_4;
    VlWide<17>/*543:0*/ __Vtemp_7;
    // Body
    if (VL_UNLIKELY((((vlSelfRef.__Vm_traceActivity
                       [1U] | vlSelfRef.__Vm_traceActivity
                       [3U]) | vlSelfRef.__Vm_traceActivity
                      [4U]) | vlSelfRef.__Vm_traceActivity
                     [5U]))) {
        bufp->chgIData(oldp+0,(((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select))
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
        bufp->chgWData(oldp+1,(__Vtemp_4),512);
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
        bufp->chgWData(oldp+17,(__Vtemp_7),544);
    }
    if (VL_UNLIKELY((vlSelfRef.__Vm_traceActivity[1U] 
                     | vlSelfRef.__Vm_traceActivity
                     [4U]))) {
        bufp->chgIData(oldp+34,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[0]),32);
        bufp->chgIData(oldp+35,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[1]),32);
        bufp->chgIData(oldp+36,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[2]),32);
        bufp->chgIData(oldp+37,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[3]),32);
        bufp->chgIData(oldp+38,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[4]),32);
        bufp->chgIData(oldp+39,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[5]),32);
        bufp->chgIData(oldp+40,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[6]),32);
        bufp->chgIData(oldp+41,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[7]),32);
        bufp->chgIData(oldp+42,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[8]),32);
        bufp->chgIData(oldp+43,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[9]),32);
        bufp->chgIData(oldp+44,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[10]),32);
        bufp->chgIData(oldp+45,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[11]),32);
        bufp->chgIData(oldp+46,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[12]),32);
        bufp->chgIData(oldp+47,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[13]),32);
        bufp->chgIData(oldp+48,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[14]),32);
        bufp->chgIData(oldp+49,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[15]),32);
    }
    if (VL_UNLIKELY(vlSelfRef.__Vm_traceActivity[2U])) {
        bufp->chgIData(oldp+50,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[0]),32);
        bufp->chgIData(oldp+51,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[1]),32);
        bufp->chgIData(oldp+52,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[2]),32);
        bufp->chgIData(oldp+53,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[3]),32);
        bufp->chgIData(oldp+54,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[4]),32);
        bufp->chgIData(oldp+55,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[5]),32);
        bufp->chgIData(oldp+56,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[6]),32);
        bufp->chgIData(oldp+57,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[7]),32);
        bufp->chgIData(oldp+58,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[8]),32);
        bufp->chgIData(oldp+59,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[9]),32);
        bufp->chgIData(oldp+60,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[10]),32);
        bufp->chgIData(oldp+61,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[11]),32);
        bufp->chgIData(oldp+62,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[12]),32);
        bufp->chgIData(oldp+63,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[13]),32);
        bufp->chgIData(oldp+64,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[14]),32);
        bufp->chgIData(oldp+65,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[15]),32);
    }
    if (VL_UNLIKELY(vlSelfRef.__Vm_traceActivity[3U])) {
        bufp->chgBit(oldp+66,(vlSelfRef.TB_WASM_TOP__DOT__INSTR_ERROR));
        bufp->chgBit(oldp+67,(vlSelfRef.TB_WASM_TOP__DOT__instr_finish));
        bufp->chgBit(oldp+68,((0xfU == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer))));
        bufp->chgIData(oldp+69,(vlSelfRef.TB_WASM_TOP__DOT__clk_cnt),32);
        bufp->chgIData(oldp+70,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUResult),32);
        bufp->chgBit(oldp+71,((0U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer))));
        bufp->chgWData(oldp+72,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr),72);
        bufp->chgBit(oldp+75,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr_vld));
        bufp->chgCData(oldp+76,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone),8);
        bufp->chgBit(oldp+77,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__shift_vld));
        bufp->chgCData(oldp+78,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num),4);
        bufp->chgCData(oldp+79,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select),2);
        bufp->chgCData(oldp+80,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl),5);
        bufp->chgBit(oldp+81,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__store_en));
        bufp->chgBit(oldp+82,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_en));
        bufp->chgBit(oldp+83,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__local_set));
        bufp->chgBit(oldp+84,(((0x20U == (0xffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) 
                               & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1))));
        bufp->chgIData(oldp+85,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode),32);
        bufp->chgCData(oldp+86,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer),8);
        bufp->chgBit(oldp+87,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en));
        bufp->chgCData(oldp+88,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_addr),8);
        bufp->chgBit(oldp+89,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__jump_hlt));
        bufp->chgBit(oldp+90,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_vld));
        bufp->chgBit(oldp+91,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num));
        bufp->chgWData(oldp+92,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg),512);
        bufp->chgIData(oldp+108,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U]),32);
        bufp->chgIData(oldp+109,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset),32);
        bufp->chgIData(oldp+110,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[2U]),32);
        bufp->chgBit(oldp+111,((1U & (IData)((1ULL 
                                              & (((1U 
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
        bufp->chgIData(oldp+112,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__sum),32);
        bufp->chgIData(oldp+113,((0U == vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U])),32);
        bufp->chgIData(oldp+114,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__eq),32);
        bufp->chgIData(oldp+115,((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U] 
                                  != vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset)),32);
        bufp->chgIData(oldp+116,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_u),32);
        bufp->chgIData(oldp+117,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_u),32);
        bufp->chgIData(oldp+118,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_s),32);
        bufp->chgIData(oldp+119,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_s),32);
        bufp->chgCData(oldp+120,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state),2);
        bufp->chgQData(oldp+121,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in),36);
        bufp->chgCData(oldp+123,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt),3);
        bufp->chgCData(oldp+124,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type),8);
        bufp->chgIData(oldp+125,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_length),32);
        bufp->chgIData(oldp+126,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_num),32);
        bufp->chgIData(oldp+127,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt),32);
        bufp->chgBit(oldp+128,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__type_decode));
        bufp->chgCData(oldp+129,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[0]),4);
        bufp->chgCData(oldp+130,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[1]),4);
        bufp->chgCData(oldp+131,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[2]),4);
        bufp->chgCData(oldp+132,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[3]),4);
        bufp->chgCData(oldp+133,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[4]),4);
        bufp->chgCData(oldp+134,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[5]),4);
        bufp->chgCData(oldp+135,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[6]),4);
        bufp->chgCData(oldp+136,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[7]),4);
        bufp->chgCData(oldp+137,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[8]),4);
        bufp->chgCData(oldp+138,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[9]),4);
        bufp->chgCData(oldp+139,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[10]),4);
        bufp->chgCData(oldp+140,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[11]),4);
        bufp->chgCData(oldp+141,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[12]),4);
        bufp->chgCData(oldp+142,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[13]),4);
        bufp->chgCData(oldp+143,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[14]),4);
        bufp->chgCData(oldp+144,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[15]),4);
        bufp->chgCData(oldp+145,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[16]),4);
        bufp->chgCData(oldp+146,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[17]),4);
        bufp->chgCData(oldp+147,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[18]),4);
        bufp->chgCData(oldp+148,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[19]),4);
        bufp->chgCData(oldp+149,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[20]),4);
        bufp->chgCData(oldp+150,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[21]),4);
        bufp->chgCData(oldp+151,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[22]),4);
        bufp->chgCData(oldp+152,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[23]),4);
        bufp->chgCData(oldp+153,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[24]),4);
        bufp->chgCData(oldp+154,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[25]),4);
        bufp->chgCData(oldp+155,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[26]),4);
        bufp->chgCData(oldp+156,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[27]),4);
        bufp->chgCData(oldp+157,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[28]),4);
        bufp->chgCData(oldp+158,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[29]),4);
        bufp->chgCData(oldp+159,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[30]),4);
        bufp->chgCData(oldp+160,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[31]),4);
        bufp->chgCData(oldp+161,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[0]),4);
        bufp->chgCData(oldp+162,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[1]),4);
        bufp->chgCData(oldp+163,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[2]),4);
        bufp->chgCData(oldp+164,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[3]),4);
        bufp->chgCData(oldp+165,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[4]),4);
        bufp->chgCData(oldp+166,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[5]),4);
        bufp->chgCData(oldp+167,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[6]),4);
        bufp->chgCData(oldp+168,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[7]),4);
        bufp->chgCData(oldp+169,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[8]),4);
        bufp->chgCData(oldp+170,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[9]),4);
        bufp->chgCData(oldp+171,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[10]),4);
        bufp->chgCData(oldp+172,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[11]),4);
        bufp->chgCData(oldp+173,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[12]),4);
        bufp->chgCData(oldp+174,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[13]),4);
        bufp->chgCData(oldp+175,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[14]),4);
        bufp->chgCData(oldp+176,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[15]),4);
        bufp->chgCData(oldp+177,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[16]),4);
        bufp->chgCData(oldp+178,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[17]),4);
        bufp->chgCData(oldp+179,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[18]),4);
        bufp->chgCData(oldp+180,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[19]),4);
        bufp->chgCData(oldp+181,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[20]),4);
        bufp->chgCData(oldp+182,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[21]),4);
        bufp->chgCData(oldp+183,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[22]),4);
        bufp->chgCData(oldp+184,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[23]),4);
        bufp->chgCData(oldp+185,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[24]),4);
        bufp->chgCData(oldp+186,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[25]),4);
        bufp->chgCData(oldp+187,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[26]),4);
        bufp->chgCData(oldp+188,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[27]),4);
        bufp->chgCData(oldp+189,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[28]),4);
        bufp->chgCData(oldp+190,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[29]),4);
        bufp->chgCData(oldp+191,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[30]),4);
        bufp->chgCData(oldp+192,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[31]),4);
        bufp->chgCData(oldp+193,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_reg),5);
        bufp->chgCData(oldp+194,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_left),5);
        bufp->chgWData(oldp+195,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[0]),72);
        bufp->chgWData(oldp+198,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[1]),72);
        bufp->chgWData(oldp+201,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[2]),72);
        bufp->chgWData(oldp+204,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[3]),72);
        bufp->chgWData(oldp+207,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[4]),72);
        bufp->chgWData(oldp+210,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[5]),72);
        bufp->chgWData(oldp+213,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[6]),72);
        bufp->chgWData(oldp+216,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[7]),72);
        bufp->chgWData(oldp+219,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[8]),72);
        bufp->chgWData(oldp+222,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[9]),72);
        bufp->chgWData(oldp+225,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[10]),72);
        bufp->chgWData(oldp+228,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[11]),72);
        bufp->chgWData(oldp+231,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[12]),72);
        bufp->chgWData(oldp+234,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[13]),72);
        bufp->chgWData(oldp+237,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[14]),72);
        bufp->chgWData(oldp+240,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[15]),72);
        bufp->chgCData(oldp+243,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[0]),8);
        bufp->chgCData(oldp+244,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[1]),8);
        bufp->chgCData(oldp+245,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[2]),8);
        bufp->chgCData(oldp+246,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[3]),8);
        bufp->chgCData(oldp+247,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[4]),8);
        bufp->chgCData(oldp+248,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[5]),8);
        bufp->chgCData(oldp+249,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[6]),8);
        bufp->chgCData(oldp+250,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[7]),8);
        bufp->chgCData(oldp+251,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[8]),8);
        bufp->chgCData(oldp+252,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[9]),8);
        bufp->chgCData(oldp+253,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[10]),8);
        bufp->chgCData(oldp+254,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[11]),8);
        bufp->chgCData(oldp+255,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[12]),8);
        bufp->chgCData(oldp+256,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[13]),8);
        bufp->chgCData(oldp+257,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[14]),8);
        bufp->chgCData(oldp+258,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[15]),8);
        bufp->chgCData(oldp+259,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[16]),8);
        bufp->chgCData(oldp+260,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[17]),8);
        bufp->chgCData(oldp+261,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[18]),8);
        bufp->chgCData(oldp+262,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[19]),8);
        bufp->chgCData(oldp+263,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[20]),8);
        bufp->chgCData(oldp+264,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[21]),8);
        bufp->chgCData(oldp+265,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[22]),8);
        bufp->chgCData(oldp+266,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[23]),8);
        bufp->chgCData(oldp+267,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[24]),8);
        bufp->chgCData(oldp+268,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[25]),8);
        bufp->chgCData(oldp+269,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[26]),8);
        bufp->chgCData(oldp+270,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[27]),8);
        bufp->chgCData(oldp+271,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[28]),8);
        bufp->chgCData(oldp+272,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[29]),8);
        bufp->chgCData(oldp+273,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[30]),8);
        bufp->chgCData(oldp+274,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[31]),8);
        bufp->chgCData(oldp+275,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__start_function_idx),5);
        bufp->chgCData(oldp+276,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list
                                 [0U]),8);
        bufp->chgCData(oldp+277,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list
                                 [1U]),8);
        bufp->chgBit(oldp+278,((9U > (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_left))));
        bufp->chgBit(oldp+279,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read));
        bufp->chgCData(oldp+280,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr),4);
        bufp->chgBit(oldp+281,((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                              >> 7U)))));
        bufp->chgBit(oldp+282,((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                              >> 0xfU)))));
        bufp->chgBit(oldp+283,((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                              >> 0x17U)))));
        bufp->chgBit(oldp+284,((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                              >> 0x1fU)))));
        bufp->chgCData(oldp+285,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[0]),7);
        bufp->chgCData(oldp+286,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[1]),7);
        bufp->chgCData(oldp+287,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[2]),7);
        bufp->chgCData(oldp+288,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[3]),7);
        bufp->chgCData(oldp+289,((0xfU & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                                  >> 0x20U)))),4);
        bufp->chgBit(oldp+290,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__instr_finish));
        bufp->chgCData(oldp+291,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer),8);
        bufp->chgBit(oldp+292,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__working));
        bufp->chgBit(oldp+293,(((~ ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__instr_finish) 
                                    | (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__jump_hlt))) 
                                & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__working))));
        bufp->chgCData(oldp+294,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__write_pointer),8);
        bufp->chgWData(oldp+295,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop),512);
        bufp->chgCData(oldp+311,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer),4);
        bufp->chgCData(oldp+312,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop),4);
        bufp->chgCData(oldp+313,((0xfU & ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num)
                                           ? ((0xfU 
                                               > (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop))
                                               ? ((IData)(1U) 
                                                  + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop))
                                               : 0xfU)
                                           : (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop)))),4);
    }
    bufp->chgBit(oldp+314,(vlSelfRef.TB_WASM_TOP__DOT__clk));
    bufp->chgBit(oldp+315,(vlSelfRef.TB_WASM_TOP__DOT__rst_n));
    bufp->chgIData(oldp+316,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_data),32);
    bufp->chgIData(oldp+317,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram
                             [(0xfU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode)]),32);
}

void VTB_WASM_TOP___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root__trace_cleanup\n"); );
    // Init
    VTB_WASM_TOP___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VTB_WASM_TOP___024root*>(voidSelf);
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[2U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[3U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[4U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[5U] = 0U;
}
