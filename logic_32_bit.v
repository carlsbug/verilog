// Name: logic_32_bit.v
// Module: NOR32
//         AND32
//         INV32
//         OR32
//
// Input: 32-bit A
//        32-bit B
//
// Output:32-bit Y
//
// Notes: Common definitions
//
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 02, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//  2.0     Nov 29, 2018  Keonwoong Min keonwoong@sjsu.edu Implemented 32bit nor, and, inv, and or in gate level
//------------------------------------------------------------------------------------------
//
// 32-bit NOR
module NOR32(Y,A,B);
//output
output [31:0] Y;
//input
input [31:0] A;
input [31:0] B;
// TBD
nor nor_inst_1(Y[0], A[0], B[0]);
nor nor_inst_2(Y[1], A[1], B[1]);
nor nor_inst_3(Y[2], A[2], B[2]);
nor nor_inst_4(Y[3], A[3], B[3]);
nor nor_inst_5(Y[4], A[4], B[4]);
nor nor_inst_6(Y[5], A[5], B[5]);
nor nor_inst_7(Y[6], A[6], B[6]);
nor nor_inst_8(Y[7], A[7], B[7]);
nor nor_inst_9(Y[8], A[8], B[8]);
nor nor_inst_10(Y[9], A[9], B[9]);
nor nor_inst_11(Y[10], A[10], B[10]);
nor nor_inst_12(Y[11], A[11], B[11]);
nor nor_inst_13(Y[12], A[12], B[12]);
nor nor_inst_14(Y[13], A[13], B[13]);
nor nor_inst_15(Y[14], A[14], B[14]);
nor nor_inst_16(Y[15], A[15], B[15]);
nor nor_inst_17(Y[16], A[16], B[16]);
nor nor_inst_18(Y[17], A[17], B[17]);
nor nor_inst_19(Y[18], A[18], B[18]);
nor nor_inst_20(Y[19], A[19], B[19]);
nor nor_inst_21(Y[20], A[20], B[20]);
nor nor_inst_22(Y[21], A[21], B[21]);
nor nor_inst_23(Y[22], A[22], B[22]);
nor nor_inst_24(Y[23], A[23], B[23]);
nor nor_inst_25(Y[24], A[24], B[24]);
nor nor_inst_26(Y[25], A[25], B[25]);
nor nor_inst_27(Y[26], A[26], B[26]);
nor nor_inst_28(Y[27], A[27], B[27]);
nor nor_inst_29(Y[28], A[28], B[28]);
nor nor_inst_30(Y[29], A[29], B[29]);
nor nor_inst_31(Y[30], A[30], B[30]);
nor nor_inst_32(Y[31], A[31], B[31]);
endmodule

// 32-bit AND
module AND32(Y,A,B);
//output
output [31:0] Y;
//input
input [31:0] A;
input [31:0] B;
// TBD
and and_inst_1(Y[0], A[0], B[0]);
and and_inst_2(Y[1], A[1], B[1]);
and and_inst_3(Y[2], A[2], B[2]);
and and_inst_4(Y[3], A[3], B[3]);
and and_inst_5(Y[4], A[4], B[4]);
and and_inst_6(Y[5], A[5], B[5]);
and and_inst_7(Y[6], A[6], B[6]);
and and_inst_8(Y[7], A[7], B[7]);
and and_inst_9(Y[8], A[8], B[8]);
and and_inst_10(Y[9], A[9], B[9]);
and and_inst_11(Y[10], A[10], B[10]);
and and_inst_12(Y[11], A[11], B[11]);
and and_inst_13(Y[12], A[12], B[12]);
and and_inst_14(Y[13], A[13], B[13]);
and and_inst_15(Y[14], A[14], B[14]);
and and_inst_16(Y[15], A[15], B[15]);
and and_inst_17(Y[16], A[16], B[16]);
and and_inst_18(Y[17], A[17], B[17]);
and and_inst_19(Y[18], A[18], B[18]);
and and_inst_20(Y[19], A[19], B[19]);
and and_inst_21(Y[20], A[20], B[20]);
and and_inst_22(Y[21], A[21], B[21]);
and and_inst_23(Y[22], A[22], B[22]);
and and_inst_24(Y[23], A[23], B[23]);
and and_inst_25(Y[24], A[24], B[24]);
and and_inst_26(Y[25], A[25], B[25]);
and and_inst_27(Y[26], A[26], B[26]);
and and_inst_28(Y[27], A[27], B[27]);
and and_inst_29(Y[28], A[28], B[28]);
and and_inst_30(Y[29], A[29], B[29]);
and and_inst_31(Y[30], A[30], B[30]);
and and_inst_32(Y[31], A[31], B[31]);
endmodule

// 32-bit inverter
module INV32(Y,A);
//output
output [31:0] Y;
//input
input [31:0] A;
// TBD
not inv_inst_1(Y[0], A[0]);
not inv_inst_2(Y[1], A[1]);
not inv_inst_3(Y[2], A[2]);
not inv_inst_4(Y[3], A[3]);
not inv_inst_5(Y[4], A[4]);
not inv_inst_6(Y[5], A[5]);
not inv_inst_7(Y[6], A[6]);
not inv_inst_8(Y[7], A[7]);
not inv_inst_9(Y[8], A[8]);
not inv_inst_10(Y[9], A[9]);
not inv_inst_11(Y[10], A[10]);
not inv_inst_12(Y[11], A[11]);
not inv_inst_13(Y[12], A[12]);
not inv_inst_14(Y[13], A[13]);
not inv_inst_15(Y[14], A[14]);
not inv_inst_16(Y[15], A[15]);
not inv_inst_17(Y[16], A[16]);
not inv_inst_18(Y[17], A[17]);
not inv_inst_19(Y[18], A[18]);
not inv_inst_20(Y[19], A[19]);
not inv_inst_21(Y[20], A[20]);
not inv_inst_22(Y[21], A[21]);
not inv_inst_23(Y[22], A[22]);
not inv_inst_24(Y[23], A[23]);
not inv_inst_25(Y[24], A[24]);
not inv_inst_26(Y[25], A[25]);
not inv_inst_27(Y[26], A[26]);
not inv_inst_28(Y[27], A[27]);
not inv_inst_29(Y[28], A[28]);
not inv_inst_30(Y[29], A[29]);
not inv_inst_31(Y[30], A[30]);
not inv_inst_32(Y[31], A[31]);
endmodule

// 32-bit OR
module OR32(Y,A,B);
//output
output [31:0] Y;
//input
input [31:0] A;
input [31:0] B;

wire [31:0] norOut;
// TBD
NOR32 nor32_inst_1(.Y(norOut),.A(A),.B(B));
INV32 inv32_inst_1(.Y(Y),.A(norOut));
endmodule
