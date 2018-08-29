module toplevel(
			input logic [7:0] S,
			input logic Clk,
			input logic Reset,
			input logic Run,
			input logic Load,
			output logic [6:0] AhexU, AhexL, BhexU, BhexL,
			output logic [7:0] Aval, Bval,
			output logic [8:0] Sum

						);			
	logic Dreg_cout;
	logic plus;
	logic A_shift_out;
	
	//logic [7:0]A_parallel_out;
	logic Reset_EN;
	logic Run_EN;
	logic Load_EN;	
	logic M; 
	logic ClearA_loadB_EN;
	logic Continue;
	
	logic	reset_now;
   logic Shift ;
  // logic minus;
   logic done;
	logic Shift_Out;
	logic Load_A;
	
	assign Reset_EN= ~Reset;
   assign Run_EN  = ~Run;
   assign Load_EN= 	~Load;
	assign M=Bval[0];

	
	
						
	Dreg    dreg_unit		(	
					 .Clk(Clk), 
					 .Reset(Reset_EN), 
					 .D(Sum[8]),
					 .Load((Continue|Load_A)),
					 .Q(Dreg_cout)

					 
						
								
								
								);
						
	reg_8   register_unit_A(
					.Clk(Clk), 
					.Reset(Reset_EN), 
					.Shift_In(Dreg_cout), 
					.Load(Load_A   ), 
					.Shift_En(Shift), 
					.D(Sum[7:0]),
					.Shift_Out(A_shift_out),
					.Data_Out(Aval[7:0])
									
								
								
									
								);	
								
	reg_8   register_unit_B(
					.Clk(Clk), 
					.Reset(Reset_EN), 
					.Shift_In(A_shift_out), 
					.Load(ClearA_loadB_EN), 
					.Shift_En(Shift), 
					.D(S[7:0]),
					.Shift_Out(Shift_Out),
					.Data_Out(Bval[7:0])

	
								
								);
								
	ripple_adder adder_unit(
					.A(Aval[7:0]),
					.B(S[7:0]),
					.control_signal(plus),
					.Sum(Sum[8:0]),
					.Continue(Continue)
								);
								
	state_flow    control(
         		.Clk(Clk),
               .Reset(Reset_EN),
         		.Load(Load_EN),										
               .Compute(Run_EN),
         		.M(M),//M
         		.reset_now(reset_now),
         		.Shift(Shift),
         		.clearA_loadB(ClearA_loadB_EN),
					.Load_A(Load_A),
         		.plus(plus), 
               .minus(minus),
         		.done(done),
					.Continue(Continue)
         			);
HexDriver AL(
				.In0(Aval[3:0]),
				.Out0(AhexL)
				);		
HexDriver AU(
				.In0(Aval[7:4]),
				.Out0(AhexU)
				);		
HexDriver BL(
				.In0(Bval[3:0]),
				.Out0(BhexL)
				);	
HexDriver BU(
				.In0(Bval[7:4]),
				.Out0(BhexU)
				);			
						
endmodule
