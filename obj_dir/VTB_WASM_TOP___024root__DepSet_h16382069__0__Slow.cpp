// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTB_WASM_TOP.h for the primary calling header

#include "VTB_WASM_TOP__pch.h"
#include "VTB_WASM_TOP___024root.h"

VL_ATTR_COLD void VTB_WASM_TOP___024root___eval_static__TOP(VTB_WASM_TOP___024root* vlSelf);

VL_ATTR_COLD void VTB_WASM_TOP___024root___eval_static(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_static\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    VTB_WASM_TOP___024root___eval_static__TOP(vlSelf);
}

VL_ATTR_COLD void VTB_WASM_TOP___024root___eval_static__TOP(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_static__TOP\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.TB_WASM_TOP__DOT__clk = 0U;
}

VL_ATTR_COLD void VTB_WASM_TOP___024root___eval_final(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_final\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VTB_WASM_TOP___024root___dump_triggers__stl(VTB_WASM_TOP___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool VTB_WASM_TOP___024root___eval_phase__stl(VTB_WASM_TOP___024root* vlSelf);

VL_ATTR_COLD void VTB_WASM_TOP___024root___eval_settle(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_settle\n"); );
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
            VTB_WASM_TOP___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("test/TB_WASM_TOP.v", 5, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (VTB_WASM_TOP___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelfRef.__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VTB_WASM_TOP___024root___dump_triggers__stl(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___dump_triggers__stl\n"); );
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

VL_ATTR_COLD void VTB_WASM_TOP___024root___stl_sequent__TOP__0(VTB_WASM_TOP___024root* vlSelf);
VL_ATTR_COLD void VTB_WASM_TOP___024root____Vm_traceActivitySetAll(VTB_WASM_TOP___024root* vlSelf);

VL_ATTR_COLD void VTB_WASM_TOP___024root___eval_stl(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_stl\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        VTB_WASM_TOP___024root___stl_sequent__TOP__0(vlSelf);
        VTB_WASM_TOP___024root____Vm_traceActivitySetAll(vlSelf);
    }
}

VL_ATTR_COLD void VTB_WASM_TOP___024root___stl_sequent__TOP__0(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___stl_sequent__TOP__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT____VdfgRegularize_hca53fb73_0_0;
    TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT____VdfgRegularize_hca53fb73_0_0 = 0;
    // Body
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__instr_finish 
        = ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer) 
           == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__write_pointer));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer 
        = ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en)
            ? (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_addr)
            : (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr_vld 
        = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__shift_vld;
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_left 
        = (0xffU & ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_reg) 
                    - ((IData)(9U) * (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr))));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1 
        = ((0xaU == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type)) 
           & (3U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state)));
    if (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__shift_vld) {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
            = ((0xffffff00U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]) 
               | vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
               [vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer]);
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
            = ((0xffff00ffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]) 
               | (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
                  [(0x7fU & ((IData)(1U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer)))] 
                  << 8U));
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
            = ((0xff00ffffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]) 
               | (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
                  [(0x7fU & ((IData)(2U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer)))] 
                  << 0x10U));
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
            = ((0xffffffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]) 
               | (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
                  [(0x7fU & ((IData)(3U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer)))] 
                  << 0x18U));
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] 
            = ((0xffffff00U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U]) 
               | vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
               [(0x7fU & ((IData)(4U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer)))]);
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] 
            = ((0xffff00ffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U]) 
               | (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
                  [(0x7fU & ((IData)(5U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer)))] 
                  << 8U));
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] 
            = ((0xff00ffffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U]) 
               | (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
                  [(0x7fU & ((IData)(6U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer)))] 
                  << 0x10U));
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] 
            = ((0xffffffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U]) 
               | (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
                  [(0x7fU & ((IData)(7U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer)))] 
                  << 0x18U));
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[2U] 
            = (0xffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
               [(0x7fU & ((IData)(8U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer)))]);
    } else {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[2U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[2U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[2U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[2U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[2U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[2U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[2U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[2U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[2U] = 0U;
    }
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__store_en 
        = ((0x36U == (0xffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) 
           & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__local_set 
        = (((0x21U == (0xffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) 
            | (0x22U == (0xffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) 
           & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_en 
        = ((0x28U == (0xffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) 
           & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
        = (0xfffffffffULL & (((2U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state)) 
                              | (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read))
                              ? (((QData)((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U])) 
                                  << 0x20U) | (QData)((IData)(
                                                              vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])))
                              : (((QData)((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U])) 
                                  << 0x38U) | (((QData)((IData)(
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U])) 
                                                << 0x18U) 
                                               | ((QData)((IData)(
                                                                  vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) 
                                                  >> 8U)))));
    if ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
        if ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
            if ((1U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
            } else if ((3U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
            } else if ((0xaU == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num 
                    = ((1U & (~ (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read))) 
                       && ((1U & (~ (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                     >> 7U))) && ((0x40U 
                                                   & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                   ? 
                                                  ((0x20U 
                                                    & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                    ? 
                                                   ((0x10U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                     ? 
                                                    ((8U 
                                                      & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                      ? 
                                                     ((1U 
                                                       & (~ 
                                                          (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                           >> 2U))) 
                                                      && ((1U 
                                                           & (~ 
                                                              (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                               >> 1U))) 
                                                          && (1U 
                                                              & (~ 
                                                                 vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))))
                                                      : 
                                                     ((1U 
                                                       & (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                          >> 2U)) 
                                                      || (1U 
                                                          & ((2U 
                                                              & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                              ? 
                                                             (~ 
                                                              vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                              : 
                                                             vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))))
                                                     : 
                                                    ((1U 
                                                      & (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 3U)) 
                                                     && ((1U 
                                                          & (~ 
                                                             (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                              >> 2U))) 
                                                         && (1U 
                                                             & (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                                >> 1U)))))
                                                    : 
                                                   ((1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 4U))) 
                                                    && ((1U 
                                                         & (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                            >> 3U)) 
                                                        || ((4U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                             ? 
                                                            ((1U 
                                                              & (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                                 >> 1U)) 
                                                             || (1U 
                                                                 & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))
                                                             : 
                                                            ((1U 
                                                              & (~ 
                                                                 (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                                  >> 1U))) 
                                                             && (1U 
                                                                 & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))))))
                                                   : 
                                                  ((0x20U 
                                                    & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                    ? 
                                                   ((1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 4U))) 
                                                    && ((8U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                         ? 
                                                        ((1U 
                                                          & (~ 
                                                             (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                              >> 2U))) 
                                                         && ((1U 
                                                              & (~ 
                                                                 (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                                  >> 1U))) 
                                                             && (1U 
                                                                 & (~ 
                                                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))))
                                                         : 
                                                        ((1U 
                                                          & (~ 
                                                             (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                              >> 2U))) 
                                                         && ((1U 
                                                              & (~ 
                                                                 (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                                  >> 1U))) 
                                                             && (1U 
                                                                 & (~ 
                                                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))))))
                                                    : 
                                                   ((1U 
                                                     & (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                        >> 4U)) 
                                                    && ((1U 
                                                         & (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                            >> 3U)) 
                                                        && ((1U 
                                                             & (~ 
                                                                (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                                 >> 2U))) 
                                                            && ((1U 
                                                                 & (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                                    >> 1U)) 
                                                                && (1U 
                                                                    & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])))))))));
                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num 
                    = ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read)
                        ? 0U : ((0x80U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                 ? 0U : ((0x40U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                          ? ((0x20U 
                                              & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                              ? ((0x10U 
                                                  & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                  ? 
                                                 ((8U 
                                                   & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                   ? 
                                                  ((4U 
                                                    & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                     ? 0U
                                                     : 
                                                    ((1U 
                                                      & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                      ? 0U
                                                      : 2U)))
                                                   : 
                                                  ((4U 
                                                    & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                    ? 2U
                                                    : 
                                                   ((2U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                     ? 
                                                    ((1U 
                                                      & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                      ? 0U
                                                      : 2U)
                                                     : 
                                                    ((1U 
                                                      & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                      ? 2U
                                                      : 0U))))
                                                  : 
                                                 ((8U 
                                                   & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                   ? 
                                                  ((4U 
                                                    & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                     ? 2U
                                                     : 0U))
                                                   : 0U))
                                              : ((0x10U 
                                                  & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                  ? 0U
                                                  : 
                                                 ((8U 
                                                   & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                   ? 2U
                                                   : 
                                                  ((4U 
                                                    & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                    ? 
                                                   ((2U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                     ? 
                                                    ((1U 
                                                      & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                      ? 1U
                                                      : 2U)
                                                     : 
                                                    ((1U 
                                                      & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                      ? 1U
                                                      : 0U))
                                                    : 0U))))
                                          : ((0x20U 
                                              & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                              ? ((0x10U 
                                                  & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                  ? 
                                                 ((8U 
                                                   & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                   ? 0U
                                                   : 
                                                  ((4U 
                                                    & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                    ? 
                                                   ((2U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                     ? 
                                                    ((1U 
                                                      & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                      ? 0U
                                                      : 2U)
                                                     : 0U)
                                                    : 0U))
                                                  : 
                                                 ((8U 
                                                   & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                   ? 
                                                  ((4U 
                                                    & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                     ? 0U
                                                     : 
                                                    ((1U 
                                                      & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                      ? 0U
                                                      : 1U)))
                                                   : 
                                                  ((4U 
                                                    & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                     ? 0U
                                                     : 
                                                    ((1U 
                                                      & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                      ? 1U
                                                      : 0U)))))
                                              : ((0x10U 
                                                  & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                  ? 
                                                 ((8U 
                                                   & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                   ? 
                                                  ((4U 
                                                    & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                     ? 
                                                    ((1U 
                                                      & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                      ? 3U
                                                      : 1U)
                                                     : 0U))
                                                   : 0U)
                                                  : 0U)))));
            }
        } else {
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
        }
    } else {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
    }
    VL_SHIFTR_WWI(512,512,32, vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop, vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg, 
                  VL_SHIFTL_III(32,32,32, (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num), 5U));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop 
        = (((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer) 
            > (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num))
            ? (0xfU & ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer) 
                       - (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num)))
            : 0U);
    if ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
        if ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
            if ((1U != (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                if ((3U != (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                    if ((0xaU == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                        if ((1U & (~ (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read)))) {
                            if ((1U & (~ (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                          >> 7U)))) {
                                if ((0x40U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                    if ((0x20U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                        if ((0x10U 
                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                     >> 3U)))) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 2U)))) {
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out6 = 0U;
                                                        }
                                                    }
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out7 = 0U;
                                                        }
                                                    }
                                                }
                                                if (
                                                    (4U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out13 = 0U;
                                                        }
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out14 = 0U;
                                                        }
                                                    }
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out16 = 0U;
                                                        }
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out15 = 0U;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((8U 
                                                 & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 2U)))) {
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out17 = 0U;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if ((1U & (~ 
                                                   (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                    >> 4U)))) {
                                            if ((8U 
                                                 & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 2U)))) {
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out5 = 0U;
                                                        }
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out4 = 0U;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((1U & (~ (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                  >> 5U)))) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                    >> 4U)))) {
                                            if ((8U 
                                                 & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                if (
                                                    (4U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out3 = 0U;
                                                        }
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out2 = 0U;
                                                        }
                                                    }
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out1 = 0U;
                                                        }
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out10 = 0U;
                                                        }
                                                    }
                                                }
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 2U)))) {
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out37 = 0U;
                                                        }
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out36 = 0U;
                                                        }
                                                    }
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out35 = 0U;
                                                        }
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out34 = 0U;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                     >> 3U)))) {
                                                if (
                                                    (4U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out33 = 0U;
                                                        }
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out32 = 0U;
                                                        }
                                                    }
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out31 = 0U;
                                                        }
                                                    }
                                                }
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 2U)))) {
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out30 = 2U;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if ((1U & (~ (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                              >> 6U)))) {
                                    if ((0x20U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                    >> 4U)))) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                     >> 3U)))) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 2U)))) {
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out8 = 3U;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((8U 
                                                 & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 2U)))) {
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out11 = 2U;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((1U & (~ (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                  >> 5U)))) {
                                        if ((0x10U 
                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                            if ((8U 
                                                 & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 2U)))) {
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out19 = 0U;
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
        }
    }
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select 
        = ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out1) 
           | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out2) 
              | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out3) 
                 | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out4) 
                    | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out5) 
                       | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out6) 
                          | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out7) 
                             | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out8) 
                                | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out10) 
                                   | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out11) 
                                      | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out13) 
                                         | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out14) 
                                            | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out15) 
                                               | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out16) 
                                                  | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out17) 
                                                     | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out19) 
                                                        | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out30) 
                                                           | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out31) 
                                                              | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out32) 
                                                                 | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out33) 
                                                                    | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out34) 
                                                                       | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out35) 
                                                                          | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out36) 
                                                                             | (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out37))))))))))))))))))))))));
    if ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
        if ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
            if ((1U != (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                if ((3U != (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                    if ((0xaU == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                        if ((1U & (~ (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read)))) {
                            if ((1U & (~ (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                          >> 7U)))) {
                                if ((0x40U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                    if ((1U & (~ (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                  >> 5U)))) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                    >> 4U)))) {
                                            if ((8U 
                                                 & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                if (
                                                    (4U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out39 = 9U;
                                                        }
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out48 = 0xdU;
                                                        }
                                                    }
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out40 = 0xeU;
                                                        }
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out41 = 0xaU;
                                                        }
                                                    }
                                                }
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 2U)))) {
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out74 = 0xcU;
                                                        }
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out75 = 8U;
                                                        }
                                                    }
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out72 = 0xbU;
                                                        }
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out73 = 7U;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                     >> 3U)))) {
                                                if (
                                                    (4U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out71 = 0xfU;
                                                        }
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out70 = 6U;
                                                        }
                                                    }
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out69 = 5U;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((0x20U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                        if ((0x10U 
                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                     >> 3U)))) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 2U)))) {
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out44 = 2U;
                                                        }
                                                    }
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out45 = 3U;
                                                        }
                                                    }
                                                }
                                                if (
                                                    (4U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out51 = 0x10U;
                                                        }
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out52 = 0x11U;
                                                        }
                                                    }
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out54 = 0x13U;
                                                        }
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out53 = 0x12U;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((8U 
                                                 & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 2U)))) {
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out55 = 0x14U;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if ((1U & (~ 
                                                   (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                    >> 4U)))) {
                                            if ((8U 
                                                 & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 2U)))) {
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out43 = 1U;
                                                        }
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out42 = 0U;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if ((1U & (~ (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                              >> 6U)))) {
                                    if ((0x20U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                        if ((1U & (~ 
                                                   (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                    >> 4U)))) {
                                            if ((8U 
                                                 & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 2U)))) {
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out49 = 0U;
                                                        }
                                                    }
                                                }
                                            }
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                     >> 3U)))) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 2U)))) {
                                                    if (
                                                        (1U 
                                                         & (~ 
                                                            (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                             >> 1U)))) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out47 = 0U;
                                                        }
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out46 = 0U;
                                                        }
                                                    }
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out38 = 0U;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if ((0x10U 
                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                            if ((1U 
                                                 & (~ 
                                                    (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                     >> 3U)))) {
                                                if (
                                                    (4U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & (~ 
                                                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out50 = 0U;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if ((1U & (~ (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                  >> 5U)))) {
                                        if ((0x10U 
                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                            if ((8U 
                                                 & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                if (
                                                    (1U 
                                                     & (~ 
                                                        (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                         >> 2U)))) {
                                                    if (
                                                        (2U 
                                                         & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                        if (
                                                            (1U 
                                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out57 = 4U;
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
        }
    }
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl 
        = ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out38) 
           | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out39) 
              | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out40) 
                 | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out41) 
                    | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out42) 
                       | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out43) 
                          | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out44) 
                             | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out45) 
                                | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out46) 
                                   | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out47) 
                                      | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out48) 
                                         | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out49) 
                                            | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out50) 
                                               | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out51) 
                                                  | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out52) 
                                                     | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out53) 
                                                        | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out54) 
                                                           | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out55) 
                                                              | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out57) 
                                                                 | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out69) 
                                                                    | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out70) 
                                                                       | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out71) 
                                                                          | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out72) 
                                                                             | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out73) 
                                                                                | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out74) 
                                                                                | (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out75))))))))))))))))))))))))));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_vld 
        = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_en;
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[0U] 
        = (0x7fU & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[1U] 
        = (0x7fU & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                            >> 8U)));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[2U] 
        = (0x7fU & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                            >> 0x10U)));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[3U] 
        = (0x7fU & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                            >> 0x18U)));
    if ((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                       >> 7U)))) {
        if ((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                           >> 0xfU)))) {
            if ((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                               >> 0x17U)))) {
                if ((1U & (IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                   >> 0x1fU)))) {
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt = 5U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode 
                        = (((IData)((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in 
                                     >> 0x20U)) << 0x1cU) 
                           | ((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                               [3U] << 0x15U) | ((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                                  [2U] 
                                                  << 0xeU) 
                                                 | ((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                                     [1U] 
                                                     << 7U) 
                                                    | vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                                    [0U]))));
                } else {
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt = 4U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode 
                        = ((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                            [3U] << 0x15U) | ((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                               [2U] 
                                               << 0xeU) 
                                              | ((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                                  [1U] 
                                                  << 7U) 
                                                 | vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                                 [0U])));
                }
            } else {
                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt = 3U;
                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode 
                    = ((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                        [2U] << 0xeU) | ((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                          [1U] << 7U) 
                                         | vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                                         [0U]));
            }
        } else {
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt = 2U;
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode 
                = ((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                    [1U] << 7U) | vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
                   [0U]);
        }
    } else {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt = 1U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode 
            = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt
            [0U];
    }
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone 
        = (0xfU & ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state))
                    ? ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state))
                        ? ((1U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))
                            ? ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__type_decode)
                                ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]
                                : ((IData)(1U) + ((
                                                   vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                   << 0x18U) 
                                                  | (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                     >> 8U))))
                            : ((3U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))
                                ? (((9U > (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_left))
                                     ? (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_left)
                                     : 9U) - (IData)(1U))
                                : ((0xaU == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))
                                    ? ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read)
                                        ? (((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt) 
                                            + vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode) 
                                           - (IData)(1U))
                                        : ((0x80U & 
                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                            ? 0U : 
                                           ((0x40U 
                                             & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                             ? ((0x20U 
                                                 & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                 ? 0U
                                                 : 
                                                ((0x10U 
                                                  & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                  ? 0U
                                                  : 
                                                 ((8U 
                                                   & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                   ? 0U
                                                   : 
                                                  ((4U 
                                                    & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                     ? 0U
                                                     : 
                                                    ((1U 
                                                      & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                      ? (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt)
                                                      : 0U))))))
                                             : ((0x20U 
                                                 & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                 ? 
                                                ((0x10U 
                                                  & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                  ? 
                                                 ((8U 
                                                   & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                   ? 0U
                                                   : 
                                                  ((4U 
                                                    & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                    ? 
                                                   ((2U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                     ? 
                                                    ((1U 
                                                      & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                      ? 0U
                                                      : 
                                                     ((IData)(1U) 
                                                      + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt)))
                                                     : 0U)
                                                    : 0U))
                                                  : 
                                                 ((8U 
                                                   & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                   ? 
                                                  ((4U 
                                                    & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                     ? 0U
                                                     : 
                                                    ((1U 
                                                      & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                      ? 0U
                                                      : 
                                                     ((IData)(1U) 
                                                      + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt)))))
                                                   : 
                                                  ((4U 
                                                    & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                     ? 
                                                    ((1U 
                                                      & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])
                                                      ? 0U
                                                      : (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt))
                                                     : (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt)))))
                                                 : 0U))))
                                    : 0U))) : ((((0xaU 
                                                  == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type)) 
                                                 || (1U 
                                                     == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) 
                                                || (3U 
                                                    == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type)))
                                                ? ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt) 
                                                   - (IData)(1U))
                                                : (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_length 
                                                   - (IData)(1U))))
                    : ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state))
                        ? (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt)
                        : 7U)));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset 
        = (((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_en) 
            | (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__store_en))
            ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode
            : ((((0x20U == (0xffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) 
                 & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1)) 
                | (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__local_set))
                ? 0U : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[1U]));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__eq 
        = (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U] 
           == vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset);
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_u 
        = (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset 
           < vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U]);
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_u 
        = (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset 
           > vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U]);
    TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT____VdfgRegularize_hca53fb73_0_0 
        = ((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset 
            ^ vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U]) 
           >> 0x1fU);
    if (TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT____VdfgRegularize_hca53fb73_0_0) {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_s 
            = VL_SHIFTR_III(32,32,32, vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset, 0x1fU);
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_s 
            = VL_SHIFTR_III(32,32,32, vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U], 0x1fU);
    } else {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_s 
            = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_u;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_s 
            = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_u;
    }
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__sum 
        = (IData)((0x1ffffffffULL & ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                                      ? (1ULL + ((QData)((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset)) 
                                                 + 
                                                 (~ (QData)((IData)(
                                                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U])))))
                                      : ((QData)((IData)(
                                                         vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U])) 
                                         + (QData)((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset))))));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUResult 
        = ((0x10U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
            ? ((8U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                ? 0U : ((4U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                         ? ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                             ? 0U : ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                                      ? 0U : (VL_SHIFTR_III(32,32,32, vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset, 
                                                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U]) 
                                              | VL_SHIFTL_III(32,32,32, vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset, 
                                                              ((IData)(0x20U) 
                                                               - 
                                                               vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U])))))
                         : ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                             ? ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                                 ? (VL_SHIFTL_III(32,32,32, vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset, 
                                                  vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U]) 
                                    | VL_SHIFTR_III(32,32,32, vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset, 
                                                    ((IData)(0x20U) 
                                                     - 
                                                     vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U])))
                                 : VL_SHIFTR_III(32,32,32, vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset, 
                                                 vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U]))
                             : ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                                 ? VL_SHIFTR_III(32,32,32, vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset, 
                                                 vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U])
                                 : VL_SHIFTL_III(32,32,32, vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset, 
                                                 vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U])))))
            : ((8U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                ? ((4U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                    ? ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                        ? ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                            ? (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U] 
                               != vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset)
                            : (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_s 
                               | vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__eq))
                        : ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                            ? (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_s 
                               | vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__eq)
                            : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_s))
                    : ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                        ? ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                            ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_s
                            : (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_u 
                               | vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__eq))
                        : ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                            ? (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_u 
                               | vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__eq)
                            : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_u)))
                : ((4U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                    ? ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                        ? ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                            ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_u
                            : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__eq)
                        : ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                            ? (0U == vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U])
                            : ((0U == vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U])
                                ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset
                                : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[2U])))
                    : ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                        ? ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                            ? (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U] 
                               | vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset)
                            : (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U] 
                               & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset))
                        : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__sum))));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_data 
        = ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_en)
            ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram
           [(0xfU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUResult)]
            : 0U);
}

