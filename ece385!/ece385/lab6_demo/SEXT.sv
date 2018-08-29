module SEXT_11(
				input logic [10:0] IR,
				output logic [15:0] SEXT_OUT
				 );
					assign SEXT_OUT ={  {5{IR[10]}}, IR[10:0]};
endmodule
