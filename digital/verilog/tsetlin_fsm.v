`timescale 1ns / 1ps

module tsetlin_fsm(
    input clk,
    input x,
    input rst,

    output alpha
);
wire A;
wire B;
wire C;
wire nA;
wire nB;
wire nC;

wire DA;
wire DB;
wire DC;

assign alpha = A;

tsetlin_comb tsetlin_comb1(
    // Connect input of the fsm to the input variable x
    .x(x),
    // Connect input of comb part to output of Dff's
    .A(A),
    .B(B),
    .C(C),
    .nA(nA),
    .nB(nB),
    .nC(nC),
    // Connect output of comb part to input of Dff's
    .DA(DA),
    .DB(DB),
    .DC(DC)
);

tsetlin_registers tsetlin_registers1(
    .clk(clk),
    .rst(rst),
    // Connect inputs of Dff's to output of comb part
    .DA(DA),
    .DB(DB),
    .DC(DC),
    // Connect outputs of Dff's to input of comb part
    .Q_DA(A),
    .Q_DB(B),
    .Q_DC(C),
    .Qn_DA(nA),
    .Qn_DB(nB),
    .Qn_DC(nC)
);

endmodule