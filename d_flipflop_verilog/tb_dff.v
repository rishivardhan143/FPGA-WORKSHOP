`timescale 1ns/1ps

module tb_dff;

reg clk;
reg d;
wire q;

// Instantiate the design under test (DUT)
dff uut (
    .clk(clk),
    .d(d),
    .q(q)
);

// 10 ns clock period
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

// Apply input stimulus
initial begin
    d = 1'b0;

    #10 d = 1'b1;
    #10 d = 1'b0;
    #10 d = 1'b1;
    #10 d = 1'b1;
    #10 d = 1'b0;

    #10 $finish;
end

// Print signal changes
initial begin
    $monitor("Time=%0t ns | clk=%b | d=%b | q=%b",
             $time, clk, d, q);
end

endmodule
