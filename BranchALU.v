module Add_ALU(PCOut, number_out, BranchALUOut);
  input [31:0] PCout;
  input [31:0] number_out;
  output reg [31:0] BranchALUOut;
	always @(*) begin
		BranchALUOut <= PCout + number_out;     //Adds incremented program counter to the branch amount
	end
endmodule
