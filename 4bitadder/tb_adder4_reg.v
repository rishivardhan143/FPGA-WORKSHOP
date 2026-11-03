`timescale 1ns/1ps
module tb_adder4_reg;
    reg clk;
    reg [3:0] a, b;
    wire [3:0] sum_q;
    integer i, j;

    adder4_reg dut (.clk(clk), .a(a), .b(b), .sum_q(sum_q));

    initial clk = 1'b0;
    always #5 clk = ~clk; // 10 ns clock period

    initial begin
        a = 0;
        b = 0;
        $display(" A(dec) B(dec) | A(bin) B(bin) | SUM(dec) SUM(bin)");
        $display("------------------------------------------------------");

        // Tests all 16 x 16 = 256 combinations.
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                @(negedge clk);
                a = i;
                b = j;
                @(posedge clk);
                #1;
                $display("   %2d     %2d   |  %04b   %04b  |   %2d     %04b",
                         a, b, a, b, sum_q, sum_q);
            end
        end

        $display("Completed all 256 input combinations.");
        $finish;
    end
endmodule
