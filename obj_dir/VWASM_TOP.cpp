// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VWASM_TOP__pch.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

VWASM_TOP::VWASM_TOP(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new VWASM_TOP__Syms(contextp(), _vcname__, this)}
    , i_clk{vlSymsp->TOP.i_clk}
    , i_rst_n{vlSymsp->TOP.i_rst_n}
    , o_INSTR_ERROR{vlSymsp->TOP.o_INSTR_ERROR}
    , o_instr_finish{vlSymsp->TOP.o_instr_finish}
    , o_stack_full{vlSymsp->TOP.o_stack_full}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
    contextp()->traceBaseModelCbAdd(
        [this](VerilatedTraceBaseC* tfp, int levels, int options) { traceBaseModel(tfp, levels, options); });
}

VWASM_TOP::VWASM_TOP(const char* _vcname__)
    : VWASM_TOP(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

VWASM_TOP::~VWASM_TOP() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void VWASM_TOP___024root___eval_debug_assertions(VWASM_TOP___024root* vlSelf);
#endif  // VL_DEBUG
void VWASM_TOP___024root___eval_static(VWASM_TOP___024root* vlSelf);
void VWASM_TOP___024root___eval_initial(VWASM_TOP___024root* vlSelf);
void VWASM_TOP___024root___eval_settle(VWASM_TOP___024root* vlSelf);
void VWASM_TOP___024root___eval(VWASM_TOP___024root* vlSelf);

void VWASM_TOP::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VWASM_TOP::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VWASM_TOP___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        VWASM_TOP___024root___eval_static(&(vlSymsp->TOP));
        VWASM_TOP___024root___eval_initial(&(vlSymsp->TOP));
        VWASM_TOP___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    VWASM_TOP___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool VWASM_TOP::eventsPending() { return false; }

uint64_t VWASM_TOP::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "%Error: No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* VWASM_TOP::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void VWASM_TOP___024root___eval_final(VWASM_TOP___024root* vlSelf);

VL_ATTR_COLD void VWASM_TOP::final() {
    VWASM_TOP___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* VWASM_TOP::hierName() const { return vlSymsp->name(); }
const char* VWASM_TOP::modelName() const { return "VWASM_TOP"; }
unsigned VWASM_TOP::threads() const { return 1; }
void VWASM_TOP::prepareClone() const { contextp()->prepareClone(); }
void VWASM_TOP::atClone() const {
    contextp()->threadPoolpOnClone();
}
std::unique_ptr<VerilatedTraceConfig> VWASM_TOP::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void VWASM_TOP___024root__trace_decl_types(VerilatedVcd* tracep);

void VWASM_TOP___024root__trace_init_top(VWASM_TOP___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    VWASM_TOP___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VWASM_TOP___024root*>(voidSelf);
    VWASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    if (strlen(vlSymsp->name())) tracep->pushPrefix(std::string{vlSymsp->name()}, VerilatedTracePrefixType::SCOPE_MODULE);
    VWASM_TOP___024root__trace_decl_types(tracep);
    VWASM_TOP___024root__trace_init_top(vlSelf, tracep);
    if (strlen(vlSymsp->name())) tracep->popPrefix();
}

VL_ATTR_COLD void VWASM_TOP___024root__trace_register(VWASM_TOP___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void VWASM_TOP::traceBaseModel(VerilatedTraceBaseC* tfp, int levels, int options) {
    (void)levels; (void)options;
    VerilatedVcdC* const stfp = dynamic_cast<VerilatedVcdC*>(tfp);
    if (VL_UNLIKELY(!stfp)) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'VWASM_TOP::trace()' called on non-VerilatedVcdC object;"
            " use --trace-fst with VerilatedFst object, and --trace with VerilatedVcd object");
    }
    stfp->spTrace()->addModel(this);
    stfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    VWASM_TOP___024root__trace_register(&(vlSymsp->TOP), stfp->spTrace());
}
