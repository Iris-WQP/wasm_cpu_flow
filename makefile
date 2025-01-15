test_instr = return_hex.txt
tb_name = TB_WASM_TOP.v

verilator:
	verilator -cc -trace --timing ./test/$(tb_name) -exe ./sim_main.cpp -Wno-WIDTHTRUNC -Wno-WIDTHEXPAND
	cp ./wasm_benchmark_file/$(test_instr) ./obj_dir/

iverilog:
	cp ./wasm_benchmark_file/$(test_instr) ./
	iverilog -o wave ./test/$(tb_name)
	vvp -n wave -lxt2

wave_iverilog:
	cp ./wasm_benchmark_file/$(test_instr) ./
	iverilog -o wave ./test/$(tb_name)
	vvp -n wave -lxt2
	gtkwave ./wave.vcd &

generate_instructions:
	python3 arrange_instr_format.py

check_result:
	python CheckResult.py

sram:
	iverilog -o wave_sram ./test/sram_tb.v
	vvp -n wave_sram -lxt2
	gtkwave ./wave_sram.vcd &

clean:
	rm -f ./wave 
	rm -f ./*.vcd 
	rm -f ./result_mem.csv
	rm -f ./input_mem.csv
	rm -f ./in.npy