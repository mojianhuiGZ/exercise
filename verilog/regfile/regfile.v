`include "regfile.h"

module regfile (
    input wire clk,
    input wire reset_,
    input wire we_,
    input wire [`ADDRBUS] addr,
    input wire [`DATABUS] din,
    output wire [`DATABUS] dout
);
reg [`DATABUS] mem[0:`DATA_D];
integer i;
assign dout = mem[addr];
always @(posedge clk or negedge reset_) begin
    if (reset_ == `ENABLE_) begin
        for (i = 0; i < `DATA_D; i = i + 1)
            mem[i] <= #1 `DATA_W'h0;
    end else if (we_ == `ENABLE_) begin
        mem[addr] <= #1 din;
    end
end
endmodule
