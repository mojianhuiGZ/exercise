`timescale 1ns/1ps

module add_rca_32_test;

parameter PERI = 10;

wire cin;
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
        for (i = 0; i < 10; i++) begin
			a <= i;
			b <= i;
			cin <= 0;
            #1
        end
    end
    $finish;
end

initial begin
    $dumpfile("add_rca_32_test.vcd");
    $dumpvars(0, add_rca_32_test);
end

endmodule
