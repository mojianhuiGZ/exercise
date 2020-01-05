`timescale 1ns/1ps

`include "regfile.h"
`include "regfile.v"

module regfile_test;

parameter PERI = 10;

reg clk;
reg reset_, we_;
reg [`ADDRBUS] addr;
reg [`DATABUS] din;
wire [`DATABUS] dout;
integer i;

regfile regfile1(
    .clk (clk),
    .reset_ (reset_),
    .we_ (we_),
    .addr (addr),
    .din (din),
    .dout (dout));

always #(PERI/2) begin
    clk <= #1 ~clk;
end

initial begin
    $dumpfile("regfile_test.vcd");
    $dumpvars(0, regfile_test);
    clk = 1'b0;
    reset_ = 1'b1;
    we_ = 1'b1;
    addr = `ADDR_W'bx;
    din = `DATA_W'bx;
    repeat(1) @(negedge clk);
    reset_ = 1'b0;
    repeat(1) @(posedge clk);
    reset_ = 1'b1;
    addr = `ADDR_W'b0;
    repeat(1) @(posedge clk);
    $finish;
end

endmodule
