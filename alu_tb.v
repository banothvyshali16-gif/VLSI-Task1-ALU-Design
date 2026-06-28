`timescale 1ns/1ps

module alu_tb;

reg [7:0] A, B;
reg [2:0] Sel;
wire [7:0] Result;

alu uut (
    .A(A),
    .B(B),
    .Sel(Sel),
    .Result(Result)
);

integer i;

initial begin

    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    A = 8'd10;
    B = 8'd5;

    for(i=0; i<8; i=i+1) begin
        Sel = i;
        #10;
    end

    // Random Tests
    repeat(10) begin
        A = $random;
        B = $random;
        Sel = $random % 8;
        #10;
    end

    $finish;

end

endmodule