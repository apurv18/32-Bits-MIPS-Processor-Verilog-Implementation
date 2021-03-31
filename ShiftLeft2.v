module ShiftLeft2(number_in, number_out);
  input [31:0] number_in;
  output [31:0] number_out;
  
  always @(number_in)
    begin
		  number_out = number_in << 2;
	  end 
endmodule
