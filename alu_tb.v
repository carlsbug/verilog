`timescale 1ns/10ps
// Name: alu_tb.v
// Module: alu_tb
// Input: A[32] - operand 1
//        B[32] - operand 2
//        OPRN[32] - operation code
// Output: Y[32] - output result for the operation
//
// Notes: Testbench for project 03 testing 32 bit gate level ALU
//
// Supports the following functions
//	- Integer add (0x0001), sub(0x0010), mul(0x0011)
//	- Integer shift_rigth (0x0100), shift_left (0x0101)
//	- Bitwise and (0x0110), or (0x0111), nor (0x1000)
//      - set less than (0x1001)
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Dec 2,  2018	Keonwoong Min	keonwoong.min@sjsu.edu Textbench for ALU
//------------------------------------------------------------------------------------------
//
`include "prj_definition.v"
module alu_tb;
wire [31:0] Y;
wire ZERO;
reg [31:0] A;
reg [31:0] B;
reg [3:0] OPRN;

ALU alu_inst_1(.OUT(Y), .ZERO(ZERO), .OP1(A), .OP2(B), .OPRN(OPRN));

initial
begin
A= 32'b1001; B=32'b1000; OPRN = 4'b0001;  //add
#5 OPRN = 4'b0010;  //sub
#5 OPRN = 4'b0011;  //mult
#5 OPRN = 4'b0100;  //sr shit 8 bits
#5 A= 32'b1001; B=32'b0001; //sr shift 1bit
#5 A= 32'b1001; B=32'b1000; OPRN = 4'b0101;  //sl shit 8 bits
#5 A= 32'b1001; B=32'b0001; //sl shift 1bit
#5 A= 32'b1001; B=32'b1000; OPRN = 4'b0110;  //and
#5 OPRN = 4'b0111;  //or
#5 OPRN = 4'b1000;  //nor
#5 OPRN = 4'b1001;  //slt when A > B, Y = 0
#5 A= 32'b1000; B=32'b1001; OPRN = 4'b1001; //slt when A < B, Y = 1
#5 $stop;
end
endmodule
