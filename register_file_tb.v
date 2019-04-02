// Name: register_file_tb.v
// Module: register_file_tb
// Input:  DATA_W : Data to be written at address ADDR_W
//         ADDR_W : Address of the memory location to be written
//         ADDR_R1 : Address of the memory location to be read for DATA_R1
//         ADDR_R2 : Address of the memory location to be read for DATA_R2
//         READ    : Read signal
//         WRITE   : Write signal
//         CLK     : Clock signal
//         RST     : Reset signal
// Output: DATA_R1 : Data at ADDR_R1 address
//         DATA_R2 : Data at ADDR_R1 address
//
// Notes: Testbench for register_file system
//
// Revision History:
//
// Version	Date		Who		email			note
//------------------------------------------------------------------------------------------
//  1.0     Oct 24, 2018	Keonwoong Min	keonwoong.min@sjsu.edu	Initial creation
//------------------------------------------------------------------------------------------
//
`include "prj_definition.v"
module register_file_tb;
wire [`DATA_INDEX_LIMIT:0] DATA_R1;
wire [`DATA_INDEX_LIMIT:0] DATA_R2;

// output list, line 30
reg READ, WRITE, RST;
reg [`DATA_INDEX_LIMIT:0] DATA_W; //31:0
reg [`REG_ADDR_INDEX_LIMIT:0] ADDR_R1, ADDR_R2, ADDR_W; //4:0

integer no_of_test;
integer no_of_pass;
integer i;
//wire list
wire  CLK;


// Clock generator instance
CLK_GENERATOR clk_gen_inst(.CLK(CLK));

// Instantiation of register_file
REGISTER_FILE_32x32 register_file_inst(.R1_DATA(DATA_R1), .R2_DATA(DATA_R2), .R1_ADDR(ADDR_R1), .R2_ADDR(ADDR_R2),
                           .W_DATA(DATA_W), .W_ADDR(ADDR_W), .READ(READ), .WRITE(WRITE), .CLK(CLK), .RST(RST));

initial
begin
RST=1'b1; // line 50
READ=1'b0;
WRITE=1'b0;
DATA_W = {`DATA_WIDTH{1'b0}};
no_of_test = 0;
no_of_pass = 0;

// Start the operation
#10 RST=1'b0; // clear up the memory
#10 RST=1'b1; // cuz at negedge RST is done

// Write cycle
for(i=0;i<10; i = i + 1)
begin
#10	DATA_W=i; READ=1'b0; WRITE=1'b1; ADDR_W = i;
end
//Read cycle
#10   READ=1'b0; WRITE=1'b0;
#5    no_of_test = no_of_test + 1;
      if (DATA_R1 !== {`DATA_WIDTH{1'bx}})
        $write("[TEST] Read %1b, Write %1b, expecting 32'hxxxxxxxx, got %8h [FAILED]\n", READ, WRITE, DATA_R1);
      else
	no_of_pass  = no_of_pass + 1;

// read data for r1
for(i=0;i<10; i = i + 1)
begin
#5 READ = 1'b1; WRITE = 1'b0; ADDR_R1 = i;
#5      no_of_test = no_of_test + 1; // increse the test number
  if (DATA_R1 !== i) // if the DATA_1 is not equal to 1, gets the specific datas
	$write("[TEST] Read %1b, Write %1b, expecting %8h, got %8h [FAILED]\n", READ, WRITE, i, DATA_R1);
  else
	no_of_pass  = no_of_pass + 1;
end

// test of write data for r2
for(i=0;i<10; i = i + 1)
begin
#5 READ = 1'b1; WRITE = 1'b0; ADDR_R2 = i;
#5      no_of_test = no_of_test + 1; // increse the test number
  if (DATA_R2 !== i) // if the DATA_1 is not equal to 1, gets the specific datas
	$write("[TEST] Read %1b, Write %1b, expecting %8h, got %8h [FAILED]\n", READ, WRITE, i, DATA_R2);
  else
	no_of_pass  = no_of_pass + 1;
end

#10    READ=1'b0; WRITE=1'b0; // No op

    $stop;

end
endmodule;
