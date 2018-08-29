module ALU_ADRS #(N = 16)(
				input  logic [N-1:0]offset,
				input  logic [15:0]pc_in,
				output logic [15:0]pc_out
				
			 );
			assign	pc_out= pc_in+offset;

endmodule
