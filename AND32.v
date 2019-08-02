// Name: and_32.v
// Module: and_32
// Input: 32-bit A
//        32-bit B
//        S
//
// Output: 32-bit Y
//
// Notes: 32-bit 2x1 AND gate
//        Y = A when S = 0;
//        Y = B when S = 1;
//        in other words, S's 1 picks A and 0 picks B
//
// Supports Addition and subtraction between two inputs, A and B
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Nov 25, 2018	Keonwoong Min	keonwoong.min@sjsu.edu
//------------------------------------------------------------------------------------------
//
module and_32(Y,A,B);

input [31:0] A;
input [31:0] B;
output [31:0] Y;

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
