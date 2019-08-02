// Name: rc_add_sub_32.v
// Module: RC_ADD_SUB_32
//
// Output: Y : Output 32-bit
//         CO : Carry Out
//
// Input: A : 32-bit input
//        B : 32-bit input
//        SnA : if SnA=0 it is add, subtraction otherwise
//
// Notes: 32-bit adder / subtractor implementaiton.
//
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//  2.0     Nov 18, 2018	Keonwoong Min	keonwoong.min@sjsu.edu	Implemented 32bit and 64 bit rc_add_sub in gate level
//------------------------------------------------------------------------------------------
`include "prj_definition.v"
module RC_ADD_SUB_64(Y, CO, A, B, SnA);
// output list
output [63:0] Y;
output CO;
// input list
input [63:0] A;
input [63:0] B;
input SnA;
// TBD
wire C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,C18,C19,C20,C21,C22,
C23,C24,C25,C26,C27,C28,C29,C30,C31,C32,C33,C34,C35,C36,C37,C38,C39,C40,C41,C42,C43,C44,
C45,C46,C47,C48,C49,C50,C51,C52,C53,C54,C55,C56,C57,C58,C59,C60,C61,C62;
xor inst1(xorY0, B[0] ,SnA);
xor inst2(xorY1, B[1] ,SnA);
xor inst3(xorY2, B[2] ,SnA);
xor inst4(xorY3, B[3] ,SnA);
xor inst5(xorY4, B[4] ,SnA);
xor inst6(xorY5, B[5] ,SnA);
xor inst7(xorY6, B[6] ,SnA);
xor inst8(xorY7, B[7] ,SnA);
xor inst9(xorY8, B[8] ,SnA);
xor inst10(xorY9, B[9] ,SnA);
xor inst11(xorY10, B[10] ,SnA);
xor inst12(xorY11, B[11] ,SnA);
xor inst13(xorY12, B[12] ,SnA);
xor inst14(xorY13, B[13] ,SnA);
xor inst15(xorY14, B[14] ,SnA);
xor inst16(xorY15, B[15] ,SnA);
xor inst17(xorY16, B[16] ,SnA);
xor inst18(xorY17, B[17] ,SnA);
xor inst19(xorY18, B[18] ,SnA);
xor inst20(xorY19, B[19] ,SnA);
xor inst21(xorY20, B[20] ,SnA);
xor inst22(xorY21, B[21] ,SnA);
xor inst23(xorY22, B[22] ,SnA);
xor inst24(xorY23, B[23] ,SnA);
xor inst25(xorY24, B[24] ,SnA);
xor inst26(xorY25, B[25] ,SnA);
xor inst27(xorY26, B[26] ,SnA);
xor inst28(xorY27, B[27] ,SnA);
xor inst29(xorY28, B[28] ,SnA);
xor inst30(xorY29, B[29] ,SnA);
xor inst31(xorY30, B[30] ,SnA);
xor inst32(xorY31, B[31] ,SnA);
xor inst33(xorY32, B[32] ,SnA);
xor inst34(xorY33, B[33] ,SnA);
xor inst35(xorY34, B[34] ,SnA);
xor inst36(xorY35, B[35] ,SnA);
xor inst37(xorY36, B[36] ,SnA);
xor inst38(xorY37, B[37] ,SnA);
xor inst39(xorY38, B[38] ,SnA);
xor inst40(xorY39, B[39] ,SnA);
xor inst41(xorY40, B[40] ,SnA);
xor inst42(xorY41, B[41] ,SnA);
xor inst43(xorY42, B[42] ,SnA);
xor inst44(xorY43, B[43] ,SnA);
xor inst45(xorY44, B[44] ,SnA);
xor inst46(xorY45, B[45] ,SnA);
xor inst47(xorY46, B[46] ,SnA);
xor inst48(xorY47, B[47] ,SnA);
xor inst49(xorY48, B[48] ,SnA);
xor inst50(xorY49, B[49] ,SnA);
xor inst51(xorY50, B[50] ,SnA);
xor inst52(xorY51, B[51] ,SnA);
xor inst53(xorY52, B[52] ,SnA);
xor inst54(xorY53, B[53] ,SnA);
xor inst55(xorY54, B[54] ,SnA);
xor inst56(xorY55, B[55] ,SnA);
xor inst57(xorY56, B[56] ,SnA);
xor inst58(xorY57, B[57] ,SnA);
xor inst59(xorY58, B[58] ,SnA);
xor inst60(xorY59, B[59] ,SnA);
xor inst61(xorY60, B[60] ,SnA);
xor inst62(xorY61, B[61] ,SnA);
xor inst63(xorY62, B[62] ,SnA);
xor inst64(xorY63, B[63] ,SnA);

FULL_ADDER fa_inst_1(.S(Y[0]), .CO(C0), .A(A[0]), .B(xorY0), .CI(SnA));
FULL_ADDER fa_inst_2(.S(Y[1]), .CO(C1), .A(A[1]), .B(xorY1), .CI(C0));
FULL_ADDER fa_inst_3(.S(Y[2]), .CO(C2), .A(A[2]), .B(xorY2), .CI(C1));
FULL_ADDER fa_inst_4(.S(Y[3]), .CO(C3), .A(A[3]), .B(xorY3), .CI(C2));
FULL_ADDER fa_inst_5(.S(Y[4]), .CO(C4), .A(A[4]), .B(xorY4), .CI(C3));
FULL_ADDER fa_inst_6(.S(Y[5]), .CO(C5), .A(A[5]), .B(xorY5), .CI(C4));
FULL_ADDER fa_inst_7(.S(Y[6]), .CO(C6), .A(A[6]), .B(xorY6), .CI(C5));
FULL_ADDER fa_inst_8(.S(Y[7]), .CO(C7), .A(A[7]), .B(xorY7), .CI(C6));
FULL_ADDER fa_inst_9(.S(Y[8]), .CO(C8), .A(A[8]), .B(xorY8), .CI(C7));
FULL_ADDER fa_inst_10(.S(Y[9]), .CO(C9), .A(A[9]), .B(xorY9), .CI(C8));
FULL_ADDER fa_inst_11(.S(Y[10]), .CO(C10), .A(A[10]), .B(xorY10), .CI(C9));
FULL_ADDER fa_inst_12(.S(Y[11]), .CO(C11), .A(A[11]), .B(xorY11), .CI(C10));
FULL_ADDER fa_inst_13(.S(Y[12]), .CO(C12), .A(A[12]), .B(xorY12), .CI(C11));
FULL_ADDER fa_inst_14(.S(Y[13]), .CO(C13), .A(A[13]), .B(xorY13), .CI(C12));
FULL_ADDER fa_inst_15(.S(Y[14]), .CO(C14), .A(A[14]), .B(xorY14), .CI(C13));
FULL_ADDER fa_inst_16(.S(Y[15]), .CO(C15), .A(A[15]), .B(xorY15), .CI(C14));
FULL_ADDER fa_inst_17(.S(Y[16]), .CO(C16), .A(A[16]), .B(xorY16), .CI(C15));
FULL_ADDER fa_inst_18(.S(Y[17]), .CO(C17), .A(A[17]), .B(xorY17), .CI(C16));
FULL_ADDER fa_inst_19(.S(Y[18]), .CO(C18), .A(A[18]), .B(xorY18), .CI(C17));
FULL_ADDER fa_inst_20(.S(Y[19]), .CO(C19), .A(A[19]), .B(xorY19), .CI(C18));
FULL_ADDER fa_inst_21(.S(Y[20]), .CO(C20), .A(A[20]), .B(xorY20), .CI(C19));
FULL_ADDER fa_inst_22(.S(Y[21]), .CO(C21), .A(A[21]), .B(xorY21), .CI(C20));
FULL_ADDER fa_inst_23(.S(Y[22]), .CO(C22), .A(A[22]), .B(xorY22), .CI(C21));
FULL_ADDER fa_inst_24(.S(Y[23]), .CO(C23), .A(A[23]), .B(xorY23), .CI(C22));
FULL_ADDER fa_inst_25(.S(Y[24]), .CO(C24), .A(A[24]), .B(xorY24), .CI(C23));
FULL_ADDER fa_inst_26(.S(Y[25]), .CO(C25), .A(A[25]), .B(xorY25), .CI(C24));
FULL_ADDER fa_inst_27(.S(Y[26]), .CO(C26), .A(A[26]), .B(xorY26), .CI(C25));
FULL_ADDER fa_inst_28(.S(Y[27]), .CO(C27), .A(A[27]), .B(xorY27), .CI(C26));
FULL_ADDER fa_inst_29(.S(Y[28]), .CO(C28), .A(A[28]), .B(xorY28), .CI(C27));
FULL_ADDER fa_inst_30(.S(Y[29]), .CO(C29), .A(A[29]), .B(xorY29), .CI(C28));
FULL_ADDER fa_inst_31(.S(Y[30]), .CO(C30), .A(A[30]), .B(xorY30), .CI(C29));
FULL_ADDER fa_inst_32(.S(Y[31]), .CO(C31), .A(A[31]), .B(xorY31), .CI(C30));
FULL_ADDER fa_inst_33(.S(Y[32]), .CO(C32), .A(A[32]), .B(xorY32), .CI(C31));
FULL_ADDER fa_inst_34(.S(Y[33]), .CO(C33), .A(A[33]), .B(xorY33), .CI(C32));
FULL_ADDER fa_inst_35(.S(Y[34]), .CO(C34), .A(A[34]), .B(xorY34), .CI(C33));
FULL_ADDER fa_inst_36(.S(Y[35]), .CO(C35), .A(A[35]), .B(xorY35), .CI(C34));
FULL_ADDER fa_inst_37(.S(Y[36]), .CO(C36), .A(A[36]), .B(xorY36), .CI(C35));
FULL_ADDER fa_inst_38(.S(Y[37]), .CO(C37), .A(A[37]), .B(xorY37), .CI(C36));
FULL_ADDER fa_inst_39(.S(Y[38]), .CO(C38), .A(A[38]), .B(xorY38), .CI(C37));
FULL_ADDER fa_inst_40(.S(Y[39]), .CO(C39), .A(A[39]), .B(xorY39), .CI(C38));
FULL_ADDER fa_inst_41(.S(Y[40]), .CO(C40), .A(A[40]), .B(xorY40), .CI(C39));
FULL_ADDER fa_inst_42(.S(Y[41]), .CO(C41), .A(A[41]), .B(xorY41), .CI(C40));
FULL_ADDER fa_inst_43(.S(Y[42]), .CO(C42), .A(A[42]), .B(xorY42), .CI(C41));
FULL_ADDER fa_inst_44(.S(Y[43]), .CO(C43), .A(A[43]), .B(xorY43), .CI(C42));
FULL_ADDER fa_inst_45(.S(Y[44]), .CO(C44), .A(A[44]), .B(xorY44), .CI(C43));
FULL_ADDER fa_inst_46(.S(Y[45]), .CO(C45), .A(A[45]), .B(xorY45), .CI(C44));
FULL_ADDER fa_inst_47(.S(Y[46]), .CO(C46), .A(A[46]), .B(xorY46), .CI(C45));
FULL_ADDER fa_inst_48(.S(Y[47]), .CO(C47), .A(A[47]), .B(xorY47), .CI(C46));
FULL_ADDER fa_inst_49(.S(Y[48]), .CO(C48), .A(A[48]), .B(xorY48), .CI(C47));
FULL_ADDER fa_inst_50(.S(Y[49]), .CO(C49), .A(A[49]), .B(xorY49), .CI(C48));
FULL_ADDER fa_inst_51(.S(Y[50]), .CO(C50), .A(A[50]), .B(xorY50), .CI(C49));
FULL_ADDER fa_inst_52(.S(Y[51]), .CO(C51), .A(A[51]), .B(xorY51), .CI(C50));
FULL_ADDER fa_inst_53(.S(Y[52]), .CO(C52), .A(A[52]), .B(xorY52), .CI(C51));
FULL_ADDER fa_inst_54(.S(Y[53]), .CO(C53), .A(A[53]), .B(xorY53), .CI(C52));
FULL_ADDER fa_inst_55(.S(Y[54]), .CO(C54), .A(A[54]), .B(xorY54), .CI(C53));
FULL_ADDER fa_inst_56(.S(Y[55]), .CO(C55), .A(A[55]), .B(xorY55), .CI(C54));
FULL_ADDER fa_inst_57(.S(Y[56]), .CO(C56), .A(A[56]), .B(xorY56), .CI(C55));
FULL_ADDER fa_inst_58(.S(Y[57]), .CO(C57), .A(A[57]), .B(xorY57), .CI(C56));
FULL_ADDER fa_inst_59(.S(Y[58]), .CO(C58), .A(A[58]), .B(xorY58), .CI(C57));
FULL_ADDER fa_inst_60(.S(Y[59]), .CO(C59), .A(A[59]), .B(xorY59), .CI(C58));
FULL_ADDER fa_inst_61(.S(Y[60]), .CO(C60), .A(A[60]), .B(xorY60), .CI(C59));
FULL_ADDER fa_inst_62(.S(Y[61]), .CO(C61), .A(A[61]), .B(xorY61), .CI(C60));
FULL_ADDER fa_inst_63(.S(Y[62]), .CO(C62), .A(A[62]), .B(xorY62), .CI(C61));
FULL_ADDER fa_inst_64(.S(Y[63]), .CO(CO), .A(A[63]), .B(xorY63), .CI(C62));
endmodule

module RC_ADD_SUB_32(Y, CO, A, B, SnA);
// output list
output [`DATA_INDEX_LIMIT:0] Y;
output CO;
// input list
input [`DATA_INDEX_LIMIT:0] A;
input [`DATA_INDEX_LIMIT:0] B;
input SnA;
// TBD
wire C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,C18,C19,C20,C21,C22,
C23,C24,C25,C26,C27,C28,C29,C30;

