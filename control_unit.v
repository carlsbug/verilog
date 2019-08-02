// Name: control_unit.v
// Module: CONTROL_UNIT
// Output: RF_DATA_W  : Data to be written at register file address RF_ADDR_W
//         RF_ADDR_W  : Register file address of the memory location to be written
//         RF_ADDR_R1 : Register file address of the memory location to be read for RF_DATA_R1
//         RF_ADDR_R2 : Registere file address of the memory location to be read for RF_DATA_R2
//         RF_READ    : Register file Read signal
//         RF_WRITE   : Register file Write signal
//         ALU_OP1    : ALU operand 1
//         ALU_OP2    : ALU operand 2
//         ALU_OPRN   : ALU operation code
//         MEM_ADDR   : Memory address to be read in
//         MEM_READ   : Memory read signal
//         MEM_WRITE  : Memory write signal
//
// Input:  RF_DATA_R1 : Data at ADDR_R1 address
//         RF_DATA_R2 : Data at ADDR_R1 address
//         ALU_RESULT    : ALU output data
//         CLK        : Clock signal
//         RST        : Reset signal
//
// INOUT: MEM_DATA    : Data to be read in from or write to the memory
//
// Notes: - Control unit synchronize operations of a processor
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		      Initial creation
//  1.1     Oct 19, 2014  Kaushik Patra kpatra@sjsu.edu         Added ZERO status output
//  1.3     Oct 29, 2018  Keonwoong Min keonwoong.min@sjsu.edu
//  2.0     Dec 05, 2018  Keonwoong Min keonwoong.min@sjsu.edu  Implemented with the control word in hex
//------------------------------------------------------------------------------------------
`include "prj_definition.v"
module CONTROL_UNIT(CTRL,READ,WRITE,INSTRUCTION,CLK,RST,ZERO);
output [31:0] CTRL;
output READ, WRITE;
input CLK,RST,ZERO;
input [31:0] INSTRUCTION;
reg [31:0] CTRL;
reg READ,WRITE;

reg [5:0] opcode;
reg [4:0] rs;
reg [4:0] rt;
reg [4:0] rd;
reg [4:0] shamt;
reg [5:0] funct;
reg [15:0] immediate;
reg [25:0] address;

wire [2:0] proc_state;

PROC_SM state_machine(.STATE(proc_state), .CLK(CLK), .RST(RST));

initial
begin
CTRL= 32'h00000000;
READ = 0;
WRITE = 0;
opcode = 0;
rs = 0;
rt = 0;
rd = 0;
funct = 0;
shamt = 0;
immediate = 0;
address = 0;
end

always @ (proc_state)
begin
  case (proc_state)
    `PROC_FETCH : // Fetch an instruction from Memory
    begin
    READ = 1;
    WRITE = 0;
    CTRL = 32'h08000020;
    end


//----------
    // `PROC_DECODE : // ID/RF
    // begin
    //   READ = 1; WRITE = 0;
    //   case(opcode)
    //
    //
    //   6'h1b : CTRL = 32'h00000190;//push
    //   6'h1c : CTRL = 32'h00000010;//pop
    //   default : CTRL = 32'h00000110;
    //   endcase
    // end


//-------
    `PROC_DECODE : // ID/RF
      begin
      READ = 0; WRITE = 0;
      CTRL = 32'h00000110;
      end
//--------
    `PROC_EXE :
      begin
      READ = 0; WRITE = 0;
      case(opcode)

      6'h00 : begin //R-type
              case(funct)
                6'h20: CTRL = 32'h00600000; //add
                6'h22: CTRL = 32'h00A00000; //sub
                6'h2c: CTRL = 32'h00E00000; //mul
                // No division
                6'h24: CTRL = 32'h01600000; //and
                6'h25: CTRL = 32'h01A00000; //or
                6'h27: CTRL = 32'h01E00000; //nor
                6'h2a: CTRL = 32'h02200000; //slt
                6'h01: CTRL = 32'h02540000; //sll
                6'h02: CTRL = 32'h02940000;  //srl
                6'h08: CTRL = 32'h00000000;
                //default:;
              endcase
              end
      //I-type {op, rs, rt, immediate}
      6'h08 : CTRL = 32'h00480000;//addi
      6'h1d : CTRL = 32'h00C80000; //muli
      6'h0c : CTRL = 32'h01400000;//andi
      6'h0d : CTRL = 32'h01800000;//ori
      6'h0f : CTRL = 32'h00000000;//lui
      6'h0a : CTRL = 32'h02080000;//slti
      6'h04 : CTRL = 32'h00A00000; //beq
      6'h05 : CTRL = 32'h00A00000;// bne
      6'h23 : CTRL = 32'h00480000;//lw
      6'h2b : CTRL = 32'h00480000;//sw
      //J-type
      6'h02 : CTRL = 32'h00000000; // Jump and address
      6'h03 : CTRL = 32'h00000000;// jal
      6'h1b : CTRL = 32'h00000000;// push M[$sp] = R[0] $sp = $sp - 1
      6'h1c : CTRL = 32'h00530000;//pop $sp = $sp + 1;R[0] = M[$sp]
    endcase
    end

    `PROC_MEM :
     begin
      READ = 0; WRITE = 0;
      case(opcode)

      6'h23 : begin
              READ = 1; WRITE = 0;
              CTRL = 32'h00480020;//lw
              end
      6'h2b : begin
              READ = 0; WRITE = 1;
              CTRL = 32'h00480040;//sw
              end
      6'h1b : begin
              READ = 0; WRITE = 1;
              CTRL = 32'h14000040;// push M[$sp] = R[0] $sp = $sp - 1
              end
      6'h1c : begin
              READ = 1; WRITE = 0;
              CTRL = 32'h04000020;//pop $sp = $sp + 1;R[0] = M[$sp]
              end
    endcase
  end

  `PROC_WB : // take care PC reg and Register file
  begin
    READ = 0; WRITE = 0;
    case(opcode)
        6'h00 : begin //R-type
                case(funct)
                6'h00: CTRL = 32'h00000000;//noOP
                6'h20: CTRL = 32'h0060920B;//add
                6'h22: CTRL = 32'h0060920B;//sub
                6'h2c: CTRL = 32'h0060920B;//mul
                6'h24: CTRL = 32'h0060920B;//and
                6'h25: CTRL = 32'h0060920B;//OR
                6'h27: CTRL = 32'h0060920B;//NOR
                6'h2a: CTRL = 32'h0060920B;//slt
                6'h01: CTRL = 32'h0294920A;//sll
                6'h02: CTRL = 32'h0294920A;//srl
                6'h08: CTRL = 32'h00000009;//jr
                endcase
                end
        //I-type
        6'h08 : CTRL = 32'h0048960B;//addi
        6'h1d : CTRL = 32'h0048960B;//muli
        6'h0c : CTRL = 32'h0140960B;//andi
        6'h0d : CTRL = 32'h0140960B;//ori
        6'h0f : CTRL = 32'h0000D60B;//lui
        6'h0a : CTRL = 32'h0000D60B;//slti
        6'h04 : CTRL = 32'h00A0000B;//beq
        6'h05 : CTRL = 32'h00A0000B;// bne
        6'h23 : CTRL = 32'h0048160B;//lw
        6'h2b : CTRL = 32'h0000000B;//sw
        //J-Type
        6'h02 : CTRL = 32'h00000001;// jmp
        6'h03 : CTRL = 32'h00000A01;// jal
        6'h1b : CTRL = 32'h0093000B;// push
        6'h1c : CTRL = 32'h0000A20B;// pop
        endcase
      end
      endcase
