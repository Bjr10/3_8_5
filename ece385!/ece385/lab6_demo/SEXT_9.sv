module SEXT_9(
				input logic [8:0] IR,
				output logic [15:0] SEXT_OUT
				 );
					assign SEXT_OUT ={  {7{IR[8]}}, IR[8:0]};
endmodule
