module Instr_MUX (instr20_16, instr15_11, RegDst, WriteReg);
        input [20:16] instr20_16;
        input [15:11] instr15_11;
	input RegDst;                                           //Control Line
	output reg [4:0] WriteReg;
        always @ (RegDst, instr20_16, instr15_11) 
                begin
                        case(RegDst)                            //Checking Control Line RegDest                           
			        0 : WriteReg <= instr20_16;     //If RegDest is 0, select register whose address is stored in instr[20:16]
			        1 : WriteReg <= instr15_11;     //If RegDest is 1, select register whose address is stored in instr[15:11]
		        endcase
	        end
endmodule
