`timescale 1ns / 1ps

module tsetlin_fsm_tb; 
reg x;
reg clk = 0;
reg rst;
wire alpha;

tsetlin_fsm dut (
    .clk(clk),
    .x(x),
    .alpha(alpha),
    .rst(rst)
);

always #10 clk = ~clk;

initial begin
    rst = 1;
    #10;
    rst = 0;
    #10
    x = 1;
    #20;
    x = 0;
    #20;
    x = 0;
    #20;
    x = 0;
    #20;
    x = 1;
    #20;
    x = 1;
    #20;
    x = 1;
    #20;
    x = 0;
    #20;
    x = 0;
    #20;
    x = 0;
    #20;
    x = 1;
    #20;
    x = 1;
    #20;
    x = 1;
    #20;
end

endmodule