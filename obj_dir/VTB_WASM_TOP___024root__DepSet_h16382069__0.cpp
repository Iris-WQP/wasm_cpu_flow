// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTB_WASM_TOP.h for the primary calling header

#include "VTB_WASM_TOP__pch.h"
#include "VTB_WASM_TOP___024root.h"

VL_ATTR_COLD void VTB_WASM_TOP___024root___eval_initial__TOP(VTB_WASM_TOP___024root* vlSelf);
VlCoroutine VTB_WASM_TOP___024root___eval_initial__TOP__Vtiming__0(VTB_WASM_TOP___024root* vlSelf);
VlCoroutine VTB_WASM_TOP___024root___eval_initial__TOP__Vtiming__1(VTB_WASM_TOP___024root* vlSelf);
VlCoroutine VTB_WASM_TOP___024root___eval_initial__TOP__Vtiming__2(VTB_WASM_TOP___024root* vlSelf);

void VTB_WASM_TOP___024root___eval_initial(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_initial\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    VTB_WASM_TOP___024root___eval_initial__TOP(vlSelf);
    vlSelfRef.__Vm_traceActivity[1U] = 1U;
    VTB_WASM_TOP___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    VTB_WASM_TOP___024root___eval_initial__TOP__Vtiming__1(vlSelf);
    VTB_WASM_TOP___024root___eval_initial__TOP__Vtiming__2(vlSelf);
    vlSelfRef.__Vtrigprevexpr___TOP__TB_WASM_TOP__DOT__clk__0 
        = vlSelfRef.TB_WASM_TOP__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__TB_WASM_TOP__DOT__rst_n__0 
        = vlSelfRef.TB_WASM_TOP__DOT__rst_n;
}

VL_INLINE_OPT VlCoroutine VTB_WASM_TOP___024root___eval_initial__TOP__Vtiming__0(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_initial__TOP__Vtiming__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.TB_WASM_TOP__DOT__rst_n = 1U;
    co_await vlSelfRef.__VdlySched.delay(2ULL, nullptr, 
                                         "test/TB_WASM_TOP.v", 
                                         27);
    vlSelfRef.TB_WASM_TOP__DOT__rst_n = 0U;
    co_await vlSelfRef.__VdlySched.delay(2ULL, nullptr, 
                                         "test/TB_WASM_TOP.v", 
                                         28);
    vlSelfRef.TB_WASM_TOP__DOT__rst_n = 1U;
}

VL_INLINE_OPT VlCoroutine VTB_WASM_TOP___024root___eval_initial__TOP__Vtiming__1(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_initial__TOP__Vtiming__1\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    co_await vlSelfRef.__VdlySched.delay(0x3e8ULL, 
                                         nullptr, "test/TB_WASM_TOP.v", 
                                         67);
    VL_FINISH_MT("test/TB_WASM_TOP.v", 68, "");
}

VL_INLINE_OPT VlCoroutine VTB_WASM_TOP___024root___eval_initial__TOP__Vtiming__2(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_initial__TOP__Vtiming__2\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    while (1U) {
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "test/TB_WASM_TOP.v", 
                                             9);
        vlSelfRef.TB_WASM_TOP__DOT__clk = (1U & (~ (IData)(vlSelfRef.TB_WASM_TOP__DOT__clk)));
    }
}

void VTB_WASM_TOP___024root___eval_act(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}

void VTB_WASM_TOP___024root___nba_sequent__TOP__0(VTB_WASM_TOP___024root* vlSelf);
void VTB_WASM_TOP___024root___nba_sequent__TOP__1(VTB_WASM_TOP___024root* vlSelf);
void VTB_WASM_TOP___024root___nba_sequent__TOP__2(VTB_WASM_TOP___024root* vlSelf);
void VTB_WASM_TOP___024root___nba_comb__TOP__0(VTB_WASM_TOP___024root* vlSelf);

