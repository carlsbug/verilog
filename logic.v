// Name: logic.v
// Module:
// Input:
// Output:
//
// Notes: Common definitions
//
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 02, 2014	Kaushik Patra	kpatra@sjsu.edu		     Initial creation
//  2.0     Nov 27, 2018  Keonwoong Min keonwoong.min@sjsu.edu Implemented 32-bit and 64-bit 2's complement
//  2.1     Dec 2,  2018  Keonwoong Min keonwoong.min@sjsu.edu Implemented SR-Latch, D-Latch, D-F/F,
//                                                             1-bit regisger, 32-bit regisger, 2x4 Line decoder,
//                                                             3x8 Line decoder, and 4x16 Line decoder
//  2.2     Dec 3,  2018  Keonwoong Min keonwoong.min@sjsu.edu Implemented 5x32 Line decoder
//------------------------------------------------------------------------------------------
//
// 64-bit two's complement
module TWOSCOMP64(Y,A);
//output list
output [63:0] Y;
//input list
input [63:0] A;
wire [63:0] notA;
// TBD
INV32 inst1(notA,A);
RC_ADD_SUB_64 inst2(.Y(Y),.CO(CO),.A(notA),.B(64'b1),.SnA(1'b0));
endmodule// 64-bit two's complement

// 32-bit two's complement
module TWOSCOMP32(Y,A);
//output list
output [31:0] Y;
//input list
input [31:0] A;
// TBD
wire CO;
wire [31:0] notA;
INV32 inst1(notA,A);
RC_ADD_SUB_32 inst2(.Y(Y),.CO(CO),.A(notA),.B(32'b1),.SnA(1'b0));
endmodule// 32-bit two's complement

