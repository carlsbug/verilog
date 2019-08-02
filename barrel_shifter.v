// Name: barrel_shifter.v
// Module: SHIFT32_L , SHIFT32_R, SHIFT32
//
// Notes: 32-bit barrel shifter
//        1 for LnR is left shift, otherwise right shift
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//  2.0     Nov 29, 2018  Keonwoong Min keonwoong.min@sjsu.edu  Implemented 32-bit barrel_shifter in gate level
//------------------------------------------------------------------------------------------
`include "prj_definition.v"
// 32-bit shift amount shifter
module SHIFT32(Y,D,S, LnR);
// output list
output [31:0] Y;
// input list
input [31:0] D;
input [31:0] S;
input LnR;

// TBD
wire [31:0] bs_out;

BARREL_SHIFTER32 barrel_shifter32_inst_1(.Y(bs_out),.D(D),.S(S[4:0]),.LnR(LnR));
or or_inst_1(orOut,S[31:5]);
MUX32_2x1 mux32_2x1_inst_1(.Y(Y),.I0(bs_out), .I1(32'b0), .S(orOut));
endmodule

// Shift with control L or R shift
module BARREL_SHIFTER32(Y,D,S, LnR);
// output list
output [31:0] Y;
// input list
input [31:0] D;
input [4:0] S;
input LnR;
// TBD
wire [31:0] rs;
wire [31:0] ls;

SHIFT32_R shift32_r_inst_1(.Y(rs),.D(D),.S(S));
SHIFT32_L shift32_l_inst_1(.Y(ls),.D(D),.S(S));
MUX32_2x1 mux32_2x1_inst_1(.Y(Y),.I0(rs), .I1(ls), .S(LnR));
endmodule

// Right shifter
module SHIFT32_R(Y,D,S);
// output list
output [31:0] Y;
// input list
input [31:0] D;
input [4:0] S; // 5

wire a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31,a32;
wire b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32;
wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31,d32;
//1bit
MUX1_2x1 MUX1_2x1_inst1_1(.Y(a1), .I0(D[0]), .I1(D[1]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_2(.Y(a2), .I0(D[1]), .I1(D[2]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_3(.Y(a3), .I0(D[2]), .I1(D[3]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_4(.Y(a4), .I0(D[3]), .I1(D[4]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_5(.Y(a5), .I0(D[4]), .I1(D[5]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_6(.Y(a6), .I0(D[5]), .I1(D[6]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_7(.Y(a7), .I0(D[6]), .I1(D[7]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_8(.Y(a8), .I0(D[7]), .I1(D[8]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_9(.Y(a9), .I0(D[8]), .I1(D[9]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_10(.Y(a10), .I0(D[9]), .I1(D[10]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_11(.Y(a11), .I0(D[10]), .I1(D[11]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_12(.Y(a12), .I0(D[11]), .I1(D[12]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_13(.Y(a13), .I0(D[12]), .I1(D[13]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_14(.Y(a14), .I0(D[13]), .I1(D[14]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_15(.Y(a15), .I0(D[14]), .I1(D[15]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_16(.Y(a16), .I0(D[15]), .I1(D[16]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_17(.Y(a17), .I0(D[16]), .I1(D[17]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_18(.Y(a18), .I0(D[17]), .I1(D[18]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_19(.Y(a19), .I0(D[18]), .I1(D[19]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_20(.Y(a20), .I0(D[19]), .I1(D[20]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_21(.Y(a21), .I0(D[20]), .I1(D[21]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_22(.Y(a22), .I0(D[21]), .I1(D[22]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_23(.Y(a23), .I0(D[22]), .I1(D[23]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_24(.Y(a24), .I0(D[23]), .I1(D[24]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_25(.Y(a25), .I0(D[24]), .I1(D[25]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_26(.Y(a26), .I0(D[25]), .I1(D[26]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_27(.Y(a27), .I0(D[26]), .I1(D[27]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_28(.Y(a28), .I0(D[27]), .I1(D[28]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_29(.Y(a29), .I0(D[28]), .I1(D[29]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_30(.Y(a30), .I0(D[29]), .I1(D[30]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_31(.Y(a31), .I0(D[30]), .I1(D[31]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_32(.Y(a32), .I0(D[31]), .I1(1'b0), .S(S[0]));
//2bit
MUX1_2x1 MUX1_2x1_inst2_1(.Y(b1), .I0(a1), .I1(a3), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_2(.Y(b2), .I0(a2), .I1(a4), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_3(.Y(b3), .I0(a3), .I1(a5), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_4(.Y(b4), .I0(a4), .I1(a6), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_5(.Y(b5), .I0(a5), .I1(a7), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_6(.Y(b6), .I0(a6), .I1(a8), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_7(.Y(b7), .I0(a7), .I1(a9), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_8(.Y(b8), .I0(a8), .I1(a10), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_9(.Y(b9), .I0(a9), .I1(a11), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_10(.Y(b10), .I0(a10), .I1(a12), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_11(.Y(b11), .I0(a11), .I1(a13), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_12(.Y(b12), .I0(a12), .I1(a14), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_13(.Y(b13), .I0(a13), .I1(a15), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_14(.Y(b14), .I0(a14), .I1(a16), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_15(.Y(b15), .I0(a15), .I1(a17), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_16(.Y(b16), .I0(a16), .I1(a18), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_17(.Y(b17), .I0(a17), .I1(a19), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_18(.Y(b18), .I0(a18), .I1(a20), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_19(.Y(b19), .I0(a19), .I1(a21), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_20(.Y(b20), .I0(a20), .I1(a22), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_21(.Y(b21), .I0(a21), .I1(a23), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_22(.Y(b22), .I0(a22), .I1(a24), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_23(.Y(b23), .I0(a23), .I1(a25), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_24(.Y(b24), .I0(a24), .I1(a26), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_25(.Y(b25), .I0(a25), .I1(a27), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_26(.Y(b26), .I0(a26), .I1(a28), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_27(.Y(b27), .I0(a27), .I1(a29), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_28(.Y(b28), .I0(a28), .I1(a30), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_29(.Y(b29), .I0(a29), .I1(a31), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_30(.Y(b30), .I0(a30), .I1(a32), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_31(.Y(b31), .I0(a31), .I1(1'b0), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_32(.Y(b32), .I0(a32), .I1(1'b0), .S(S[1]));
//4bit
MUX1_2x1 MUX1_2x1_inst3_1(.Y(c1), .I0(b1), .I1(b5), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_2(.Y(c2), .I0(b2), .I1(b6), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_3(.Y(c3), .I0(b3), .I1(b7), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_4(.Y(c4), .I0(b4), .I1(b8), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_5(.Y(c5), .I0(b5), .I1(b9), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_6(.Y(c6), .I0(b6), .I1(b10), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_7(.Y(c7), .I0(b7), .I1(b11), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_8(.Y(c8), .I0(b8), .I1(b12), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_9(.Y(c9), .I0(b9), .I1(b13), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_10(.Y(c10), .I0(b10), .I1(b14), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_11(.Y(c11), .I0(b11), .I1(b15), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_12(.Y(c12), .I0(b12), .I1(b16), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_13(.Y(c13), .I0(b13), .I1(b17), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_14(.Y(c14), .I0(b14), .I1(b18), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_15(.Y(c15), .I0(b15), .I1(b19), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_16(.Y(c16), .I0(b16), .I1(b20), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_17(.Y(c17), .I0(b17), .I1(b21), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_18(.Y(c18), .I0(b18), .I1(b22), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_19(.Y(c19), .I0(b19), .I1(b23), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_20(.Y(c20), .I0(b20), .I1(b24), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_21(.Y(c21), .I0(b21), .I1(b25), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_22(.Y(c22), .I0(b22), .I1(b26), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_23(.Y(c23), .I0(b23), .I1(b27), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_24(.Y(c24), .I0(b24), .I1(b28), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_25(.Y(c25), .I0(b25), .I1(b29), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_26(.Y(c26), .I0(b26), .I1(b30), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_27(.Y(c27), .I0(b27), .I1(b31), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_28(.Y(c28), .I0(b28), .I1(b32), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_29(.Y(c29), .I0(b29), .I1(1'b0), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_30(.Y(c30), .I0(b30), .I1(1'b0), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_31(.Y(c31), .I0(b31), .I1(1'b0), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_32(.Y(c32), .I0(b32), .I1(1'b0), .S(S[2]));
//8bit
MUX1_2x1 MUX1_2x1_inst4_1(.Y(d1), .I0(c1), .I1(c9), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_2(.Y(d2), .I0(c2), .I1(c10), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_3(.Y(d3), .I0(c3), .I1(c11), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_4(.Y(d4), .I0(c4), .I1(c12), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_5(.Y(d5), .I0(c5), .I1(c13), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_6(.Y(d6), .I0(c6), .I1(c14), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_7(.Y(d7), .I0(c7), .I1(c15), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_8(.Y(d8), .I0(c8), .I1(c16), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_9(.Y(d9), .I0(c9), .I1(c17), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_10(.Y(d10), .I0(c10), .I1(c18), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_11(.Y(d11), .I0(c11), .I1(c19), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_12(.Y(d12), .I0(c12), .I1(c20), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_13(.Y(d13), .I0(c13), .I1(c21), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_14(.Y(d14), .I0(c14), .I1(c22), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_15(.Y(d15), .I0(c15), .I1(c23), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_16(.Y(d16), .I0(c16), .I1(c24), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_17(.Y(d17), .I0(c17), .I1(c25), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_18(.Y(d18), .I0(c18), .I1(c26), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_19(.Y(d19), .I0(c19), .I1(c27), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_20(.Y(d20), .I0(c20), .I1(c28), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_21(.Y(d21), .I0(c21), .I1(c29), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_22(.Y(d22), .I0(c22), .I1(c30), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_23(.Y(d23), .I0(c23), .I1(c31), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_24(.Y(d24), .I0(c24), .I1(c32), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_25(.Y(d25), .I0(c25), .I1(1'b0), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_26(.Y(d26), .I0(c26), .I1(1'b0), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_27(.Y(d27), .I0(c27), .I1(1'b0), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_28(.Y(d28), .I0(c28), .I1(1'b0), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_29(.Y(d29), .I0(c29), .I1(1'b0), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_30(.Y(d30), .I0(c30), .I1(1'b0), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_31(.Y(d31), .I0(c31), .I1(1'b0), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_32(.Y(d32), .I0(c32), .I1(1'b0), .S(S[3]));
//16bit
MUX1_2x1 MUX1_2x1_inst5_1(.Y(Y[0]), .I0(d1), .I1(d17), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_2(.Y(Y[1]), .I0(d2), .I1(d18), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_3(.Y(Y[2]), .I0(d3), .I1(d19), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_4(.Y(Y[3]), .I0(d4), .I1(d20), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_5(.Y(Y[4]), .I0(d5), .I1(d21), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_6(.Y(Y[5]), .I0(d6), .I1(d22), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_7(.Y(Y[6]), .I0(d7), .I1(d23), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_8(.Y(Y[7]), .I0(d8), .I1(d24), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_9(.Y(Y[8]), .I0(d9), .I1(d25), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_10(.Y(Y[9]), .I0(d10), .I1(d26), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_11(.Y(Y[10]), .I0(d11), .I1(d27), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_12(.Y(Y[11]), .I0(d12), .I1(d28), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_13(.Y(Y[12]), .I0(d13), .I1(d29), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_14(.Y(Y[13]), .I0(d14), .I1(d30), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_15(.Y(Y[14]), .I0(d15), .I1(d31), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_16(.Y(Y[15]), .I0(d16), .I1(d32), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_17(.Y(Y[16]), .I0(d17), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_18(.Y(Y[17]), .I0(d18), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_19(.Y(Y[18]), .I0(d19), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_20(.Y(Y[19]), .I0(d20), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_21(.Y(Y[20]), .I0(d21), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_22(.Y(Y[21]), .I0(d22), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_23(.Y(Y[22]), .I0(d23), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_24(.Y(Y[23]), .I0(d24), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_25(.Y(Y[24]), .I0(d25), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_26(.Y(Y[25]), .I0(d26), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_27(.Y(Y[26]), .I0(d27), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_28(.Y(Y[27]), .I0(d28), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_29(.Y(Y[28]), .I0(d29), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_30(.Y(Y[29]), .I0(d30), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_31(.Y(Y[30]), .I0(d31), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_32(.Y(Y[31]), .I0(d32), .I1(1'b0), .S(S[4]));
// TBD
// wire [29:0] mux1Out1;
// wire [31:30] mux1Out2;
//
// wire [27:0] mux2Out1;
// wire [31:28] mux2Out2;
//
// wire [23:0] mux3Out1;
// wire [31:24] mux3Out2;
//
// wire [15:0] mux4Out1;
// wire [31:16] mux4Out2;
//
// MUX32_2x1 mux32_2x1_inst_1(.Y({mux1Out2,mux1Out1}), .I0(D), .I1({{1'b0},{D[30:0]}}), .S(S[0])); // 1bit
// MUX32_2x1 mux32_2x1_inst_2(.Y({mux2Out2,mux2Out1}), .I0({mux1Out2,mux1Out1}), .I1({{2'b0},{mux1Out1}}), .S(S[1])); //2bit
// MUX32_2x1 mux32_2x1_inst_3(.Y({mux3Out2,mux3Out1}), .I0({mux2Out2,mux2Out1}), .I1({{4'b0},mux2Out1}), .S(S[2])); //4bit
// MUX32_2x1 mux32_2x1_inst_4(.Y({mux4Out2,mux4Out1}), .I0({mux3Out2,mux3Out1}), .I1({{8'b0},{mux3Out1}}), .S(S[3])); // 8bit
// MUX32_2x1 mux32_2x1_inst_5(.Y(Y), .I0({mux4Out2,mux4Out1}), .I1({{16'b0},{mux4Out1}}), .S(S[4]));
endmodule
// Left shifter
module SHIFT32_L(Y,D,S);
// output list
output [31:0] Y;
// input list
input [31:0] D;
input [4:0] S;
// TBD
wire a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19,a20,a21,a22,a23,a24,a25,a26,a27,a28,a29,a30,a31,a32;
wire b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32;
wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32;
wire d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31,d32;
//1bit
MUX1_2x1 MUX1_2x1_inst1_1(.Y(a1), .I0(D[0]), .I1(1'b0), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_2(.Y(a2), .I0(D[1]), .I1(D[0]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_3(.Y(a3), .I0(D[2]), .I1(D[1]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_4(.Y(a4), .I0(D[3]), .I1(D[2]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_5(.Y(a5), .I0(D[4]), .I1(D[3]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_6(.Y(a6), .I0(D[5]), .I1(D[4]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_7(.Y(a7), .I0(D[6]), .I1(D[5]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_8(.Y(a8), .I0(D[7]), .I1(D[6]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_9(.Y(a9), .I0(D[8]), .I1(D[7]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_10(.Y(a10), .I0(D[9]), .I1(D[8]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_11(.Y(a11), .I0(D[10]), .I1(D[9]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_12(.Y(a12), .I0(D[11]), .I1(D[10]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_13(.Y(a13), .I0(D[12]), .I1(D[11]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_14(.Y(a14), .I0(D[13]), .I1(D[12]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_15(.Y(a15), .I0(D[14]), .I1(D[13]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_16(.Y(a16), .I0(D[15]), .I1(D[14]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_17(.Y(a17), .I0(D[16]), .I1(D[15]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_18(.Y(a18), .I0(D[17]), .I1(D[16]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_19(.Y(a19), .I0(D[18]), .I1(D[17]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_20(.Y(a20), .I0(D[19]), .I1(D[18]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_21(.Y(a21), .I0(D[20]), .I1(D[19]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_22(.Y(a22), .I0(D[21]), .I1(D[20]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_23(.Y(a23), .I0(D[22]), .I1(D[21]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_24(.Y(a24), .I0(D[23]), .I1(D[22]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_25(.Y(a25), .I0(D[24]), .I1(D[23]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_26(.Y(a26), .I0(D[25]), .I1(D[24]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_27(.Y(a27), .I0(D[26]), .I1(D[25]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_28(.Y(a28), .I0(D[27]), .I1(D[26]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_29(.Y(a29), .I0(D[28]), .I1(D[27]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_30(.Y(a30), .I0(D[29]), .I1(D[28]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_31(.Y(a31), .I0(D[30]), .I1(D[29]), .S(S[0]));
MUX1_2x1 MUX1_2x1_inst1_32(.Y(a32), .I0(D[31]), .I1(D[30]), .S(S[0]));
//2bit
MUX1_2x1 MUX1_2x1_inst2_1(.Y(b1), .I0(a1), .I1(1'b0), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_2(.Y(b2), .I0(a2), .I1(1'b0), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_3(.Y(b3), .I0(a3), .I1(a1), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_4(.Y(b4), .I0(a4), .I1(a2), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_5(.Y(b5), .I0(a5), .I1(a3), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_6(.Y(b6), .I0(a6), .I1(a4), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_7(.Y(b7), .I0(a7), .I1(a5), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_8(.Y(b8), .I0(a8), .I1(a6), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_9(.Y(b9), .I0(a9), .I1(a7), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_10(.Y(b10), .I0(a10), .I1(a8), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_11(.Y(b11), .I0(a11), .I1(a9), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_12(.Y(b12), .I0(a12), .I1(a10), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_13(.Y(b13), .I0(a13), .I1(a11), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_14(.Y(b14), .I0(a14), .I1(a12), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_15(.Y(b15), .I0(a15), .I1(a13), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_16(.Y(b16), .I0(a16), .I1(a14), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_17(.Y(b17), .I0(a17), .I1(a15), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_18(.Y(b18), .I0(a18), .I1(a16), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_19(.Y(b19), .I0(a19), .I1(a17), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_20(.Y(b20), .I0(a20), .I1(a18), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_21(.Y(b21), .I0(a21), .I1(a19), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_22(.Y(b22), .I0(a22), .I1(a20), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_23(.Y(b23), .I0(a23), .I1(a21), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_24(.Y(b24), .I0(a24), .I1(a22), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_25(.Y(b25), .I0(a25), .I1(a23), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_26(.Y(b26), .I0(a26), .I1(a24), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_27(.Y(b27), .I0(a27), .I1(a25), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_28(.Y(b28), .I0(a28), .I1(a26), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_29(.Y(b29), .I0(a29), .I1(a27), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_30(.Y(b30), .I0(a30), .I1(a28), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_31(.Y(b31), .I0(a31), .I1(a29), .S(S[1]));
MUX1_2x1 MUX1_2x1_inst2_32(.Y(b32), .I0(a32), .I1(a30), .S(S[1]));
//4bit
MUX1_2x1 MUX1_2x1_inst3_1(.Y(c1), .I0(b1), .I1(1'b0), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_2(.Y(c2), .I0(b2), .I1(1'b0), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_3(.Y(c3), .I0(b3), .I1(1'b0), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_4(.Y(c4), .I0(b4), .I1(1'b0), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_5(.Y(c5), .I0(b5), .I1(b1), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_6(.Y(c6), .I0(b6), .I1(b2), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_7(.Y(c7), .I0(b7), .I1(b3), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_8(.Y(c8), .I0(b8), .I1(b4), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_9(.Y(c9), .I0(b9), .I1(b5), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_10(.Y(c10), .I0(b10), .I1(b6), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_11(.Y(c11), .I0(b11), .I1(b7), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_12(.Y(c12), .I0(b12), .I1(b8), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_13(.Y(c13), .I0(b13), .I1(b9), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_14(.Y(c14), .I0(b14), .I1(b10), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_15(.Y(c15), .I0(b15), .I1(b11), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_16(.Y(c16), .I0(b16), .I1(b12), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_17(.Y(c17), .I0(b17), .I1(b13), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_18(.Y(c18), .I0(b18), .I1(b14), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_19(.Y(c19), .I0(b19), .I1(b15), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_20(.Y(c20), .I0(b20), .I1(b16), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_21(.Y(c21), .I0(b21), .I1(b17), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_22(.Y(c22), .I0(b22), .I1(b18), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_23(.Y(c23), .I0(b23), .I1(b19), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_24(.Y(c24), .I0(b24), .I1(b20), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_25(.Y(c25), .I0(b25), .I1(b21), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_26(.Y(c26), .I0(b26), .I1(b22), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_27(.Y(c27), .I0(b27), .I1(b23), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_28(.Y(c28), .I0(b28), .I1(b24), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_29(.Y(c29), .I0(b29), .I1(b25), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_30(.Y(c30), .I0(b30), .I1(b26), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_31(.Y(c31), .I0(b31), .I1(b27), .S(S[2]));
MUX1_2x1 MUX1_2x1_inst3_32(.Y(c32), .I0(b32), .I1(b28), .S(S[2]));
//8bit
MUX1_2x1 MUX1_2x1_inst4_1(.Y(d1), .I0(c1), .I1(1'b0), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_2(.Y(d2), .I0(c2), .I1(1'b0), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_3(.Y(d3), .I0(c3), .I1(1'b0), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_4(.Y(d4), .I0(c4), .I1(1'b0), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_5(.Y(d5), .I0(c5), .I1(1'b0), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_6(.Y(d6), .I0(c6), .I1(1'b0), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_7(.Y(d7), .I0(c7), .I1(1'b0), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_8(.Y(d8), .I0(c8), .I1(1'b0), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_9(.Y(d9), .I0(c9), .I1(c1), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_10(.Y(d10), .I0(c10), .I1(c2), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_11(.Y(d11), .I0(c11), .I1(c3), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_12(.Y(d12), .I0(c12), .I1(c4), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_13(.Y(d13), .I0(c13), .I1(c5), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_14(.Y(d14), .I0(c14), .I1(c6), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_15(.Y(d15), .I0(c15), .I1(c7), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_16(.Y(d16), .I0(c16), .I1(c8), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_17(.Y(d17), .I0(c17), .I1(c9), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_18(.Y(d18), .I0(c18), .I1(c10), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_19(.Y(d19), .I0(c19), .I1(c11), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_20(.Y(d20), .I0(c20), .I1(c12), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_21(.Y(d21), .I0(c21), .I1(c13), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_22(.Y(d22), .I0(c22), .I1(c14), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_23(.Y(d23), .I0(c23), .I1(c15), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_24(.Y(d24), .I0(c24), .I1(c16), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_25(.Y(d25), .I0(c25), .I1(c17), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_26(.Y(d26), .I0(c26), .I1(c18), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_27(.Y(d27), .I0(c27), .I1(c19), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_28(.Y(d28), .I0(c28), .I1(c20), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_29(.Y(d29), .I0(c29), .I1(c21), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_30(.Y(d30), .I0(c30), .I1(c22), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_31(.Y(d31), .I0(c31), .I1(c23), .S(S[3]));
MUX1_2x1 MUX1_2x1_inst4_32(.Y(d32), .I0(c32), .I1(c24), .S(S[3]));
//16bit
MUX1_2x1 MUX1_2x1_inst5_1(.Y(Y[0]), .I0(d1), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_2(.Y(Y[1]), .I0(d2), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_3(.Y(Y[2]), .I0(d3), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_4(.Y(Y[3]), .I0(d4), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_5(.Y(Y[4]), .I0(d5), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_6(.Y(Y[5]), .I0(d6), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_7(.Y(Y[6]), .I0(d7), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_8(.Y(Y[7]), .I0(d8), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_9(.Y(Y[8]), .I0(d9), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_10(.Y(Y[9]), .I0(d10), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_11(.Y(Y[10]), .I0(d11), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_12(.Y(Y[11]), .I0(d12), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_13(.Y(Y[12]), .I0(d13), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_14(.Y(Y[13]), .I0(d14), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_15(.Y(Y[14]), .I0(d15), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_16(.Y(Y[15]), .I0(d16), .I1(1'b0), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_17(.Y(Y[16]), .I0(d17), .I1(d1), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_18(.Y(Y[17]), .I0(d18), .I1(d2), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_19(.Y(Y[18]), .I0(d19), .I1(d3), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_20(.Y(Y[19]), .I0(d20), .I1(d4), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_21(.Y(Y[20]), .I0(d21), .I1(d5), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_22(.Y(Y[21]), .I0(d22), .I1(d6), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_23(.Y(Y[22]), .I0(d23), .I1(d7), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_24(.Y(Y[23]), .I0(d24), .I1(d8), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_25(.Y(Y[24]), .I0(d25), .I1(d9), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_26(.Y(Y[25]), .I0(d26), .I1(d10), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_27(.Y(Y[26]), .I0(d27), .I1(d11), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_28(.Y(Y[27]), .I0(d28), .I1(d12), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_29(.Y(Y[28]), .I0(d29), .I1(d13), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_30(.Y(Y[29]), .I0(d30), .I1(d14), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_31(.Y(Y[30]), .I0(d31), .I1(d15), .S(S[4]));
MUX1_2x1 MUX1_2x1_inst5_32(.Y(Y[31]), .I0(d32), .I1(d16), .S(S[4]));
// wire [29:0] mux1Out1;
// wire [31:30] mux1Out2;
// wire [27:0] mux2Out1;
// wire [31:28] mux2Out2;
// wire [23:0] mux3Out1;
// wire [31:24] mux3Out2;
// wire [15:0] mux4Out1;
// wire [31:16] mux4Out2;
// MUX32_2x1 mux32_2x1_inst_1(.Y({mux1Out2,mux1Out1}), .I0(D), .I1({{D[30:0]},{1'b0}}), .S(S[0]));
// MUX32_2x1 mux32_2x1_inst_2(.Y({mux2Out2,mux2Out1}), .I0({mux1Out2,mux1Out1}), .I1({{mux1Out1},{2'b0}}), .S(S[1]));
// MUX32_2x1 mux32_2x1_inst_3(.Y({mux3Out2,mux3Out1}), .I0({mux2Out2,mux2Out1}), .I1({{mux2Out1},{4'b0}}), .S(S[2]));
// MUX32_2x1 mux32_2x1_inst_4(.Y({mux4Out2,mux4Out1}), .I0({mux3Out2,mux3Out1}), .I1({{mux3Out1},{8'b0}}), .S(S[3]));
// MUX32_2x1 mux32_2x1_inst_5(.Y(Y), .I0({mux4Out2,mux4Out1}), .I1({{mux4Out1},{16'b0}}), .S(S[4]));
endmodule
