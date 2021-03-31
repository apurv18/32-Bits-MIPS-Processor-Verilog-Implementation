module PC(clock, reset, PC_In, PC_Out);

	input clock;
  input reset;
  input [31:0] PC_In;
  output reg [31:0] PC_Out;
	
	always @(posedge clock)
    begin
      if (reset == 1)           //If reset is active, reset program counter to initial position
        begin
			    PC_Out <= 0;
        end
		  else 
        begin
			    PC_Out <= PC_In + 4; //Increment program counter by 4 to point to next instruction location
	      end
    end
endmodule
