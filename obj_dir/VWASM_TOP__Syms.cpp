// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table implementation internals

#include "VWASM_TOP__pch.h"
#include "VWASM_TOP.h"
#include "VWASM_TOP___024root.h"

// FUNCTIONS
VWASM_TOP__Syms::~VWASM_TOP__Syms()
{
}

VWASM_TOP__Syms::VWASM_TOP__Syms(VerilatedContext* contextp, const char* namep, VWASM_TOP* modelp)
    : VerilatedSyms{contextp}
    // Setup internal state of the Syms class
    , __Vm_modelp{modelp}
    // Setup module instances
    , TOP{this, namep}
{
        // Check resources
        Verilated::stackCheck(86);
    // Configure time unit / time precision
    _vm_contextp__->timeunit(-12);
    _vm_contextp__->timeprecision(-12);
    // Setup each module's pointers to their submodules
    // Setup each module's pointer back to symbol table (for public functions)
    TOP.__Vconfigure(true);
}
