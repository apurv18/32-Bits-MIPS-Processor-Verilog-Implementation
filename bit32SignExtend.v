module bit32SignExtend(bit_16A, bit_32A);
	input [15:0] bit_16A;                         //16 bit input number
	output [31:0] bit_32A;                        //16 bit output number

	always @(bit_16A)
	begin
		if (bit_16A[15]==1)                         //If MSB of input is 1, number is negative and hence will require 1's to be stored in MSBs
			begin
				assign bit_32A = {16'hFFFF, bit_16A}; 
			end
		else                                        //If MSB of input is 0, number is positive and hence will require 0's to be stored in MSBs
			begin
				assign bit_32A = {16'h0000, bit_16A};
			end
	end
endmodule
