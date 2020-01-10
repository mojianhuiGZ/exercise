//ripple-carry adder
module add_rca_4(a, b, cin, s, cout);
input wire [3:0] a, b;
input wire cin;
output wire [3:0] s;
output wire cout;

wire c1;

fulladder(.a(), .b(), .s(), );
endmodule

module add_rca_8(a, b, cin, s, cout);
input wire [7:0] a, b;
input wire cin;
output wire [7:0] s;
output wire cout;

wire c1;

add_rca_4 m1(a[3:0], b[3:0], cin, s[3:0], c1);
add_rca_4 m2(a[7:4], b[7:4], c1, s[7:4], cout);
endmodule

module add_rca_32(a, b, cin, s, cout);
input wire [31:0] a, b;
input wire cin;
output wire [31:0] s;
output wire cout;

wire c1, c2, c3;

add_rca_8 m1(a[7:0], b[7:0], cin, s[7:0], c1);
add_rca_8 m2(a[15:8], b[15:8], c1, s[15:8], c2);
add_rca_8 m3(a[23:16], b[23:16], c2, s[23:16], c3);
add_rca_8 m4(a[31:24], b[31:24], c3, s[31:24], cout);
endmodule
