# wasm_cpu_flow

Please install verilator and gtkwave first: \
verilator: [https://verilator.org/guide/latest/install.html#git-install](https://verilator.org/guide/latest/install.html#git-install)\
gtkwave: `sudo apt-get install gtkwave`
### before running flow:
``` bash
gedit makefile
```
On the first line, set `test_instr` to the target benchmark with "_hex.txt" as the suffix.

### run flow:

iverilog version is better at this point:

```bash
make iverilog
```

verilator version has some problem:

``` bash
make
cd obj_dir
bash gtk_obj.sh
```

or simply without wave:
``` bash
make
cd obj_dir
bash obj.sh
```
