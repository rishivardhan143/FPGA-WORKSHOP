4-bit Registered Adder — Exhaustive Testbench

Files:
- adder4_reg.v: design
- tb_adder4_reg.v: tests all 256 input combinations
- all_256_results.csv: expected output table

ModelSim Intel FPGA Edition:
1. vlog adder4_reg.v tb_adder4_reg.v
2. vsim work.tb_adder4_reg
3. add wave *
4. run -all

The testbench prints all 256 combinations in the Transcript window.
To view the waveform clearly, you can enter:
  add wave sim:/tb_adder4_reg/clk
  add wave -radix unsigned sim:/tb_adder4_reg/a
  add wave -radix unsigned sim:/tb_adder4_reg/b
  add wave -radix unsigned sim:/tb_adder4_reg/sum_q

A and B range from 0 to 15. The output is 4 bits, so it equals (A+B) modulo 16.
For example, 15 + 1 gives 0000 because the carry-out is discarded.
As a registered adder, sum_q updates at the rising edge of clk.