xor inst1(xorY0, B[0] ,SnA);
xor inst2(xorY1, B[1] ,SnA);
xor inst3(xorY2, B[2] ,SnA);
xor inst4(xorY3, B[3] ,SnA);
xor inst5(xorY4, B[4] ,SnA);
xor inst6(xorY5, B[5] ,SnA);
xor inst7(xorY6, B[6] ,SnA);
xor inst8(xorY7, B[7] ,SnA);
xor inst9(xorY8, B[8] ,SnA);
xor inst10(xorY9, B[9] ,SnA);
xor inst11(xorY10, B[10] ,SnA);
xor inst12(xorY11, B[11] ,SnA);
xor inst13(xorY12, B[12] ,SnA);
xor inst14(xorY13, B[13] ,SnA);
xor inst15(xorY14, B[14] ,SnA);
xor inst16(xorY15, B[15] ,SnA);
xor inst17(xorY16, B[16] ,SnA);
xor inst18(xorY17, B[17] ,SnA);
xor inst19(xorY18, B[18] ,SnA);
xor inst20(xorY19, B[19] ,SnA);
xor inst21(xorY20, B[20] ,SnA);
xor inst22(xorY21, B[21] ,SnA);
xor inst23(xorY22, B[22] ,SnA);
xor inst24(xorY23, B[23] ,SnA);
xor inst25(xorY24, B[24] ,SnA);
xor inst26(xorY25, B[25] ,SnA);
xor inst27(xorY26, B[26] ,SnA);
xor inst28(xorY27, B[27] ,SnA);
xor inst29(xorY28, B[28] ,SnA);
xor inst30(xorY29, B[29] ,SnA);
xor inst31(xorY30, B[30] ,SnA);
xor inst32(xorY31, B[31] ,SnA);

