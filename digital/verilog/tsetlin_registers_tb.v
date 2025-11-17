`timescale 1ns / 1ps

module tsetlin_registers_tb; 
reg DA = 0;
reg DB = 0;
reg DC = 0;
reg clk = 0;

wire Q_DA;
wire Q_DB;
wire Q_DC;

tsetlin_registers dut (
    .clk(clk),
    .DA(DA), .DB(DB), .DC(DC),
    .Q_DA(Q_DA), .Q_DB(Q_DB), .Q_DC(Q_DC)
);

always #10 clk = ~clk;

initial begin
    #10;
    DA = 1; DB = 1; DC = 1;
    #20;
    DA = 1; DB = 1; DC = 1;
    #20;
    DA = 0; DB = 0; DC = 0;
    #20;
    DA = 0; DB = 0; DC = 0;
    #20;
end

endmodule