// Name: full_adder.v
// Module: FULL_ADDER
//
// Output: S : Sum
//         CO : Carry Out
//
// Input: A : Bit 1
//        B : Bit 2
//        CI : Carry In
//
// Notes: 1-bit full adder implementaiton.
//
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//  2.0     Nov 14, 2018	Keonwoong Min	keonwoong.min@sjsu.edu
//------------------------------------------------------------------------------------------
`include "prj_definition.v"

module FULL_ADDER(S,CO,A,B, CI);
output S,CO;
input A,B, CI;

//TBD
wire Yinst1;
wire Cinst1;
wire Cinst2;

or inst1(CO,Cinst2,Cinst1);
HALF_ADDER ha_inst_1(.Y(Yinst1), .C(Cinst1), .A(A), .B(B));
HALF_ADDER ha_inst_2(.Y(S), .C(Cinst2), .A(Yinst1), .B(CI));

endmodule;
