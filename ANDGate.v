module ANDGate(ALUZero, Branch, BranchOut);
	input Branch;
	input ALUZero;
	output reg BranchOut;
	always @(*)
    begin
      assign BranchOut <= Branch & ALUZero;
    end
endmodule
