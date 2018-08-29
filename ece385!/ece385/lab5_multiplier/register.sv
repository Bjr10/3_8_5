/*module one_register(
							input a,
							input cin,
							output logic cout,
							);
endmodule

module four_register(
							input [3:0]A,
							input cin,
							output logic cout
	
							);
							
	logic c0,c1, c2,
		one_register R0(.a(A[3]), .cin(cin), ,cout(c0) );
		one_register R1(.a(A[2]), .cin(c0), ,cout(c1) );
		one_register R2(.a(A[1]), .cin(c1), ,cout(c2) );
		one_register R3(.a(A[0]), .cin(c2), ,cout(cout) );
		
endmodule

module eight_register(
							input [7:0] AA,
							input cin,
							output logic cout,
			
							);
logic temp
four_register	A1(.A(AA[7:4]), .cin(cin) , .cout(temp) );
four_register	A2(.A(AA[3:0]), .cin(temp) , .cout(cout) );
								
endmodule	 						
		
		
		
		
module nine_register(
							input [8:0]AAA,
							input cin,
							output logic cout
							);	
logic temp	
one_register   one(.a(AAA[8]), .cin(cin), .cout(temp))	
eight_register two(.AA(AAA[7:0]), .cin(temp), .cout(cout) )
	
endmodule		
*/

module reg_8 ( 
				input logic Clk, Reset, Shift_In, Load, Shift_En,
				input logic [7:0] D,
				output logic Shift_Out,
				output logic [7:0] Data_Out
				);


logic [7:0] Data_next;


always_ff @ (posedge Clk)
	begin
			Data_Out <= Data_next;
	end
always_comb
	begin
			Data_next = Data_Out;
			if (Reset) // Synchronous Reset
				Data_next = 0;
			else if (Load)
				Data_next = D;
			else if (Shift_En)
				Data_next = { Shift_In, Data_Out[7:1] };
				Shift_Out = Data_Out[0];
end


endmodule


/*
module reg_9 ( 
				input logic Clk, Reset, Shift_In, Load, Shift_En,
				input logic [8:0] D,
				output logic Shift_Out,
				output logic [8:0] Data_Out
				);


logic [8:0] Data_Next;


always_ff @ (posedge Clk)
	begin
			Data_Out <= Data_Next;
	end
always_comb
	begin
			Data_next = Data_Out;
			if (Reset) // Synchronous Reset
				Data_next = 0;
			else if (Load)
				Data_next = D;
			else if (Shift_En)
				Data_next = { Shift_In, Data_Out[8:1] };
end


endmodule
*/