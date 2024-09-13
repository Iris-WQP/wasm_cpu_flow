// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "VTB_WASM_TOP__pch.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

VTB_WASM_TOP::VTB_WASM_TOP(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new VTB_WASM_TOP__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
    contextp()->traceBaseModelCbAdd(
        [this](VerilatedTraceBaseC* tfp, int levels, int options) { traceBaseModel(tfp, levels, options); });
}

VTB_WASM_TOP::VTB_WASM_TOP(const char* _vcname__)
    : VTB_WASM_TOP(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

VTB_WASM_TOP::~VTB_WASM_TOP() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void VTB_WASM_TOP___024root___eval_debug_assertions(VTB_WASM_TOP___024root* vlSelf);
#endif  // VL_DEBUG
void VTB_WASM_TOP___024root___eval_static(VTB_WASM_TOP___024root* vlSelf);
void VTB_WASM_TOP___024root___eval_initial(VTB_WASM_TOP___024root* vlSelf);
void VTB_WASM_TOP___024root___eval_settle(VTB_WASM_TOP___024root* vlSelf);
void VTB_WASM_TOP___024root___eval(VTB_WASM_TOP___024root* vlSelf);

void VTB_WASM_TOP::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VTB_WASM_TOP::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    VTB_WASM_TOP___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        VTB_WASM_TOP___024root___eval_static(&(vlSymsp->TOP));
        VTB_WASM_TOP___024root___eval_initial(&(vlSymsp->TOP));
        VTB_WASM_TOP___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    VTB_WASM_TOP___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

void VTB_WASM_TOP::eval_end_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+eval_end_step VTB_WASM_TOP::eval_end_step\n"); );
#ifdef VM_TRACE
    // Tracing
    if (VL_UNLIKELY(vlSymsp->__Vm_dumping)) vlSymsp->_traceDump();
#endif  // VM_TRACE
}

//============================================================
// Events and timing
bool VTB_WASM_TOP::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t VTB_WASM_TOP::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* VTB_WASM_TOP::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void VTB_WASM_TOP___024root___eval_final(VTB_WASM_TOP___024root* vlSelf);

VL_ATTR_COLD void VTB_WASM_TOP::final() {
    VTB_WASM_TOP___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* VTB_WASM_TOP::hierName() const { return vlSymsp->name(); }
const char* VTB_WASM_TOP::modelName() const { return "VTB_WASM_TOP"; }
unsigned VTB_WASM_TOP::threads() const { return 1; }
void VTB_WASM_TOP::prepareClone() const { contextp()->prepareClone(); }
void VTB_WASM_TOP::atClone() const {
    contextp()->threadPoolpOnClone();
}
std::unique_ptr<VerilatedTraceConfig> VTB_WASM_TOP::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void VTB_WASM_TOP___024root__trace_decl_types(VerilatedVcd* tracep);

void VTB_WASM_TOP___024root__trace_init_top(VTB_WASM_TOP___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    VTB_WASM_TOP___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VTB_WASM_TOP___024root*>(voidSelf);
    VTB_WASM_TOP__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    if (strlen(vlSymsp->name())) tracep->pushPrefix(std::string{vlSymsp->name()}, VerilatedTracePrefixType::SCOPE_MODULE);
    VTB_WASM_TOP___024root__trace_decl_types(tracep);
    VTB_WASM_TOP___024root__trace_init_top(vlSelf, tracep);
    if (strlen(vlSymsp->name())) tracep->popPrefix();
}

VL_ATTR_COLD void VTB_WASM_TOP___024root__trace_register(VTB_WASM_TOP___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void VTB_WASM_TOP::traceBaseModel(VerilatedTraceBaseC* tfp, int levels, int options) {
    (void)levels; (void)options;
    VerilatedVcdC* const stfp = dynamic_cast<VerilatedVcdC*>(tfp);
    if (VL_UNLIKELY(!stfp)) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'VTB_WASM_TOP::trace()' called on non-VerilatedVcdC object;"
            " use --trace-fst with VerilatedFst object, and --trace with VerilatedVcd object");
    }
    stfp->spTrace()->addModel(this);
    stfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    VTB_WASM_TOP___024root__trace_register(&(vlSymsp->TOP), stfp->spTrace());
}
