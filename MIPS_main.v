module MipsCPU(clock, reset, PC_In,PC_Out,inst,RegDst, RegWrite, ALUSrc, MemtoReg, MemRead, MemWrite, Branch,ALUOp,WriteReg,ReadData1, ReadData2,Extend32,ALU_B,ShiftOut,ALUCntrl,ALUZero,ALUOut,Add_ALUOut,AndGateOut,ReadData,WriteData_Reg);				
	input clock;
	input reset;
	//Connection of PC
	output wire [31:0] PC_In, PC_Out;
	PC pc_0(
		//inputs
		.clock(clock),
		.reset(reset),
		.PC_In(PC_In),
		//outputs
		.PC_Out(PC_Out)	
	);
	
	//Connection of InstMem
	output wire [31:0] inst;
	InstMem instmem_0(
		//inputs
		.clock(clock),
		.address(PCin),
		//outputs
		.inst(inst)	
	);
	
	//Connection of MainControl
	output wire RegDst, RegWrite, ALUSrc, MemtoReg, MemRead, MemWrite, Branch;
	output wire [1:0] ALUOp;
	MainControl main_control_0(
		//inputs
		.Opcode(inst[31:26]),
		//outputs
		.RegDst(RegDst),
		.RegWrite(RegWrite),
		.ALUSrc(ALUSrc),
		.MemtoReg(MemtoReg),
		.MemRead(MemRead),
		.MemWrite(MemWrite),
		.Branch(Branch),
		.ALUOp(ALUOp)	
	);
	
	//Connection of the Mux between InstMem and RegisterFile
	output wire [4:0]  WriteReg;
	Instr_MUX mux1(
		//inputs
		.inst20_16(inst[20:16]),
		.inst15_11(inst[15:11]),
		.RegDst(RegDst),
		//outputs
		.WriteReg(WriteReg)	
	);
	
	//Connection of RegFile
	output wire [31:0] ReadData1, ReadData2;
	RegFile regfile_0(
		//inputs
		.clock(clock),
		.ReadReg1(inst[25:21]),
		//***********************************************************************
		.ReadReg2(inst[20:16]),
		.RegWrite(RegWrite),
		.WriteReg(WriteReg),	
		.WriteData(WriteData_Reg),
		//outputs
		.ReadData1(ReadData1),
		.ReadData2(ReadData2)	
	);
	
	//Connection of SignExtend
	output wire [31:0] Extend32;
	bit32SignExtend sign_extend_0(
		//inputs
		.inst15_0(inst[15:0]),
		//outputs
		.Extend32(Extend32)
	);
	
	//Connection of Mux2
	output wire [31:0] ALU_B;
	bigALU_MUX mux2(
		//inputs
		.ALUSrc(ALUSrc),
		.ReadData2(ReadData2),
		.Extend32(Extend32),
		//outputs
		.ALU_B(ALU_B)	
	);
	
	//Connection of ShiftLeft2
	output wire [31:0] ShiftOut;
	ShiftLeft2 shift_left2_0(
		//inputs
		.ShiftIn(Extend32),
		//outputs
		.ShiftOut(ShiftOut)
	);
	
	//Connection of ALUControl
	output wire [3:0] ALUCtl;
	ALUControl alu_control_0(
		//inputs
		.ALUOp(ALUOp),
		.Func(inst[5:0]),
		//outputs
		.ALUCntrl(ALUCntrl)	
	);
	
	//Connection of ALU
	output wire Zero;
	output wire [31:0] ALUOut;
	bigALU alu(
		//inputs
		.A(ReadData1),
		.B(ALU_B),
		.ALUCntrl(ALUCntrl),
		//outputs
		.ALUOut(ALUOut),
		.ALUZero(ALUZero)
	);
	
	//Connection of Add_ALU
	output wire [31:0] Add_ALUOut;
	Add_ALU add_alu_0(
		//inputs
		.PCout(PCout),
		.ShiftOut(ShiftOut),
		//outputs
		.Add_ALUOut(Add_ALUOut)	
	);
	
	//Connection of AndGate
	output wire AndGateOut;
	AndGate and_gate_0(
		//inputs
		.Branch(Branch),
		.Zero(Zero),
		//outputs
		.AndGateOut(AndGateOut)
	);
	
	//Connection of Mux4
	Mux4 mux4_0(
		//inputs
		.PCout(PCout),
		.Add_ALUOut(Add_ALUOut),
		.AndGateOut(AndGateOut),
		//outputs
		.PCin(PCin)
	);
	
	//Connection of DataMemory
	output wire [31:0] ReadData;
	DataMemory  data_memory_0(
		//inputs
		.clock(clock),
		.address(ALUOut),
		.MemWrite(MemWrite),
		.MemRead(MemRead),
		.WriteData(ReadData2),
		//outputs
		.ReadData(ReadData)
	);
	
	//Connection of Mux3
	output wire[31:0] WriteData_Reg;
	Mux3 mu3_0(
	//inputs
	.ReadData(ReadData),
	.ALUOut(ALUOut),
	//outputs
	.WriteData_Reg(WriteData_Reg)
	);	
endmodule