void VTB_WASM_TOP___024root___eval_nba(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VTB_WASM_TOP___024root___nba_sequent__TOP__0(vlSelf);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VTB_WASM_TOP___024root___nba_sequent__TOP__1(vlSelf);
        vlSelfRef.__Vm_traceActivity[3U] = 1U;
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VTB_WASM_TOP___024root___nba_sequent__TOP__2(vlSelf);
        vlSelfRef.__Vm_traceActivity[4U] = 1U;
    }
    if ((3ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VTB_WASM_TOP___024root___nba_comb__TOP__0(vlSelf);
        vlSelfRef.__Vm_traceActivity[5U] = 1U;
    }
}

VL_INLINE_OPT void VTB_WASM_TOP___024root___nba_sequent__TOP__0(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___nba_sequent__TOP__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram__v0;
    __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram__v0 = 0;
    CData/*3:0*/ __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram__v0;
    __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram__v0 = 0;
    CData/*0:0*/ __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram__v0;
    __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram__v0 = 0;
    // Body
    __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram__v0 = 0U;
    vlSelfRef.__VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram__v0 = 0U;
    if (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__store_en) {
        __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram__v0 
            = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U];
        __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram__v0 
            = (0xfU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUResult);
        __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram__v0 = 1U;
    }
    if (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__local_set) {
        vlSelfRef.__VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram__v0 
            = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U];
        vlSelfRef.__VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram__v0 
            = (0xfU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode);
        vlSelfRef.__VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram__v0 = 1U;
    }
    if (__VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram__v0) {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram[__VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram__v0] 
            = __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram__v0;
    }
}

extern const VlWide<16>/*511:0*/ VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0;

