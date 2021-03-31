module DataMem(Address, WriteData, MemWrite, MemRead, ReadData, clock);
  input [31:0] Address;
  input [31:0] WriteData;
  input MemWrite;
  input MemRead;
  input clock;
  output reg [31:0] ReadData;

  reg [31:0] RAM [0:255]; //32 bits memory with 255 entries
	
	always @ (posedge clock)
		begin
			if (MemWrite == 1)
        			RAM[address[7:2]] <= WriteData;
    		end
	always @(negedge clock)
    		begin
		  	if (MemRead == 1)
        			ReadData <= RAM[address[7:2]];
		end	
endmodule