FULL_ADDER fa_inst_1(.S(Y[0]), .CO(C0), .A(A[0]), .B(xorY0), .CI(SnA));
FULL_ADDER fa_inst_2(.S(Y[1]), .CO(C1), .A(A[1]), .B(xorY1), .CI(C0));
FULL_ADDER fa_inst_3(.S(Y[2]), .CO(C2), .A(A[2]), .B(xorY2), .CI(C1));
FULL_ADDER fa_inst_4(.S(Y[3]), .CO(C3), .A(A[3]), .B(xorY3), .CI(C2));
FULL_ADDER fa_inst_5(.S(Y[4]), .CO(C4), .A(A[4]), .B(xorY4), .CI(C3));
FULL_ADDER fa_inst_6(.S(Y[5]), .CO(C5), .A(A[5]), .B(xorY5), .CI(C4));
FULL_ADDER fa_inst_7(.S(Y[6]), .CO(C6), .A(A[6]), .B(xorY6), .CI(C5));
FULL_ADDER fa_inst_8(.S(Y[7]), .CO(C7), .A(A[7]), .B(xorY7), .CI(C6));
FULL_ADDER fa_inst_9(.S(Y[8]), .CO(C8), .A(A[8]), .B(xorY8), .CI(C7));
FULL_ADDER fa_inst_10(.S(Y[9]), .CO(C9), .A(A[9]), .B(xorY9), .CI(C8));
FULL_ADDER fa_inst_11(.S(Y[10]), .CO(C10), .A(A[10]), .B(xorY10), .CI(C9));
FULL_ADDER fa_inst_12(.S(Y[11]), .CO(C11), .A(A[11]), .B(xorY11), .CI(C10));
FULL_ADDER fa_inst_13(.S(Y[12]), .CO(C12), .A(A[12]), .B(xorY12), .CI(C11));
FULL_ADDER fa_inst_14(.S(Y[13]), .CO(C13), .A(A[13]), .B(xorY13), .CI(C12));
FULL_ADDER fa_inst_15(.S(Y[14]), .CO(C14), .A(A[14]), .B(xorY14), .CI(C13));
FULL_ADDER fa_inst_16(.S(Y[15]), .CO(C15), .A(A[15]), .B(xorY15), .CI(C14));
FULL_ADDER fa_inst_17(.S(Y[16]), .CO(C16), .A(A[16]), .B(xorY16), .CI(C15));
FULL_ADDER fa_inst_18(.S(Y[17]), .CO(C17), .A(A[17]), .B(xorY17), .CI(C16));
FULL_ADDER fa_inst_19(.S(Y[18]), .CO(C18), .A(A[18]), .B(xorY18), .CI(C17));
FULL_ADDER fa_inst_20(.S(Y[19]), .CO(C19), .A(A[19]), .B(xorY19), .CI(C18));
FULL_ADDER fa_inst_21(.S(Y[20]), .CO(C20), .A(A[20]), .B(xorY20), .CI(C19));
FULL_ADDER fa_inst_22(.S(Y[21]), .CO(C21), .A(A[21]), .B(xorY21), .CI(C20));
FULL_ADDER fa_inst_23(.S(Y[22]), .CO(C22), .A(A[22]), .B(xorY22), .CI(C21));
FULL_ADDER fa_inst_24(.S(Y[23]), .CO(C23), .A(A[23]), .B(xorY23), .CI(C22));
FULL_ADDER fa_inst_25(.S(Y[24]), .CO(C24), .A(A[24]), .B(xorY24), .CI(C23));
FULL_ADDER fa_inst_26(.S(Y[25]), .CO(C25), .A(A[25]), .B(xorY25), .CI(C24));
FULL_ADDER fa_inst_27(.S(Y[26]), .CO(C26), .A(A[26]), .B(xorY26), .CI(C25));
FULL_ADDER fa_inst_28(.S(Y[27]), .CO(C27), .A(A[27]), .B(xorY27), .CI(C26));
FULL_ADDER fa_inst_29(.S(Y[28]), .CO(C28), .A(A[28]), .B(xorY28), .CI(C27));
FULL_ADDER fa_inst_30(.S(Y[29]), .CO(C29), .A(A[29]), .B(xorY29), .CI(C28));
FULL_ADDER fa_inst_31(.S(Y[30]), .CO(C30), .A(A[30]), .B(xorY30), .CI(C29));
FULL_ADDER fa_inst_32(.S(Y[31]), .CO(CO), .A(A[31]), .B(xorY31), .CI(C30));
endmodule
