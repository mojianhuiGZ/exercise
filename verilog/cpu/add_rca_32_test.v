`timescale 1ns/1ps

module add_rca_32_test;

reg cin;
reg [31:0] a;
reg [31:0] b;
wire [31:0] s;
wire cout;

add_rca_32 adder1(
	.a(a),
	.b(b),
	.cin(cin),
	.s(s),
	.cout(cout));

initial begin
    #0 begin
        a <= 32'h12345678;
        b <= 32'hffffffff;
        cin <= 0;
    end
    #1
    $finish;
end

initial begin
    $dumpfile("add_rca_32_test.vcd");
    $dumpvars(0, add_rca_32_test);
end

endmodule
