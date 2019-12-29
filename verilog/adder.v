module adder {
    input  wire [31:0] in_0,
    input  wire [31:0] in_1,
    output wire [31:0] out
};
    assign out = in_0 + in_1;
endmodule
