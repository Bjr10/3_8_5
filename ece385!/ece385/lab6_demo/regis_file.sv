module reg_unit #(N=16)(
						input logic Clk, Reset, Load,
						input logic [N-1: 0] input_val,
						output logic [N-1 :0] output_val
						); 

logic [N-1:0] data; 						

always_ff @ (posedge Clk)
	begin 
			if(Reset == 1)
				begin
					 data = {N{1'b0}};
				end
		
			else if(Load ==1)
				begin 
					 data = input_val;
				end
				
				
	end
	
	always_comb
	begin
		output_val = data;
	end
	
endmodule
