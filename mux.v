// Name: mux.v
// Module:
// Input:
// Output:
//
// Notes: Common definitions
//        I0 if S = 0, I1 if S =1
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 02, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//  2.0     Nov 27, 2018  Keonwoong Min keonwoong.min@sjsu.edu Implemented 1-bit mux and 32-bit mux
//  2.1     Dec 1,  2018  Keonwoong Min keonwoong.min@sjsu.edu Implemented 32-bit 4x1 mux, 32-bit 8x1 mux, 32-bit 16x1 mux
//  2.2     Dec 2,  2018  Keonwoong Min keonwoong.min@sjsu.edu Implemented 32-bit 32x1 mux
//------------------------------------------------------------------------------------------
//
// 32-bit mux
module MUX32_32x1(Y, I0, I1, I2, I3, I4, I5, I6, I7,
                     I8, I9, I10, I11, I12, I13, I14, I15,
                     I16, I17, I18, I19, I20, I21, I22, I23,
                     I24, I25, I26, I27, I28, I29, I30, I31, S);
// output list
output [31:0] Y;
//input list
input [31:0] I0, I1, I2, I3, I4, I5, I6, I7;
input [31:0] I8, I9, I10, I11, I12, I13, I14, I15;
input [31:0] I16, I17, I18, I19, I20, I21, I22, I23;
input [31:0] I24, I25, I26, I27, I28, I29, I30, I31;
input [4:0] S;

// TBD
wire [31:0] mux32out1;
wire [31:0] mux32out2;
MUX32_16x1 mux32_16x1_inst_1(.Y(mux32out1), .I0(I0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7),
                     .I8(I8), .I9(I9), .I10(I10), .I11(I11), .I12(I12), .I13(I13), .I14(I14), .I15(I15), .S(S[3:0]));
MUX32_16x1 mux32_16x1_inst_2(.Y(mux32out2), .I0(I16), .I1(I17), .I2(I18), .I3(I19), .I4(I20), .I5(I21), .I6(I22), .I7(I23),
                    .I8(I24), .I9(I25), .I10(I26), .I11(I27), .I12(I28), .I13(I29), .I14(I30), .I15(I31), .S(S[3:0]));
MUX32_2x1 mux32_2x1_inst(.Y(Y), .I0(mux32out1), .I1(mux32out2), .S(S[4]));
endmodule

// 32-bit 16x1 mux
module MUX32_16x1(Y, I0, I1, I2, I3, I4, I5, I6, I7,
                     I8, I9, I10, I11, I12, I13, I14, I15, S);
// output list
output [31:0] Y;
//input list
input [31:0] I0;
input [31:0] I1;
input [31:0] I2;
input [31:0] I3;
input [31:0] I4;
input [31:0] I5;
input [31:0] I6;
input [31:0] I7;
input [31:0] I8;
input [31:0] I9;
input [31:0] I10;
input [31:0] I11;
input [31:0] I12;
input [31:0] I13;
input [31:0] I14;
input [31:0] I15;
input [3:0] S;
// TBD
wire [31:0] mux1;
wire [31:0] mux2;
MUX32_8x1 mux32_8x1_inst_1(.Y(mux1), .I0(I0), .I1(I1), .I2(I2), .I3(I3), .I4(I4), .I5(I5), .I6(I6), .I7(I7), .S(S[2:0]));
MUX32_8x1 mux32_8x1_inst_2(.Y(mux2), .I0(I8), .I1(I9), .I2(I10), .I3(I11), .I4(I12), .I5(I13), .I6(I14), .I7(I15), .S(S[2:0]));
MUX32_2x1 mux32_2x1_inst_1(.Y(Y), .I0(mux1), .I1(mux2), .S(S[3]));

endmodule

// 32-bit 8x1 mux
module MUX32_8x1(Y, I0, I1, I2, I3, I4, I5, I6, I7, S);
// output list
output [31:0] Y;
//input list
input [31:0] I0;
input [31:0] I1;
input [31:0] I2;
input [31:0] I3;
input [31:0] I4;
input [31:0] I5;
input [31:0] I6;
input [31:0] I7;
input [2:0] S;
// TBD
wire [31:0] mux1;
wire [31:0] mux2;
MUX32_4x1 mux32_4x1_inst_1(.Y(mux1), .I0(I0), .I1(I1), .I2(I2), .I3(I3), .S(S[1:0]));
MUX32_4x1 mux32_4x1_inst_2(.Y(mux2), .I0(I4), .I1(I5), .I2(I6), .I3(I7), .S(S[1:0]));
MUX32_2x1 mux32_2x1_inst_1(.Y(Y), .I0(mux1), .I1(mux2), .S(S[2]));

endmodule

// 32-bit 4x1 mux
module MUX32_4x1(Y, I0, I1, I2, I3, S);
// output list
output [31:0] Y;
//input list
input [31:0] I0;
input [31:0] I1;
input [31:0] I2;
input [31:0] I3;
input [1:0] S;

// TBD
wire [31:0] mux1;
wire [31:0] mux2;
MUX32_2x1 mux32_2x1_inst_1(.Y(mux1), .I0(I0), .I1(I1), .S(S[0])); //D[0], D[1]
MUX32_2x1 mux32_2x1_inst_2(.Y(mux2), .I0(I2), .I1(I3), .S(S[0])); //D[2], D[3]
MUX32_2x1 mux32_2x1_inst_3(.Y(Y), .I0(mux1), .I1(mux2), .S(S[1]));
endmodule

