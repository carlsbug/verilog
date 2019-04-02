// Name: alu.v
// Module: ALU
// Input: OP1[32] - operand 1
//        OP2[32] - operand 2
//        OPRN[6] - operation code
// Output: OUT[32] - output result for the operation
//
// Notes: 32 bit combinatorial ALU
//
// Supports the following functions
//	- Integer add (0x1), sub(0x2), mul(0x3)
//	- Integer shift_rigth (0x4), shift_left (0x5)
//	- Bitwise and (0x6), or (0x7), nor (0x8)
//  - set less than (0x9)
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//  2.0     Dec  1, 2018  Keonwoong Min keonwoong.min@sjsu.edu  Implemented ALU
//  2.1     Dec  5, 2018  Keonwoong Min keonwoong.min@sjsu.edu  Added Zero port
//------------------------------------------------------------------------------------------
//
`include "prj_definition.v"
module ALU(OUT, ZERO, OP1, OP2, OPRN);
// input list
input [`DATA_INDEX_LIMIT:0] OP1; // operand 1
input [`DATA_INDEX_LIMIT:0] OP2; // operand 2
input [3:0] OPRN; // operation code

// output list
output [`DATA_INDEX_LIMIT:0] OUT; // result of the operation.
output ZERO;

// TBD
wire [31:0] i3;
wire [31:0] shiftOut;
wire [0:0] addsubOutput31;
wire [30:0] addsubOutput;
wire [31:0] andout32;
wire [31:0] norout32;
wire [31:0] orout32;

MULT32 mult_inst(.HI(), .LO(i3), .A(OP1), .B(OP2));
SHIFT32 shift_inst(.Y(shiftOut),.D(OP1),.S(OP2), .LnR(OPRN[0]));
RC_ADD_SUB_32 rc_add_sub_inst(.Y({{addsubOutput31}, {addsubOutput}}), .CO(), .A(OP1), .B(OP2), .SnA(orOut));
and inst1(andOut, OPRN[0],OPRN[3]);
not inst3(notout, OPRN[0]);
or inst2(orOut,andOut,notout);

NOR32 nor_inst(.Y(norout32),.A(OP1),.B(OP2));
AND32 and_inst(.Y(andout32),.A(OP1),.B(OP2));
OR32 or_inst(.Y(orout32),.A(OP1),.B(OP2));


MUX32_16x1 mux16x1_inst(.Y(OUT), .I0(), .I1({{addsubOutput31}, {addsubOutput}}), .I2({{addsubOutput31}, {addsubOutput}}), .I3(i3), .I4(shiftOut), .I5(shiftOut), .I6(andout32), .I7(orout32),
                     .I8(norout32), .I9({{31{1'b0}},{addsubOutput31}}), .I10(), .I11(), .I12(), .I13(), .I14(), .I15(), .S(OPRN[3:0]));
nor nor_inst_2(ZERO, OUT[0], OUT[1], OUT[2], OUT[3], OUT[4], OUT[5], OUT[6], OUT[7], OUT[8], OUT[09], OUT[10], OUT[11],
                OUT[12] ,OUT[13], OUT[14], OUT[15], OUT[16], OUT[17], OUT[18], OUT[19], OUT[20], OUT[21],
                OUT[22], OUT[23], OUT[24], OUT[25], OUT[26], OUT[27], OUT[28], OUT[29], OUT[30], OUT[31]);


endmodule
