module ALUControl (ALUOp, Func, ALUCntrl);
	input [1:0] ALUOp;
	input [5:0] Func;
	output reg [3:0] ALUCntrl;
	always @(ALUOp, FuncCode) 
		begin
			if(ALUOp == 0)		// LW and SW type Instructions
				ALUCtl <= 2;    
			else if(ALUOp == 1)	//branch type Instructions
				ALUCtl <= 6;		
			else
				case(FuncCode)	//R Type Instructions
					6'b100100: ALUCntrl <= 0;		//AND operation
					6'b100101: ALUCntrl <= 1;		//OR operation
					6'b100000: ALUCntrl <= 2;		//ADD operation
					6'b100111: ALUCntrl <= 3;		//NOR operation
					6'b100110: ALUCntrl <= 4;		//XOR operation
					6'b100010: ALUCntrl <= 6;		//SUB operation
					6'b101010: ALUCntrl <= 7;		//SLT operation
					6'b011000: ALUCntrl <= 9;		//MULT operation
					6'b011010: ALUCntrl <= 14;		//DIV operation
					6'b000011: ALUCntrl <= 15; 	//SRA operation
					default: ALUCtl <= 12; //should not happen
				endcase
		end
endmodule
