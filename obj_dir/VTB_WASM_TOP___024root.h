// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VTB_WASM_TOP.h for the primary calling header

#ifndef VERILATED_VTB_WASM_TOP___024ROOT_H_
#define VERILATED_VTB_WASM_TOP___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class VTB_WASM_TOP__Syms;

class alignas(VL_CACHE_LINE_BYTES) VTB_WASM_TOP___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    // Anonymous structures to workaround compiler member-count bugs
    struct {
        CData/*0:0*/ TB_WASM_TOP__DOT__clk;
        CData/*0:0*/ TB_WASM_TOP__DOT__rst_n;
        CData/*0:0*/ TB_WASM_TOP__DOT__INSTR_ERROR;
        CData/*0:0*/ TB_WASM_TOP__DOT__instr_finish;
        CData/*7:0*/ TB_WASM_TOP__DOT__read_pointer;
        CData/*0:0*/ TB_WASM_TOP__DOT__stack_empty;
        CData/*0:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr_vld;
        CData/*7:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer_shift_minusone;
        CData/*0:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__shift_vld;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__pop_num;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__push_select;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUControl;
        CData/*0:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__store_en;
        CData/*0:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__load_en;
        CData/*0:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__local_set;
        CData/*7:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__read_pointer;
        CData/*0:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_en;
        CData/*7:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__jump_addr;
        CData/*0:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__load_vld;
        CData/*0:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__push_num;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__write_pointer_shift_minusone;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__instr_pointer_state;
        CData/*2:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_byte_cnt;
        CData/*7:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_type;
        CData/*0:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__type_decode;
        CData/*7:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_reg;
        CData/*7:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_num_left;
        CData/*7:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__start_function_idx;
        CData/*0:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__code_pre_read;
        CData/*3:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_store_addr;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out1;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out2;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out3;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out4;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out5;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out6;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out7;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out8;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out10;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out11;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out13;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out14;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out15;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out16;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out17;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out19;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out30;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out31;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out32;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out33;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out34;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out35;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out36;
        CData/*1:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__push_select__out__strong__out37;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out38;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out39;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out40;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out41;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out42;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out43;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out44;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out45;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out46;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out47;
    };
    struct {
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out48;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out49;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out50;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out51;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out52;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out53;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out54;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out55;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out57;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out69;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out70;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out71;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out72;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out73;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out74;
        CData/*4:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__ALUControl__out__strong__out75;
        CData/*0:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT____VdfgRegularize_hbf18cbca_0_1;
        CData/*0:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__instr_finish;
        CData/*7:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__read_pointer;
        CData/*0:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__working;
        CData/*7:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__write_pointer;
        CData/*3:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer;
        CData/*3:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__pointer_after_pop;
        CData/*3:0*/ __VdlyDim0__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram__v0;
        CData/*0:0*/ __VdlySet__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram__v0;
        CData/*0:0*/ __VstlFirstIteration;
        CData/*0:0*/ __Vtrigprevexpr___TOP__TB_WASM_TOP__DOT__clk__0;
        CData/*0:0*/ __Vtrigprevexpr___TOP__TB_WASM_TOP__DOT__rst_n__0;
        CData/*0:0*/ __VactContinue;
        IData/*31:0*/ TB_WASM_TOP__DOT__ALUResult;
        IData/*31:0*/ TB_WASM_TOP__DOT__clk_cnt;
        IData/*31:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__ALUResult;
        VlWide<3>/*71:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__Instr;
        IData/*31:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__load_data;
        VlWide<8>/*255:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__wr_data;
        IData/*31:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__B_offset;
        IData/*31:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_decode;
        IData/*31:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__section_length;
        IData/*31:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_num;
        IData/*31:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__vector_cnt;
        IData/*31:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__sum;
        IData/*31:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__eq;
        IData/*31:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_u;
        IData/*31:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_u;
        IData/*31:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__lt_s;
        IData/*31:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_alu__DOT__gt_s;
        VlWide<16>/*511:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg;
        VlWide<16>/*511:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_stack__DOT__stack_reg_after_pop;
        IData/*31:0*/ __VdlyVal__TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram__v0;
        IData/*31:0*/ __VactIterCount;
        QData/*35:0*/ TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__LEB128_in;
        VlUnpacked<IData/*31:0*/, 16> TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_variables;
        VlUnpacked<CData/*7:0*/, 16> TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__global_var_type;
        VlUnpacked<IData/*31:0*/, 16> TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__local_variables;
        VlUnpacked<CData/*7:0*/, 8> TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__para_num_reg;
        VlUnpacked<CData/*7:0*/, 8> TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__retu_num_reg;
        VlUnpacked<VlWide<3>/*71:0*/, 16> TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_type_list;
        VlUnpacked<CData/*7:0*/, 32> TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__function_addr_list;
        VlUnpacked<CData/*6:0*/, 4> TB_WASM_TOP__DOT__u_wasm_top__DOT__u_ctrl_unit__DOT__u_decode__DOT__dt;
        VlUnpacked<CData/*7:0*/, 256> TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram;
        VlUnpacked<IData/*31:0*/, 16> TB_WASM_TOP__DOT__u_wasm_top__DOT__u_line_memory__DOT__bram;
        VlUnpacked<IData/*31:0*/, 16> TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram;
        VlUnpacked<CData/*0:0*/, 6> __Vm_traceActivity;
    };
    VlDelayScheduler __VdlySched;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<3> __VactTriggered;
    VlTriggerVec<3> __VnbaTriggered;

    // INTERNAL VARIABLES
    VTB_WASM_TOP__Syms* const vlSymsp;

    // CONSTRUCTORS
    VTB_WASM_TOP___024root(VTB_WASM_TOP__Syms* symsp, const char* v__name);
    ~VTB_WASM_TOP___024root();
    VL_UNCOPYABLE(VTB_WASM_TOP___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
