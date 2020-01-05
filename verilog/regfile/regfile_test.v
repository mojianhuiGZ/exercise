`timescale 1ns/1ps
`include regfile.h

module regfile_test;

reg clk;
wire reset_, we_;
wire [`ADDRBUS] addr;
wire [`DATABUS] din, dout;

regfile regfile1(
    .clk (clk),
    .reset_ (reset_),
    .we_ (we_),
    .addr (addr),
    .din (din),
    .dout (dout));

always #10 begin
    clk <= #1 ~clk;
end

initial begin
    #0 begin
        clk <= 1'b0;
        reset_ <= 1'b1;
        we_ <= 1'b1;
        addr <= `ADDRBUS'dx;
        din <= `DATABUS'dx;
        dout <= `DATABUS'dx;
    end
    #10 begin
        reset_ <= 0;
        reset_ <= #5 1;  
    end
    #20 begin
    end
end

endmodule
