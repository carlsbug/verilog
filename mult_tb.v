// Name: mult_tb.v
// Module: mult_tb
//
// Output: HI: 32 higher bits
//         LO: 32 lower bits
//
// Input: A : 32-bit input (MCND)
//        B : 32-bit input (MPLR)
//
// Notes: Testbench for 32-bit multiplier
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.1     Nov 27, 2018	Keonwoong Min	keonwoong.min@sjsu.edu Textbench for 32-bit multiplier
//------------------------------------------------------------------------------------------
//
`timescale 1ns/10ps
module mult_tb;
reg [31:0] A;
reg [31:0] B;
wire [31:0]HI;
wire [31:0]LO;

MULT32 mult32_inst_1(.HI(HI), .LO(LO), .A(A),.B(B));
initial
begin
A= 32'b1001; B=32'b1000;
#5 $stop;
end

endmodule
