`timescale 1ns / 1ps

module tsetlin_d_latch (
    input wire D,
    input wire EN,
    input wire rst,
    output wire Q,
    output wire Qn
);
    wire Dn = ~D;
    wire set_g = rst ? 1 : ~(D & EN);
    wire rst_g = rst ? 0 : ~(Dn & EN);

    assign Q  = ~(set_g & Qn);
    assign Qn = ~(rst_g & Q);
endmodule

module tsetlin_dff (
    input wire D,
    input wire clk,
    input wire rst,
    output wire Q,
    output wire Qn
);
    wire clk_n = ~clk;
    wire q_internal, qn_internal;

    tsetlin_d_latch master (.D(D),  .EN(clk_n),  .rst(rst),  .Q(q_internal), .Qn(qn_internal));
    tsetlin_d_latch slave  (.D(q_internal), .EN(clk), .rst(rst), .Q(Q),  .Qn(Qn));
endmodule

module tsetlin_registers (
    input wire clk,
    input wire DA,
    input wire DB,
    input wire DC,
    input wire rst,
    output wire Q_DA,
    output wire Q_DB,
    output wire Q_DC,
    output wire Qn_DA,
    output wire Qn_DB,
    output wire Qn_DC
);
    tsetlin_dff ffA (.D(DA), .clk(clk), .rst(rst), .Q(Q_DA), .Qn(Qn_DA));
    tsetlin_dff ffB (.D(DB), .clk(clk), .rst(rst), .Q(Q_DB), .Qn(Qn_DB));
    tsetlin_dff ffC (.D(DC), .clk(clk), .rst(rst), .Q(Q_DC), .Qn(Qn_DC));
endmodule