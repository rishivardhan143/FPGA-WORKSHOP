4-bit Adder with Registered 4-bit Sum
======================================

Files
-----
- adder4_reg.v     : 4-bit adder plus four output flip-flops
- tb_adder4_reg.v  : testbench
- README.txt       : instructions

Behavior
--------
sum_comb = a + b is the combinational sum.
At each rising edge of clk, sum_q captures the 4-bit result.

Important:
A + B can require 5 bits. This design stores only four bits, so carry-out
is discarded. Example: 15 + 1 = 16 (10000 binary), but sum_q stores 0000.
If you need to store carry-out too, you need five flip-flops.

ModelSim
--------
1. Put both .v files in one project folder.
2. Compile:
       vlog adder4_reg.v tb_adder4_reg.v
3. Simulate the testbench:
       vsim work.tb_adder4_reg
4. Add signals and run:
       add wave *
       run 60 ns

The testbench changes a and b on falling clock edges, so they are stable
before the next rising edge at which sum_q captures the result.
