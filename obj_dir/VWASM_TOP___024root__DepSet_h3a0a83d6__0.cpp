// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VWASM_TOP.h for the primary calling header

#include "VWASM_TOP__pch.h"
#include "VWASM_TOP__Syms.h"
#include "VWASM_TOP___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void VWASM_TOP___024root___dump_triggers__act(VWASM_TOP___024root* vlSelf);
#endif  // VL_DEBUG

void VWASM_TOP___024root___eval_triggers__act(VWASM_TOP___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VWASM_TOP___024root___eval_triggers__act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.set(0U, (((IData)(vlSelfRef.i_clk) 
                                        & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__i_clk__0))) 
                                       | ((~ (IData)(vlSelfRef.i_rst_n)) 
                                          & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__i_rst_n__0))));
    vlSelfRef.__VactTriggered.set(1U, ((IData)(vlSelfRef.i_clk) 
                                       & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__i_clk__0))));
    vlSelfRef.__Vtrigprevexpr___TOP__i_clk__0 = vlSelfRef.i_clk;
    vlSelfRef.__Vtrigprevexpr___TOP__i_rst_n__0 = vlSelfRef.i_rst_n;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VWASM_TOP___024root___dump_triggers__act(vlSelf);
    }
#endif
}
