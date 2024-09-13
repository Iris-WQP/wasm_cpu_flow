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
    VlWide<3>/*95:0*/ __Vtemp_8;
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
        bufp->chgCData(oldp+76,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone),4);
        bufp->chgBit(oldp+77,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__shift_vld));
        bufp->chgCData(oldp+78,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num),2);
        bufp->chgCData(oldp+79,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select),2);
        bufp->chgCData(oldp+80,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl),5);
        bufp->chgBit(oldp+81,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__store_en));
        bufp->chgBit(oldp+82,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_en));
        bufp->chgBit(oldp+83,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__local_set));
        bufp->chgBit(oldp+84,(((0x20U == (0xffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) 
                               & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1))));
        bufp->chgIData(oldp+85,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode),32);
        bufp->chgBit(oldp+86,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_vld));
        bufp->chgBit(oldp+87,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num));
        __Vtemp_8[0U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U];
        __Vtemp_8[1U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[1U];
        __Vtemp_8[2U] = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[2U];
        bufp->chgWData(oldp+88,(__Vtemp_8),96);
        bufp->chgIData(oldp+91,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U]),32);
        bufp->chgIData(oldp+92,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset),32);
        bufp->chgIData(oldp+93,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[2U]),32);
        bufp->chgBit(oldp+94,((1U & (IData)((1ULL & 
                                             (((1U 
                                                & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                                                ? (1ULL 
                                                   + 
                                                   ((QData)((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset)) 
                                                    + 
                                                    (~ (QData)((IData)(
                                                                       vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U])))))
                                                : ((QData)((IData)(
                                                                   vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U])) 
                                                   + (QData)((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset)))) 
                                              >> 0x20U))))));
        bufp->chgIData(oldp+95,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__sum),32);
        bufp->chgIData(oldp+96,((0U == vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U])),32);
        bufp->chgIData(oldp+97,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__eq),32);
        bufp->chgIData(oldp+98,((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U] 
                                 != vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset)),32);
        bufp->chgIData(oldp+99,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_u),32);
        bufp->chgIData(oldp+100,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_u),32);
        bufp->chgIData(oldp+101,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_s),32);
        bufp->chgIData(oldp+102,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_s),32);
        bufp->chgCData(oldp+103,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state),2);
        bufp->chgQData(oldp+104,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in),36);
        bufp->chgCData(oldp+106,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt),3);
        bufp->chgCData(oldp+107,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type),8);
        bufp->chgIData(oldp+108,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_length),32);
        bufp->chgIData(oldp+109,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_num),32);
        bufp->chgIData(oldp+110,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt),32);
        bufp->chgBit(oldp+111,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__type_decode));
        bufp->chgCData(oldp+112,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[0]),8);
        bufp->chgCData(oldp+113,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[1]),8);
        bufp->chgCData(oldp+114,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[2]),8);
        bufp->chgCData(oldp+115,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[3]),8);
        bufp->chgCData(oldp+116,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[4]),8);
        bufp->chgCData(oldp+117,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[5]),8);
        bufp->chgCData(oldp+118,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[6]),8);
        bufp->chgCData(oldp+119,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[7]),8);
        bufp->chgCData(oldp+120,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[0]),8);
        bufp->chgCData(oldp+121,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[1]),8);
        bufp->chgCData(oldp+122,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[2]),8);
        bufp->chgCData(oldp+123,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[3]),8);
        bufp->chgCData(oldp+124,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[4]),8);
        bufp->chgCData(oldp+125,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[5]),8);
        bufp->chgCData(oldp+126,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[6]),8);
        bufp->chgCData(oldp+127,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[7]),8);
        bufp->chgCData(oldp+128,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_reg),8);
        bufp->chgWData(oldp+129,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[0]),72);
        bufp->chgWData(oldp+132,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[1]),72);
        bufp->chgWData(oldp+135,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[2]),72);
        bufp->chgWData(oldp+138,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[3]),72);
        bufp->chgWData(oldp+141,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[4]),72);
        bufp->chgWData(oldp+144,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[5]),72);
        bufp->chgWData(oldp+147,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[6]),72);
        bufp->chgWData(oldp+150,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[7]),72);
        bufp->chgWData(oldp+153,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[8]),72);
        bufp->chgWData(oldp+156,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[9]),72);
        bufp->chgWData(oldp+159,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[10]),72);
        bufp->chgWData(oldp+162,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[11]),72);
        bufp->chgWData(oldp+165,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[12]),72);
        bufp->chgWData(oldp+168,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[13]),72);
        bufp->chgWData(oldp+171,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[14]),72);
        bufp->chgWData(oldp+174,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[15]),72);
        bufp->chgCData(oldp+177,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg
                                 [0U]),8);
        bufp->chgCData(oldp+178,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg
                                 [0U]),8);
        bufp->chgWData(oldp+179,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list
                                 [0U]),72);
        bufp->chgCData(oldp+182,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr),4);
        bufp->chgBit(oldp+183,((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                              >> 7U)))));
        bufp->chgBit(oldp+184,((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                              >> 0xfU)))));
        bufp->chgBit(oldp+185,((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                              >> 0x17U)))));
        bufp->chgBit(oldp+186,((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                              >> 0x1fU)))));
        bufp->chgCData(oldp+187,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[0]),7);
        bufp->chgCData(oldp+188,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[1]),7);
        bufp->chgCData(oldp+189,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[2]),7);
        bufp->chgCData(oldp+190,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[3]),7);
        bufp->chgCData(oldp+191,((0xfU & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                                  >> 0x20U)))),4);
        bufp->chgBit(oldp+192,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__instr_finish));
        bufp->chgBit(oldp+193,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__working));
        bufp->chgBit(oldp+194,(((~ (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__instr_finish)) 
                                & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__working))));
        bufp->chgCData(oldp+195,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer),6);
        bufp->chgCData(oldp+196,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__write_pointer),6);
        bufp->chgWData(oldp+197,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg),512);
        bufp->chgWData(oldp+213,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop),512);
        bufp->chgCData(oldp+229,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer),4);
        bufp->chgCData(oldp+230,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop),4);
        bufp->chgCData(oldp+231,((0xfU & ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num)
                                           ? ((0xfU 
                                               > (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop))
                                               ? ((IData)(1U) 
                                                  + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop))
                                               : 0xfU)
                                           : (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop)))),4);
    }
    bufp->chgBit(oldp+232,(vlSelfRef.TB_WASM_TOP__DOT__clk));
    bufp->chgBit(oldp+233,(vlSelfRef.TB_WASM_TOP__DOT__rst_n));
    bufp->chgIData(oldp+234,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_data),32);
    bufp->chgIData(oldp+235,(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram
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
