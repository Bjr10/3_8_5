module SEXT_6(
				input logic [5:0] IR,
				output logic [15:0] SEXT_OUT
				 );
					assign SEXT_OUT ={  {10{IR[5]}}, IR[5:0]};
endmodule