VL_INLINE_OPT void VTB_WASM_TOP___024root___nba_sequent__TOP__1(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___nba_sequent__TOP__1\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT____VdfgRegularize_hca53fb73_0_0;
    TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT____VdfgRegularize_hca53fb73_0_0 = 0;
    CData/*0:0*/ __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read;
    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read = 0;
    IData/*31:0*/ __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt;
    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt = 0;
    CData/*0:0*/ __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en;
    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en = 0;
    CData/*7:0*/ __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v0;
    __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v0 = 0;
    CData/*4:0*/ __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v0;
    __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v0 = 0;
    CData/*7:0*/ __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v1;
    __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v1 = 0;
    CData/*4:0*/ __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v1;
    __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v1 = 0;
    CData/*1:0*/ __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state;
    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state = 0;
    CData/*3:0*/ __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg__v0;
    __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg__v0 = 0;
    CData/*4:0*/ __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg__v0;
    __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg__v0 = 0;
    CData/*3:0*/ __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg__v0;
    __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg__v0 = 0;
    CData/*4:0*/ __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg__v0;
    __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg__v0 = 0;
    VlWide<3>/*71:0*/ __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0;
    VL_ZERO_W(72, __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0);
    CData/*3:0*/ __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0;
    __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0 = 0;
    CData/*3:0*/ __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr;
    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr = 0;
    CData/*0:0*/ __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v0;
    __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v0 = 0;
    CData/*0:0*/ __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v1;
    __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v1 = 0;
    CData/*0:0*/ __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg__v0;
    __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg__v0 = 0;
    CData/*0:0*/ __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg__v0;
    __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg__v0 = 0;
    CData/*0:0*/ __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0;
    __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0 = 0;
    // Body
    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt 
        = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt;
    __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0 = 0U;
    __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg__v0 = 0U;
    __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg__v0 = 0U;
    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr 
        = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr;
    __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v0 = 0U;
    __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v1 = 0U;
    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read 
        = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read;
    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state 
        = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state;
    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en 
        = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en;
    if (vlSelfRef.TB_WASM_TOP__DOT__rst_n) {
        if (VL_UNLIKELY(vlSelfRef.TB_WASM_TOP__DOT__instr_finish)) {
            VL_WRITEF_NX("clk_cnt = %10#\n",0,32,vlSelfRef.TB_WASM_TOP__DOT__clk_cnt);
            VL_FINISH_MT("test/TB_WASM_TOP.v", 60, "");
        } else {
            vlSelfRef.TB_WASM_TOP__DOT__clk_cnt = ((IData)(1U) 
                                                   + vlSelfRef.TB_WASM_TOP__DOT__clk_cnt);
        }
    } else {
        vlSelfRef.TB_WASM_TOP__DOT__clk_cnt = 0U;
    }
    if (vlSelfRef.TB_WASM_TOP__DOT__rst_n) {
        if (((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__shift_vld) 
             & ((~ ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__instr_finish) 
                    | (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__jump_hlt))) 
                & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__working)))) {
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer 
                = (0xffU & ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en)
                             ? ((IData)(1U) + ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_addr) 
                                               + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone)))
                             : ((IData)(1U) + ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer) 
                                               + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone)))));
        }
        if (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num) {
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer 
                = (0xfU & ((0xfU > (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop))
                            ? ((IData)(1U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop))
                            : 0xfU));
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U] 
                = ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select))
                    ? ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select))
                        ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram
                       [(0xfU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode)]
                        : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode)
                    : ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select))
                        ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_data
                        : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUResult));
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[1U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[2U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[1U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[3U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[2U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[4U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[3U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[5U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[4U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[6U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[5U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[7U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[6U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[8U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[7U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[9U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[8U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xaU] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[9U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xbU] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xaU];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xcU] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xbU];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xdU] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xcU];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xeU] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xdU];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xfU] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xeU];
        } else {
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer 
                = (0xfU & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop));
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[1U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[1U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[2U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[2U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[3U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[3U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[4U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[4U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[5U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[5U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[6U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[6U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[7U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[7U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[8U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[8U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[9U] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[9U];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xaU] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xaU];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xbU] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xbU];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xcU] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xcU];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xdU] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xdU];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xeU] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xeU];
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xfU] 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop[0xfU];
        }
        if (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__instr_finish) {
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__working = 0U;
        }
        if ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
            if ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
                if ((0xaU == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                    if (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read) {
                        if ((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt 
                             == (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_num 
                                 - (IData)(1U)))) {
                            if (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__jump_hlt) {
                                __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read = 0U;
                                __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__jump_hlt = 0U;
                                __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en = 1U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_addr 
                                    = (0xffU & ((IData)(2U) 
                                                + vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list
                                                [vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__start_function_idx]));
                            } else {
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__jump_hlt = 1U;
                                __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v0 
                                    = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer;
                                __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v0 
                                    = (0x1fU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt);
                                __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v0 = 1U;
                            }
                        } else {
                            __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt 
                                = ((IData)(1U) + vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt);
                            __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v1 
                                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer;
                            __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v1 
                                = (0x1fU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt);
                            __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v1 = 1U;
                        }
                    } else if ((1U & (~ (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read)))) {
                        if ((0U == (0xffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                            vlSelfRef.TB_WASM_TOP__DOT__INSTR_ERROR = 1U;
                            vlSelfRef.TB_WASM_TOP__DOT__instr_finish = 1U;
                        } else if ((0x10U == (0xffU 
                                              & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                            __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en = 1U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_addr 
                                = (0xffU & ((IData)(2U) 
                                            + vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list
                                            [(0x1fU 
                                              & (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                 >> 8U))]));
                        } else if (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en) {
                            __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en = 0U;
                        }
                        if ((0xbU == (0xffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                            __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt = 0U;
                            __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state = 1U;
                            vlSelfRef.TB_WASM_TOP__DOT__instr_finish = 1U;
                        } else {
                            __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt 
                                = ((IData)(1U) + vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt);
                        }
                    }
                } else if ((1U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                    if (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__type_decode) {
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__type_decode = 0U;
                        __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg__v0 
                            = (0xfU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]);
                        __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg__v0 
                            = (0x1fU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt);
                        __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg__v0 = 1U;
                        if ((vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt 
                             == (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_num 
                                 - (IData)(1U)))) {
                            __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt = 0U;
                            __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state = 1U;
                        } else {
                            __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt 
                                = ((IData)(1U) + vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt);
                        }
                    } else {
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__type_decode = 1U;
                        __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg__v0 
                            = (0xfU & (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                       >> 8U));
                        __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg__v0 
                            = (0x1fU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt);
                        __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg__v0 = 1U;
                    }
                } else if ((3U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                    __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0[0U] 
                        = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U];
                    __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0[1U] 
                        = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U];
                    __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0[2U] 
                        = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[2U];
                    __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0 
                        = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr;
                    __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0 = 1U;
                    if ((((IData)(9U) + vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt) 
                         >= (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_num 
                             - (IData)(1U)))) {
                        __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt = 0U;
                        __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state = 1U;
                        __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr = 0U;
                    } else {
                        __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt 
                            = ((IData)(9U) + vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt);
                        __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr 
                            = (0xfU & ((IData)(1U) 
                                       + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr)));
                    }
                } else {
                    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state = 1U;
                }
            } else {
                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_num 
                    = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode;
                if ((1U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state = 3U;
                } else if ((3U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state = 3U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_reg 
                        = (0x1fU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]);
                } else if ((8U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__start_function_idx 
                        = (0x1fU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]);
                    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state = 1U;
                } else if ((0xaU == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state = 3U;
                    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read = 1U;
                } else {
                    __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state = 1U;
                }
            }
        } else if ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type 
                = (0xffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]);
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_length 
                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode;
            __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state = 2U;
        } else if ((0x16d736100ULL == (((QData)((IData)(
                                                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U])) 
                                        << 0x20U) | (QData)((IData)(
                                                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))))) {
            __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state = 1U;
        } else {
            vlSelfRef.TB_WASM_TOP__DOT__INSTR_ERROR = 1U;
        }
    } else {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[0U];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[1U] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[1U];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[2U] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[2U];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[3U] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[3U];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[4U] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[4U];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[5U] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[5U];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[6U] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[6U];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[7U] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[7U];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[8U] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[8U];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[9U] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[9U];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xaU] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[0xaU];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xbU] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[0xbU];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xcU] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[0xcU];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xdU] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[0xdU];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xeU] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[0xeU];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0xfU] 
            = VTB_WASM_TOP__ConstPool__CONST_h93e1b771_0[0xfU];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__working = 1U;
        __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__INSTR_ERROR = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_length = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__type_decode = 0U;
        __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__instr_finish = 0U;
        __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr = 0U;
        __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read = 0U;
        __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_addr = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__start_function_idx = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__jump_hlt = 0U;
    }
    if ((1U & (~ (IData)(vlSelfRef.TB_WASM_TOP__DOT__rst_n)))) {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__write_pointer = 0x34U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__shift_vld = 1U;
    }
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__instr_finish 
        = ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer) 
           == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__write_pointer));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt 
        = __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt;
    if (__VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg__v0) {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg[__VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg__v0] 
            = __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg__v0;
    }
    if (__VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg__v0) {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg[__VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg__v0] 
            = __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg__v0;
    }
    if (__VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0) {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[__VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0][0U] 
            = __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0[0U];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[__VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0][1U] 
            = __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0[1U];
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list[__VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0][2U] 
            = __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list__v0[2U];
    }
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr 
        = __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr;
    if (__VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v0) {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[__VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v0] 
            = __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v0;
    }
    if (__VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v1) {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list[__VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v1] 
            = __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list__v1;
    }
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read 
        = __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read;
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state 
        = __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state;
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en 
        = __Vdly__TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en;
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr_vld 
        = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__shift_vld;
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_left 
        = (0x1fU & ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_reg) 
                    - ((IData)(9U) * (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr))));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1 
        = ((0xaU == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type)) 
           & (3U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state)));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer 
        = ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en)
            ? (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_addr)
            : (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer));
    if (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__shift_vld) {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
            = ((0xffffff00U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]) 
               | vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
               [vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer]);
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
            = ((0xffff00ffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]) 
               | (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
                  [(0xffU & ((IData)(1U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer)))] 
                  << 8U));
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
            = ((0xff00ffffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]) 
               | (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
                  [(0xffU & ((IData)(2U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer)))] 
                  << 0x10U));
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
            = ((0xffffffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]) 
               | (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
                  [(0xffU & ((IData)(3U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer)))] 
                  << 0x18U));
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] 
            = ((0xffffff00U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U]) 
               | vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
               [(0xffU & ((IData)(4U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer)))]);
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] 
            = ((0xffff00ffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U]) 
               | (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
                  [(0xffU & ((IData)(5U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer)))] 
                  << 8U));
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] 
            = ((0xff00ffffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U]) 
               | (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
                  [(0xffU & ((IData)(6U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer)))] 
                  << 0x10U));
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U] 
            = ((0xffffffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[1U]) 
               | (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
                  [(0xffU & ((IData)(7U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer)))] 
                  << 0x18U));
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[2U] 
            = (0xffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram
               [(0xffU & ((IData)(8U) + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer)))]);
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
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset 
        = (((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_en) 
            | (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__store_en))
            ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode
            : ((((0x20U == (0xffU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) 
                 & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1)) 
                | (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__local_set))
                ? 0U : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[1U]));
    if ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
        if ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
            if ((1U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                if (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__type_decode) {
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone 
                        = (0xfU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]);
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                } else {
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone 
                        = (0xffU & ((IData)(1U) + (0xfU 
                                                   & (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                                      >> 8U))));
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                }
            } else if ((3U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone 
                    = (0xffU & (((9U > (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_left))
                                  ? (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_left)
                                  : 9U) - (IData)(1U)));
                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
            } else if ((0xaU == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) {
                if (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read) {
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone 
                        = (0xffU & (((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt) 
                                     + vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode) 
                                    - (IData)(1U)));
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                } else if ((0x80U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                } else if ((0x40U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                    if ((0x20U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                        if ((0x10U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                            if ((8U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                if ((4U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                                } else if ((2U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                                } else if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                                } else {
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out18 = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out57 = 0x14U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                }
                            } else if ((4U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                if ((2U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                    if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out17 = 0U;
                                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out56 = 0x13U;
                                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                    } else {
                                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out16 = 0U;
                                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out55 = 0x12U;
                                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                    }
                                } else if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out15 = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out54 = 0x11U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                } else {
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out14 = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out53 = 0x10U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                }
                            } else if ((2U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                                } else {
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out8 = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out47 = 3U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                }
                            } else if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out7 = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out46 = 2U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            } else {
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                            }
                        } else if ((8U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                            if ((4U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                            } else if ((2U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out6 = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out45 = 1U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                } else {
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out5 = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out44 = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                }
                            } else {
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                            }
                        } else {
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                        }
                    } else if ((0x10U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                    } else if ((8U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                        if ((4U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                            if ((2U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out4 = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out43 = 0xaU;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                } else {
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out3 = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out42 = 0xeU;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                }
                            } else if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out2 = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out41 = 9U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            } else {
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out1 = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out40 = 0xdU;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            }
                        } else if ((2U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                            if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out10 = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out49 = 8U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            } else {
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out38 = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out77 = 0xcU;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            }
                        } else if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out37 = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out76 = 7U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                        } else {
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out36 = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out75 = 0xbU;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                        }
                    } else if ((4U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                        if ((2U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                            if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 1U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out35 = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out74 = 0xfU;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            } else {
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out34 = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out73 = 6U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            }
                        } else if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 1U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out33 = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out72 = 5U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                        } else {
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                        }
                    } else if ((2U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                    } else if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out32 = 2U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone 
                            = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt;
                    } else {
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                    }
                } else if ((0x20U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                    if ((0x10U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                        if ((8U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                        } else if ((4U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                            if ((2U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                                } else {
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 2U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out52 = 0U;
                                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone 
                                        = (0xffU & 
                                           ((IData)(1U) 
                                            + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt)));
                                }
                            } else {
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                            }
                        } else {
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                        }
                    } else if ((8U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                        if ((4U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                        } else if ((2U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                        } else if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                        } else {
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 1U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out12 = 2U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out51 = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone 
                                = (0xffU & ((IData)(1U) 
                                            + (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt)));
                        }
                    } else if ((4U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                    } else if ((2U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                        if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                        } else {
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out50 = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone 
                                = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt;
                        }
                    } else if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 1U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out39 = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone 
                            = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt;
                    } else {
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out9 = 3U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out48 = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone 
                            = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt;
                    }
                } else if ((0x10U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                    if ((8U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                        if ((4U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                        } else if ((2U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                            if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 3U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 1U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out31 = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out70 = 4U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            } else {
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 1U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            }
                        } else {
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                        }
                    } else if ((4U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                    } else if ((2U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                    } else if (VL_LIKELY((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U]))) {
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                    } else {
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num 
                            = (0xfU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list
                               [(0x1fU & (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U] 
                                          >> 8U))]);
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                        VL_WRITEF_NX("call, addr=%x\n",0,
                                     8,vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer);
                    }
                } else if ((8U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                } else if ((4U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                } else if ((2U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                } else if ((1U & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr[0U])) {
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                } else {
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
                    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
                }
            } else {
                vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 0U;
            }
        } else if ((((0xaU == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type)) 
                     || (1U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type))) 
                    || (3U == (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type)))) {
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone 
                = (0xffU & ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt) 
                            - (IData)(1U)));
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
        } else {
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone 
                = (0xffU & (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_length 
                            - (IData)(1U)));
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
            vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
        }
    } else if ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone 
            = vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
    } else {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone = 7U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num = 0U;
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num = 0U;
    }
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
    VL_SHIFTR_WWI(512,512,32, vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop, vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg, 
                  VL_SHIFTL_III(32,32,32, (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num), 5U));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop 
        = (((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer) 
            > (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num))
            ? (0xfU & ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer) 
                       - (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num)))
            : 0U);
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select 
        = ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out1) 
           | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out2) 
              | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out3) 
                 | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out4) 
                    | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out5) 
                       | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out6) 
                          | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out7) 
                             | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out8) 
                                | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out9) 
                                   | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out10) 
                                      | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out12) 
                                         | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out14) 
                                            | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out15) 
                                               | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out16) 
                                                  | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out17) 
                                                     | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out18) 
                                                        | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out31) 
                                                           | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out32) 
                                                              | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out33) 
                                                                 | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out34) 
                                                                    | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out35) 
                                                                       | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out36) 
                                                                          | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out37) 
                                                                             | (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out38))))))))))))))))))))))));
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl 
        = ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out39) 
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
                                                           | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out56) 
                                                              | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out57) 
                                                                 | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out70) 
                                                                    | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out72) 
                                                                       | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out73) 
                                                                          | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out74) 
                                                                             | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out75) 
                                                                                | ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out76) 
                                                                                | (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out77))))))))))))))))))))))))));
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
                                ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[2U]
                                : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset)))
                    : ((2U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                        ? ((1U & (IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl))
                            ? (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U] 
                               | vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset)
                            : (vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg[0U] 
                               & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset))
                        : vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__sum))));
}

