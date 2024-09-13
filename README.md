# wasm_cpu_flow



### before running flow:
``` bash
gedit makefile
```
Change `test_instr.txt` into target benchmark with "_hex.txt" as the suffix.



### run flow:
``` bash
make verilator
cd obj_dir
bash gtk_obj.sh
```

or simply without wave:
``` bash
make
cd obj_dir
bash obj.sh
```