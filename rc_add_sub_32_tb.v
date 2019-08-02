
// Name: rc_add_sub_32_tb.v
// Module:  rc_add_sub_32_tb
//
// Notes: Testbench for 32-bit Ripple Carry Adder and Subtractor
//        SnA 0 is addition and 1 is subtraction
//        Adds two inputs which occurs Carry out in this testbench
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Nov 17, 2018	Keonwoong Min	keonwoong.min@sjsu.edu
//------------------------------------------------------------------------------------------
//
`timescale 1ns/10ps
module rc_add_sub_32_tb;
reg [31:0] A;
reg [31:0] B;
reg [0:0] SnA; // 0 is add, 1 is sub

wire [31:0] Y;
wire [0:0] Cout;

rc_add_sub_32 rc_inst_1(.Y(Y), .Cout(Cout), .A(A), .B(B), .SnA(SnA));

initial
begin

A = 32'b11111111111111111111111111111111; B = 32'b10000000000000000000000000000001; SnA = 1'b0;

#5 $stop;
end

endmodule
