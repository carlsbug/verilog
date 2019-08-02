// Name: half_adder_tb.v
// Module:  half_adder_tb
//
// Notes: Testbench for Half adder
//        When A and B both are 0, Y =0 and C = 0
//             A is 0 and B is 1, then Y = 1 and C = 0
//             A is 1 and B is 0, then Y = 1 and C = 0
//             A and B are both 1, then Y = 0 and C = 1
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Nov 14, 2018	Keonwoong Min	keonwoong.min@sjsu.edu
//------------------------------------------------------------------------------------------
//
`timescale 1ns/10ps
module half_adder_tb;
//reg A and B to give data to half_adder input ports
reg A,B;
// wire Y and C are the wire from the output port in half_adder, so when you read Y and C, you get outputs
wire Y,C;

half_adder ha_inst_1(.Y(Y), .C(C), .A(A), .B(B));

initial
begin
A= 0; B=0;
#5 A=1; B=0;
#5 A=0; B=1;
#5 A=1; B=1;
#5 $stop;
end
endmodule
