// Name: half_adder_tb.v
// Module:  half_adder_tb
//
// Notes: Testbench for Half adder
//        When A and B both are 0, Y =0 and C = 0
//             A is 0 and B is 1, then Y = 1 and C = 0
//             A is 1 and B is 0, then Y = 1 and C = 0
//             A and B are both 1, then Y = 0 and C = 1
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Nov 18, 2018	Keonwoong Min	keonwoong.min@sjsu.edu Implemented testbench for half adder
//------------------------------------------------------------------------------------------
//
`timescale 1ns/10ps
module full_adder_tb;
reg A,B;
reg CI;
wire Y,CO;

full_adder fa_inst_1(.Y(Y), .CO(CO), .A(A), .B(B), .CI(CI));

initial
begin
A= 0; B=0; CI = 0;
#5 A= 0; B=0; CI = 1;
#5 A= 0; B=1; CI = 0;
#5 A= 0; B=1; CI = 1;
#5 A= 1; B=0; CI = 0;
#5 A= 1; B=0; CI = 1;
#5 A= 1; B=1; CI = 0;
#5 A= 1; B=1; CI = 1;

#5 $stop;
end

endmodule
