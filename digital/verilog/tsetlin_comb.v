`timescale 1ns / 1ps

module tsetlin_comb (
    input wire A,
    input wire B,
    input wire C,
    input wire nA,
    input wire nB,
    input wire nC,
    input wire x,
    output wire DA,
    output wire DB,
    output wire DC
);
wire nand_out_1;
wire nand_out_2;
wire nand_out_3;

wire nand_out_4;
wire nand_out_5;
wire nand_out_6;

wire nand_out_7;
wire nand_out_8;
wire nand_out_9;
wire nand_out_10;

wire nand_out_11;
wire nand_out_12;
wire nand_out_13;

assign nand_out_1 = ~(A & nC);
assign nand_out_2 = ~(nA & B & C & ~x);
assign nand_out_3 = ~(A & B & C & x);

assign nand_out_4 = ~(nA & C & ~x);
assign nand_out_5 = ~(A & B & C);
assign nand_out_6 = ~(A & nC & ~x);

assign nand_out_7 = ~(nA & nB & ~x);
assign nand_out_8 = ~(nA & B & C & ~x);
assign nand_out_9 = ~(nA & B & C & x);
assign nand_out_10 = ~(A & B & ~x);

assign nand_out_11 = ~(nand_out_1 & nand_out_2 & nand_out_3);
assign nand_out_12 = ~(nand_out_4 & nand_out_5 & nand_out_6);
assign nand_out_13 = ~(nand_out_7 & nand_out_8 & nand_out_9 & nand_out_10);

assign DA = nand_out_11;
assign DB = nand_out_12;
assign DC = nand_out_13;

endmodule