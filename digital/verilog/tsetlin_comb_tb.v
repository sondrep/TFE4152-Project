`timescale 1ns / 1ps

module tsetlin_comb_tb; 
reg A;
reg B;
reg C;
reg nA;
reg nB;
reg nC;
reg x;

wire DA;
wire DB;
wire DC;

always @* begin
    nA = ~A;
    nB = ~B;
    nC = ~C;
end

tsetlin_comb dut (
    .x(x),
    .A(A), .B(B), .C(C),
    .nA(nA), .nB(nB), .nC(nC),
    .DA(DA), .DB(DB), .DC(DC)
);

initial begin
    // Testcase T0-T11
    A = 0; B = 0; C = 0; x = 0; #20;
    A = 0; B = 0; C = 0; x = 1; #20;
    A = 0; B = 0; C = 1; x = 0; #20;
    A = 0; B = 0; C = 1; x = 1; #20;
    A = 0; B = 1; C = 1; x = 0; #20;
    A = 0; B = 1; C = 1; x = 1; #20;
    A = 1; B = 1; C = 1; x = 0; #20;
    A = 1; B = 1; C = 1; x = 1; #20;
    A = 1; B = 1; C = 0; x = 0; #20;
    A = 1; B = 1; C = 0; x = 1; #20;
    A = 1; B = 0; C = 0; x = 0; #20;
    A = 1; B = 0; C = 0; x = 1; #20;
    // Set everything to 0 again
    A = 0; B = 0; C = 0; x = 0; #20;
    // Testcase T12-T15
    A = 0; B = 1; C = 0; x = 0; #20;
    A = 0; B = 1; C = 0; x = 1; #20;
    A = 1; B = 0; C = 1; x = 0; #20;
    A = 1; B = 0; C = 1; x = 1; #20;
    // Set everything to 0 again
    A = 0; B = 0; C = 0; x = 0; #20;
end

endmodule