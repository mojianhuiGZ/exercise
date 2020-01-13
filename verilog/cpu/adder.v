`timescale 1ns / 1ps

module BitwiseG(
	input Ai,
	input Bi,
	output Gi
    );

and #0.1 (Gi,Ai,Bi);

endmodule

module BitwiseP(
		input Ai,
		input Bi,
		output Pi
    );

xor #0.1 (Pi,Ai,Bi);

endmodule

module BlackCell(
	input Gik,
	input Pik,
	input Gk_1j,
	input Pk_1j,
	output Gij,
	output Pij
    );
	 
wire net1;

and #0.1 (net1,Pik,Gk_1j);
or #0.1 (Gij,Gik,net1);		// output Gij generated here
and #0.1 (Pij,Pik,Pk_1j);		// output Pij generated

endmodule

module GrayCell(
	input Gik,
	input Pik,
	input Gk_1j,
	output Gij
    );

wire net1;

and #0.1 (net1,Pik,Gk_1j);
or #0.1 (Gij,Gik,net1);		// output Gij generated here

endmodule

module BUFFER(
	input Pi,
	input Gi,
	output Po,
	output Go
    );
	 
assign #0.1 Po = Pi;
assign #0.1 Go = Gi;

endmodule

module HalfAdder(
    input A,B,
    output S,Cout
    );
	 
assign #0.1 S = A^B;
assign #0.1 Cout = A&B; 

endmodule

module FullAdder(
    input A,B,
    input Cin,
    output S,
    output Cout
    );
assign #0.4 S=A^B^Cin;
assign #0.2 Cout=(A&B)|(B&Cin)|(A&Cin);

endmodule

module MUX2x1(
    input din_0,
	 input din_1,
    input sel,
    output mux_out      
  );
  
  
  assign #0.1 mux_out = (sel) ? din_1 : din_0;


endmodule

module RCA32Bit(
		input [31:0] A,
		input [31:0] B,
		input Cin,
		output [31:0] S,
		output Cout
    );
	 
wire [32:0] carry_prop;
assign carry_prop[0] = Cin;

FullAdder FullAdder0 (A[0],B[0],carry_prop[0],S[0],carry_prop[1]);
FullAdder FullAdder1 (A[1],B[1],carry_prop[1],S[1],carry_prop[2]);
FullAdder FullAdder2 (A[2],B[2],carry_prop[2],S[2],carry_prop[3]);
FullAdder FullAdder3 (A[3],B[3],carry_prop[3],S[3],carry_prop[4]);
FullAdder FullAdder4 (A[4],B[4],carry_prop[4],S[4],carry_prop[5]);
FullAdder FullAdder5 (A[5],B[5],carry_prop[5],S[5],carry_prop[6]);
FullAdder FullAdder6 (A[6],B[6],carry_prop[6],S[6],carry_prop[7]);
FullAdder FullAdder7 (A[7],B[7],carry_prop[7],S[7],carry_prop[8]);
FullAdder FullAdder8 (A[8],B[8],carry_prop[8],S[8],carry_prop[9]);
FullAdder FullAdder9 (A[9],B[9],carry_prop[9],S[9],carry_prop[10]);
FullAdder FullAdder10 (A[10],B[10],carry_prop[10],S[10],carry_prop[11]);
FullAdder FullAdder11 (A[11],B[11],carry_prop[11],S[11],carry_prop[12]);
FullAdder FullAdder12 (A[12],B[12],carry_prop[12],S[12],carry_prop[13]);
FullAdder FullAdder13 (A[13],B[13],carry_prop[13],S[13],carry_prop[14]);
FullAdder FullAdder14 (A[14],B[14],carry_prop[14],S[14],carry_prop[15]);
FullAdder FullAdder15 (A[15],B[15],carry_prop[15],S[15],carry_prop[16]);
FullAdder FullAdder16 (A[16],B[16],carry_prop[16],S[16],carry_prop[17]);
FullAdder FullAdder17 (A[17],B[17],carry_prop[17],S[17],carry_prop[18]);
FullAdder FullAdder18 (A[18],B[18],carry_prop[18],S[18],carry_prop[19]);
FullAdder FullAdder19 (A[19],B[19],carry_prop[19],S[19],carry_prop[20]);
FullAdder FullAdder20 (A[20],B[20],carry_prop[20],S[20],carry_prop[21]);
FullAdder FullAdder21 (A[21],B[21],carry_prop[21],S[21],carry_prop[22]);
FullAdder FullAdder22 (A[22],B[22],carry_prop[22],S[22],carry_prop[23]);
FullAdder FullAdder23 (A[23],B[23],carry_prop[23],S[23],carry_prop[24]);
FullAdder FullAdder24 (A[24],B[24],carry_prop[24],S[24],carry_prop[25]);
FullAdder FullAdder25 (A[25],B[25],carry_prop[25],S[25],carry_prop[26]);
FullAdder FullAdder26 (A[26],B[26],carry_prop[26],S[26],carry_prop[27]);
FullAdder FullAdder27 (A[27],B[27],carry_prop[27],S[27],carry_prop[28]);
FullAdder FullAdder28 (A[28],B[28],carry_prop[28],S[28],carry_prop[29]);
FullAdder FullAdder29 (A[29],B[29],carry_prop[29],S[29],carry_prop[30]);
FullAdder FullAdder30 (A[30],B[30],carry_prop[30],S[30],carry_prop[31]);
FullAdder FullAdder31 (A[31],B[31],carry_prop[31],S[31],carry_prop[32]);
assign Cout = carry_prop[32];

endmodule

module KoggeStone32Bit(
		input [31:0] A,
		input [31:0] B,
		input Cin,
		output [31:0] S,
		output Cout
    );

wire [31:0] level1G;
wire [31:0] level1P;
wire [31:0] level2G;
wire [31:0] level2P;
wire [31:0] level3G;
wire [31:0] level3P;
wire [31:0] level4G;
wire [31:0] level4P;
wire [31:0] level5G;
wire [31:0] level5P;
wire [31:0] level6G;
wire [31:0] level6P;

// level 1 start
genvar i;
assign level1G[0] = Cin;	// by definition to include carry in
assign level1P[0] = 0;		// by definition to include carry in
generate
	for(i=1;i<32;i=i+1) begin
		BitwiseG G(A[i], B[i], level1G[i]);
		BitwiseP P(A[i], B[i], level1P[i]);
	end
endgenerate
// level 1 end

// level 2 start
BUFFER Buff20(level1P[0],level1G[0],level2P[0],level2G[0]);
GrayCell GrayCell20(level1G[1],level1P[1],level1G[0],level2G[1]);
generate
	for(i=2;i<32;i=i+1) begin
		BlackCell BC20(level1G[i],level1P[i],level1G[i-1],level1P[i-1],level2G[i],level2P[i]);
	end
endgenerate
// level 2 end

// level 3 start
assign level3P[0] = level2P[0];
assign level3G[0] = level2G[0];
BUFFER Buff30(level2P[1],level2G[1],level3P[1],level3G[1]);
GrayCell GrayCell30(level2G[2],level2P[2],level2G[0],level3G[2]);
GrayCell GrayCell31(level2G[3],level2P[3],level2G[1],level3G[3]);
generate
	for(i=4;i<32;i=i+1) begin
		BlackCell BC30(level2G[i],level2P[i],level2G[i-2],level2P[i-2],level3G[i],level3P[i]);
	end
endgenerate
// level 3 end

// level 4 start
assign level4P[0] = level3P[0];
assign level4G[0] = level3G[0];
assign level4P[1] = level3P[1];
assign level4G[1] = level3G[1];
BUFFER Buff40(level3P[2],level3G[2],level4P[2],level4G[2]);
BUFFER Buff41(level3P[3],level3G[3],level4P[3],level4G[3]);
GrayCell GrayCell40(level3G[4],level3P[4],level3G[0],level4G[4]);
GrayCell GrayCell41(level3G[5],level3P[5],level3G[1],level4G[5]);
GrayCell GrayCell42(level3G[6],level3P[6],level3G[2],level4G[6]);
GrayCell GrayCell43(level3G[7],level3P[7],level3G[3],level4G[7]);
generate
	for(i=8;i<32;i=i+1) begin
		BlackCell BC40(level3G[i],level3P[i],level3G[i-4],level3P[i-4],level4G[i],level4P[i]);
	end
endgenerate
// level 4 end

// level 5 start
generate
	for(i=0;i<4;i=i+1) begin
		assign level5P[i] = level4P[i];
		assign level5G[i] = level4G[i];
	end
endgenerate
generate
	for(i=4;i<8;i=i+1) begin
		BUFFER Buff50(level4P[i],level4G[i],level5P[i],level5G[i]);
	end
endgenerate
generate
	for(i=8;i<16;i=i+1) begin
		GrayCell GrayCell50(level4G[i],level4P[i],level4G[i-8],level5G[i]);
	end
endgenerate
generate
	for(i=16;i<32;i=i+1) begin
		BlackCell BC50(level4G[i],level4P[i],level4G[i-8],level4P[i-8],level5G[i],level5P[i]);
	end
endgenerate
// level 5 end


// level 6 start
generate
	for(i=0;i<8;i=i+1) begin
		assign level6P[i] = level5P[i];
		assign level6G[i] = level5G[i];
	end
endgenerate
generate
	for(i=8;i<16;i=i+1) begin
		BUFFER Buff60(level5P[i],level5G[i],level6P[i],level6G[i]);
	end
endgenerate
generate
	for(i=16;i<32;i=i+1) begin
		GrayCell GrayCell60(level5G[i],level5P[i],level6G[i-16],level6G[i]);
	end
endgenerate
// level 6 end

// sum start
generate
	xor #0.1 XPS1(S[0],level1P[1],level1G[0]);
	for(i=1;i<32;i=i+1) begin
		SumGen SG(level1P[i],level6G[i-1],S[i]);
	end
endgenerate
assign Cout=level6G[31];
// sum end

endmodule

