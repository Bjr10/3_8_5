module Mux_2 #(N=16) (
				input logic  [N-1:0] A,B,
				input logic  Select_signal,
				output logic [N-1:0] Bus_out
			
				);
				
always_comb 
	begin 
				if (Select_signal==1)
					begin
						 Bus_out = A;
					end	
					
				else 
					begin
						 Bus_out = B;
					end	
				
					
	end
	
endmodule
	