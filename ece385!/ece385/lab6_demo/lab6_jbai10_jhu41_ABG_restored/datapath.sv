module datapath(
				input logic Reset, Clk,
				input logic [15:0] S,
				input logic Gate_MAR, Gate_PC, Gate_MDR, Gate_ALU,
				input logic L_MDR, L_MAR, L_IR, L_PC, L_CC, L_BEN ,L_REG,L_LED,
				//input logic [15:0] MDR_In,
				input logic ADDR1MUX,
				input logic [1:0]ADDR2MUX,
				input logic [1:0] PC_select ,
				input logic  MIO_EN,
				output logic[15:0] MAR_O, MDR_O, PC_O,IR_O, ALU_O,
				output logic BEN_O,
				input  logic DRMUX, SR1MUX, SR2MUX,
				input  logic [1:0]ALUK,
				input logic [15:0]Data_to_CPU,
				output logic [11:0]LED_O
				);
				
				
	logic [2:0]sign;
	logic [15:0] bus;
	logic branch;
	logic [15:0]MDR_MUX_OUT, PC_MUX_OUT;
	logic [3:0]select_gate;
	logic [15:0]adder_MUX_O;
	logic [15:0] MDR_In;

	
	//logic [1:0]ADDR_MUX_SIG_2;
	//logic ADDR_MUX_SIG_1;
	logic [15:0]ADDR_MUX_OUT_2;
	logic [15:0]ADDR_MUX_OUT_1;

	
	logic [15:0]SEXT_11_OUT;
	logic [15:0]SEXT_9_OUT;
	logic [15:0]SEXT_6_OUT;
	logic [15:0]SEXT_5_OUT;
	
	logic [15:0] SR1_OUT;
	logic [15:0] SR2_OUT;
	
	//logic [2:0] SR2;
	
	//logic SR2_MUX_SELECT;
	//logic SR1_MUX_SELECT;																		//SR mux select signal might be given
	//logic DR_MUX_SELECT;
	logic [2:0]SR1_MUX_OUT;
	logic [15:0]SR2_MUX_OUT;
	logic [2:0]DR_MUX_OUT;
	
	
	//logic [1:0]A
	
	logic [15:0]ALU_B;
	logic [15:0]ALU_A;
	
	logic BEN_IN;
	
	logic Reset_h;
	assign Reset_h = ~Reset;
	
	
	
	assign select_gate[0]=Gate_MAR;
	assign select_gate[1]=Gate_PC;
	assign select_gate[2]=Gate_MDR;
	assign select_gate[3]=Gate_ALU;
	//assign adder_MUX_O   =0;
	
	//temp select signals
	
