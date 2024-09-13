// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VTB_WASM_TOP.h for the primary calling header

#include "VTB_WASM_TOP__pch.h"
#include "VTB_WASM_TOP__Syms.h"
#include "VTB_WASM_TOP___024root.h"

void VTB_WASM_TOP___024root___ctor_var_reset(VTB_WASM_TOP___024root* vlSelf);

VTB_WASM_TOP___024root::VTB_WASM_TOP___024root(VTB_WASM_TOP__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , __VdlySched{*symsp->_vm_contextp__}
    , vlSymsp{symsp}
 {
    // Reset structure values
    VTB_WASM_TOP___024root___ctor_var_reset(this);
}

void VTB_WASM_TOP___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

VTB_WASM_TOP___024root::~VTB_WASM_TOP___024root() {
}
