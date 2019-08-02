// Name: data_path.v
// Module: DATA_PATH
// Output:  DATA : Data to be written at address ADDR
//          ADDR : Address of the memory location to be accessed
//
// Input:   DATA : Data read out in the read operation
//          CLK  : Clock signal
//          RST  : Reset signal
//
// Notes: - 32 bit processor implementing cs147sec05 instruction set
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//------------------------------------------------------------------------------------------
//
`include "prj_definition.v"
module DATA_PATH(DATA_OUT, ADDR, ZERO, INSTRUCTION, DATA_IN, CTRL, CLK, RST);

// output list
output [`ADDRESS_INDEX_LIMIT:0] ADDR; //25
output ZERO;
output [`DATA_INDEX_LIMIT:0] DATA_OUT, INSTRUCTION; //31

// input list
input [`CTRL_WIDTH_INDEX_LIMIT:0]  CTRL; //31
input CLK, RST;
input [`DATA_INDEX_LIMIT:0] DATA_IN; //31

// TBD
wire [31:0] WdSel1MuxOutputWire;
wire [31:0] aluOutputWire;
wire [31:0] WdSel2MuxOutputWire;
wire [31:0] pcOutputWire;
wire [31:0] adder1Out;
wire [31:0] WdSel3MuxOutputWire;
wire [31:0] pcSelMux1OutputWire;
wire [31:0] adder2Out;
wire [31:0] pcSelMux2OutputWire;
wire [31:0] op2Sel4OutputWire;
wire [31:0] R1DataOutputWire;
wire [31:0] R2DataOutputWire;
wire [31:0] r1Sel1OutputWire;
wire [31:0] waSel3OutputWire;
wire [31:0] pcSelMux3OutputWire;
wire [31:0] op2Sel3OutputWire;
wire [31:0] op1Sel1OutputWire;
wire [31:0] spOutputWire;
wire [31:0] maSel1OutputWire;
wire [31:0] waSel1OutputWire;
wire [31:0] waSel2OutputWire;
wire [31:0] op2Sel1OutputWire;
wire [31:0] op2Sel2OutputWire;


REG32 instruction_reg(.Q(INSTRUCTION), .D(DATA_IN), .LOAD(CTRL[4]), .CLK(CLK), .RESET(RST));
MUX32_2x1 wd_sel_1_mux(.Y(WdSel1MuxOutputWire), .I0(aluOutputWire), .I1(DATA_IN), .S(CTRL[13]));
MUX32_2x1 wd_sel_2_mux(.Y(WdSel2MuxOutputWire), .I0(WdSel1MuxOutputWire), .I1({{INSTRUCTION[15:0]},{16'b0}}), .S(CTRL[14]));
RC_ADD_SUB_32 adder1(.Y(adder1Out), .CO(), .A(32'b1), .B(pcOutputWire), .SnA(1'b0)); //adder

MUX32_2x1 wd_sel_3_mux(.Y(WdSel3MuxOutputWire), .I0(adder1Out), .I1(WdSel2MuxOutputWire), .S(CTRL[15]));

RC_ADD_SUB_32 adder2(.Y(adder2Out), .CO(), .A(adder1Out), .B({{{INSTRUCTION[15:0]}},{INSTRUCTION[15:0]}}), .SnA(1'b0)); //adder
REGISTER_FILE_32x32 rf_inst(.R1_DATA(R1DataOutputWire), .R2_DATA(R2DataOutputWire), .R1_ADDR(r1Sel1OutputWire[4:0]), .R2_ADDR(INSTRUCTION[20:16]),
                            .W_DATA(WdSel3MuxOutputWire), .W_ADDR(waSel3OutputWire[4:0]), .READ(CTRL[8]), .WRITE(CTRL[9]), .CLK(CLK), .RST(RST));

MUX32_2x1 pc_sel_1_mux(.Y(pcSelMux1OutputWire), .I0(R1DataOutputWire), .I1(adder1Out), .S(CTRL[1]));
MUX32_2x1 pc_sel_2_mux(.Y(pcSelMux2OutputWire), .I0(pcSelMux1OutputWire), .I1(adder2Out), .S(CTRL[2]));
MUX32_2x1 pc_sel_3_mux(.Y(pcSelMux3OutputWire), .I0({{6'b0},{INSTRUCTION[25:0]}}), .I1(pcSelMux2OutputWire), .S(CTRL[3]));

MUX32_2x1 op2_sel_4_mux(.Y(op2Sel4OutputWire), .I0(op2Sel3OutputWire), .I1(R2DataOutputWire), .S(CTRL[21]));
ALU alu_inst(.OUT(aluOutputWire), .ZERO(ZERO), .OP1(op1Sel1OutputWire), .OP2(op2Sel4OutputWire), .OPRN(CTRL[25:22]));
MUX32_2x1 op1_sel_1_mux(.Y(op1Sel1OutputWire), .I0(R1DataOutputWire), .I1(spOutputWire), .S(CTRL[17]));

MUX32_2x1 md_sel_1_mux(.Y(DATA_OUT), .I0(R2DataOutputWire), .I1(R1DataOutputWire), .S(CTRL[28]));
MUX32_2x1 ma_sel_1_mux(.Y(maSel1OutputWire), .I0(aluOutputWire), .I1(spOutputWire), .S(CTRL[26]));
MUX32_2x1 ma_sel_2_mux(.Y(ADDR), .I0(maSel1OutputWire), .I1(pcOutputWire), .S(CTRL[27]));

REG32 pc_reg(.Q(pcOutputWire), .D(pcSelMux3OutputWire), .LOAD(CTRL[0]), .CLK(CLK), .RESET(RST));

MUX32_2x1 r1_sel_1_mux(.Y(r1Sel1OutputWire), .I0(32'b0), .I1({{27{1'b0}} ,{INSTRUCTION[25:21]}}), .S(CTRL[7]));
MUX32_2x1 wa_sel_1_mux(.Y(waSel1OutputWire), .I0({{27{1'b0}},{INSTRUCTION[15:11]}}), .I1({{27{1'b0}},{INSTRUCTION[20:16]}}), .S(CTRL[10]));
MUX32_2x1 wa_sel_2_mux(.Y(waSel2OutputWire), .I0(32'b0), .I1(32'b11111), .S(CTRL[11]));
MUX32_2x1 wa_sel_3_mux(.Y(waSel3OutputWire), .I0(waSel2OutputWire), .I1(waSel1OutputWire), .S(CTRL[12]));
//32b'11111 = 31(d) or 1F(hex)

MUX32_2x1 op2_sel_1_mux(.Y(op2Sel1OutputWire), .I0(32'b1), .I1({{27'b0},{INSTRUCTION[10:6]}}), .S(CTRL[18])); //27-bit zero Extnder
MUX32_2x1 op2_sel_2_mux(.Y(op2Sel2OutputWire), .I0({{16'b0},{INSTRUCTION[15:0]}}), .I1({{16{INSTRUCTION[15]}},{INSTRUCTION[15:0]}}), .S(CTRL[19]));
MUX32_2x1 op2_sel_3_mux(.Y(op2Sel3OutputWire), .I0(op2Sel2OutputWire), .I1(op2Sel1OutputWire), .S(CTRL[20]));

REG32 sp_reg(.Q(spOutputWire), .D(aluOutputWire), .LOAD(CTRL[16]), .CLK(CLK), .RESET(RST));


endmodule
