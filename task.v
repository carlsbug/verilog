
//-----------------------------------------------------------------------------
// TASK: task
//
// PARAMETERS:
//     INOUT: total_test ; total test counter
//     INOUT: pass_test ; pass test counter
//     INPUT: test_status ; status of the current test 1 or 0
//
// NOTES: Keeps track of number of test and pass cases.
//
//-----------------------------------------------------------------------------
`include "prj_definition.v"
module print_instuction();
task print_instruction;
input [`DATA_INDEX_LIMIT:0] inst;
reg [5:0] opcode;
reg [4:0] rs;
reg [4:0] rt;
reg [4:0] rd;
reg [4:0] shamt;
reg [5:0] funct;
reg [15:0] immediate;
reg [25:0] address;

begin
// parse the instruction
// R-type
{opcode, rs, rt, rd, shamt, funct} = inst;
// I-type
{opcode, rs, rt, immediate} = inst;
// J-type
{opcode, address} = inst;
$write("@ %6dns -> [0X%08h] ", $time, inst);

case(opcode)
// R-Type , opcode 6'h00
6'h00 : begin
    case(funct)
    6'h20: $write("add  r[%02d], r[%02d], r[%02d];", rs, rt, rd);
    6'h22: $write("sub  r[%02d], r[%02d], r[%02d];", rs, rt, rd);
    6'h2c: $write("mul  r[%02d], r[%02d], r[%02d];", rs, rt, rd);
    6'h24: $write("and  r[%02d], r[%02d], r[%02d];", rs, rt, rd);
    6'h25: $write("or   r[%02d], r[%02d], r[%02d];", rs, rt, rd);
    6'h27: $write("nor  r[%02d], r[%02d], r[%02d];", rs, rt, rd);
    6'h2a: $write("slt  r[%02d], r[%02d], r[%02d];", rs, rt, rd);
    6'h01: $write("sll  r[%02d], %2d, r[%02d];", rs, shamt, rd);
    6'h02: $write("srl  r[%02d], 0X%02h, r[%02d];", rs, shamt, rd);
    6'h08: $write("jr   r[%02d];", rs);
    default: $write("");
    endcase
end
// I-type
  //case(immediate)

 //if(opcode === 6'h08)// SignExtImm
6'h08 :
        //R[rt] = R[rs] + SignExtImm

        $write("addi  r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);

6'h1d : $write("muli  r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h0c : $write("andi  r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h0d : $write("ori   r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h0f : $write("lui   r[%02d], 0X%04h;", rt, immediate);
6'h0a : $write("slti  r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h04 : $write("beq   r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h05 : $write("bne   r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h23 : $write("lw    r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
6'h2b : $write("sw    r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);

// J-Type
//address = {16{Imm[15]}, immediate }
6'h02 : $write("jmp  0X%07h;", address);
6'h03 : $write("jal  0X%07h;", address);
6'h1b : $write("push;");
6'h1c : $write("pop;");
default: $write("");

endcase
$write("\n");
end

endtask
endmodule
