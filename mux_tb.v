// Name: mux_tb.v
// Module:  - mux1_2x1_tb
//          - mux32_2x1_tb
//          - mux32_4x1_tb
//          - mux32_8x1_tb
//          - mux32_16x1_tb
//          - mux32_32x1_tb
//
// Notes: Testbench for mux
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Nov 22, 2018	Keonwoong Min	keonwoong.min@sjsu.edu  Implemented testbench for 1-bit 2x1 mux, and 32-bit 2x1 mux,
//  1.1     Dec 1,  2018	Keonwoong Min	keonwoong.min@sjsu.edu  Implemented testbench for 32-bit 4x1 mux, , 32-bit 8x1 mux, and 32-bit 16x1 mux
//  1.2     Dec 2,  2018	Keonwoong Min	keonwoong.min@sjsu.edu  Implemented testbench for 32-bit 32x1 mux
//------------------------------------------------------------------------------------------
//
`timescale 1ns/10ps
module mux1_2x1_tb;
reg I0;
reg I1;
reg S;
wire Y;
MUX1_2x1 mux_2x1_inst(.Y(Y), .I0(I0), .I1(I1), .S(S));
initial
begin
I0= 0; I1=0; S = 0;
#5 I0=0; I1=0; S=1;
#5 I0=0; I1=1; S=0;
#5 I0=0; I1=1; S=1;
#5 I0=1; I1=0; S=0;
#5 I0=1; I1=0; S=1;
#5 I0=1; I1=1; S=0;
#5 I0=1; I1=1; S=1;
#5 $stop;
end
endmodule//mux1_2x1_tb

module mux32_2x1_tb;
reg [31:0] A;
reg [31:0] B;
reg [0:0] S;
wire [31:0] Y;
MUX32_2x1 mux32_inst_1(.Y(Y), .I0(A), .I1(B), .S(S));
initial
begin
A = 32'b11111111111111111111111111111111; B = 32'b10000000000000000000000000000001; S =0; //pick B
#5 A=32'b11111111111111000000000101111111; B=32'b10000000000000000000000000000001; S=1;
#5 A=32'b000; B=32'b101; S=0;
#5 A=32'b010; B=32'b000; S=1;
#5 A=32'b000; B=32'b010; S=0;
#5 A=32'b110; B=32'b000; S=1;
#5 A=32'b000; B=32'b011; S=0;
#5 A=32'b011; B=32'b000; S=1;
#5 $stop;
end
endmodule//mux_32_2x1_tb

module mux32_4x1_tb;
wire [31:0] Y;
reg [31:0] I0;
reg [31:0] I1;
reg [31:0] I2;
reg [31:0] I3;
reg [1:0] S;
MUX32_4x1 mux_4x1_inst(.Y(Y), .I0(I0), .I1(I1), .I2(I2), .I3(I3), .S(S));
initial
begin
I0 = 32'b00; I1 = 32'b01; I2 = 32'b10; I3 = 32'b11; S = 2'b00;
#5 S = 2'b01;
#5 S = 2'b10;
#5 S = 2'b11;
#5 $stop;
end
endmodule//mux32_4x1_tb

module mux32_8x1_tb;
wire [31:0] Y;
reg [31:0] I0;
reg [31:0] I1;
reg [31:0] I2;
reg [31:0] I3;
reg [31:0] I4;
reg [31:0] I5;
reg [31:0] I6;
reg [31:0] I7;
reg [2:0] S;
MUX32_8x1 mux_8x1_inst(.Y(Y), .I0(I0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7), .S(S[2:0]));
initial
begin
I0 = 32'b000; I1 = 32'b001; I2 = 32'b010; I3 = 32'b011;
I4 = 32'b100; I5 = 32'b101; I6 = 32'b110; I7 = 32'b111;
S = 3'b000;
#5 S = 3'b001;
#5 S = 3'b010;
#5 S = 3'b011;
#5 S = 3'b100;
#5 S = 3'b101;
#5 S = 3'b110;
#5 S = 3'b111;
#5 $stop;
end
endmodule//mux32_8x1_tb

module mux32_16x1_tb;
wire [31:0] Y;
reg [31:0] I0;
reg [31:0] I1;
reg [31:0] I2;
reg [31:0] I3;
reg [31:0] I4;
reg [31:0] I5;
reg [31:0] I6;
reg [31:0] I7;
reg [31:0] I8;
reg [31:0] I9;
reg [31:0] I10;
reg [31:0] I11;
reg [31:0] I12;
reg [31:0] I13;
reg [31:0] I14;
reg [31:0] I15;
reg [3:0] S;
MUX32_16x1 mux_16x1_inst(.Y(Y), .I0(I0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7),
.I8(I8), .I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.S(S[3:0]));
initial
begin
I0 = 32'b0000; I1 = 32'b0001; I2 = 32'b0010; I3 = 32'b0011;
I4 = 32'b0100; I5 = 32'b0101; I6 = 32'b0110; I7 = 32'b0111;
I8 = 32'b1000; I9 = 32'b1001; I10 = 32'b1010; I11 = 32'b1011;
I12 = 32'b1100; I13 = 32'b1101; I14 = 32'b1110; I15 = 32'b1111;
S = 4'b0000;
#5 S = 4'b0001;
#5 S = 4'b0010;
#5 S = 4'b0011;
#5 S = 4'b0100;
#5 S = 4'b0101;
#5 S = 4'b0110;
#5 S = 4'b0111;
#5 S = 4'b1000;
#5 S = 4'b1001;
#5 S = 4'b1010;
#5 S = 4'b1011;
#5 S = 4'b1100;
#5 S = 4'b1101;
#5 S = 4'b1110;
#5 S = 4'b1111;
#5 $stop;
end
endmodule //MUX32_16x1

module mux32_32x1_tb;
wire [31:0] Y;
reg [31:0] I0;
reg [31:0] I1;
reg [31:0] I2;
reg [31:0] I3;
reg [31:0] I4;
reg [31:0] I5;
reg [31:0] I6;
reg [31:0] I7;
reg [31:0] I8;
reg [31:0] I9;
reg [31:0] I10;
reg [31:0] I11;
reg [31:0] I12;
reg [31:0] I13;
reg [31:0] I14;
reg [31:0] I15;
reg [31:0] I16;
reg [31:0] I17;
reg [31:0] I18;
reg [31:0] I19;
reg [31:0] I20;
reg [31:0] I21;
reg [31:0] I22;
reg [31:0] I23;
reg [31:0] I24;
reg [31:0] I25;
reg [31:0] I26;
reg [31:0] I27;
reg [31:0] I28;
reg [31:0] I29;
reg [31:0] I30;
reg [31:0] I31;
reg [4:0] S;
MUX32_32x1 mux32_32x1_inst(.Y(Y), .I0(I0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7),
                     .I8(I8), .I9(I9), .I10(I10), .I11(I11), .I12(I12), .I13(I13), .I14(I14), .I15(I15),
                     .I16(I16), .I17(I17), .I18(I18), .I19(I19), .I20(I20), .I21(I21), .I22(I22), .I23(I23),
                     .I24(I24), .I25(I25), .I26(I26), .I27(I27), .I28(I28), .I29(I29), .I30(I30), .I31(I31), .S(S));
initial
begin
I0 = 32'b00000; I1 = 32'b00001; I2 = 32'b00010; I3 = 32'b00011;
I4 = 32'b00100; I5 = 32'b00101; I6 = 32'b00110; I7 = 32'b00111;
I8 = 32'b01000; I9 = 32'b01001; I10 = 32'b01010; I11 = 32'b01011;
I12 = 32'b01100; I13 = 32'b01101; I14 = 32'b01110; I15 = 32'b01111;
I16 = 32'b10000; I17 = 32'b10001; I18 = 32'b10010; I19 = 32'b10011;
I20 = 32'b10100; I21 = 32'b10101; I22 = 32'b10110; I23 = 32'b10111;
I24 = 32'b11000; I25 = 32'b11001; I26 = 32'b11010; I27 = 32'b11011;
I28 = 32'b11100; I29 = 32'b11101; I30 = 32'b11110; I31 = 32'b11111;
S = 5'b00000;
#5 S = 5'b00001;
#5 S = 5'b00010;
#5 S = 5'b00011;
#5 S = 5'b00100;
#5 S = 5'b00101;
#5 S = 5'b00110;
#5 S = 5'b00111;
#5 S = 5'b01000;
#5 S = 5'b01001;
#5 S = 5'b01010;
#5 S = 5'b01011;
#5 S = 5'b01100;
#5 S = 5'b01101;
#5 S = 5'b01110;
#5 S = 5'b01111;
#5 S = 5'b10000;
#5 S = 5'b10001;
#5 S = 5'b10010;
#5 S = 5'b10011;
#5 S = 5'b10100;
#5 S = 5'b10101;
#5 S = 5'b10110;
#5 S = 5'b10111;
#5 S = 5'b11000;
#5 S = 5'b11001;
#5 S = 5'b11010;
#5 S = 5'b11011;
#5 S = 5'b11100;
#5 S = 5'b11101;
#5 S = 5'b11110;
#5 S = 5'b11111;
#5 $stop;
end
endmodule //mux32_32x1_tb