// 32-bit register +ve edge, Reset on RESET=0
module REG32(Q, D, LOAD, CLK, RESET);
output [31:0] Q;
input CLK, LOAD;
input [31:0] D;
input RESET;
// TBD
REG1 inst1(.Q(Q[0]), .Qbar(), .D(D[0]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst2(.Q(Q[1]), .Qbar(), .D(D[1]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst3(.Q(Q[2]), .Qbar(), .D(D[2]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst4(.Q(Q[3]), .Qbar(), .D(D[3]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst5(.Q(Q[4]), .Qbar(), .D(D[4]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst6(.Q(Q[5]), .Qbar(), .D(D[5]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst7(.Q(Q[6]), .Qbar(), .D(D[6]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst8(.Q(Q[7]), .Qbar(), .D(D[7]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst9(.Q(Q[8]), .Qbar(), .D(D[8]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst10(.Q(Q[9]), .Qbar(), .D(D[9]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst11(.Q(Q[10]), .Qbar(), .D(D[10]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst12(.Q(Q[11]), .Qbar(), .D(D[11]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst13(.Q(Q[12]), .Qbar(), .D(D[12]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst14(.Q(Q[13]), .Qbar(), .D(D[13]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst15(.Q(Q[14]), .Qbar(), .D(D[14]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst16(.Q(Q[15]), .Qbar(), .D(D[15]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst17(.Q(Q[16]), .Qbar(), .D(D[16]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst18(.Q(Q[17]), .Qbar(), .D(D[17]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst19(.Q(Q[18]), .Qbar(), .D(D[18]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst20(.Q(Q[19]), .Qbar(), .D(D[19]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst21(.Q(Q[20]), .Qbar(), .D(D[20]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst22(.Q(Q[21]), .Qbar(), .D(D[21]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst23(.Q(Q[22]), .Qbar(), .D(D[22]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst24(.Q(Q[23]), .Qbar(), .D(D[23]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst25(.Q(Q[24]), .Qbar(), .D(D[24]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst26(.Q(Q[25]), .Qbar(), .D(D[25]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst27(.Q(Q[26]), .Qbar(), .D(D[26]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst28(.Q(Q[27]), .Qbar(), .D(D[27]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst29(.Q(Q[28]), .Qbar(), .D(D[28]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst30(.Q(Q[29]), .Qbar(), .D(D[29]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst31(.Q(Q[30]), .Qbar(), .D(D[30]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
REG1 inst32(.Q(Q[31]), .Qbar(), .D(D[31]), .L(LOAD), .C(CLK), .nP(1'b1), .nR(RESET));
endmodule// 32-bit register

// 1 bit register +ve edge,
// Preset on nP=0, nR=1, reset on nP=1, nR=0;
// Undefined nP=0, nR=0
// normal operation nP=1, nR=1
// data is held when L = 0;
// data is loaded with new value when L = 1;
module REG1(Q, Qbar, D, L, C, nP, nR);
input D, C, L;
input nP, nR;
output Q, Qbar;
// TBD
MUX1_2x1 mux_inst(.Y(muxOut),.I0(Q), .I1(D), .S(L));
D_FF d_ff_inst(.Q(Q), .Qbar(Qbar), .D(muxOut), .C(C), .nP(nP), .nR(nR));
endmodule// 1 bit register

// 1 bit flipflop +ve edge,
// Preset on nP=0, nR=1, reset on nP=1, nR=0;
// Undefined nP=0, nR=0
// normal operation nP=1, nR=1
module D_FF(Q, Qbar, D, C, nP, nR);
input D, C;
input nP, nR;
output Q, Qbar;
// TBD
wire Qsr;
wire QbarSr;
not inst(Cnot, C);
D_LATCH d_latch_inst(.Q(Qsr), .Qbar(QbarSr), .D(D), .C(C), .nP(nP), .nR(nR));
SR_LATCH sr_latch_inst(.Q(Q), .Qbar(Qbar), .S(Qsr), .R(QbarSr), .C(Cnot), .nP(nP), .nR(nR));
endmodule// 1 bit flipflop

// 1 bit D latch
// Preset on nP=0, nR=1, reset on nP=1, nR=0;
// Undefined nP=0, nR=0
// normal operation nP=1, nR=1
module D_LATCH(Q, Qbar, D, C, nP, nR);
input D, C;
input nP, nR;
output Q,Qbar;
// TBD
nand inst1(Dout,D,C);
nand inst2(DbarOut,Dbar,C);
nand inst3(Q,Dout,Qbar,nP);
nand inst4(Qbar,DbarOut,Q,nR);
not inst5(Dbar,D);
endmodule// 1 bit D latch

// 1 bit SR latch
// Preset on nP=0, nR=1, reset on nP=1, nR=0;
// Undefined nP=0, nR=0
// normal operation nP=1, nR=1
module SR_LATCH(Q, Qbar, S, R, C, nP, nR);
input S, R, C;
input nP, nR;
output Q,Qbar;
// TBD
// wire sOut;
// wire rout;
nand inst1(sOut,S,C);
nand inst2(rout,R,C);
nand inst3(Q,sOut,Qbar,nP);
nand inst4(Qbar,rout,Q,nR);
endmodule// 1 bit SR latch

// 5x32 Line decoder
module DECODER_5x32(D,I);
// output
output [31:0] D;
// input
input [4:0] I;
// TBD
wire d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15;
DECODER_4x16 decoder_4x16_inst(.D({d15,d14,d13,d12,d11,d10,d9,d8,d7,d6,d5,d4,d3,d2,d1,d0}),.I(I[3:0]));
not inst_I3(notOutI3, I[4]);
and inst_D0(D[0], d0, notOutI3);
and inst_D1(D[1], d1, notOutI3);
and inst_D2(D[2], d2, notOutI3);
and inst_D3(D[3], d3, notOutI3);
and inst_D4(D[4], d4, notOutI3);
and inst_D5(D[5], d5, notOutI3);
and inst_D6(D[6], d6, notOutI3);
and inst_D7(D[7], d7, notOutI3);
and inst_D8(D[8], d8, notOutI3);
and inst_D9(D[9], d9, notOutI3);
and inst_D10(D[10], d10, notOutI3);
and inst_D11(D[11], d11, notOutI3);
and inst_D12(D[12], d12, notOutI3);
and inst_D13(D[13], d13, notOutI3);
and inst_D14(D[14], d14, notOutI3);
and inst_D15(D[15], d15, notOutI3);
and inst_D16(D[16], d0, I[4]);
and inst_D17(D[17], d1, I[4]);
and inst_D18(D[18], d2, I[4]);
and inst_D19(D[19], d3, I[4]);
and inst_D20(D[20], d4, I[4]);
and inst_D21(D[21], d5, I[4]);
and inst_D22(D[22], d6, I[4]);
and inst_D23(D[23], d7, I[4]);
and inst_D24(D[24], d8, I[4]);
and inst_D25(D[25], d9, I[4]);
and inst_D26(D[26], d10, I[4]);
and inst_D27(D[27], d11, I[4]);
and inst_D28(D[28], d12, I[4]);
and inst_D29(D[29], d13, I[4]);
and inst_D30(D[30], d14, I[4]);
and inst_D31(D[31], d15, I[4]);
endmodule// 5x32 Line decoder

// 4x16 Line decoder
module DECODER_4x16(D,I);
// output
output [15:0] D;
// input
input [3:0] I;
// TBD
wire d0,d1,d2,d3,d4,d5,d6,d7;
DECODER_3x8 decoder_3x8_inst(.D({d7,d6,d5,d4,d3,d2,d1,d0}),.I(I[2:0]));
not inst_I3(notOutI3, I[3]);
and inst_D0(D[0], d0, notOutI3);
and inst_D1(D[1], d1, notOutI3);
and inst_D2(D[2], d2, notOutI3);
and inst_D3(D[3], d3, notOutI3);
and inst_D4(D[4], d4, notOutI3);
and inst_D5(D[5], d5, notOutI3);
and inst_D6(D[6], d6, notOutI3);
and inst_D7(D[7], d7, notOutI3);
and inst_D8(D[8], d0, I[3]);
and inst_D9(D[9], d1, I[3]);
and inst_D10(D[10], d2, I[3]);
and inst_D11(D[11], d3, I[3]);
and inst_D12(D[12], d4, I[3]);
and inst_D13(D[13], d5, I[3]);
and inst_D14(D[14], d6, I[3]);
and inst_D15(D[15], d7, I[3]);
endmodule// 4x16 Line decoder

// 3x8 Line decoder
module DECODER_3x8(D,I);
// output
output [7:0] D;
// input
input [2:0] I;
//TBD
wire d0,d1,d2,d3;
DECODER_2x4 decoder_2x4_inst(.D({d3,d2,d1,d0}),.I(I[1:0]));
not inst_I2(notOutI2, I[2]);
and inst_D0(D[0], d0, notOutI2);
and inst_D1(D[1], d1, notOutI2);
and inst_D2(D[2], d2, notOutI2);
and inst_D3(D[3], d3, notOutI2);
and inst_D4(D[4], d0, I[2]);
and inst_D5(D[5], d1, I[2]);
and inst_D6(D[6], d2, I[2]);
and inst_D7(D[7], d3, I[2]);
endmodule// 3x8 Line decoder

// 2x4 Line decoder
module DECODER_2x4(D,I);
// output
output [3:0] D;
// input
input [1:0] I;
// TBD
not inst1_I0(notOutI0,I[0]);
not inst2_I1(notOutI1,I[1]);
and inst3_D0(D[0], notOutI1, notOutI0);
and inst4_D1(D[1], notOutI1, I[0]);
and inst5_D2(D[2], I[1], notOutI0);
and inst6_D3(D[3], I[1], I[0]);
endmodule// 2x4 Line decoder
