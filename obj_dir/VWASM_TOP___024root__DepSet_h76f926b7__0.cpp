// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VWASM_TOP.h for the primary calling header

#include "VWASM_TOP__pch.h"
#include "VWASM_TOP___024root.h"

void VWASM_TOP___024root___eval_act(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___eval_act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}

void VWASM_TOP___024root___nba_sequent__TOP__0(VWASM_TOP___024root* vlSelf);
void VWASM_TOP___024root___nba_sequent__TOP__1(VWASM_TOP___024root* vlSelf);
void VWASM_TOP___024root___nba_sequent__TOP__2(VWASM_TOP___024root* vlSelf);
void VWASM_TOP___024root___nba_comb__TOP__0(VWASM_TOP___024root* vlSelf);

void VWASM_TOP___024root___eval_nba(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___eval_nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VWASM_TOP___024root___nba_sequent__TOP__0(vlSelf);
        vlSelfRef.__Vm_traceActivity[1U] = 1U;
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VWASM_TOP___024root___nba_sequent__TOP__1(vlSelf);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VWASM_TOP___024root___nba_sequent__TOP__2(vlSelf);
        vlSelfRef.__Vm_traceActivity[3U] = 1U;
    }
    if ((3ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VWASM_TOP___024root___nba_comb__TOP__0(vlSelf);
        vlSelfRef.__Vm_traceActivity[4U] = 1U;
    }
}

VL_INLINE_OPT void VWASM_TOP___024root___nba_sequent__TOP__0(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___nba_sequent__TOP__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VdlyVal__WASM_TOP__DOT__u_line_memory__DOT__bram__v0;
    __VdlyVal__WASM_TOP__DOT__u_line_memory__DOT__bram__v0 = 0;
    CData/*3:0*/ __VdlyDim0__WASM_TOP__DOT__u_line_memory__DOT__bram__v0;
    __VdlyDim0__WASM_TOP__DOT__u_line_memory__DOT__bram__v0 = 0;
    CData/*0:0*/ __VdlySet__WASM_TOP__DOT__u_line_memory__DOT__bram__v0;
    __VdlySet__WASM_TOP__DOT__u_line_memory__DOT__bram__v0 = 0;
    // Body
    __VdlySet__WASM_TOP__DOT__u_line_memory__DOT__bram__v0 = 0U;
    vlSelfRef.__VdlySet__WASM_TOP__DOT__u_local_mem__DOT__bram__v0 = 0U;
    if (vlSelfRef.WASM_TOP__DOT__store_en) {
        __VdlyVal__WASM_TOP__DOT__u_line_memory__DOT__bram__v0 
            = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U];
        __VdlyDim0__WASM_TOP__DOT__u_line_memory__DOT__bram__v0 
            = (0xfU & vlSelfRef.WASM_TOP__DOT__ALUResult);
        __VdlySet__WASM_TOP__DOT__u_line_memory__DOT__bram__v0 = 1U;
    }
    if (vlSelfRef.WASM_TOP__DOT__local_set) {
        vlSelfRef.__VdlyVal__WASM_TOP__DOT__u_local_mem__DOT__bram__v0 
            = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U];
        vlSelfRef.__VdlyDim0__WASM_TOP__DOT__u_local_mem__DOT__bram__v0 
            = (0xfU & vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode);
        vlSelfRef.__VdlySet__WASM_TOP__DOT__u_local_mem__DOT__bram__v0 = 1U;
    }
    if (__VdlySet__WASM_TOP__DOT__u_line_memory__DOT__bram__v0) {
        vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[__VdlyDim0__WASM_TOP__DOT__u_line_memory__DOT__bram__v0] 
            = __VdlyVal__WASM_TOP__DOT__u_line_memory__DOT__bram__v0;
    }
}

extern const VlWide<16>/*511:0*/ VWASM_TOP__ConstPool__CONST_h93e1b771_0;