VL_ATTR_COLD void VTB_WASM_TOP___024root___eval_triggers__stl(VTB_WASM_TOP___024root* vlSelf);

VL_ATTR_COLD bool VTB_WASM_TOP___024root___eval_phase__stl(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_phase__stl\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    VTB_WASM_TOP___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelfRef.__VstlTriggered.any();
    if (__VstlExecute) {
        VTB_WASM_TOP___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VTB_WASM_TOP___024root___dump_triggers__act(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___dump_triggers__act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge TB_WASM_TOP.clk or negedge TB_WASM_TOP.rst_n)\n");
    }
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @(posedge TB_WASM_TOP.clk)\n");
    }
    if ((4ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 2 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void VTB_WASM_TOP___024root___dump_triggers__nba(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___dump_triggers__nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge TB_WASM_TOP.clk or negedge TB_WASM_TOP.rst_n)\n");
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @(posedge TB_WASM_TOP.clk)\n");
    }
    if ((4ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 2 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void VTB_WASM_TOP___024root____Vm_traceActivitySetAll(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root____Vm_traceActivitySetAll\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vm_traceActivity[0U] = 1U;
    vlSelfRef.__Vm_traceActivity[1U] = 1U;
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    vlSelfRef.__Vm_traceActivity[3U] = 1U;
    vlSelfRef.__Vm_traceActivity[4U] = 1U;
    vlSelfRef.__Vm_traceActivity[5U] = 1U;
}

VL_ATTR_COLD void VTB_WASM_TOP___024root___ctor_var_reset(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___ctor_var_reset\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelf->TB_WASM_TOP__DOT__clk = VL_RAND_RESET_I(1);
    vlSelf->TB_WASM_TOP__DOT__rst_n = VL_RAND_RESET_I(1);
    vlSelf->TB_WASM_TOP__DOT__INSTR_ERROR = VL_RAND_RESET_I(1);
    vlSelf->TB_WASM_TOP__DOT__instr_finish = VL_RAND_RESET_I(1);
    vlSelf->TB_WASM_TOP__DOT__read_pointer = VL_RAND_RESET_I(7);
    vlSelf->TB_WASM_TOP__DOT__ALUResult = VL_RAND_RESET_I(32);
    vlSelf->TB_WASM_TOP__DOT__stack_empty = VL_RAND_RESET_I(1);
    vlSelf->TB_WASM_TOP__DOT__clk_cnt = VL_RAND_RESET_I(32);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUResult = VL_RAND_RESET_I(32);
    VL_RAND_RESET_W(72, vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr_vld = VL_RAND_RESET_I(1);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = VL_RAND_RESET_I(4);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__shift_vld = VL_RAND_RESET_I(1);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__store_en = VL_RAND_RESET_I(1);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__load_en = VL_RAND_RESET_I(1);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__local_set = VL_RAND_RESET_I(1);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer = VL_RAND_RESET_I(7);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en = VL_RAND_RESET_I(1);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_addr = VL_RAND_RESET_I(7);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__load_data = VL_RAND_RESET_I(32);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__load_vld = VL_RAND_RESET_I(1);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = VL_RAND_RESET_I(1);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__write_pointer_shift_minusone = VL_RAND_RESET_I(5);
    VL_RAND_RESET_W(256, vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__wr_data);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset = VL_RAND_RESET_I(32);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state = VL_RAND_RESET_I(2);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type[__Vi0] = VL_RAND_RESET_I(8);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in = VL_RAND_RESET_Q(36);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode = VL_RAND_RESET_I(32);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt = VL_RAND_RESET_I(3);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type = VL_RAND_RESET_I(8);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_length = VL_RAND_RESET_I(32);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_num = VL_RAND_RESET_I(32);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt = VL_RAND_RESET_I(32);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__type_decode = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 8; ++__Vi0) {
        vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[__Vi0] = VL_RAND_RESET_I(8);
    }
    for (int __Vi0 = 0; __Vi0 < 8; ++__Vi0) {
        vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[__Vi0] = VL_RAND_RESET_I(8);
    }
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_reg = VL_RAND_RESET_I(8);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_left = VL_RAND_RESET_I(8);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        VL_RAND_RESET_W(72, vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[__Vi0]);
    }
    for (int __Vi0 = 0; __Vi0 < 32; ++__Vi0) {
        vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[__Vi0] = VL_RAND_RESET_I(7);
    }
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__start_function_idx = VL_RAND_RESET_I(8);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read = VL_RAND_RESET_I(1);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr = VL_RAND_RESET_I(4);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out1 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out2 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out3 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out4 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out5 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out6 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out7 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out8 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out10 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out11 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out13 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out14 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out15 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out16 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out17 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out19 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out30 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out31 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out32 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out33 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out34 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out35 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out36 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out37 = VL_RAND_RESET_I(2);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out38 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out39 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out40 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out41 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out42 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out43 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out44 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out45 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out46 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out47 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out48 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out49 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out50 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out51 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out52 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out53 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out54 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out55 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out57 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out69 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out70 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out71 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out72 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out73 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out74 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out75 = VL_RAND_RESET_I(5);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1 = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 4; ++__Vi0) {
        vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[__Vi0] = VL_RAND_RESET_I(7);
    }
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__instr_finish = VL_RAND_RESET_I(1);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer = VL_RAND_RESET_I(7);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__working = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 128; ++__Vi0) {
        vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram[__Vi0] = VL_RAND_RESET_I(8);
    }
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__write_pointer = VL_RAND_RESET_I(7);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__sum = VL_RAND_RESET_I(32);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__eq = VL_RAND_RESET_I(32);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_u = VL_RAND_RESET_I(32);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_u = VL_RAND_RESET_I(32);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_s = VL_RAND_RESET_I(32);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_s = VL_RAND_RESET_I(32);
    VL_RAND_RESET_W(512, vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg);
    VL_RAND_RESET_W(512, vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer = VL_RAND_RESET_I(4);
    vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop = VL_RAND_RESET_I(4);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[__Vi0] = VL_RAND_RESET_I(32);
    }
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->__VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram__v0 = VL_RAND_RESET_I(32);
    vlSelf->__VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram__v0 = VL_RAND_RESET_I(4);
    vlSelf->__VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram__v0 = 0;
    vlSelf->__Vtrigprevexpr___TOP__TB_WASM_TOP__DOT__clk__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__TB_WASM_TOP__DOT__rst_n__0 = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 6; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
