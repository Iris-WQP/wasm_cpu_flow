// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTB_WASM_TOP.h for the primary calling header

#include "VTB_WASM_TOP__pch.h"
#include "VTB_WASM_TOP__Syms.h"
#include "VTB_WASM_TOP___024root.h"

extern const VlWide<8>/*255:0*/ VTB_WASM_TOP__ConstPool__CONST_h2f89c816_0;

VL_ATTR_COLD void VTB_WASM_TOP___024root___eval_initial__TOP(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_initial__TOP\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSymsp->_vm_contextp__->dumpfile(std::string{"wave.vcd"});
    vlSymsp->_traceDumpOpen();
    VL_WRITEF_NX("Loading test data\n",0);
    VL_READMEM_N(true, 8, 128, 0, VL_CVT_PACK_STR_NW(8, VTB_WASM_TOP__ConstPool__CONST_h2f89c816_0)
                 ,  &(vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_instr_mem_ctrl__DOT__bram)
                 , 0, ~0ULL);
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[0U] = 0xaU;
    vlSelfRef.TB_WASM_TOP__DOT__u_wasm_top__DOT__u_local_mem__DOT__bram[1U] = 6U;
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VTB_WASM_TOP___024root___dump_triggers__stl(VTB_WASM_TOP___024root* vlSelf);
#endif  // VL_DEBUG

VL_ATTR_COLD void VTB_WASM_TOP___024root___eval_triggers__stl(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_triggers__stl\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VstlTriggered.set(0U, (IData)(vlSelfRef.__VstlFirstIteration));
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VTB_WASM_TOP___024root___dump_triggers__stl(vlSelf);
    }
#endif
}