VL_INLINE_OPT void VWASM_TOP___024root___nba_sequent__TOP__1(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___nba_sequent__TOP__1\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ WASM_TOP__DOT__u_alu__DOT____VdfgRegularize_hca53fb73_0_0;
    WASM_TOP__DOT__u_alu__DOT____VdfgRegularize_hca53fb73_0_0 = 0;
    IData/*31:0*/ __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt;
    __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt = 0;
    CData/*1:0*/ __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state;
    __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state = 0;
    CData/*7:0*/ __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg__v0;
    __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg__v0 = 0;
    CData/*2:0*/ __VdlyDim0__WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg__v0;
    __VdlyDim0__WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg__v0 = 0;
    CData/*7:0*/ __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg__v0;
    __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg__v0 = 0;
    CData/*2:0*/ __VdlyDim0__WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg__v0;
    __VdlyDim0__WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg__v0 = 0;
    VlWide<3>/*71:0*/ __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0;
    VL_ZERO_W(72, __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0);
    CData/*3:0*/ __VdlyDim0__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0;
    __VdlyDim0__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0 = 0;
    CData/*3:0*/ __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__function_store_addr;
    __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__function_store_addr = 0;
    CData/*0:0*/ __VdlySet__WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg__v0;
    __VdlySet__WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg__v0 = 0;
    CData/*0:0*/ __VdlySet__WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg__v0;
    __VdlySet__WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg__v0 = 0;
    CData/*0:0*/ __VdlySet__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0;
    __VdlySet__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0 = 0;
    // Body
    __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__function_store_addr 
        = vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_store_addr;
    __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt 
        = vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt;
    __VdlySet__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0 = 0U;
    __VdlySet__WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg__v0 = 0U;
    __VdlySet__WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg__v0 = 0U;
    __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state 
        = vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state;
    if (vlSelfRef.i_rst_n) {
        if (((IData)(vlSelfRef.WASM_TOP__DOT__shift_vld) 
             & ((~ (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__instr_finish)) 
                & (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__working)))) {
            vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer 
                = (0x3fU & ((IData)(1U) + ((IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer) 
                                           + (IData)(vlSelfRef.WASM_TOP__DOT__read_pointer_shift_minusone))));
        }
        if (vlSelfRef.WASM_TOP__DOT__push_num) {
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer 
                = (0xfU & ((0xfU > (IData)(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer_after_pop))
                            ? ((IData)(1U) + (IData)(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer_after_pop))
                            : 0xfU));
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U] 
                = ((2U & (IData)(vlSelfRef.WASM_TOP__DOT__push_select))
                    ? ((1U & (IData)(vlSelfRef.WASM_TOP__DOT__push_select))
                        ? vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram
                       [(0xfU & vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode)]
                        : vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode)
                    : ((1U & (IData)(vlSelfRef.WASM_TOP__DOT__push_select))
                        ? vlSelfRef.WASM_TOP__DOT__load_data
                        : vlSelfRef.WASM_TOP__DOT__ALUResult));
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[1U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[2U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[1U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[3U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[2U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[4U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[3U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[5U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[4U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[6U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[5U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[7U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[6U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[8U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[7U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[9U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[8U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xaU] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[9U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xbU] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xaU];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xcU] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xbU];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xdU] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xcU];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xeU] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xdU];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xfU] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xeU];
        } else {
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer 
                = (0xfU & (IData)(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer_after_pop));
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[1U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[1U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[2U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[2U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[3U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[3U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[4U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[4U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[5U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[5U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[6U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[6U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[7U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[7U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[8U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[8U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[9U] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[9U];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xaU] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xaU];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xbU] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xbU];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xcU] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xcU];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xdU] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xdU];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xeU] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xeU];
            vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xfU] 
                = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop[0xfU];
        }
        if ((2U & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
            if ((1U & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
                if ((0xaU == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type))) {
                    if ((0xbU == (0xffU & vlSelfRef.WASM_TOP__DOT__Instr[0U]))) {
                        __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt = 0U;
                        __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state = 1U;
                        vlSelfRef.o_instr_finish = 1U;
                    } else {
                        __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt 
                            = ((IData)(1U) + vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt);
                    }
                } else if ((1U == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type))) {
                    if (vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__type_decode) {
                        vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__type_decode = 0U;
                        __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg__v0 
                            = (0xffU & vlSelfRef.WASM_TOP__DOT__Instr[0U]);
                        __VdlyDim0__WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg__v0 
                            = (7U & vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt);
                        __VdlySet__WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg__v0 = 1U;
                        if ((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt 
                             == (vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_num 
                                 - (IData)(1U)))) {
                            __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt = 0U;
                            __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state = 1U;
                        } else {
                            __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt 
                                = ((IData)(1U) + vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt);
                        }
                    } else {
                        vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__type_decode = 1U;
                        __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg__v0 
                            = (0xffU & (vlSelfRef.WASM_TOP__DOT__Instr[0U] 
                                        >> 8U));
                        __VdlyDim0__WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg__v0 
                            = (7U & vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt);
                        __VdlySet__WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg__v0 = 1U;
                    }
                } else if ((3U == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type))) {
                    __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0[0U] 
                        = vlSelfRef.WASM_TOP__DOT__Instr[0U];
                    __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0[1U] 
                        = vlSelfRef.WASM_TOP__DOT__Instr[1U];
                    __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0[2U] 
                        = vlSelfRef.WASM_TOP__DOT__Instr[2U];
                    __VdlyDim0__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0 
                        = vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_store_addr;
                    __VdlySet__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0 = 1U;
                    if ((((IData)(9U) + vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt) 
                         >= (vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_num 
                             - (IData)(1U)))) {
                        __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt = 0U;
                        __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state = 1U;
                        __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__function_store_addr = 0U;
                    } else {
                        __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt 
                            = ((IData)(9U) + vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt);
                        __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__function_store_addr 
                            = (0xfU & ((IData)(1U) 
                                       + (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_store_addr)));
                    }
                } else {
                    __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state = 1U;
                }
            } else {
                vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_num 
                    = vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode;
                __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state 
                    = ((((0xaU == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type)) 
                         | (1U == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type))) 
                        | (3U == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type)))
                        ? 3U : 1U);
                if ((3U == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type))) {
                    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_num_reg 
                        = (0xffU & vlSelfRef.WASM_TOP__DOT__Instr[0U]);
                }
            }
        } else if ((1U & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state))) {
            vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type 
                = (0xffU & vlSelfRef.WASM_TOP__DOT__Instr[0U]);
            vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_length 
                = vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode;
            __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state = 2U;
        } else if ((0x16d736100ULL == (((QData)((IData)(
                                                        vlSelfRef.WASM_TOP__DOT__Instr[1U])) 
                                        << 0x20U) | (QData)((IData)(
                                                                    vlSelfRef.WASM_TOP__DOT__Instr[0U]))))) {
            __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state = 1U;
        } else {
            vlSelfRef.o_INSTR_ERROR = 1U;
        }
        if (vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__instr_finish) {
            vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__working = 0U;
        }
    } else {
        vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer = 0U;
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer = 0U;
        __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state = 0U;
        vlSelfRef.o_INSTR_ERROR = 0U;
        vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_length = 0U;
        vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type = 0U;
        vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__type_decode = 0U;
        __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt = 0U;
        vlSelfRef.o_instr_finish = 0U;
        __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__function_store_addr = 0U;
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[0U];
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[1U] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[1U];
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[2U] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[2U];
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[3U] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[3U];
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[4U] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[4U];
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[5U] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[5U];
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[6U] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[6U];
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[7U] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[7U];
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[8U] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[8U];
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[9U] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[9U];
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xaU] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[0xaU];
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xbU] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[0xbU];
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xcU] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[0xcU];
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xdU] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[0xdU];
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xeU] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[0xeU];
        vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0xfU] 
            = VWASM_TOP__ConstPool__CONST_h93e1b771_0[0xfU];
        vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__working = 1U;
    }
    if ((1U & (~ (IData)(vlSelfRef.i_rst_n)))) {
        vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__write_pointer = 0x34U;
        vlSelfRef.WASM_TOP__DOT__shift_vld = 1U;
    }
    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt 
        = __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt;
    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_store_addr 
        = __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__function_store_addr;
    if (__VdlySet__WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg__v0) {
        vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[__VdlyDim0__WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg__v0] 
            = __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg__v0;
    }
    if (__VdlySet__WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg__v0) {
        vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[__VdlyDim0__WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg__v0] 
            = __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg__v0;
    }
    if (__VdlySet__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0) {
        vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[__VdlyDim0__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0][0U] 
            = __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0[0U];
        vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[__VdlyDim0__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0][1U] 
            = __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0[1U];
        vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[__VdlyDim0__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0][2U] 
            = __VdlyVal__WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list__v0[2U];
    }
    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state 
        = __Vdly__WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state;
    vlSelfRef.o_stack_full = (0xfU == (IData)(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer));
    vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1 
        = ((0xaU == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type)) 
           & (3U == (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state)));
    vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__instr_finish 
        = ((IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer) 
           == (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__write_pointer));
    if (vlSelfRef.WASM_TOP__DOT__shift_vld) {
        vlSelfRef.WASM_TOP__DOT__Instr_vld = 1U;
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
        vlSelfRef.WASM_TOP__DOT__Instr_vld = 0U;
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
}