end

task print_instruction;
reg [5:0] opcode;
reg [4:0] rs;
reg [4:0] rt;
reg [4:0] rd;
reg [4:0] shamt;
reg [5:0] funct;
reg [15:0] immediate;
reg [25:0] address;
input [`DATA_INDEX_LIMIT:0] inst;
begin
  {opcode, rs, rt, rd, shamt, funct} = inst;// R-type
  {opcode, rs, rt, immediate} = inst;// I-type
  {opcode, address} = inst;// J-type
  $write("@ %6dns -> [0X%08h] ", $time, inst); // I could not figure out what this is
  case(opcode) // R-Type , opcode 6'h00
    6'h00 :
        begin
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
    6'h08 : $write("addi  r[%02d], r[%02d], 0X%04h;", rs, rt, immediate);
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
    6'h02 : $write("jmp  0X%07h;", address);
    6'h03 : $write("jal  0X%07h;", address);
    6'h1b : $write("push;");
    6'h1c : $write("pop;");
    default: $write("");
  endcase
$write("\n");
end
endtask
endmodule;
//------------------------------------------------------------------------------------------
// Module: CONTROL_UNIT
// Output: STATE      : State of the processor
//
// Input:  CLK        : Clock signal
//         RST        : Reset signal
//
// INOUT: MEM_DATA    : Data to be read in from or write to the memory
//
// Notes: - Processor continuously cycle witnin fetch, decode, execute,
//          memory, write back state. State values are in the prj_definition.v
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Sep 10, 2014	Kaushik Patra	kpatra@sjsu.edu		Initial creation
//  1.1     OCt 29, 2018  Keonwoong Min keonwoong.min@sjsu.edu
//------------------------------------------------------------------------------------------
// `define PROC_FETCH    3'h0
// `define PROC_DECODE   3'h1
// `define PROC_EXE      3'h2
// `define PROC_MEM      3'h3
// `define PROC_WB       3'h4
`include "prj_definition.v"
module PROC_SM(STATE,CLK,RST);
input CLK, RST;// list of inputs
output [2:0] STATE;// list of outputs
// reg list
reg [2:0] STATE; //output
reg [2:0] state; // b) �Define state and next_state register
reg [2:0] next_state;
// initiation of state
initial
begin
  STATE = 2'bxx; // b) �state to 2 bit unknown (2'bxx).
  next_state = `PROC_FETCH;
end
// reset signal handling
always @ (negedge RST) // b) � State machine is reset on negative edge of RST // reset signal handling
begin
    state = 2'bxx;
    next_state = `PROC_FETCH;
end

always @ (posedge CLK)
begin
  case(next_state)
  `PROC_FETCH:
  begin
    STATE = next_state;
    next_state = `PROC_DECODE;
  end
  `PROC_DECODE:
  begin
    STATE = next_state;
    next_state = `PROC_EXE;
  end
  `PROC_EXE:
  begin
    STATE = next_state;
    next_state = `PROC_MEM;
  end
  `PROC_MEM:
  begin
    STATE = next_state;
    next_state = `PROC_WB;
  end
  `PROC_WB:
  begin
    STATE = next_state;
    next_state = `PROC_FETCH;
  end
  default:;
  endcase
end
endmodule;
