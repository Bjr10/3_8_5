module SEXT_5(
				input logic [4:0] IR,
				output logic [15:0] SEXT_OUT
				 );
					assign SEXT_OUT ={  {11{IR[4]}}, IR[4:0]};
endmodule
