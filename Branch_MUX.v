
module Branch_MUX (PC_Out, BranchALUOut, AndGateOut, PC_In);

  input [31:0] PC_Out;
  input [31:0] BranchALUOut;
	input AndGateOut;	
  output reg [31:0] PC_In;
	initial
    begin
		  PC_In <= 0;                   //Initial value of output is set to 0
	  end
	always @(*)
    begin
      case (AndGateOut)             //Checking output of the branch AND Gate
			  0: PCin <= PCout ;          // No branch 
			  1: PCin <= Add_ALUOut;      //Branching Occurs
		  endcase
	  end
endmodule
