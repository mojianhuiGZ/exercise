`timescale 1ns/1ps

`include "regfile.h"

module regfile_test;

parameter PERI = 10;

reg clk;
reg reset_, we_;
reg [`ADDRBUS] addr;
reg [`DATABUS] din;
wire [`DATABUS] dout;
integer i;

regfile regfile(
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
    #0 begin
        clk <= `LOW;
        reset_ <= `DISABLE_;
        we_ <= `DISABLE_;
        addr <= `ADDR_W'bx;
        din <= `DATA_W'bx;
    end
    #(PERI/2) reset_ <= #1 `ENABLE_;
    #(PERI/2) reset_ <= #1 `DISABLE_;
    #0 begin
        for (i = 0; i < `DATA_D; i++) begin
            #PERI begin
                we_ <= #1 `DISABLE_;
                addr <= #1 i;
            end
            #PERI begin
                we_ <= #1 `ENABLE_;
                din <= #1 i+1;
            end
            #PERI begin
                we_ <= #1 `DISABLE_;
            end
        end
    end
    $finish;
end

initial begin
    $dumpfile("regfile_test.vcd");
    $dumpvars(0, regfile_test);
end

endmodule
