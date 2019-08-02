`timescale 1ns/10ps
// Name: logic_tb.v
// Module: logic_tb_tb
// Input: S
//        R
//        C  - clock
//        nP - Preset
//        nR - reset
// Output: Q
//         Qbar
//
// Notes: Testbench for project 03 testing 32 bit gate level SR-latch, D-Latch, and D-FF
//	- Preset on nP=0, nR=1, reset on nP=1, nR=0;
//  - Undefined nP=0, nR=0
//  - normal operation nP=1, nR=1
//  - 1 does not effect on the NAND gate such that nP = 1, nR =1 is normal operation
//  - data is held when L = 0;
//  - data is loaded with new value when L = 1;
//
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Dec 2,  2018	Keonwoong Min	keonwoong.min@sjsu.edu Textbench for SR-Latch, D-Latch, D-F/F, 1-bit reg,
//                                                                           32-bit reg, 2x4 Line decoder, 3x8 Line decoder
//                                                                           ,and 4x16 Line decoder
//  1.1     Dec 3,  2018  Keonwoong Min keonwoong.min@sjsu.edu Textbench for 5x32 Line decoder
//------------------------------------------------------------------------------------------
//
module sr_latch_tb;
reg S, R, C;
reg nP, nR;
wire Q,Qbar;
SR_LATCH sr_latch_inst(Q, Qbar, S, R, C, nP, nR);
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
endmodule//sr_latch_tb

module d_latch_tb;
reg D, C;
reg nP, nR;
wire Q, Qbar;
D_LATCH d_latch_inst(Q, Qbar, D, C, nP, nR);
initial
begin
nP = 1; nR = 1; //normal operation
C = 1; D =1; //set
#5 D = 0; //reset
#5 C = 0; //hold
#5 nP = 0; nR = 1; //Preset, change Q to 1;
#5 $stop;
end
endmodule//d_latch_tb

module d_ff_tb;
reg D, C;
reg nP, nR;
wire Q, Qbar;
D_FF d_ff_inst(Q, Qbar, D, C, nP, nR);
initial
begin
C= 1; D = 1; nP = 1; nR = 1; //preset in normal operation
//at 5 C = 0, get Q = 1
#10 D = 0; //reset in normal operation
//at 15 C = 0 , get Q = 0
#10 nP = 0; nR = 1; // at 20 Preset
#10 nP = 1; nR = 0; // at 30 Reset
#10 nP = 1; nR = 1; // at 40 C = 0, D =0, so hold Q = 0
#10 D = 1; // at 50 Normal preset, Q = 1
#10 D = 0; // at 60Normal reset, Q = 0
#10 $stop; // at 70
end
always
begin
#5 C <= ~C; //C = 1 at every 10 ns
end
endmodule //d_ff_tb

module reg1_tb;
reg D, C, L;
reg nP, nR;
wire Q, Qbar;
REG1 reg1_inst(Q, Qbar, D, L, C, nP, nR);
initial
begin
L = 1; C= 1; D = 1; nP = 1; nR = 1; //preset in normal operation
// at 5ns when C is negedge, Q =1 and Q' = 0;
#10 D = 0; L = 0;
// at 15ns when C is negedge, Q is still 1 and Q' = 0 still, because L = 0
#10 D = 0; L = 1; // at 20ns
// at 25ns, C is negedge, and L =1. It takes the new Data 0, so Q = 0, Q'=1
#10 D = 1; L = 1;  // at 30ns
// at 35ns, C is negedge and L = 1. It loads new data, 1. So Q = 1, Q'= 0 now
#10 L = 0; // at 40ns
// at 45ns, when C is negedge, It holds the previous data since L = 0;. So Q = 1, Q' = 0 sill.
#10 $stop; // at 50ns
end
always
begin
#5 C <= ~C; //C = 1 at every 10 ns
end
endmodule// reg1_tb

module reg32_tb;
wire [31:0] Q;
reg CLK, LOAD;
reg [31:0] D;
reg RESET;
REG32 reg32_inst(Q, D, LOAD, CLK, RESET);
initial
begin
LOAD = 1; CLK = 1; D = 32'b11; RESET = 1; // at 0ns, Bring the new data!
// at 5ns, Q = 32'b11 at the negedge of CLK
#10 D = 32'b10; LOAD = 0; // at 10ns, keep the previous value, LOAD = 0;
// at 15ns, Q = 32'b11 still at the negedge of CLK
#10 D = 32'b10; LOAD = 1; // at 20ns
// at 25ns, Q = 32'b10; Bring the new data, LOAD = 1; at the negedge of CLK
#10 D = 32'b11; LOAD = 1;  // at 30ns, new data comes in, LOAD = 1;
// at 35ns, Q is updated at the negege of CLK.  Output Q is now 32'b11.
#10 LOAD = 0; // at 40ns, keep the previous value
// at 45ns, Since LOAD is 0, Q is still 32'b11.
#10 RESET = 0; // at 50ns, Reset is operated, Q is now 32'b0
// at 55ns
#10 $stop; // at 60ns
end
always
begin
#5 CLK <= ~CLK; //CLK = 1 at every 10 ns
end
endmodule// reg32_tb

module decoder_2x4_tb;
wire [3:0] D;
reg [1:0] I;
DECODER_2x4 decoder_2x4_inst(D,I);
initial
begin
I = 2'b0;
#5 I = 2'b01;
#5 I = 2'b10;
#5 I = 2'b11;
#5 $stop;
end
endmodule//decoder_2x4_tb

module decoder_3x8_tb;
wire [7:0] D;
reg [2:0] I;
DECODER_3x8 decoder_3x8_inst(D,I);
initial
begin
I = 3'b000;
#5 I = 3'b001;
#5 I = 3'b010;
#5 I = 3'b011;
#5 I = 3'b100;
#5 I = 3'b101;
#5 I = 3'b110;
#5 I = 3'b111;
#5 $stop;
end
endmodule//decoder_3x8_tb

module decoder_4x16_tb;
wire [15:0] D;
reg [3:0] I;
DECODER_4x16 decoder_4x16_inst(D,I);
initial
begin
I = 4'b0000;
#5 I = 4'b0001;
#5 I = 4'b0010;
#5 I = 4'b0011;
#5 I = 4'b0100;
#5 I = 4'b0101;
#5 I = 4'b0110;
#5 I = 4'b0111;
#5 I = 4'b1000;
#5 I = 4'b1001;
#5 I = 4'b1010;
#5 I = 4'b1011;
#5 I = 4'b1100;
#5 I = 4'b1101;
#5 I = 4'b1110;
#5 I = 4'b1111;
#5 $stop;
end
endmodule//decoder_4x16_tb

module decoder_5x32_tb;
wire [31:0] D;
reg [4:0] I;
DECODER_5x32 decoder_5x32_inst(D,I);
initial
begin
I = 5'b00000;
#5 I = 5'b00001;
#5 I = 5'b00010;
#5 I = 5'b00011;
#5 I = 5'b00100;
#5 I = 5'b00101;
#5 I = 5'b00110;
#5 I = 5'b00111;
#5 I = 5'b01000;
#5 I = 5'b01001;
#5 I = 5'b01010;
#5 I = 5'b01011;
#5 I = 5'b01100;
#5 I = 5'b01101;
#5 I = 5'b01110;
#5 I = 5'b01111;
#5 I = 5'b10000;
#5 I = 5'b10001;
#5 I = 5'b10010;
#5 I = 5'b10011;
#5 I = 5'b10100;
#5 I = 5'b10101;
#5 I = 5'b10110;
#5 I = 5'b10111;
#5 I = 5'b11000;
#5 I = 5'b11001;
#5 I = 5'b11010;
#5 I = 5'b11011;
#5 I = 5'b11100;
#5 I = 5'b11101;
#5 I = 5'b11110;
#5 I = 5'b11111;
#5 $stop;
end
endmodule//decoder_5x32_tb
