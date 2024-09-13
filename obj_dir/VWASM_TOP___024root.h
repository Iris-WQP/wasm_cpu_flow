// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VWASM_TOP.h for the primary calling header

#ifndef VERILATED_VWASM_TOP___024ROOT_H_
#define VERILATED_VWASM_TOP___024ROOT_H_  // guard

#include "verilated.h"


class VWASM_TOP__Syms;

class alignas(VL_CACHE_LINE_BYTES) VWASM_TOP___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    // Anonymous structures to workaround compiler member-count bugs
    struct {
        VL_IN8(i_clk,0,0);
        VL_IN8(i_rst_n,0,0);
        VL_OUT8(o_INSTR_ERROR,0,0);
        VL_OUT8(o_instr_finish,0,0);
        VL_OUT8(o_stack_full,0,0);
        CData/*0:0*/ WASM_TOP__DOT__Instr_vld;
        CData/*3:0*/ WASM_TOP__DOT__read_pointer_shift_minusone;
        CData/*0:0*/ WASM_TOP__DOT__shift_vld;
        CData/*1:0*/ WASM_TOP__DOT__pop_num;
        CData/*1:0*/ WASM_TOP__DOT__push_select;
        CData/*4:0*/ WASM_TOP__DOT__ALUControl;
        CData/*0:0*/ WASM_TOP__DOT__store_en;
        CData/*0:0*/ WASM_TOP__DOT__load_en;
        CData/*0:0*/ WASM_TOP__DOT__local_set;
        CData/*0:0*/ WASM_TOP__DOT__load_vld;
        CData/*0:0*/ WASM_TOP__DOT__push_num;
        CData/*4:0*/ WASM_TOP__DOT__write_pointer_shift_minusone;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__instr_pointer_state;
        CData/*2:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt;
        CData/*7:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__section_type;
        CData/*0:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__type_decode;
        CData/*7:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__function_num_reg;
        CData/*3:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__function_store_addr;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out1;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out2;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out3;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out4;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out5;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out6;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out7;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out9;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out10;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out12;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out13;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out14;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out15;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out16;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out18;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out26;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out28;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out29;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out30;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out31;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out32;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out33;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out34;
        CData/*1:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__push_select__out__strong__out35;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out36;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out37;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out38;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out39;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out40;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out41;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out42;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out43;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out44;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out45;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out46;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out47;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out48;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out49;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out50;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out51;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out52;
    };
    struct {
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out62;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out64;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out65;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out66;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out67;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out68;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out69;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out70;
        CData/*4:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out71;
        CData/*0:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1;
        CData/*0:0*/ WASM_TOP__DOT__u_instr_mem_ctrl__DOT__instr_finish;
        CData/*0:0*/ WASM_TOP__DOT__u_instr_mem_ctrl__DOT__working;
        CData/*5:0*/ WASM_TOP__DOT__u_instr_mem_ctrl__DOT__read_pointer;
        CData/*5:0*/ WASM_TOP__DOT__u_instr_mem_ctrl__DOT__write_pointer;
        CData/*3:0*/ WASM_TOP__DOT__u_stack__DOT__pointer;
        CData/*3:0*/ WASM_TOP__DOT__u_stack__DOT__pointer_after_pop;
        CData/*3:0*/ __VdlyDim0__WASM_TOP__DOT__u_local_mem__DOT__bram__v0;
        CData/*0:0*/ __VdlySet__WASM_TOP__DOT__u_local_mem__DOT__bram__v0;
        CData/*0:0*/ __VstlFirstIteration;
        CData/*0:0*/ __Vtrigprevexpr___TOP__i_clk__0;
        CData/*0:0*/ __Vtrigprevexpr___TOP__i_rst_n__0;
        CData/*0:0*/ __VactContinue;
        IData/*31:0*/ WASM_TOP__DOT__ALUResult;
        VlWide<3>/*71:0*/ WASM_TOP__DOT__Instr;
        IData/*31:0*/ WASM_TOP__DOT__load_data;
        VlWide<8>/*255:0*/ WASM_TOP__DOT__wr_data;
        IData/*31:0*/ WASM_TOP__DOT__B_offset;
        IData/*31:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_decode;
        IData/*31:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__section_length;
        IData/*31:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__vector_num;
        IData/*31:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__vector_cnt;
        IData/*31:0*/ WASM_TOP__DOT__u_alu__DOT__sum;
        IData/*31:0*/ WASM_TOP__DOT__u_alu__DOT__eq;
        IData/*31:0*/ WASM_TOP__DOT__u_alu__DOT__lt_u;
        IData/*31:0*/ WASM_TOP__DOT__u_alu__DOT__gt_u;
        IData/*31:0*/ WASM_TOP__DOT__u_alu__DOT__lt_s;
        IData/*31:0*/ WASM_TOP__DOT__u_alu__DOT__gt_s;
        VlWide<16>/*511:0*/ WASM_TOP__DOT__u_stack__DOT__stack_reg;
        VlWide<16>/*511:0*/ WASM_TOP__DOT__u_stack__DOT__stack_reg_after_pop;
        IData/*31:0*/ __VdlyVal__WASM_TOP__DOT__u_local_mem__DOT__bram__v0;
        IData/*31:0*/ __VactIterCount;
        QData/*35:0*/ WASM_TOP__DOT__u_ctrl_unit__DOT__LEB128_in;
        VlUnpacked<IData/*31:0*/, 16> WASM_TOP__DOT__u_ctrl_unit__DOT__global_variables;
        VlUnpacked<CData/*7:0*/, 16> WASM_TOP__DOT__u_ctrl_unit__DOT__global_var_type;
        VlUnpacked<IData/*31:0*/, 16> WASM_TOP__DOT__u_ctrl_unit__DOT__local_variables;
        VlUnpacked<CData/*7:0*/, 8> WASM_TOP__DOT__u_ctrl_unit__DOT__para_num_reg;
        VlUnpacked<CData/*7:0*/, 8> WASM_TOP__DOT__u_ctrl_unit__DOT__retu_num_reg;
        VlUnpacked<VlWide<3>/*71:0*/, 16> WASM_TOP__DOT__u_ctrl_unit__DOT__function_type_list;
        VlUnpacked<CData/*5:0*/, 32> WASM_TOP__DOT__u_ctrl_unit__DOT__function_addr_list;
        VlUnpacked<CData/*6:0*/, 4> WASM_TOP__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt;
        VlUnpacked<CData/*7:0*/, 64> WASM_TOP__DOT__u_instr_mem_ctrl__DOT__bram;
        VlUnpacked<IData/*31:0*/, 16> WASM_TOP__DOT__u_line_memory__DOT__bram;
        VlUnpacked<IData/*31:0*/, 16> WASM_TOP__DOT__u_local_mem__DOT__bram;
        VlUnpacked<CData/*0:0*/, 5> __Vm_traceActivity;
    };
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<2> __VactTriggered;
    VlTriggerVec<2> __VnbaTriggered;

    // INTERNAL VARIABLES
    VWASM_TOP__Syms* const vlSymsp;

    // CONSTRUCTORS
    VWASM_TOP___024root(VWASM_TOP__Syms* symsp, const char* v__name);
    ~VWASM_TOP___024root();
    VL_UNCOPYABLE(VWASM_TOP___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
