`timescale 1ns/1ps

module tb_adder4_reg;

reg clk;
reg [3:0] a;
reg [3:0] b;
wire [3:0] sum_q;

adder4_reg uut (
    .clk   (clk),
    .a     (a),
    .b     (b),
    .sum_q (sum_q)
);

// 10 ns clock period
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

// Change inputs on falling edges to avoid a race with the DUT.
initial begin
    a = 4'd0;
    b = 4'd0;

    @(negedge clk); a = 4'd3;  b = 4'd2;   // 3 + 2 = 5
    @(negedge clk); a = 4'd7;  b = 4'd8;   // 7 + 8 = 15
    @(negedge clk); a = 4'd9;  b = 4'd6;   // 9 + 6 = 15
    @(negedge clk); a = 4'd15; b = 4'd1;   // 15 + 1 = 16; stored result = 0
    @(negedge clk); a = 4'd10; b = 4'd4;  // 10 + 4 = 14

    @(negedge clk);
    #1 $finish;
end

initial begin
    $monitor("Time=%0t ns | clk=%b | a=%d (%b) | b=%d (%b) | sum_q=%d (%b)",
             $time, clk, a, a, b, b, sum_q, sum_q);
end

endmodule
