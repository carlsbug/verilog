// Name: register_file.v
// Module: REGISTER_FILE_32x32
// Input:  DATA_W : Data to be written at address ADDR_W
//         ADDR_W : Address of the memory location to be written
//         ADDR_R1 : Address of the memory location to be read for DATA_R1
//         ADDR_R2 : Address of the memory location to be read for DATA_R2
//         READ    : Read signal
//         WRITE   : Write signal
//         CLK     : Clock signal
//         RST     : Reset signal
// Output: DATA_R1 : Data at ADDR_R1 address
//         DATA_R2 : Data at ADDR_R1 address
//
// Notes: - 32 bit word accessible dual read register file having 32 regsisters.
//        - Reset is done at -ve edge of the RST signal
//        - Rest of the operation is done at the +ve edge of the CLK signal
//        - Read operation is done if READ=1 and WRITE=0
//        - Write operation is done if WRITE=1 and READ=0
//        - X is the value at DATA_R* if both READ and WRITE are 0 or 1
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//  2.0     Dec 4,  2018  Keonwoong Min keonwoong.min@sjsu.edu Implemented 32 bit word register file in gate level
//------------------------------------------------------------------------------------------
//
`include "prj_definition.v"
module REGISTER_FILE_32x32(R1_DATA, R2_DATA, R1_ADDR, R2_ADDR,
                            W_DATA, W_ADDR, READ, WRITE, CLK, RST);
input [31:0] W_DATA;
input CLK, RST, WRITE, READ; // change to 1 bit read
input [4:0] W_ADDR;
input [4:0] R1_ADDR;
input [4:0] R2_ADDR;
output [31:0] R1_DATA;
output [31:0] R2_DATA;

wire [31:0] mux1_r1_addr;
wire [31:0] mux2_r2_addr;

wire d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,
     d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31;


wire [31:0]q0;
wire [31:0]q1;
wire [31:0]q2;
wire [31:0]q3;
wire [31:0]q4;
wire [31:0]q5;
wire [31:0]q6;
wire [31:0]q7;
wire [31:0]q8;
wire [31:0]q9;
wire [31:0]q10;
wire [31:0]q11;
wire [31:0]q12;
wire [31:0]q13;
wire [31:0]q14;
wire [31:0]q15;
wire [31:0]q16;
wire [31:0]q17;
wire [31:0]q18;
wire [31:0]q19;
wire [31:0]q20;
wire [31:0]q21;
wire [31:0]q22;
wire [31:0]q23;
wire [31:0]q24;
wire [31:0]q25;
wire [31:0]q26;
wire [31:0]q27;
wire [31:0]q28;
wire [31:0]q29;
wire [31:0]q30;
wire [31:0]q31;

DECODER_5x32 decoder_5x32_inst(.D({d31,d30,d29,d28,d27,d26,d25,d24,d23,d22,d21,d20,d19,d18,d17,d16,
                               d15,d14,d13,d12,d11,d10,d9,d8,d7,d6,d5,d4,d3,d2,d1,d0}), .I(W_ADDR));
and inst1(load1,d0,WRITE);
and inst2(load2,d1,WRITE);
and inst3(load3,d2,WRITE);
and inst4(load4,d3,WRITE);
and inst5(load5,d4,WRITE);
and inst6(load6,d5,WRITE);
and inst7(load7,d6,WRITE);
and inst8(load8,d7,WRITE);
and inst9(load9,d8,WRITE);
and inst10(load10,d9,WRITE);
and inst11(load11,d10,WRITE);
and inst12(load12,d11,WRITE);
and inst13(load13,d12,WRITE);
and inst14(load14,d13,WRITE);
and inst15(load15,d14,WRITE);
and inst16(load16,d15,WRITE);
and inst17(load17,d16,WRITE);
and inst18(load18,d17,WRITE);
and inst19(load19,d18,WRITE);
and inst20(load20,d19,WRITE);
and inst21(load21,d20,WRITE);
and inst22(load22,d21,WRITE);
and inst23(load23,d22,WRITE);
and inst24(load24,d23,WRITE);
and inst25(load25,d24,WRITE);
and inst26(load26,d25,WRITE);
and inst27(load27,d26,WRITE);
and inst28(load28,d27,WRITE);
and inst29(load29,d28,WRITE);
and inst30(load30,d29,WRITE);
and inst31(load31,d30,WRITE);
and inst32(load32,d31,WRITE);

REG32 reg32_inst_1(.Q(q0), .D(W_DATA), .LOAD(load1), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_2(.Q(q1), .D(W_DATA), .LOAD(load2), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_3(.Q(q2), .D(W_DATA), .LOAD(load3), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_4(.Q(q3), .D(W_DATA), .LOAD(load4), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_5(.Q(q4), .D(W_DATA), .LOAD(load5), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_6(.Q(q5), .D(W_DATA), .LOAD(load6), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_7(.Q(q6), .D(W_DATA), .LOAD(load7), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_8(.Q(q7), .D(W_DATA), .LOAD(load8), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_9(.Q(q8), .D(W_DATA), .LOAD(load9), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_10(.Q(q9), .D(W_DATA), .LOAD(load10), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_11(.Q(q10), .D(W_DATA), .LOAD(load11), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_12(.Q(q11), .D(W_DATA), .LOAD(load12), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_13(.Q(q12), .D(W_DATA), .LOAD(load13), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_14(.Q(q13), .D(W_DATA), .LOAD(load14), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_15(.Q(q14), .D(W_DATA), .LOAD(load15), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_16(.Q(q15), .D(W_DATA), .LOAD(load16), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_17(.Q(q16), .D(W_DATA), .LOAD(load17), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_18(.Q(q17), .D(W_DATA), .LOAD(load18), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_19(.Q(q18), .D(W_DATA), .LOAD(load19), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_20(.Q(q19), .D(W_DATA), .LOAD(load20), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_21(.Q(q20), .D(W_DATA), .LOAD(load21), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_22(.Q(q21), .D(W_DATA), .LOAD(load22), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_23(.Q(q22), .D(W_DATA), .LOAD(load23), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_24(.Q(q23), .D(W_DATA), .LOAD(load24), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_25(.Q(q24), .D(W_DATA), .LOAD(load25), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_26(.Q(q25), .D(W_DATA), .LOAD(load26), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_27(.Q(q26), .D(W_DATA), .LOAD(load27), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_28(.Q(q27), .D(W_DATA), .LOAD(load28), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_29(.Q(q28), .D(W_DATA), .LOAD(load29), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_30(.Q(q29), .D(W_DATA), .LOAD(load30), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_31(.Q(q30), .D(W_DATA), .LOAD(load31), .CLK(CLK), .RESET(RST));
REG32 reg32_inst_32(.Q(q31), .D(W_DATA), .LOAD(load32), .CLK(CLK), .RESET(RST));

MUX32_32x1 mux32_32x1_inst1(.Y(mux1_r1_addr), .I0(q0), .I1(q1), .I2(q2), .I3(q3), .I4(q4), .I5(q5), .I6(q6), .I7(q7),
                            .I8(q8), .I9(q9), .I10(q10), .I11(q11), .I12(q12), .I13(q13), .I14(q14), .I15(q15),
                            .I16(q16), .I17(q17), .I18(q18), .I19(q19), .I20(q20), .I21(q21), .I22(q22), .I23(q23),
                            .I24(q24), .I25(q25), .I26(q26), .I27(q27), .I28(q28), .I29(q29), .I30(q30), .I31(q31), .S(R1_ADDR));
MUX32_32x1 mux32_32x1_inst2(.Y(mux2_r2_addr), .I0(q0), .I1(q1), .I2(q2), .I3(q3), .I4(q4), .I5(q5), .I6(q6), .I7(q7),
                            .I8(q8), .I9(q9), .I10(q10), .I11(q11), .I12(q12), .I13(q13), .I14(q14), .I15(q15),
                            .I16(q16), .I17(q17), .I18(q18), .I19(q19), .I20(q20), .I21(q21), .I22(q22), .I23(q23),
                            .I24(q24), .I25(q25), .I26(q26), .I27(q27), .I28(q28), .I29(q29), .I30(q30), .I31(q31), .S(R2_ADDR));

MUX32_2x1 mux32_2x1_inst1(.Y(R1_DATA), .I0(32'hz), .I1(mux1_r1_addr), .S(READ));
MUX32_2x1 mux32_2x1_inst2(.Y(R2_DATA), .I0(32'hz), .I1(mux2_r2_addr), .S(READ));

endmodule