VL_INLINE_OPT void VTB_WASM_TOP___024root___nba_sequent__TOP__2(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___nba_sequent__TOP__2\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (vlSelfRef.__VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram__v0) {
        vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[vlSelfRef.__VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram__v0] 
            = vlSelfRef.__VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram__v0;
    }
}

VL_INLINE_OPT void VTB_WASM_TOP___024root___nba_comb__TOP__0(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___nba_comb__TOP__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_data 
        = ((IData)(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__load_en)
            ? vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram
           [(0xfU & vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUResult)]
            : 0U);
}

void VTB_WASM_TOP___024root___timing_resume(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___timing_resume\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((4ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VdlySched.resume();
    }
}

void VTB_WASM_TOP___024root___eval_triggers__act(VTB_WASM_TOP___024root* vlSelf);

bool VTB_WASM_TOP___024root___eval_phase__act(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_phase__act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<3> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    VTB_WASM_TOP___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        VTB_WASM_TOP___024root___timing_resume(vlSelf);
        VTB_WASM_TOP___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool VTB_WASM_TOP___024root___eval_phase__nba(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_phase__nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        VTB_WASM_TOP___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VTB_WASM_TOP___024root___dump_triggers__nba(VTB_WASM_TOP___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void VTB_WASM_TOP___024root___dump_triggers__act(VTB_WASM_TOP___024root* vlSelf);
#endif  // VL_DEBUG

void VTB_WASM_TOP___024root___eval(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            VTB_WASM_TOP___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("test/TB_WASM_TOP.v", 5, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelfRef.__VactIterCount))) {
#ifdef VL_DEBUG
                VTB_WASM_TOP___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("test/TB_WASM_TOP.v", 5, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (VTB_WASM_TOP___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (VTB_WASM_TOP___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void VTB_WASM_TOP___024root___eval_debug_assertions(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_debug_assertions\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