// 32-bit mux
module MUX32_2x1(Y, I0, I1, S);
// output list
output [31:0] Y;
//input list
input [31:0] I0;
input [31:0] I1;
input S;
// TBD
MUX1_2x1 MUX1_2x1_inst_1(.Y(Y[0]), .I0(I0[0]), .I1(I1[0]), .S(S));
MUX1_2x1 MUX1_2x1_inst_2(.Y(Y[1]), .I0(I0[1]), .I1(I1[1]), .S(S));
MUX1_2x1 MUX1_2x1_inst_3(.Y(Y[2]), .I0(I0[2]), .I1(I1[2]), .S(S));
MUX1_2x1 MUX1_2x1_inst_4(.Y(Y[3]), .I0(I0[3]), .I1(I1[3]), .S(S));
MUX1_2x1 MUX1_2x1_inst_5(.Y(Y[4]), .I0(I0[4]), .I1(I1[4]), .S(S));
MUX1_2x1 MUX1_2x1_inst_6(.Y(Y[5]), .I0(I0[5]), .I1(I1[5]), .S(S));
MUX1_2x1 MUX1_2x1_inst_7(.Y(Y[6]), .I0(I0[6]), .I1(I1[6]), .S(S));
MUX1_2x1 MUX1_2x1_inst_8(.Y(Y[7]), .I0(I0[7]), .I1(I1[7]), .S(S));
MUX1_2x1 MUX1_2x1_inst_9(.Y(Y[8]), .I0(I0[8]), .I1(I1[8]), .S(S));
MUX1_2x1 MUX1_2x1_inst_10(.Y(Y[9]), .I0(I0[9]), .I1(I1[9]), .S(S));
MUX1_2x1 MUX1_2x1_inst_11(.Y(Y[10]), .I0(I0[10]), .I1(I1[10]), .S(S));
MUX1_2x1 MUX1_2x1_inst_12(.Y(Y[11]), .I0(I0[11]), .I1(I1[11]), .S(S));
MUX1_2x1 MUX1_2x1_inst_13(.Y(Y[12]), .I0(I0[12]), .I1(I1[12]), .S(S));
MUX1_2x1 MUX1_2x1_inst_14(.Y(Y[13]), .I0(I0[13]), .I1(I1[13]), .S(S));
MUX1_2x1 MUX1_2x1_inst_15(.Y(Y[14]), .I0(I0[14]), .I1(I1[14]), .S(S));
MUX1_2x1 MUX1_2x1_inst_16(.Y(Y[15]), .I0(I0[15]), .I1(I1[15]), .S(S));
MUX1_2x1 MUX1_2x1_inst_17(.Y(Y[16]), .I0(I0[16]), .I1(I1[16]), .S(S));
MUX1_2x1 MUX1_2x1_inst_18(.Y(Y[17]), .I0(I0[17]), .I1(I1[17]), .S(S));
MUX1_2x1 MUX1_2x1_inst_19(.Y(Y[18]), .I0(I0[18]), .I1(I1[18]), .S(S));
MUX1_2x1 MUX1_2x1_inst_20(.Y(Y[19]), .I0(I0[19]), .I1(I1[19]), .S(S));
MUX1_2x1 MUX1_2x1_inst_21(.Y(Y[20]), .I0(I0[20]), .I1(I1[20]), .S(S));
MUX1_2x1 MUX1_2x1_inst_22(.Y(Y[21]), .I0(I0[21]), .I1(I1[21]), .S(S));
MUX1_2x1 MUX1_2x1_inst_23(.Y(Y[22]), .I0(I0[22]), .I1(I1[22]), .S(S));
MUX1_2x1 MUX1_2x1_inst_24(.Y(Y[23]), .I0(I0[23]), .I1(I1[23]), .S(S));
MUX1_2x1 MUX1_2x1_inst_25(.Y(Y[24]), .I0(I0[24]), .I1(I1[24]), .S(S));
MUX1_2x1 MUX1_2x1_inst_26(.Y(Y[25]), .I0(I0[25]), .I1(I1[25]), .S(S));
MUX1_2x1 MUX1_2x1_inst_27(.Y(Y[26]), .I0(I0[26]), .I1(I1[26]), .S(S));
MUX1_2x1 MUX1_2x1_inst_28(.Y(Y[27]), .I0(I0[27]), .I1(I1[27]), .S(S));
MUX1_2x1 MUX1_2x1_inst_29(.Y(Y[28]), .I0(I0[28]), .I1(I1[28]), .S(S));
MUX1_2x1 MUX1_2x1_inst_30(.Y(Y[29]), .I0(I0[29]), .I1(I1[29]), .S(S));
MUX1_2x1 MUX1_2x1_inst_31(.Y(Y[30]), .I0(I0[30]), .I1(I1[30]), .S(S));
MUX1_2x1 MUX1_2x1_inst_32(.Y(Y[31]), .I0(I0[31]), .I1(I1[31]), .S(S));
endmodule

// 1-bit mux
module MUX1_2x1(Y,I0, I1, S);
//output list
output Y;
//input list
input I1, I0, S;
// TBD
not inst1(SNot,S);
and inst2(I0wire,I0,SNot);
and inst3(I1wire,I1,S);
or inst4(Y,I0wire,I1wire);

endmodule
