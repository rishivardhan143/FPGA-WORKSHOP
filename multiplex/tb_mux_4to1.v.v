`timescale 1ns/1ps

module mux_tb;

    reg [3:0] I;
    reg [1:0] S;
    wire Y;

    integer i, j;

    // DUT instantiation
    mux_4to1 dut (
        .I(I),
        .S(S),
        .Y(Y)
    );

    initial begin
        $display("I\tS\tY");
        $display("----------------");

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                I = i;
                S = j;
                #10;
                $display("%b\t%b\t%b", I, S, Y);
            end
        end

        $finish;
    end

endmodule
