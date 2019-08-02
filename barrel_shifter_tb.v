// Name: barrel_shifter_tb.v
// Module:  barrel_shifter_tb
//
// Notes: Testbench for 32-bit barrel shifter
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Nov 30, 2018	Keonwoong Min	keonwoong.min@sjsu.edu Testbench for the 32-bit barrel shifter
//------------------------------------------------------------------------------------------
//
`timescale 1ns/10ps
module barrel_shifter_tb;
wire [31:0] Y;
reg [31:0] D;
reg [31:0] S;
reg LnR;

SHIFT32 sh_inst_1(.Y(Y),.D(D),.S(S), .LnR(LnR));
initial
begin
D = 32'b11111111111111111111111111111111; LnR=1'b0; S = 32'b11111;
#5 D = 32'b11111111111111111111111111111111; LnR=1'b1; S = 32'b11111;
#5 $stop;
end
endmodule
