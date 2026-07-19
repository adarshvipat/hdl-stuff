4-bit ALU (Verilog)

A simple combinational 4-bit ALU supporting ADD, SUB, AND, and OR.

Files
alu.v - the ALU module
alu_tb.v - testbench

Operation encoding
sel = 00: ADD
sel = 01: SUB
sel = 10: AND
sel = 11: OR

Ports
a, b: 4-bit inputs
sel: 2-bit operation select
out: 4-bit result
carry: carry-out for ADD/SUB, tied to 0 for AND/OR

Design notes
ADD and SUB share the same adder logic. SUB is computed as a + ~b + 1 (two's complement). Both use a 5-bit intermediate result so carry can be split from the 4-bit output. AND and OR are simple bitwise ops.

Testbench
Runs 6 test cases: normal ADD, ADD with overflow, normal SUB, SUB with borrow, AND, OR. Results print live with $monitor, and waveforms are dumped with $dumpfile and $dumpvars for viewing in EPWave.

Simulation
Run on EDA Playground with Icarus Verilog, or locally with:
iverilog -o alu_sim alu.v alu_tb.v
vvp alu_sim

Waveform
waveform.png
