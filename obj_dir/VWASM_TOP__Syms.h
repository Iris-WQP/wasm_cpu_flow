// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VWASM_TOP__SYMS_H_
#define VERILATED_VWASM_TOP__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "VWASM_TOP.h"

// INCLUDE MODULE CLASSES
#include "VWASM_TOP___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES)VWASM_TOP__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    VWASM_TOP* const __Vm_modelp;
    bool __Vm_activity = false;  ///< Used by trace routines to determine change occurred
    uint32_t __Vm_baseCode = 0;  ///< Used by trace routines when tracing multiple models
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    VWASM_TOP___024root            TOP;

    // CONSTRUCTORS
    VWASM_TOP__Syms(VerilatedContext* contextp, const char* namep, VWASM_TOP* modelp);
    ~VWASM_TOP__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
};

#endif  // guard
