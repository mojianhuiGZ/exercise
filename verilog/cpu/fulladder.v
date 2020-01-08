module fulladder(
    input wire a, b, cin,
    output wire s, cout
);
wire p, g;

assign p = a ^ b;
assign g = a & b;
assign s = p ^ cin;
assign cout = g | (p & cin);

endmodule
