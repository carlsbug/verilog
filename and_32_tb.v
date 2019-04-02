// Name: and_32_tb.v
// Module:  and_32_tb
//
// Notes: Testbench for 32-bit 2x1 Muliplexer
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Nov 24, 2018	Keonwoong Min	keonwoong.min@sjsu.edu
//------------------------------------------------------------------------------------------
//
`timescale 1ns/10ps
module and_32_tb;
reg [31:0] A;
reg [31:0] B;

wire  [31:0]Y;

and_32 and_32_inst_1(.Y(Y), .A(A), .B(B));

initial
begin
A = 32'b11111111111111111111111111111111; B = 32'b10000000000000000000000000000001; //pick B
#5 A=32'b11111111111111000000000101111111; B=32'b10000000000000000000000000000001;
#5 A=32'b001; B=32'b101;
#5 A=32'b010; B=32'b110;
#5 A=32'b000; B=32'b010;
#5 A=32'b110; B=32'b010;
#5 A=32'b001; B=32'b011;
#5 A=32'b011; B=32'b001;

#5 $stop;
end

endmodule
