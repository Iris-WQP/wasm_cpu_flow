default:
	iverilog -o wave ./test/TB_WASM_TOP.v
	vvp -n wave -lxt2

generate_instructions:
	python3 arrange_instr_format.py

verilator:
	verilator -cc -trace --timing TB_WASM_TOP.v -exe sim_main.cpp

check_result:
	python CheckResult.py

clean:
	rm -f ./wave 
	rm -f ./*.vcd 
	rm -f ./result_mem.csv
	rm -f ./input_mem.csv
	rm -f ./in.npy