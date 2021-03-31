module RegFile (clock, RegWrite, ReadReg1, ReadReg2, WriteReg, WriteData, ReadData1, ReadData2);
	input clock;
	input RegWrite;
	input [4:0] ReadReg1;
	input [4:0] ReadReg2;
	input [4:0] WriteReg;
	input [31:0] WriteData;	
	output [31:0] ReadData1;
	output [31:0] ReadData2;
	reg [31:0] Registers [0:31];  //32bit registers - 32
	initial begin
		Registers[0] <= 32'h00000000;
		Registers[8] <= 32'h00000000;
		Registers[9] <= 32'h00000000;
		Registers[10] <= 32'h00000000;
		Registers[11] <= 32'h00000000;
		Registers[12] <= 32'h00000000;
		Registers[13] <= 32'h00000000;
		Registers[14] <= 32'h00000000;
		Registers[15] <= 32'h00000000;
		Registers[16] <= 32'h00000000;
		Registers[17] <= 32'h00000000;
		Registers[18] <= 32'h00000000;
		Registers[19] <= 32'h00000000;
		Registers[20] <= 32'h00000000;
		Registers[21] <= 32'h00000000;
		Registers[22] <= 32'h00000000;
		Registers[23] <= 32'h00000000;
		Registers[24] <= 32'h00000000;
		Registers[25] <= 32'h00000000;
		Registers[31] <= 32'b0;
	end
	assign ReadData1 = Registers[ReadReg1];
	assign ReadData2 = Registers[ReadReg2];
	
	always @(posedge clock) begin
		if (RegWrite == 1)
			Registers[WriteReg] = WriteData;
	end	
endmodule
