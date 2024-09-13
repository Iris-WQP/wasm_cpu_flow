// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTB_WASM_TOP.h for the primary calling header

#include "VTB_WASM_TOP__pch.h"
#include "VTB_WASM_TOP__Syms.h"
#include "VTB_WASM_TOP___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void VTB_WASM_TOP___024root___dump_triggers__act(VTB_WASM_TOP___024root* vlSelf);
#endif  // VL_DEBUG

void VTB_WASM_TOP___024root___eval_triggers__act(VTB_WASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VTB_WASM_TOP___024root___eval_triggers__act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.set(0U, (((IData)(vlSelfRef.TB_WASM_TOP__DOT__clk) 
                                        & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__TB_WASM_TOP__DOT__clk__0))) 
                                       | ((~ (IData)(vlSelfRef.TB_WASM_TOP__DOT__rst_n)) 
                                          & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__TB_WASM_TOP__DOT__rst_n__0))));
    vlSelfRef.__VactTriggered.set(1U, ((IData)(vlSelfRef.TB_WASM_TOP__DOT__clk) 
                                       & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__TB_WASM_TOP__DOT__clk__0))));
    vlSelfRef.__VactTriggered.set(2U, vlSelfRef.__VdlySched.awaitingCurrentTime());
    vlSelfRef.__Vtrigprevexpr___TOP__TB_WASM_TOP__DOT__clk__0 
        = vlSelfRef.TB_WASM_TOP__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__TB_WASM_TOP__DOT__rst_n__0 
        = vlSelfRef.TB_WASM_TOP__DOT__rst_n;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VTB_WASM_TOP___024root___dump_triggers__act(vlSelf);
    }
#endif
}