VL_INLINE_OPT void VWASM_TOP___024root___nba_sequent__TOP__2(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___nba_sequent__TOP__2\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (vlSelfRef.__VdlySet__WASM_TOP__DOT__u_local_mem__DOT__bram__v0) {
        vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[vlSelfRef.__VdlyDim0__WASM_TOP__DOT__u_local_mem__DOT__bram__v0] 
            = vlSelfRef.__VdlyVal__WASM_TOP__DOT__u_local_mem__DOT__bram__v0;
    }
}

VL_INLINE_OPT void VWASM_TOP___024root___nba_comb__TOP__0(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___nba_comb__TOP__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.WASM_TOP__DOT__load_data = ((IData)(vlSelfRef.WASM_TOP__DOT__load_en)
                                           ? vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram
                                          [(0xfU & vlSelfRef.WASM_TOP__DOT__ALUResult)]
                                           : 0U);
}

void VWASM_TOP___024root___eval_triggers__act(VWASM_TOP___024root* vlSelf);

bool VWASM_TOP___024root___eval_phase__act(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___eval_phase__act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<2> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    VWASM_TOP___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        VWASM_TOP___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool VWASM_TOP___024root___eval_phase__nba(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___eval_phase__nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        VWASM_TOP___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VWASM_TOP___024root___dump_triggers__nba(VWASM_TOP___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void VWASM_TOP___024root___dump_triggers__act(VWASM_TOP___024root* vlSelf);
#endif  // VL_DEBUG

void VWASM_TOP___024root___eval(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___eval\n"); );
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
            VWASM_TOP___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("src/WASM_TOP.v", 11, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelfRef.__VactIterCount))) {
#ifdef VL_DEBUG
                VWASM_TOP___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("src/WASM_TOP.v", 11, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (VWASM_TOP___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (VWASM_TOP___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void VWASM_TOP___024root___eval_debug_assertions(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___eval_debug_assertions\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (VL_UNLIKELY((vlSelfRef.i_clk & 0xfeU))) {
        Verilated::overWidthError("i_clk");}
    if (VL_UNLIKELY((vlSelfRef.i_rst_n & 0xfeU))) {
        Verilated::overWidthError("i_rst_n");}
}
#endif  // VL_DEBUG
