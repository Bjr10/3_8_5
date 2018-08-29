module pc(
			input logic [8:0]offset,
			input logic [15:0]pc_in,
			output logic [15:0]pc_next);
			
	assign pc_next=pc_in+{{7{offset[8]}},offset[8:0]};
	
endmodule
	
