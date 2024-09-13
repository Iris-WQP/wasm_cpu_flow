// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VWASM_TOP.h for the primary calling header

#include "VWASM_TOP__pch.h"
#include "VWASM_TOP___024root.h"

VL_ATTR_COLD void VWASM_TOP___024root___eval_static(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___eval_static\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void VWASM_TOP___024root___eval_initial__TOP(VWASM_TOP___024root* vlSelf);
VL_ATTR_COLD void VWASM_TOP___024root____Vm_traceActivitySetAll(VWASM_TOP___024root* vlSelf);

VL_ATTR_COLD void VWASM_TOP___024root___eval_initial(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___eval_initial\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    VWASM_TOP___024root___eval_initial__TOP(vlSelf);
    VWASM_TOP___024root____Vm_traceActivitySetAll(vlSelf);
    vlSelfRef.__Vtrigprevexpr___TOP__i_clk__0 = vlSelfRef.i_clk;
    vlSelfRef.__Vtrigprevexpr___TOP__i_rst_n__0 = vlSelfRef.i_rst_n;
}

VL_ATTR_COLD void VWASM_TOP___024root___eval_initial__TOP(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___eval_initial__TOP\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[0U] = 0xaU;
    vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[1U] = 6U;
}

VL_ATTR_COLD void VWASM_TOP___024root___eval_final(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___eval_final\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VWASM_TOP___024root___dump_triggers__stl(VWASM_TOP___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool VWASM_TOP___024root___eval_phase__stl(VWASM_TOP___024root* vlSelf);

VL_ATTR_COLD void VWASM_TOP___024root___eval_settle(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___eval_settle\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VstlIterCount;
    CData/*0:0*/ __VstlContinue;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        if (VL_UNLIKELY((0x64U < __VstlIterCount))) {
#ifdef VL_DEBUG
            VWASM_TOP___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("src/WASM_TOP.v", 11, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (VWASM_TOP___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelfRef.__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VWASM_TOP___024root___dump_triggers__stl(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___dump_triggers__stl\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VstlTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void VWASM_TOP___024root___stl_sequent__TOP__0(VWASM_TOP___024root* vlSelf);

VL_ATTR_COLD void VWASM_TOP___024root___eval_stl(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___eval_stl\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        VWASM_TOP___024root___stl_sequent__TOP__0(vlSelf);
        VWASM_TOP___024root____Vm_traceActivitySetAll(vlSelf);
    }
}

VL_ATTR_COLD void VWASM_TOP___024root___stl_sequent__TOP__0(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___stl_sequent__TOP__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ WASM_TOP__DOT__u_alu__DOT____VdfgRegularize_hca53fb73_0_0;
    WASM_TOP__DOT__u_alu__DOT____VdfgRegularize_hca53fb73_0_0 = 0;
    // Body
    vlSelfRef.o_stack_full = (0xfU == (IData)(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer));
    vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__instr_finish 
        = ((IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer) 
           == (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__write_pointer));
    vlSelfRef.WASM_TOP__DOT__Instr_vld = vlSelfRef.WASM_TOP__DOT__shift_vld;
    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1 
        = ((0xaU == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type)) 
           & (3U == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state)));
    if (vlSelfRef.WASM_TOP__DOT__shift_vld) {
        vlSelfRef.WASM_TOP__DOT__Instr[0U] = ((0xffffff00U 
                                               & vlSelfRef.WASM_TOP__DOT__Instr[0U]) 
                                              | vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__bram
                                              [vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer]);
        vlSelfRef.WASM_TOP__DOT__Instr[0U] = ((0xffff00ffU 
                                               & vlSelfRef.WASM_TOP__DOT__Instr[0U]) 
                                              | (vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__bram
                                                 [(0x3fU 
                                                   & ((IData)(1U) 
                                                      + (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer)))] 
                                                 << 8U));
        vlSelfRef.WASM_TOP__DOT__Instr[0U] = ((0xff00ffffU 
                                               & vlSelfRef.WASM_TOP__DOT__Instr[0U]) 
                                              | (vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__bram
                                                 [(0x3fU 
                                                   & ((IData)(2U) 
                                                      + (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer)))] 
                                                 << 0x10U));
        vlSelfRef.WASM_TOP__DOT__Instr[0U] = ((0xffffffU 
                                               & vlSelfRef.WASM_TOP__DOT__Instr[0U]) 
                                              | (vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__bram
                                                 [(0x3fU 
                                                   & ((IData)(3U) 
                                                      + (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer)))] 
                                                 << 0x18U));
        vlSelfRef.WASM_TOP__DOT__Instr[1U] = ((0xffffff00U 
                                               & vlSelfRef.WASM_TOP__DOT__Instr[1U]) 
                                              | vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__bram
                                              [(0x3fU 
                                                & ((IData)(4U) 
                                                   + (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer)))]);
        vlSelfRef.WASM_TOP__DOT__Instr[1U] = ((0xffff00ffU 
                                               & vlSelfRef.WASM_TOP__DOT__Instr[1U]) 
                                              | (vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__bram
                                                 [(0x3fU 
                                                   & ((IData)(5U) 
                                                      + (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer)))] 
                                                 << 8U));
        vlSelfRef.WASM_TOP__DOT__Instr[1U] = ((0xff00ffffU 
                                               & vlSelfRef.WASM_TOP__DOT__Instr[1U]) 
                                              | (vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__bram
                                                 [(0x3fU 
                                                   & ((IData)(6U) 
                                                      + (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer)))] 
                                                 << 0x10U));
        vlSelfRef.WASM_TOP__DOT__Instr[1U] = ((0xffffffU 
                                               & vlSelfRef.WASM_TOP__DOT__Instr[1U]) 
                                              | (vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__bram
                                                 [(0x3fU 
                                                   & ((IData)(7U) 
                                                      + (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer)))] 
                                                 << 0x18U));
        vlSelfRef.WASM_TOP__DOT__Instr[2U] = (0xffU 
                                              & vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__bram
                                              [(0x3fU 
                                                & ((IData)(8U) 
                                                   + (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer)))]);
    } else {
        vlSelfRef.WASM_TOP__DOT__Instr[0U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[1U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[2U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[0U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[1U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[2U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[0U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[1U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[2U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[0U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[1U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[2U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[0U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[1U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[2U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[0U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[1U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[2U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[0U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[1U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[2U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[0U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[1U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[2U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[0U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[1U] = 0U;
        vlSelfRef.WASM_TOP__DOT__Instr[2U] = 0U;
    }
    vlSelfRef.WASM_TOP__DOT__store_en = ((0x36U == 
                                          (0xffU & 
                                           vlSelfRef.WASM_TOP__DOT__Instr[0U])) 
                                         & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1));
    vlSelfRef.WASM_TOP__DOT__local_set = (((0x21U == 
                                            (0xffU 
                                             & vlSelfRef.WASM_TOP__DOT__Instr[0U])) 
                                           | (0x22U 
                                              == (0xffU 
                                                  & vlSelfRef.WASM_TOP__DOT__Instr[0U]))) 
                                          & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1));
    vlSelfRef.WASM_TOP__DOT__load_en = ((0x28U == (0xffU 
                                                   & vlSelfRef.WASM_TOP__DOT__Instr[0U])) 
                                        & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1));
    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
        = (0xfffffffffULL & ((2U == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state))
                              ? (((QData)((IData)(vlSelfRef.WASM_TOP__DOT__Instr[1U])) 
                                  << 0x20U) | (QData)((IData)(
                                                              vlSelfRef.WASM_TOP__DOT__Instr[0U])))
                              : (((QData)((IData)(vlSelfRef.WASM_TOP__DOT__Instr[1U])) 
                                  << 0x38U) | (((QData)((IData)(
                                                                vlSelfRef.WASM_TOP__DOT__Instr[1U])) 
                                                << 0x18U) 
                                               | ((QData)((IData)(
                                                                  vlSelfRef.WASM_TOP__DOT__Instr[0U])) 
                                                  >> 8U)))));
    if ((2U & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
        if ((1U & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
            if ((1U == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type))) {
                vlSelfRef.WASM_TOP__DOT__push_num = 0U;
                vlSelfRef.WASM_TOP__DOT__pop_num = 0U;
            } else if ((0xaU == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type))) {
                vlSelfRef.WASM_TOP__DOT__push_num = 
                    ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                               >> 7U))) && ((0x40U 
                                             & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                             ? ((0x20U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                 ? 
                                                ((0x10U 
                                                  & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                  ? 
                                                 ((8U 
                                                   & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                   ? 
                                                  ((1U 
                                                    & (~ 
                                                       (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                        >> 2U))) 
                                                   && ((1U 
                                                        & (~ 
                                                           (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                            >> 1U))) 
                                                       && (1U 
                                                           & (~ 
                                                              vlSelfRef.WASM_TOP__DOT__Instr[0U]))))
                                                   : 
                                                  ((1U 
                                                    & (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                       >> 2U)) 
                                                   || (1U 
                                                       & ((2U 
                                                           & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                           ? 
                                                          (~ 
                                                           vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                           : 
                                                          vlSelfRef.WASM_TOP__DOT__Instr[0U]))))
                                                  : 
                                                 ((1U 
                                                   & (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                      >> 3U)) 
                                                  && ((1U 
                                                       & (~ 
                                                          (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                           >> 2U))) 
                                                      && (1U 
                                                          & (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                             >> 1U)))))
                                                 : 
                                                ((1U 
                                                  & (~ 
                                                     (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                      >> 4U))) 
                                                 && ((1U 
                                                      & (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                         >> 3U)) 
                                                     || ((4U 
                                                          & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                          ? 
                                                         ((1U 
                                                           & (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                              >> 1U)) 
                                                          || (1U 
                                                              & vlSelfRef.WASM_TOP__DOT__Instr[0U]))
                                                          : 
                                                         ((1U 
                                                           & (~ 
                                                              (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                               >> 1U))) 
                                                          && (1U 
                                                              & vlSelfRef.WASM_TOP__DOT__Instr[0U]))))))
                                             : ((0x20U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                 ? 
                                                ((1U 
                                                  & (~ 
                                                     (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                      >> 4U))) 
                                                 && ((8U 
                                                      & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                      ? 
                                                     ((1U 
                                                       & (~ 
                                                          (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                           >> 2U))) 
                                                      && ((1U 
                                                           & (~ 
                                                              (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                               >> 1U))) 
                                                          && (1U 
                                                              & (~ 
                                                                 vlSelfRef.WASM_TOP__DOT__Instr[0U]))))
                                                      : 
                                                     ((1U 
                                                       & (~ 
                                                          (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                           >> 2U))) 
                                                      && ((1U 
                                                           & (~ 
                                                              (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                               >> 1U))) 
                                                          && (1U 
                                                              & (~ 
                                                                 vlSelfRef.WASM_TOP__DOT__Instr[0U]))))))
                                                 : 
                                                ((1U 
                                                  & (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 4U)) 
                                                 && ((1U 
                                                      & (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                         >> 3U)) 
                                                     && ((1U 
                                                          & (~ 
                                                             (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                              >> 2U))) 
                                                         && ((1U 
                                                              & (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                                 >> 1U)) 
                                                             && (1U 
                                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U]))))))));
                vlSelfRef.WASM_TOP__DOT__pop_num = 
                    ((0x80U & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                      ? 0U : ((0x40U & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                               ? ((0x20U & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                   ? ((0x10U & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                       ? ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                           ? ((4U & 
                                               vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                               ? 0U
                                               : ((2U 
                                                   & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                   ? 0U
                                                   : 
                                                  ((1U 
                                                    & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                    ? 0U
                                                    : 2U)))
                                           : ((4U & 
                                               vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                               ? 2U
                                               : ((2U 
                                                   & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                   ? 
                                                  ((1U 
                                                    & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                    ? 0U
                                                    : 2U)
                                                   : 
                                                  ((1U 
                                                    & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                    ? 2U
                                                    : 0U))))
                                       : ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                           ? ((4U & 
                                               vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                               ? 0U
                                               : ((2U 
                                                   & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                   ? 2U
                                                   : 0U))
                                           : 0U)) : 
                                  ((0x10U & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                    ? 0U : ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                             ? 2U : 
                                            ((4U & 
                                              vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                              ? ((2U 
                                                  & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                  ? 
                                                 ((1U 
                                                   & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                   ? 1U
                                                   : 2U)
                                                  : 
                                                 ((1U 
                                                   & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                   ? 1U
                                                   : 0U))
                                              : 0U))))
                               : ((0x20U & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                   ? ((0x10U & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                       ? ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                           ? 0U : (
                                                   (4U 
                                                    & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                    ? 
                                                   ((2U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                     ? 
                                                    ((1U 
                                                      & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                      ? 0U
                                                      : 2U)
                                                     : 0U)
                                                    : 0U))
                                       : ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                           ? ((4U & 
                                               vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                               ? 0U
                                               : ((2U 
                                                   & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                   ? 0U
                                                   : 
                                                  ((1U 
                                                    & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                    ? 0U
                                                    : 1U)))
                                           : ((4U & 
                                               vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                               ? 0U
                                               : ((2U 
                                                   & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                   ? 0U
                                                   : 
                                                  ((1U 
                                                    & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                    ? 1U
                                                    : 0U)))))
                                   : ((0x10U & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                       ? ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                           ? ((4U & 
                                               vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                               ? 0U
                                               : ((2U 
                                                   & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                   ? 
                                                  ((1U 
                                                    & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                    ? 3U
                                                    : 1U)
                                                   : 0U))
                                           : 0U) : 0U))));
            }
        } else {
            vlSelfRef.WASM_TOP__DOT__push_num = 0U;
            vlSelfRef.WASM_TOP__DOT__pop_num = 0U;
        }
    } else {
        vlSelfRef.WASM_TOP__DOT__push_num = 0U;
        vlSelfRef.WASM_TOP__DOT__pop_num = 0U;
    }
    VL_SHIFTR_WWI(512,512,32, vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop, vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg, 
                  VL_SHIFTL_III(32,32,32, (IData)(vlSelfRef.WASM_TOP__DOT__pop_num), 5U));
    vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer_after_pop 
        = (((IData)(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer) 
            > (IData)(vlSelfRef.WASM_TOP__DOT__pop_num))
            ? (0xfU & ((IData)(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer) 
                       - (IData)(vlSelfRef.WASM_TOP__DOT__pop_num)))
            : 0U);
    if ((2U & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
        if ((1U & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
            if ((1U != (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type))) {
                if ((0xaU == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type))) {
                    if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                  >> 7U)))) {
                        if ((0x40U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                            if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                          >> 5U)))) {
                                if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                              >> 4U)))) {
                                    if ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                        if ((4U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out35 = 0U;
                                                }
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out9 = 0U;
                                                }
                                            }
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out2 = 0U;
                                                }
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out1 = 0U;
                                                }
                                            }
                                        }
                                        if ((1U & (~ 
                                                   (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                    >> 2U)))) {
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out34 = 0U;
                                                }
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out33 = 0U;
                                                }
                                            }
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out32 = 0U;
                                                }
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out31 = 0U;
                                                }
                                            }
                                        }
                                    }
                                    if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                  >> 3U)))) {
                                        if ((4U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out30 = 0U;
                                                }
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out29 = 0U;
                                                }
                                            }
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out28 = 0U;
                                                }
                                            }
                                        }
                                        if ((1U & (~ 
                                                   (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                    >> 2U)))) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out18 = 2U;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((0x20U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                if ((0x10U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                    if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                  >> 3U)))) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                    >> 2U)))) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out5 = 0U;
                                                }
                                            }
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out6 = 0U;
                                                }
                                            }
                                        }
                                        if ((4U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out13 = 0U;
                                                }
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out12 = 0U;
                                                }
                                            }
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out15 = 0U;
                                                }
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out14 = 0U;
                                                }
                                            }
                                        }
                                    }
                                    if ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                    >> 2U)))) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out16 = 0U;
                                                }
                                            }
                                        }
                                    }
                                }
                                if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                              >> 4U)))) {
                                    if ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                    >> 2U)))) {
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out4 = 0U;
                                                }
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out3 = 0U;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                      >> 6U)))) {
                            if ((0x20U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                              >> 4U)))) {
                                    if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                  >> 3U)))) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                    >> 2U)))) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out7 = 3U;
                                                }
                                            }
                                        }
                                    }
                                    if ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                    >> 2U)))) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out10 = 2U;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                          >> 5U)))) {
                                if ((0x10U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                    if ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                    >> 2U)))) {
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out26 = 0U;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    vlSelfRef.WASM_TOP__DOT__push_select = ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out1) 
                                            | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out2) 
                                               | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out3) 
                                                  | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out4) 
                                                     | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out5) 
                                                        | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out6) 
                                                           | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out7) 
                                                              | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out9) 
                                                                 | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out10) 
                                                                    | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out12) 
                                                                       | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out13) 
                                                                          | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out14) 
                                                                             | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out15) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out16) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out18) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out26) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out28) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out29) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out30) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out31) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out32) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out33) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out34) 
                                                                                | (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out35))))))))))))))))))))))));
    if ((2U & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
        if ((1U & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
            if ((1U != (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type))) {
                if ((0xaU == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type))) {
                    if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                  >> 7U)))) {
                        if ((0x40U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                            if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                          >> 5U)))) {
                                if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                              >> 4U)))) {
                                    if ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                        if ((4U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out71 = 0xdU;
                                                }
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out45 = 9U;
                                                }
                                            }
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out37 = 0xeU;
                                                }
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out38 = 0xaU;
                                                }
                                            }
                                        }
                                        if ((1U & (~ 
                                                   (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                    >> 2U)))) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out67 = 0xbU;
                                                }
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out68 = 7U;
                                                }
                                            }
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out69 = 0xcU;
                                                }
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out70 = 8U;
                                                }
                                            }
                                        }
                                    }
                                    if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                  >> 3U)))) {
                                        if ((4U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out66 = 0xfU;
                                                }
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out65 = 6U;
                                                }
                                            }
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out64 = 5U;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((0x20U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                if ((0x10U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                    if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                  >> 3U)))) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                    >> 2U)))) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out41 = 2U;
                                                }
                                            }
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out42 = 3U;
                                                }
                                            }
                                        }
                                        if ((4U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out48 = 0x10U;
                                                }
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out49 = 0x11U;
                                                }
                                            }
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out51 = 0x13U;
                                                }
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out50 = 0x12U;
                                                }
                                            }
                                        }
                                    }
                                    if ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                    >> 2U)))) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out52 = 0x14U;
                                                }
                                            }
                                        }
                                    }
                                }
                                if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                              >> 4U)))) {
                                    if ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                    >> 2U)))) {
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out40 = 1U;
                                                }
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out39 = 0U;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                      >> 6U)))) {
                            if ((0x20U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                              >> 4U)))) {
                                    if ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                    >> 2U)))) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out46 = 0U;
                                                }
                                            }
                                        }
                                    }
                                    if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                  >> 3U)))) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                    >> 2U)))) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 1U)))) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out43 = 0U;
                                                }
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out44 = 0U;
                                                }
                                            }
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out36 = 0U;
                                                }
                                            }
                                        }
                                    }
                                }
                                if ((0x10U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                    if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                  >> 3U)))) {
                                        if ((4U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out47 = 0U;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if ((1U & (~ (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                          >> 5U)))) {
                                if ((0x10U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                    if ((8U & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                    >> 2U)))) {
                                            if ((2U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])) {
                                                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out62 = 4U;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    vlSelfRef.WASM_TOP__DOT__ALUControl = ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out36) 
                                           | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out37) 
                                              | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out38) 
                                                 | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out39) 
                                                    | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out40) 
                                                       | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out41) 
                                                          | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out42) 
                                                             | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out43) 
                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out44) 
                                                                   | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out45) 
                                                                      | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out46) 
                                                                         | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out47) 
                                                                            | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out48) 
                                                                               | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out49) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out50) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out51) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out52) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out62) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out64) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out65) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out66) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out67) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out68) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out69) 
                                                                                | ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out70) 
                                                                                | (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out71))))))))))))))))))))))))));
    vlSelfRef.WASM_TOP__DOT__load_vld = vlSelfRef.WASM_TOP__DOT__load_en;
    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt 
        = ((1U & (IData)((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                          >> 7U))) ? ((1U & (IData)(
                                                    (vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                                     >> 0xfU)))
                                       ? ((1U & (IData)(
                                                        (vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                                         >> 0x17U)))
                                           ? ((1U & (IData)(
                                                            (vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                                             >> 0x1fU)))
                                               ? 5U
                                               : 4U)
                                           : 3U) : 2U)
            : 1U);
    vlSelfRef.WASM_TOP__DOT__read_pointer_shift_minusone 
        = (0xfU & ((2U & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state))
                    ? ((1U & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state))
                        ? ((1U == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type))
                            ? ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__type_decode)
                                ? vlSelfRef.WASM_TOP__DOT__Instr[0U]
                                : ((IData)(1U) + ((
                                                   vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                   << 0x18U) 
                                                  | (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                                     >> 8U))))
                            : ((0xaU == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type))
                                ? ((0x80U & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                    ? 0U : ((0x40U 
                                             & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                             ? ((0x20U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                 ? 0U
                                                 : 
                                                ((0x10U 
                                                  & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                  ? 0U
                                                  : 
                                                 ((8U 
                                                   & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                   ? 0U
                                                   : 
                                                  ((4U 
                                                    & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                     ? 0U
                                                     : 
                                                    ((1U 
                                                      & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                      ? (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt)
                                                      : 0U))))))
                                             : ((0x20U 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                 ? 
                                                ((0x10U 
                                                  & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                  ? 
                                                 ((8U 
                                                   & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                   ? 0U
                                                   : 
                                                  ((4U 
                                                    & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                    ? 
                                                   ((2U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                     ? 
                                                    ((1U 
                                                      & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                      ? 0U
                                                      : 
                                                     ((IData)(1U) 
                                                      + (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt)))
                                                     : 0U)
                                                    : 0U))
                                                  : 
                                                 ((8U 
                                                   & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                   ? 
                                                  ((4U 
                                                    & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                     ? 0U
                                                     : 
                                                    ((1U 
                                                      & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                      ? 0U
                                                      : 
                                                     ((IData)(1U) 
                                                      + (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt)))))
                                                   : 
                                                  ((4U 
                                                    & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                     ? 
                                                    ((1U 
                                                      & vlSelfRef.WASM_TOP__DOT__Instr[0U])
                                                      ? 0U
                                                      : (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt))
                                                     : (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt)))))
                                                 : 0U)))
                                : 0U)) : ((((0xaU == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type)) 
                                            || (1U 
                                                == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type))) 
                                           || (3U == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type)))
                                           ? ((IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt) 
                                              - (IData)(1U))
                                           : (vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_length 
                                              - (IData)(1U))))
                    : ((1U & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state))
                        ? (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt)
                        : 7U)));
    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[0U] 
        = (0x7fU & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in));
    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[1U] 
        = (0x7fU & (IData)((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                            >> 8U)));
    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[2U] 
        = (0x7fU & (IData)((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                            >> 0x10U)));
    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[3U] 
        = (0x7fU & (IData)((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                            >> 0x18U)));
    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode 
        = ((1U & (IData)((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                          >> 7U))) ? ((1U & (IData)(
                                                    (vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                                     >> 0xfU)))
                                       ? ((1U & (IData)(
                                                        (vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                                         >> 0x17U)))
                                           ? ((1U & (IData)(
                                                            (vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                                             >> 0x1fU)))
                                               ? (((IData)(
                                                           (vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                                            >> 0x20U)) 
                                                   << 0x1cU) 
                                                  | ((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                                      [3U] 
                                                      << 0x15U) 
                                                     | ((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                                         [2U] 
                                                         << 0xeU) 
                                                        | ((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                                            [1U] 
                                                            << 7U) 
                                                           | vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                                           [0U]))))
                                               : ((
                                                   vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                                   [3U] 
                                                   << 0x15U) 
                                                  | ((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                                      [2U] 
                                                      << 0xeU) 
                                                     | ((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                                         [1U] 
                                                         << 7U) 
                                                        | vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                                        [0U]))))
                                           : ((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                               [2U] 
                                               << 0xeU) 
                                              | ((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                                  [1U] 
                                                  << 7U) 
                                                 | vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                                 [0U])))
                                       : ((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                           [1U] << 7U) 
                                          | vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                          [0U])) : 
           vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
           [0U]);
    vlSelfRef.WASM_TOP__DOT__B_offset = (((IData)(vlSelfRef.WASM_TOP__DOT__load_en) 
                                          | (IData)(vlSelfRef.WASM_TOP__DOT__store_en))
                                          ? vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode
                                          : ((((0x20U 
                                                == 
                                                (0xffU 
                                                 & vlSelfRef.WASM_TOP__DOT__Instr[0U])) 
                                               & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1)) 
                                              | (IData)(vlSelfRef.WASM_TOP__DOT__local_set))
                                              ? 0U : 
                                             vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[1U]));
    vlSelfRef.WASM_TOP__DOT__u_alu__DOT__eq = (vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U] 
                                               == vlSelfRef.WASM_TOP__DOT__B_offset);
    vlSelfRef.WASM_TOP__DOT__u_alu__DOT__lt_u = (vlSelfRef.WASM_TOP__DOT__B_offset 
                                                 < 
                                                 vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U]);
    vlSelfRef.WASM_TOP__DOT__u_alu__DOT__gt_u = (vlSelfRef.WASM_TOP__DOT__B_offset 
                                                 > 
                                                 vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U]);
    WASM_TOP__DOT__u_alu__DOT____VdfgRegularize_hca53fb73_0_0 
        = ((vlSelfRef.WASM_TOP__DOT__B_offset ^ vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U]) 
           >> 0x1fU);
    if (WASM_TOP__DOT__u_alu__DOT____VdfgRegularize_hca53fb73_0_0) {
        vlSelfRef.WASM_TOP__DOT__u_alu__DOT__lt_s = 
            VL_SHIFTR_III(32,32,32, vlSelfRef.WASM_TOP__DOT__B_offset, 0x1fU);
        vlSelfRef.WASM_TOP__DOT__u_alu__DOT__gt_s = 
            VL_SHIFTR_III(32,32,32, vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U], 0x1fU);
    } else {
        vlSelfRef.WASM_TOP__DOT__u_alu__DOT__lt_s = vlSelfRef.WASM_TOP__DOT__u_alu__DOT__lt_u;
        vlSelfRef.WASM_TOP__DOT__u_alu__DOT__gt_s = vlSelfRef.WASM_TOP__DOT__u_alu__DOT__gt_u;
    }
    vlSelfRef.WASM_TOP__DOT__u_alu__DOT__sum = (IData)(
                                                       (0x1ffffffffULL 
                                                        & ((1U 
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
                                                            + (QData)((IData)(vlSelfRef.WASM_TOP__DOT__B_offset))))));
    vlSelfRef.WASM_TOP__DOT__ALUResult = ((0x10U & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                           ? ((8U & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                               ? 0U
                                               : ((4U 
                                                   & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                   ? 
                                                  ((2U 
                                                    & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                    ? 0U
                                                    : 
                                                   ((1U 
                                                     & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                     ? 0U
                                                     : 
                                                    (VL_SHIFTR_III(32,32,32, vlSelfRef.WASM_TOP__DOT__B_offset, 
                                                                   vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U]) 
                                                     | VL_SHIFTL_III(32,32,32, vlSelfRef.WASM_TOP__DOT__B_offset, 
                                                                     ((IData)(0x20U) 
                                                                      - 
                                                                      vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U])))))
                                                   : 
                                                  ((2U 
                                                    & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                    ? 
                                                   ((1U 
                                                     & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                     ? 
                                                    (VL_SHIFTL_III(32,32,32, vlSelfRef.WASM_TOP__DOT__B_offset, 
                                                                   vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U]) 
                                                     | VL_SHIFTR_III(32,32,32, vlSelfRef.WASM_TOP__DOT__B_offset, 
                                                                     ((IData)(0x20U) 
                                                                      - 
                                                                      vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U])))
                                                     : 
                                                    VL_SHIFTR_III(32,32,32, vlSelfRef.WASM_TOP__DOT__B_offset, 
                                                                  vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U]))
                                                    : 
                                                   ((1U 
                                                     & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                     ? 
                                                    VL_SHIFTR_III(32,32,32, vlSelfRef.WASM_TOP__DOT__B_offset, 
                                                                  vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U])
                                                     : 
                                                    VL_SHIFTL_III(32,32,32, vlSelfRef.WASM_TOP__DOT__B_offset, 
                                                                  vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U])))))
                                           : ((8U & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                               ? ((4U 
                                                   & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                   ? 
                                                  ((2U 
                                                    & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                    ? 
                                                   ((1U 
                                                     & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                     ? 
                                                    (vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U] 
                                                     != vlSelfRef.WASM_TOP__DOT__B_offset)
                                                     : 
                                                    (vlSelfRef.WASM_TOP__DOT__u_alu__DOT__gt_s 
                                                     | vlSelfRef.WASM_TOP__DOT__u_alu__DOT__eq))
                                                    : 
                                                   ((1U 
                                                     & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                     ? 
                                                    (vlSelfRef.WASM_TOP__DOT__u_alu__DOT__lt_s 
                                                     | vlSelfRef.WASM_TOP__DOT__u_alu__DOT__eq)
                                                     : vlSelfRef.WASM_TOP__DOT__u_alu__DOT__gt_s))
                                                   : 
                                                  ((2U 
                                                    & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                    ? 
                                                   ((1U 
                                                     & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                     ? vlSelfRef.WASM_TOP__DOT__u_alu__DOT__lt_s
                                                     : 
                                                    (vlSelfRef.WASM_TOP__DOT__u_alu__DOT__gt_u 
                                                     | vlSelfRef.WASM_TOP__DOT__u_alu__DOT__eq))
                                                    : 
                                                   ((1U 
                                                     & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                     ? 
                                                    (vlSelfRef.WASM_TOP__DOT__u_alu__DOT__lt_u 
                                                     | vlSelfRef.WASM_TOP__DOT__u_alu__DOT__eq)
                                                     : vlSelfRef.WASM_TOP__DOT__u_alu__DOT__gt_u)))
                                               : ((4U 
                                                   & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                   ? 
                                                  ((2U 
                                                    & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                    ? 
                                                   ((1U 
                                                     & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                     ? vlSelfRef.WASM_TOP__DOT__u_alu__DOT__lt_u
                                                     : vlSelfRef.WASM_TOP__DOT__u_alu__DOT__eq)
                                                    : 
                                                   ((1U 
                                                     & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                     ? 
                                                    (0U 
                                                     == 
                                                     vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U])
                                                     : 
                                                    ((0U 
                                                      == 
                                                      vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U])
                                                      ? vlSelfRef.WASM_TOP__DOT__B_offset
                                                      : 
                                                     vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[2U])))
                                                   : 
                                                  ((2U 
                                                    & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                    ? 
                                                   ((1U 
                                                     & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                     ? 
                                                    (vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U] 
                                                     | vlSelfRef.WASM_TOP__DOT__B_offset)
                                                     : 
                                                    (vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U] 
                                                     & vlSelfRef.WASM_TOP__DOT__B_offset))
                                                    : vlSelfRef.WASM_TOP__DOT__u_alu__DOT__sum))));
    vlSelfRef.WASM_TOP__DOT__load_data = ((IData)(vlSelfRef.WASM_TOP__DOT__load_en)
                                           ? vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram
                                          [(0xfU & vlSelfRef.WASM_TOP__DOT__ALUResult)]
                                           : 0U);
}

VL_ATTR_COLD void VWASM_TOP___024root___eval_triggers__stl(VWASM_TOP___024root* vlSelf);

VL_ATTR_COLD bool VWASM_TOP___024root___eval_phase__stl(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___eval_phase__stl\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    VWASM_TOP___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelfRef.__VstlTriggered.any();
    if (__VstlExecute) {
        VWASM_TOP___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VWASM_TOP___024root___dump_triggers__act(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___dump_triggers__act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge i_clk or negedge i_rst_n)\n");
    }
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @(posedge i_clk)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void VWASM_TOP___024root___dump_triggers__nba(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___dump_triggers__nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge i_clk or negedge i_rst_n)\n");
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @(posedge i_clk)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void VWASM_TOP___024root____Vm_traceActivitySetAll(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root____Vm_traceActivitySetAll\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vm_traceActivity[0U] = 1U;
    vlSelfRef.__Vm_traceActivity[1U] = 1U;
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    vlSelfRef.__Vm_traceActivity[3U] = 1U;
    vlSelfRef.__Vm_traceActivity[4U] = 1U;
}

VL_ATTR_COLD void VWASM_TOP___024root___ctor_var_reset(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___ctor_var_reset\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelf->i_clk = VL_RAND_RESET_I(1);
    vlSelf->i_rst_n = VL_RAND_RESET_I(1);
    vlSelf->o_INSTR_ERROR = VL_RAND_RESET_I(1);
    vlSelf->o_instr_finish = VL_RAND_RESET_I(1);
    vlSelf->o_stack_full = VL_RAND_RESET_I(1);
    vlSelf->WASM_TOP__DOT__ALUResult = VL_RAND_RESET_I(32);
    VL_RAND_RESET_W(72, vlSelf->WASM_TOP__DOT__Instr);
    vlSelf->WASM_TOP__DOT__Instr_vld = VL_RAND_RESET_I(1);
    vlSelf->WASM_TOP__DOT__read_pointer_shift_minusone = VL_RAND_RESET_I(4);
    vlSelf->WASM_TOP__DOT__shift_vld = VL_RAND_RESET_I(1);
    vlSelf->WASM_TOP__DOT__pop_num = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__push_select = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__ALUControl = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__store_en = VL_RAND_RESET_I(1);
    vlSelf->WASM_TOP__DOT__load_en = VL_RAND_RESET_I(1);
    vlSelf->WASM_TOP__DOT__local_set = VL_RAND_RESET_I(1);
    vlSelf->WASM_TOP__DOT__load_data = VL_RAND_RESET_I(32);
    vlSelf->WASM_TOP__DOT__load_vld = VL_RAND_RESET_I(1);
    vlSelf->WASM_TOP__DOT__push_num = VL_RAND_RESET_I(1);
    vlSelf->WASM_TOP__DOT__write_pointer_shift_minusone = VL_RAND_RESET_I(5);
    VL_RAND_RESET_W(256, vlSelf->WASM_TOP__DOT__wr_data);
    vlSelf->WASM_TOP__DOT__B_offset = VL_RAND_RESET_I(32);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state = VL_RAND_RESET_I(2);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type[__Vi0] = VL_RAND_RESET_I(8);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in = VL_RAND_RESET_Q(36);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode = VL_RAND_RESET_I(32);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt = VL_RAND_RESET_I(3);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__section_type = VL_RAND_RESET_I(8);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__section_length = VL_RAND_RESET_I(32);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__vector_num = VL_RAND_RESET_I(32);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt = VL_RAND_RESET_I(32);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__type_decode = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 8; ++__Vi0) {
        vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[__Vi0] = VL_RAND_RESET_I(8);
    }
    for (int __Vi0 = 0; __Vi0 < 8; ++__Vi0) {
        vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[__Vi0] = VL_RAND_RESET_I(8);
    }
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__function_num_reg = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        VL_RAND_RESET_W(72, vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[__Vi0]);
    }
    for (int __Vi0 = 0; __Vi0 < 32; ++__Vi0) {
        vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list[__Vi0] = VL_RAND_RESET_I(6);
    }
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__function_store_addr = VL_RAND_RESET_I(4);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out1 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out2 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out3 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out4 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out5 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out6 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out7 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out9 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out10 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out12 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out13 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out14 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out15 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out16 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out18 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out26 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out28 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out29 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out30 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out31 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out32 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out33 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out34 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out35 = VL_RAND_RESET_I(2);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out36 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out37 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out38 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out39 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out40 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out41 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out42 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out43 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out44 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out45 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out46 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out47 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out48 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out49 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out50 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out51 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out52 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out62 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out64 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out65 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out66 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out67 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out68 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out69 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out70 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out71 = VL_RAND_RESET_I(5);
    vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1 = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 4; ++__Vi0) {
        vlSelf->WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[__Vi0] = VL_RAND_RESET_I(7);
    }
    vlSelf->WASM_TOP__DOT__u_instr_mem_ctrl__DOT__instr_finish = VL_RAND_RESET_I(1);
    vlSelf->WASM_TOP__DOT__u_instr_mem_ctrl__DOT__working = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 64; ++__Vi0) {
        vlSelf->WASM_TOP__DOT__u_instr_mem_ctrl__DOT__bram[__Vi0] = VL_RAND_RESET_I(8);
    }
    vlSelf->WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer = VL_RAND_RESET_I(6);
    vlSelf->WASM_TOP__DOT__u_instr_mem_ctrl__DOT__write_pointer = VL_RAND_RESET_I(6);
    vlSelf->WASM_TOP__DOT__u_alu__DOT__sum = VL_RAND_RESET_I(32);
    vlSelf->WASM_TOP__DOT__u_alu__DOT__eq = VL_RAND_RESET_I(32);
    vlSelf->WASM_TOP__DOT__u_alu__DOT__lt_u = VL_RAND_RESET_I(32);
    vlSelf->WASM_TOP__DOT__u_alu__DOT__gt_u = VL_RAND_RESET_I(32);
    vlSelf->WASM_TOP__DOT__u_alu__DOT__lt_s = VL_RAND_RESET_I(32);
    vlSelf->WASM_TOP__DOT__u_alu__DOT__gt_s = VL_RAND_RESET_I(32);
    VL_RAND_RESET_W(512, vlSelf->WASM_TOP__DOT__u_stack__DOT__stack_reg);
    VL_RAND_RESET_W(512, vlSelf->WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop);
    vlSelf->WASM_TOP__DOT__u_stack__DOT__pointer = VL_RAND_RESET_I(4);
    vlSelf->WASM_TOP__DOT__u_stack__DOT__pointer_after_pop = VL_RAND_RESET_I(4);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->WASM_TOP__DOT__u_line_memory__DOT__bram[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->WASM_TOP__DOT__u_local_mem__DOT__bram[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->__VdlyVal__WASM_TOP__DOT__u_local_mem__DOT__bram__v0 = VL_RAND_RESET_I(32);
    vlSelf->__VdlyDim0__WASM_TOP__DOT__u_local_mem__DOT__bram__v0 = VL_RAND_RESET_I(4);
    vlSelf->__VdlySet__WASM_TOP__DOT__u_local_mem__DOT__bram__v0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__i_clk__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__i_rst_n__0 = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 5; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
