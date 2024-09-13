// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VWASM_TOP__Syms.h"


void VWASM_TOP___024root__trace_chg_0_sub_0(VWASM_TOP___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void VWASM_TOP___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root__trace_chg_0\n"); );
    // Init
    VWASM_TOP___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VWASM_TOP___024root*>(voidSelf);
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    VWASM_TOP___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

void VWASM_TOP___024root__trace_chg_0_sub_0(VWASM_TOP___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root__trace_chg_0_sub_0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    VlWide<3>/*95:0*/ __Vtemp_1;
    VlWide<16>/*511:0*/ __Vtemp_5;
    VlWide<17>/*543:0*/ __Vtemp_8;
    // Body
    if (VL_UNLIKELY(vlSelfRef.__Vm_traceActivity[1U])) {
        bufp->chgIData(oldp+0,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[0]),32);
        bufp->chgIData(oldp+1,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[1]),32);
        bufp->chgIData(oldp+2,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[2]),32);
        bufp->chgIData(oldp+3,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[3]),32);
        bufp->chgIData(oldp+4,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[4]),32);
        bufp->chgIData(oldp+5,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[5]),32);
        bufp->chgIData(oldp+6,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[6]),32);
        bufp->chgIData(oldp+7,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[7]),32);
        bufp->chgIData(oldp+8,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[8]),32);
        bufp->chgIData(oldp+9,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[9]),32);
        bufp->chgIData(oldp+10,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[10]),32);
        bufp->chgIData(oldp+11,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[11]),32);
        bufp->chgIData(oldp+12,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[12]),32);
        bufp->chgIData(oldp+13,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[13]),32);
        bufp->chgIData(oldp+14,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[14]),32);
        bufp->chgIData(oldp+15,(vlSelfRef.WASM_TOP__DOT__u_line_memory__DOT__bram[15]),32);
    }
    if (VL_UNLIKELY(vlSelfRef.__Vm_traceActivity[2U])) {
        bufp->chgIData(oldp+16,(vlSelfRef.WASM_TOP__DOT__ALUResult),32);
        bufp->chgBit(oldp+17,((0U == (IData)(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer))));
        bufp->chgWData(oldp+18,(vlSelfRef.WASM_TOP__DOT__Instr),72);
        bufp->chgBit(oldp+21,(vlSelfRef.WASM_TOP__DOT__Instr_vld));
        bufp->chgCData(oldp+22,(vlSelfRef.WASM_TOP__DOT__read_pointer_shift_minusone),4);
        bufp->chgBit(oldp+23,(vlSelfRef.WASM_TOP__DOT__shift_vld));
        bufp->chgCData(oldp+24,(vlSelfRef.WASM_TOP__DOT__pop_num),2);
        bufp->chgCData(oldp+25,(vlSelfRef.WASM_TOP__DOT__push_select),2);
        bufp->chgCData(oldp+26,(vlSelfRef.WASM_TOP__DOT__ALUControl),5);
        bufp->chgBit(oldp+27,(vlSelfRef.WASM_TOP__DOT__store_en));
        bufp->chgBit(oldp+28,(vlSelfRef.WASM_TOP__DOT__load_en));
        bufp->chgBit(oldp+29,(vlSelfRef.WASM_TOP__DOT__local_set));
        bufp->chgBit(oldp+30,(((0x20U == (0xffU & vlSelfRef.WASM_TOP__DOT__Instr[0U])) 
                               & (IData)(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1))));
        bufp->chgIData(oldp+31,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode),32);
        bufp->chgBit(oldp+32,(vlSelfRef.WASM_TOP__DOT__load_vld));
        bufp->chgBit(oldp+33,(vlSelfRef.WASM_TOP__DOT__push_num));
        __Vtemp_1[0U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U];
        __Vtemp_1[1U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[1U];
        __Vtemp_1[2U] = vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[2U];
        bufp->chgWData(oldp+34,(__Vtemp_1),96);
        bufp->chgIData(oldp+37,(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U]),32);
        bufp->chgIData(oldp+38,(vlSelfRef.WASM_TOP__DOT__B_offset),32);
        bufp->chgIData(oldp+39,(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[2U]),32);
        bufp->chgBit(oldp+40,((1U & (IData)((1ULL & 
                                             (((1U 
                                                & (IData)(vlSelfRef.WASM_TOP__DOT__ALUControl))
                                                ? (1ULL 
                                                   + 
                                                   ((QData)((IData)(vlSelfRef.WASM_TOP__DOT__B_offset)) 
                                                    + 
                                                    (~ (QData)((IData)(
                                                                       vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U])))))
                                                : ((QData)((IData)(
                                                                   vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U])) 
                                                   + (QData)((IData)(vlSelfRef.WASM_TOP__DOT__B_offset)))) 
                                              >> 0x20U))))));
        bufp->chgIData(oldp+41,(vlSelfRef.WASM_TOP__DOT__u_alu__DOT__sum),32);
        bufp->chgIData(oldp+42,((0U == vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U])),32);
        bufp->chgIData(oldp+43,(vlSelfRef.WASM_TOP__DOT__u_alu__DOT__eq),32);
        bufp->chgIData(oldp+44,((vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg[0U] 
                                 != vlSelfRef.WASM_TOP__DOT__B_offset)),32);
        bufp->chgIData(oldp+45,(vlSelfRef.WASM_TOP__DOT__u_alu__DOT__lt_u),32);
        bufp->chgIData(oldp+46,(vlSelfRef.WASM_TOP__DOT__u_alu__DOT__gt_u),32);
        bufp->chgIData(oldp+47,(vlSelfRef.WASM_TOP__DOT__u_alu__DOT__lt_s),32);
        bufp->chgIData(oldp+48,(vlSelfRef.WASM_TOP__DOT__u_alu__DOT__gt_s),32);
        bufp->chgCData(oldp+49,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state),2);
        bufp->chgQData(oldp+50,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in),36);
        bufp->chgCData(oldp+52,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt),3);
        bufp->chgCData(oldp+53,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_type),8);
        bufp->chgIData(oldp+54,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__section_length),32);
        bufp->chgIData(oldp+55,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_num),32);
        bufp->chgIData(oldp+56,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt),32);
        bufp->chgBit(oldp+57,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__type_decode));
        bufp->chgCData(oldp+58,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[0]),8);
        bufp->chgCData(oldp+59,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[1]),8);
        bufp->chgCData(oldp+60,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[2]),8);
        bufp->chgCData(oldp+61,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[3]),8);
        bufp->chgCData(oldp+62,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[4]),8);
        bufp->chgCData(oldp+63,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[5]),8);
        bufp->chgCData(oldp+64,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[6]),8);
        bufp->chgCData(oldp+65,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg[7]),8);
        bufp->chgCData(oldp+66,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[0]),8);
        bufp->chgCData(oldp+67,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[1]),8);
        bufp->chgCData(oldp+68,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[2]),8);
        bufp->chgCData(oldp+69,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[3]),8);
        bufp->chgCData(oldp+70,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[4]),8);
        bufp->chgCData(oldp+71,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[5]),8);
        bufp->chgCData(oldp+72,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[6]),8);
        bufp->chgCData(oldp+73,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg[7]),8);
        bufp->chgCData(oldp+74,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_num_reg),8);
        bufp->chgWData(oldp+75,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[0]),72);
        bufp->chgWData(oldp+78,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[1]),72);
        bufp->chgWData(oldp+81,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[2]),72);
        bufp->chgWData(oldp+84,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[3]),72);
        bufp->chgWData(oldp+87,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[4]),72);
        bufp->chgWData(oldp+90,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[5]),72);
        bufp->chgWData(oldp+93,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[6]),72);
        bufp->chgWData(oldp+96,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[7]),72);
        bufp->chgWData(oldp+99,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[8]),72);
        bufp->chgWData(oldp+102,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[9]),72);
        bufp->chgWData(oldp+105,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[10]),72);
        bufp->chgWData(oldp+108,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[11]),72);
        bufp->chgWData(oldp+111,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[12]),72);
        bufp->chgWData(oldp+114,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[13]),72);
        bufp->chgWData(oldp+117,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[14]),72);
        bufp->chgWData(oldp+120,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list[15]),72);
        bufp->chgCData(oldp+123,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg
                                 [0U]),8);
        bufp->chgCData(oldp+124,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg
                                 [0U]),8);
        bufp->chgWData(oldp+125,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list
                                 [0U]),72);
        bufp->chgCData(oldp+128,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__function_store_addr),4);
        bufp->chgBit(oldp+129,((1U & (IData)((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                              >> 7U)))));
        bufp->chgBit(oldp+130,((1U & (IData)((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                              >> 0xfU)))));
        bufp->chgBit(oldp+131,((1U & (IData)((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                              >> 0x17U)))));
        bufp->chgBit(oldp+132,((1U & (IData)((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                              >> 0x1fU)))));
        bufp->chgCData(oldp+133,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[0]),7);
        bufp->chgCData(oldp+134,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[1]),7);
        bufp->chgCData(oldp+135,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[2]),7);
        bufp->chgCData(oldp+136,(vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt[3]),7);
        bufp->chgCData(oldp+137,((0xfU & (IData)((vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in 
                                                  >> 0x20U)))),4);
        bufp->chgBit(oldp+138,(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__instr_finish));
        bufp->chgBit(oldp+139,(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__working));
        bufp->chgBit(oldp+140,(((~ (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__instr_finish)) 
                                & (IData)(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__working))));
        bufp->chgCData(oldp+141,(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer),6);
        bufp->chgCData(oldp+142,(vlSelfRef.WASM_TOP__DOT__u_instr_mem_ctrl__DOT__write_pointer),6);
        bufp->chgWData(oldp+143,(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg),512);
        bufp->chgWData(oldp+159,(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop),512);
        bufp->chgCData(oldp+175,(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer),4);
        bufp->chgCData(oldp+176,(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer_after_pop),4);
        bufp->chgCData(oldp+177,((0xfU & ((IData)(vlSelfRef.WASM_TOP__DOT__push_num)
                                           ? ((0xfU 
                                               > (IData)(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer_after_pop))
                                               ? ((IData)(1U) 
                                                  + (IData)(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer_after_pop))
                                               : 0xfU)
                                           : (IData)(vlSelfRef.WASM_TOP__DOT__u_stack__DOT__pointer_after_pop)))),4);
    }
    if (VL_UNLIKELY(((vlSelfRef.__Vm_traceActivity[2U] 
                      | vlSelfRef.__Vm_traceActivity
                      [3U]) | vlSelfRef.__Vm_traceActivity
                     [4U]))) {
        bufp->chgIData(oldp+178,(((2U & (IData)(vlSelfRef.WASM_TOP__DOT__push_select))
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
        bufp->chgWData(oldp+179,(__Vtemp_5),512);
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
        bufp->chgWData(oldp+195,(__Vtemp_8),544);
    }
    if (VL_UNLIKELY(vlSelfRef.__Vm_traceActivity[3U])) {
        bufp->chgIData(oldp+212,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[0]),32);
        bufp->chgIData(oldp+213,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[1]),32);
        bufp->chgIData(oldp+214,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[2]),32);
        bufp->chgIData(oldp+215,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[3]),32);
        bufp->chgIData(oldp+216,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[4]),32);
        bufp->chgIData(oldp+217,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[5]),32);
        bufp->chgIData(oldp+218,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[6]),32);
        bufp->chgIData(oldp+219,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[7]),32);
        bufp->chgIData(oldp+220,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[8]),32);
        bufp->chgIData(oldp+221,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[9]),32);
        bufp->chgIData(oldp+222,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[10]),32);
        bufp->chgIData(oldp+223,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[11]),32);
        bufp->chgIData(oldp+224,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[12]),32);
        bufp->chgIData(oldp+225,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[13]),32);
        bufp->chgIData(oldp+226,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[14]),32);
        bufp->chgIData(oldp+227,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram[15]),32);
    }
    bufp->chgBit(oldp+228,(vlSelfRef.i_clk));
    bufp->chgBit(oldp+229,(vlSelfRef.i_rst_n));
    bufp->chgBit(oldp+230,(vlSelfRef.o_INSTR_ERROR));
    bufp->chgBit(oldp+231,(vlSelfRef.o_instr_finish));
    bufp->chgBit(oldp+232,(vlSelfRef.o_stack_full));
    bufp->chgIData(oldp+233,(vlSelfRef.WASM_TOP__DOT__load_data),32);
    bufp->chgIData(oldp+234,(vlSelfRef.WASM_TOP__DOT__u_local_mem__DOT__bram
                             [(0xfU & vlSelfRef.WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode)]),32);
}

void VWASM_TOP___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root__trace_cleanup\n"); );
    // Init
    VWASM_TOP___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VWASM_TOP___024root*>(voidSelf);
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[2U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[3U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[4U] = 0U;
}
