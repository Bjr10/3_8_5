//------------------------------------------------------------------------------
// Company:        UIUC ECE Dept.
// Engineer:       Stephen Kempf
//
// Create Date:    
// Design Name:    ECE 385 Lab 6 Given Code - SLC-3 
// Module Name:    SLC3
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//    Revised 09-22-2015 
//    Revised 10-19-2017 
//    spring 2018 Distribution
//
//------------------------------------------------------------------------------
module slc3(
    input logic [15:0] S,
	// output logic [15:0]  PC,
    input logic Clk, Reset, Run, Continue,
    output logic [11:0] LED,
    output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
    output logic CE, UB, LB, OE, WE,
    output logic [19:0] ADDR,
    inout wire [15:0] Data //tristate buffers need to be of type wire
);

// Declaration of push button active high signals
logic Reset_ah, Continue_ah, Run_ah;

assign Reset_ah = ~Reset;
assign Continue_ah = ~Continue;
assign Run_ah = ~Run;

// Internal connections
logic BEN;
logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED;
logic GatePC, GateMDR, GateALU, GateMARMUX;
logic [1:0]  ADDR2MUX, ALUK;
logic [1:0]PCMUX;
logic DRMUX, SR1MUX, SR2MUX, ADDR1MUX;
logic MIO_EN;
logic [15:0]  PC;
logic [15:0] MDR_In;
logic [15:0] MAR, MDR, IR;
logic [15:0] Data_from_SRAM, Data_to_SRAM, Data_to_CPU;

logic [15:0] ALU_O;
// Signals being displayed on hex display
logic [3:0][3:0] hex_4;

// For week 1, hexdrivers will display IR. Comment out these in week 2.
//HexDriver hex_driver3 (IR[15:12], HEX3);
//HexDriver hex_driver2 (IR[11:8], HEX2);
//HexDriver hex_driver1 (IR[7:4], HEX1);
//HexDriver hex_driver0 (IR[3:0], HEX0);

 //For week 2, hexdrivers will be mounted to Mem2IO
 HexDriver hex_driver3 (hex_4[3][3:0], HEX3);
 HexDriver hex_driver2 (hex_4[2][3:0], HEX2);
 HexDriver hex_driver1 (hex_4[1][3:0], HEX1);
 HexDriver hex_driver0 (hex_4[0][3:0], HEX0);

// The other hex display will show PC for both weeks.
HexDriver hex_driver7 (PC[15:12], HEX7);
HexDriver hex_driver6 (PC[11:8], HEX6);
HexDriver hex_driver5 (PC[7:4], HEX5);
HexDriver hex_driver4 (PC[3:0], HEX4);

// Connect MAR to ADDR, which is also connected as an input into MEM2IO.
// MEM2IO will determine what gets put onto Data_CPU (which serves as a potential
// input into MDR)
assign ADDR = { 4'b00, MAR }; //Note, our external SRAM chip is 1Mx16, but address space is only 64Kx16
assign MIO_EN = ~OE;

//logic [2:0]PCMUX_SIG;
														//   hotwire signal for pcmux
//assign PCMUX_SIG[2:0]=3'b100;
//always_comb
//begin
//	if (PCMUX== 0)
//		begin
//			assign PCMUX_SIG[0]=1;
//		end
//	if (PCMUX== 1)
//		begin
//			assign PCMUX_SIG[1]=1;
//		end
//	else 
//		begin
//			assign PCMUX_SIG[2]=1;
//		end
//end
//	

	
// You need to make your own datapath module and connect everything to the datapath
// Be careful about whether Reset is active high or low
datapath d0 (
			.Reset(Reset), 
			.Clk(Clk),
			.S(S),
			.Gate_MAR(GateMARMUX),
			.Gate_PC(GatePC), 
			.Gate_MDR(GateMDR), 
			.Gate_ALU(GateALU),
			.L_MDR(LD_MDR),
			.L_MAR(LD_MAR), 
			.L_IR(LD_IR), 
			.L_PC(LD_PC), 
			.L_CC(LD_CC), 
			.L_BEN(LD_BEN),
			.L_REG(LD_REG),
			//.LED_O(LED),
			//.L_LED(LD_LED),
			//.MDR_In(MDR_In),
			.PC_select(PCMUX) ,
			.MIO_EN(MIO_EN),
			.MAR_O(MAR),
			.MDR_O(MDR), 
			.PC_O(PC),
			.IR_O(IR), 
			.BEN_O(BEN),
			.ADDR1MUX(ADDR1MUX),										
			.ADDR2MUX(ADDR2MUX),										
			.ALU_O(ALU_O),	
			.DRMUX(DRMUX),
			.SR1MUX(SR1MUX),
			.SR2MUX(SR2MUX),
			.ALUK(ALUK),
			.Data_to_CPU
				);

// Our SRAM and I/O controller
Mem2IO memory_subsystem(
    .*, .Reset(Reset_ah), .ADDR(ADDR), .Switches(S),
    .HEX0(hex_4[0][3:0]), .HEX1(hex_4[1][3:0]), .HEX2(hex_4[2][3:0]), .HEX3(hex_4[3][3:0]),
    .Data_from_CPU(MDR), .Data_to_CPU(Data_to_CPU),
    .Data_from_SRAM(Data_from_SRAM), .Data_to_SRAM(Data_to_SRAM)
);
//test_memory my_test_memory(.Reset(~Reset), .I_O(Data), .A(ADDR), .*);
// The tri-state buffer serves as the interface between Mem2IO and SRAM
tristate #(.N(16)) tr0(
    .Clk(Clk), .tristate_output_enable(~WE), .Data_write(Data_to_SRAM), .Data_read(Data_from_SRAM), .Data(Data)
);

// State machine and control signals
ISDU state_controller(
    .*, .Reset(Reset_ah), .Run(Run_ah), .Continue(Continue_ah),
    .Opcode(IR[15:12]), .IR_5(IR[5]), .IR_11(IR[11]),
    .Mem_CE(CE), .Mem_UB(UB), .Mem_LB(LB), .Mem_OE(OE), .Mem_WE(WE)
);

//test_memory my_test_memory(.Reset(~Reset), .I_O(Data), .A(ADDR), .*);

assign LED =IR[11:0];
endmodule