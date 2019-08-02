// Name: mult.v
// Module: MULT32 , MULT32_U
//
// Output: HI: 32 higher bits
//         LO: 32 lower bits
//
// Input: A : 32-bit input (MCND)
//        B : 32-bit input (MPLR)
//
// Notes: 32-bit multiplier
//
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//  2.0     Nov 27, 2018	Keonwoong Min	keonwoong.min@sjsu.edu  implement  32-bit unsigned multiplier
//  2.1     Nov 27, 2018  Keonwoong Min keonwoong.min@sjsu.edu  implement 32-bit Signed multiplier
//------------------------------------------------------------------------------------------
`include "prj_definition.v"
module MULT32(HI, LO, A, B); //32bit Signed Multiplication Circuit
// output list
output [31:0] HI;
output [31:0] LO;
// input list
input [31:0] A;
input [31:0] B;
// TBD
wire [31:0] twoscomp32_inst_1_out;
wire [31:0] twoscomp32_inst_2_out;
wire [31:0] twoscomp32_inst_3_out;
wire [31:0] twoscomp32_inst_4_out;
wire [31:0] mux32_2x1_inst_1_out;
wire [31:0] mux32_2x1_inst_2_out;
wire [31:0] mult32_u_inst_1_HI;
wire [31:0] mult32_u_inst_1_LO;

TWOSCOMP32 towscomp32_inst_1(.Y(twoscomp32_inst_1_out), .A(A)); //MCND
MUX32_2x1 mux32_2x1_inst_1(.Y(mux32_2x1_inst_1_out), .I0(A), .I1(twoscomp32_inst_1_out), .S(A[31])); //MCND
TWOSCOMP32 towscomp32_inst_2(.Y(twoscomp32_inst_2_out), .A(B)); //MPLR
MUX32_2x1 mux32_2x1_inst_2(.Y(mux32_2x1_inst_2_out), .I0(B), .I1(twoscomp32_inst_2_out), .S(B[31])); //MPLR

MULT32_U mult32_u_inst_1(.HI(mult32_u_inst_1_HI), .LO(mult32_u_inst_1_LO), .A(mux32_2x1_inst_1_out), .B(mux32_2x1_inst_2_out));

TWOSCOMP32 towscomp32_inst_3(.Y(twoscomp32_inst_3_out), .A(mult32_u_inst_1_HI)); //HI of 32bit Unisigned
TWOSCOMP32 towscomp32_inst_4(.Y(twoscomp32_inst_4_out), .A(mult32_u_inst_1_LO)); //LO of 32bit Unisigned
MUX32_2x1 mux32_2x1_inst_3(.Y(HI), .I0(mult32_u_inst_1_HI), .I1(twoscomp32_inst_3_out), .S(xorY)); //HI
MUX32_2x1 mux32_2x1_inst_4(.Y(LO), .I0(mult32_u_inst_1_LO), .I1(twoscomp32_inst_4_out), .S(xorY)); //LO
xor xor_inst_1(xorY,A[31],B[31]); //take 2 sign bit

endmodule

module MULT32_U(HI, LO, A, B);
// output list
output [31:0] HI;
output [31:0] LO;
// input list
input [31:0] A; //MCND
input [31:0] B; //MPLR
// TBD
wire [31:1] andOut1;
wire [31:0] andOut2;
wire [31:0] andOut3;
wire [31:0] andOut4;
wire [31:0] andOut5;
wire [31:0] andOut6;
wire [31:0] andOut7;
wire [31:0] andOut8;
wire [31:0] andOut9;
wire [31:0] andOut10;
wire [31:0] andOut11;
wire [31:0] andOut12;
wire [31:0] andOut13;
wire [31:0] andOut14;
wire [31:0] andOut15;
wire [31:0] andOut16;
wire [31:0] andOut17;
wire [31:0] andOut18;
wire [31:0] andOut19;
wire [31:0] andOut20;
wire [31:0] andOut21;
wire [31:0] andOut22;
wire [31:0] andOut23;
wire [31:0] andOut24;
wire [31:0] andOut25;
wire [31:0] andOut26;
wire [31:0] andOut27;
wire [31:0] andOut28;
wire [31:0] andOut29;
wire [31:0] andOut30;
wire [31:0] andOut31;
wire [31:0] andOut32;

wire [31:1] adder1;
wire [31:1] adder2;
wire [31:1] adder3;
wire [31:1] adder4;
wire [31:1] adder5;
wire [31:1] adder6;
wire [31:1] adder7;
wire [31:1] adder8;
wire [31:1] adder9;
wire [31:1] adder10;
wire [31:1] adder11;
wire [31:1] adder12;
wire [31:1] adder13;
wire [31:1] adder14;
wire [31:1] adder15;
wire [31:1] adder16;
wire [31:1] adder17;
wire [31:1] adder18;
wire [31:1] adder19;
wire [31:1] adder20;
wire [31:1] adder21;
wire [31:1] adder22;
wire [31:1] adder23;
wire [31:1] adder24;
wire [31:1] adder25;
wire [31:1] adder26;
wire [31:1] adder27;
wire [31:1] adder28;
wire [31:1] adder29;
wire [31:1] adder30;
wire [31:1] adder31;

wire C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,C18,C19,C20,C21,C22,
C23,C24,C25,C26,C27,C28,C29,C30,C31;
and_32 and_inst_1(.Y({andOut1,LO[0]}), .A(A), .B({32{B[0]}}));
and_32 and_inst_2(.Y(andOut2), .A(A), .B({32{B[1]}}));
and_32 and_inst_3(.Y(andOut3),.A(A),.B({32{B[2]}}));
and_32 and_inst_4(.Y(andOut4),.A(A),.B({32{B[3]}}));
and_32 and_inst_5(.Y(andOut5),.A(A),.B({32{B[4]}}));
and_32 and_inst_6(.Y(andOut6),.A(A),.B({32{B[5]}}));
and_32 and_inst_7(.Y(andOut7),.A(A),.B({32{B[6]}}));
and_32 and_inst_8(.Y(andOut8),.A(A),.B({32{B[7]}}));
and_32 and_inst_9(.Y(andOut9),.A(A),.B({32{B[8]}}));
and_32 and_inst_10(.Y(andOut10),.A(A),.B({32{B[9]}}));
and_32 and_inst_11(.Y(andOut11),.A(A),.B({32{B[10]}}));
and_32 and_inst_12(.Y(andOut12),.A(A),.B({32{B[11]}}));
and_32 and_inst_13(.Y(andOut13),.A(A),.B({32{B[12]}}));
and_32 and_inst_14(.Y(andOut14),.A(A),.B({32{B[13]}}));
and_32 and_inst_15(.Y(andOut15),.A(A),.B({32{B[14]}}));
and_32 and_inst_16(.Y(andOut16),.A(A),.B({32{B[15]}}));
and_32 and_inst_17(.Y(andOut17),.A(A),.B({32{B[16]}}));
and_32 and_inst_18(.Y(andOut18),.A(A),.B({32{B[17]}}));
and_32 and_inst_19(.Y(andOut19),.A(A),.B({32{B[18]}}));
and_32 and_inst_20(.Y(andOut20),.A(A),.B({32{B[19]}}));
and_32 and_inst_21(.Y(andOut21),.A(A),.B({32{B[20]}}));
and_32 and_inst_22(.Y(andOut22),.A(A),.B({32{B[21]}}));
and_32 and_inst_23(.Y(andOut23),.A(A),.B({32{B[22]}}));
and_32 and_inst_24(.Y(andOut24),.A(A),.B({32{B[23]}}));
and_32 and_inst_25(.Y(andOut25),.A(A),.B({32{B[24]}}));
and_32 and_inst_26(.Y(andOut26),.A(A),.B({32{B[25]}}));
and_32 and_inst_27(.Y(andOut27),.A(A),.B({32{B[26]}}));
and_32 and_inst_28(.Y(andOut28),.A(A),.B({32{B[27]}}));
and_32 and_inst_29(.Y(andOut29),.A(A),.B({32{B[28]}}));
and_32 and_inst_30(.Y(andOut30),.A(A),.B({32{B[29]}}));
and_32 and_inst_31(.Y(andOut31),.A(A),.B({32{B[30]}}));
and_32 and_inst_32(.Y(andOut32),.A(A),.B({32{B[31]}}));

RC_ADD_SUB_32 add_inst_1(.Y({adder1 , LO[1]}), .CO(C1), .A(andOut2), .B({1'b0,andOut1}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_2(.Y({adder2, LO[2]}), .CO(C2), .A(andOut3), .B({C1,adder1}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_3(.Y({adder3, LO[3]}), .CO(C3), .A(andOut4), .B({C2,adder2}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_4(.Y({adder4, LO[4]}), .CO(C4), .A(andOut5), .B({C3,adder3}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_5(.Y({adder5, LO[5]}), .CO(C5), .A(andOut6), .B({C4,adder4}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_6(.Y({adder6, LO[6]}), .CO(C6), .A(andOut7), .B({C5,adder5}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_7(.Y({adder7, LO[7]}), .CO(C7), .A(andOut8), .B({C6,adder6}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_8(.Y({adder8, LO[8]}), .CO(C8), .A(andOut9), .B({C7,adder7}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_9(.Y({adder9, LO[9]}), .CO(C9), .A(andOut10), .B({C8,adder8}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_10(.Y({adder10, LO[10]}), .CO(C10), .A(andOut11), .B({C9,adder9}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_11(.Y({adder11, LO[11]}), .CO(C11), .A(andOut12), .B({C10,adder10}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_12(.Y({adder12, LO[12]}), .CO(C12), .A(andOut13), .B({C11,adder11}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_13(.Y({adder13, LO[13]}), .CO(C13), .A(andOut14), .B({C12,adder12}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_14(.Y({adder14, LO[14]}), .CO(C14), .A(andOut15), .B({C13,adder13}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_15(.Y({adder15, LO[15]}), .CO(C15), .A(andOut16), .B({C14,adder14}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_16(.Y({adder16, LO[16]}), .CO(C16), .A(andOut17), .B({C15,adder15}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_17(.Y({adder17, LO[17]}), .CO(C17), .A(andOut18), .B({C16,adder16}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_18(.Y({adder18, LO[18]}), .CO(C18), .A(andOut19), .B({C17,adder17}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_19(.Y({adder19, LO[19]}), .CO(C19), .A(andOut20), .B({C18,adder18}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_20(.Y({adder20, LO[20]}), .CO(C20), .A(andOut21), .B({C19,adder19}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_21(.Y({adder21, LO[21]}), .CO(C21), .A(andOut22), .B({C20,adder20}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_22(.Y({adder22, LO[22]}), .CO(C22), .A(andOut23), .B({C21,adder21}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_23(.Y({adder23, LO[23]}), .CO(C23), .A(andOut24), .B({C22,adder22}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_24(.Y({adder24, LO[24]}), .CO(C24), .A(andOut25), .B({C23,adder23}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_25(.Y({adder25, LO[25]}), .CO(C25), .A(andOut26), .B({C24,adder24}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_26(.Y({adder26, LO[26]}), .CO(C26), .A(andOut27), .B({C25,adder25}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_27(.Y({adder27, LO[27]}), .CO(C27), .A(andOut28), .B({C26,adder26}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_28(.Y({adder28, LO[28]}), .CO(C28), .A(andOut29), .B({C27,adder27}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_29(.Y({adder29, LO[29]}), .CO(C29), .A(andOut30), .B({C28,adder28}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_30(.Y({adder30, LO[30]}), .CO(C30), .A(andOut31), .B({C29,adder29}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_31(.Y({adder31, LO[31]}), .CO(C31), .A(andOut32), .B({C30,adder30}), .SnA(1'b0));
RC_ADD_SUB_32 add_inst_32(.Y({HI[31:1]}), .CO(HI[0]), .A(32'b0), .B({C31,adder31}), .SnA(1'b0));
endmodule