//	logic [1:0]MIO_TEMP;
//	assign MIO_TEMP= 1'b10;
//	
//	
//		reg_unit #( .N (16))  LED(
//				.Clk(Clk),
//				.Reset(Reset_h),
//				.Load(L_LED),
//				.input_val(IR_O[11:0]),
//				.output_val(LED_O)
//	 
//	 );
//		
	
	 reg_unit #( .N (16))  MAR_REGISTER(
				.Clk(Clk),
				.Reset(Reset_h),
				.Load(L_MAR),
				.input_val(bus),
				.output_val(MAR_O)
	 
	 );
	 
	 	 reg_unit #( .N (16))  MDR_REGISTER(
				.Clk(Clk),
				.Reset(Reset_h),
				.Load(L_MDR),
				.input_val(MDR_In),
				.output_val(MDR_O)
	 
	 );
	 
	  reg_unit #( .N (16))  PC_REGISTER(
				.Clk(Clk),
				.Reset(Reset_h),
				.Load(L_PC),
				.input_val(PC_MUX_OUT),
				.output_val(PC_O)
	 
	 );
	 
	 
		 reg_unit #( .N (16))  IR_REGISTER(
				.Clk(Clk),
				.Reset(Reset_h),
				.Load(L_IR),
				.input_val(bus),
				.output_val(IR_O)
	 
	);
	
	 reg_unit   # (.N (1))BEN_REGISTER(       //size(1)
			.Clk(Clk),
			.Reset(Reset_h),
			.Load(L_BEN),
			.input_val(BEN_IN),
			.output_val(BEN_O)
   );


		Mux_2 #(.N (16)) MDR_M(
				 .A(bus),
				 .B(Data_to_CPU),
				 .Select_signal(~MIO_EN),
				 //.Select_signal(MIO_TEMP),
				 .Bus_out(MDR_In)
				 
	);

	
	
		Mux_3 #(.N (16)) PC_M(
				.A(PC_O+4'h0001),
				.B(adder_MUX_O),
				.C(bus),
				.Select_signal(PC_select),
				.Bus_out(PC_MUX_OUT)
		
	);
	
		 bus #(.N (16))  Bus_MUX(
				.input_MAR(adder_MUX_O), 
				.input_PC(PC_O), 
				.input_MDR(MDR_O),
				.input_ALU(ALU_O),
				.Select_signal(select_gate),
			   .Bus_out(bus)
	);
		SEXT_11    S_11(
				.IR(IR_O[10:0]),
				.SEXT_OUT(SEXT_11_OUT)
	);			
		SEXT_9	 S_09	(
				.IR(IR_O[8:0]),
				.SEXT_OUT(SEXT_9_OUT)
	);			
		SEXT_6    S_06(
				.IR(IR_O[5:0]),
				.SEXT_OUT(SEXT_6_OUT)
	);			
		SEXT_5    S_05(
				.IR(IR_O[4:0]),
				.SEXT_OUT(SEXT_5_OUT)
	);			
		 Mux_4   ADDR2_MUX(
				.A(16'b0000000000000000),				
				.B(SEXT_6_OUT),
				.C(SEXT_9_OUT),
				.D(SEXT_11_OUT),
				.Select_signal(ADDR2MUX),
				.Bus_out(ADDR_MUX_OUT_2)
	); 
	
		Mux_2 #(.N (16)) ADDR1_MUX(
				 .A(SR1_OUT),
				 .B(PC_O),
				 .Select_signal(ADDR1MUX),
				 //.Select_signal(MIO_TEMP),
				 .Bus_out(ADDR_MUX_OUT_1)
	);

		ALU_LOGIC   ADDR_MUX_ADDER(
						.ALUK(2'b00),
						.A(ADDR_MUX_OUT_2),
						.B(ADDR_MUX_OUT_1),
						.ALU_OUT(adder_MUX_O)

	);
						
		Mux_2 #(.N (16)) SR2_MUX(
				 .A(SEXT_5_OUT),																	//left gate is 1 for sext							
				 .B(SR2_OUT),
				 .Select_signal(SR2MUX),
				 .Bus_out(SR2_MUX_OUT)
	);
		Mux_2 #(.N (3)) SR1_MUX(
				 .A(IR_O[11:9]),																	//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ IR_O might not be right IR for sr1 mux 							
				 .B(IR_O[8:6]),
				 .Select_signal(SR1MUX),
				 .Bus_out(SR1_MUX_OUT)
	);
	
		Mux_2 #(.N (3)) DR_MUX(
				 .A(3'b111),																	//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ IR_O might not be right IR for sr1 mux 							
				 .B(IR_O[11:9]),
				 .Select_signal(DRMUX),
				 .Bus_out(DR_MUX_OUT)
	);
		
			ALU_LOGIC   ALU_UNIT(
						.ALUK(ALUK),
						.A(SR1_OUT),
						.B(SR2_MUX_OUT),
						.ALU_OUT(ALU_O)

	);
	
	
	
			reg_file    register_file (
					.Clk(Clk), 
					.LD_REG(L_REG), 
					.Reset(Reset_h),
 					.SR_1(SR1_MUX_OUT),
					.SR_2(IR_O[2:0]),
					.DR(DR_MUX_OUT),  
					.bus(bus), 
 					.SR1_OUT(SR1_OUT), 
					.SR2_OUT(SR2_OUT) 
	);
	
	
	
	
	
			CC  set_cc(
			.LD_CC(L_CC), 
			.bus(bus),
			.IR(IR_O),
			.BEN(BEN_IN),
			.Reset(Reset_h),
			.Clk(Clk)
	);
	
	
	
endmodule	