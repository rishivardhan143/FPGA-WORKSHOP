D Flip-Flop Verilog Example
===========================

Files
-----
- dff.v       : D flip-flop design
- tb_dff.v    : Testbench for simulation

ModelSim steps
--------------
1. Create/open a ModelSim project.
2. Add dff.v and tb_dff.v.
3. Compile both files.
4. Start simulation with work.tb_dff as the top-level module.
5. Add clk, d, and q to the Wave window.
6. Run for 60 ns.

Expected behavior
-----------------
q captures d on each rising edge of clk and holds its value between edges.
Because there is no reset or initial value, q starts as X until the first
rising clock edge.

You can also compile/run with Icarus Verilog:
    iverilog -o dff_sim dff.v tb_dff.v
    vvp dff_sim
