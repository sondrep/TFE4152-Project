`timescale 1ns / 1ps

module tsetlin_registers(
    input DA,
    input DB,
    input DC,
    input clk,

    output Q_DA,
    output Q_DB,
    output Q_DC
);
reg DA_reg = 0;
reg DB_reg = 0;
reg DC_reg = 0;

assign Q_DA = DA_reg;
assign Q_DB = DB_reg;
assign Q_DC = DC_reg;

always @(posedge(clk)) begin
    DA_reg <= DA;
    DB_reg <= DB;
    DC_reg <= DC;
end

endmodule