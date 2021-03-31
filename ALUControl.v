module ALUControl(ALUOp, Func, ALUCntrl);
	input [1:0] ALUOp;
	input [5:0] Func;
	output reg [3:0] ALUCntrl;		//ALUOp taken 4 bits to include implementation of I type instructions 
	
