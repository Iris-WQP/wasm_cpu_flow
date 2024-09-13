// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VWASM_TOP.h for the primary calling header

#include "VWASM_TOP__pch.h"
#include "VWASM_TOP__Syms.h"
#include "VWASM_TOP___024root.h"

void VWASM_TOP___024root___ctor_var_reset(VWASM_TOP___024root* vlSelf);

VWASM_TOP___024root::VWASM_TOP___024root(VWASM_TOP__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    VWASM_TOP___024root___ctor_var_reset(this);
}

void VWASM_TOP___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

VWASM_TOP___024root::~VWASM_TOP___024root() {
}
