module bigALU_MUX (ALUSrc, ReadData2, SignExtend32, ALU_B);

	input ALUSrc;
        input [31:0] ReadData2;
        input [31:0] SignExtend32;	
	output reg [31:0] ALU_B;
	
        always @(ALUSrc, ReadData2, SignExtend32) 
                begin
                        case (ALUSrc)                           //Checks value of Control Line ALUSrc
			0: ALU_B <= ReadData2;                  //If ALUSrc is set to 0, Data is read from register
                        1: ALU_B <= SignExtend32;                   //If ALUSrc is set to 1, Data is taken from sign extended value of Immediate data
		endcase
	end
endmodule
