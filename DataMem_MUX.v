
module Mux3 (ReadData, ALUOut, MemtoReg, WriteDataReg);
	input [31:0] ReadData;
        input [31:0] ALUOut;
        input MemtoReg;	
        output reg [31:0] WriteData_Reg;
	
	always @(*)
                begin
                        case (MemtoReg)                         //Checks Control Signal MemtoReg
			        0: WriteDataReg <= ALUOut ;     //Selects ALU Output as output value if MemtoReg is 0
			        1: WriteDataReg <= ReadData;    //Selects Data from memory as output value if MemtoReg is 1
		        endcase
	        end
endmodule
