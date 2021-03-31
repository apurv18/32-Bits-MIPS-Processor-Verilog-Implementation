module bigALU( A, B, ALUCntrl, ALUOut, ALUZero);
	input [31:0] A;
	input [31:0] B;
	input [3:0] ALUCntrl;
	output [31:0] ALUOut;
	output ALUZero;

	assign ALUOut = 32'b00000000000000000000000000000000;
	assing ALUZero = 1'b0;
	wire [31:0] sra_sign;
	wire [31:0] sra_aux;
  	wire [63:0] product;
  	wire [63:0] quotient;
  	wire [63:0] remainder;
 	assign sra_sign = 32'b1111_1111_1111_1111 << (32 - A);
  	assign sra_aux = B >> A;
  
  	always@(*)
    case(alucont[3:0])
     	4'b0000: ALUOut <= A & B;				//AND operation and ANDI operation 				   - 0
      	4'b0001: ALUOut <= A | B;				//OR operation and ORI operation   				   - 1
      	4'b0010: ALUOut <= A + B;				//ADD operation, ADDU operation and ADDI operation - 2
      	4'b0011: ALUOut <= ~(A | B);			//NOR operation 								   - 3
      	4'b0100: ALUOut <= A ^ B;				//XOR operation									   - 4
      	4'b0110: ALUOut <= A - B;				//SUB operation					   				   - 6
      	4'b0111: ALUOut <= A < B ? 1:0;			//SLT operation and SLTI operation 				   - 7
      	4'b1001: 								//MULT operation and MULTU operation			   - 9
        	begin
        		assign product = A * B;			//Storing product in 64 bit register since 32 bit x 32 bit gives 64 bit outputs
          		ALUOut <= product[31:0]; 
          		wd0    <= product[31:0];
          		wd1    <= product[63:32];
        	end
      	4'b1010: ALUOut <= B << A;				//SLL operation, SLLV operation 				   - 10
      	4'b1101: ALUOut <= B >> A;				//SRL operation, SRLV operation 				   - 13
      	4'b1110: 								//DIV operation and DIVU opeation 				   - 14
        	begin
        		assign quotient = A / B;
  				assign remainder = A % B;
          		ALUOut <= quotient; 
          		wd0    <= quotient;
          		wd1    <= remainder;
        	end
      	4'b1111: ALUOut <= sra_sign | sra_aux;	//SRA operation, SRAV operation 				   - 15
    endcase
    assign ALUZero = (ALUOut == 32'b00000000000000000000000000000000);	//Setting ALUZero output if ALUOut is 0
endmodule
