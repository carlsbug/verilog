`timescale 1ns/10ps
// Name: sr_latch_tb.v
// Module: sr_latch_tb
// Input: S
//        R
//        C  - clock
//        nP - Preset
//        nR - reset
// Output: Q
//         Qbar
//
// Notes: Testbench for project 03 testing 32 bit gate level ALU
//	- Preset on nP=0, nR=1, reset on nP=1, nR=0;
//  - Undefined nP=0, nR=0
//  - normal operation nP=1, nR=1
//  - 1 does not effect on the NAND gate such that nP = 1, nR =1 is normal operation
//
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Dec 2,  2018	Keonwoong Min	keonwoong.min@sjsu.edu Textbench for ALU
//------------------------------------------------------------------------------------------
//
module sr_latch_tb;
reg S, R, C;
reg nP, nR;
wire Q,Qbar;

SR_LATCH sr_latch_inst(Q,Qbar, S, R, C, nP, nR);

initial
begin
nP = 1; nR =1; // Normal operation
C = 1; S = 1; R = 0; // set Q =1 Qbar = 0
#5 S= 0; R = 0; // hold Q was 1, so Q =1, Qbar = 0
#5 S = 0; R = 1; // reset Q =0 Qbar = 1
#5 S= 0; R = 0; // hold Q was 0, so Q =0, Qbar = 0

#5 S = 0; R = 1; // reset Q =0 Qbar = 1, latch time
// after reset, use preset then it got a problem... Q and Qbar have same value
#5 nP=0; nR=1; // Preset operation makes Q = 1, such that now Q = 1 and Qbar is also 1
#5 nP=1; nR=0; // Reset operation Q = 0,
#5 nP=0; nR=0; // Undefined operation

#5 $stop;
end
endmodule
