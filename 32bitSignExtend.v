module 32bitSignExtend(16bit_A, 32bit_A);
  input [15:0] 16bit_A;                         //16 bit input number
  output [31:0] 32bit_A;                        //16 bit output number

	always @(16bit_A)
	begin
    if (16bit_A[15]==1)                         //If MSB of input is 1, number is negative and hence will require 1's to be stored in MSBs
			begin
				assign 32bit_A = {16'hFFFF, 16bit_A}; 
			end
		else                                        //If MSB of input is 0, number is positive and hence will require 0's to be stored in MSBs
			begin
				assign 32bit_A = {16'h0000, 16bit_A};
			end
	end
endmodule
