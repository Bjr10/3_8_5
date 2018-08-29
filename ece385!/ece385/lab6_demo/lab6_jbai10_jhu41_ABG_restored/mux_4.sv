module Mux_4  (
				input logic  [15:0] A,B,C,D,
				input logic  [1:0] Select_signal,
				output logic [15:0] Bus_out
			
				);
				
always_comb
	begin 
				if (Select_signal == 2'b00)
					begin
						 Bus_out = A;
					end	
					
				else if(Select_signal == 2'b01)
					begin
						 Bus_out = B;
					end	
				
					
				else if(Select_signal == 2'b10 )
					begin
						 Bus_out = C;
					end	
				
				else 
					begin
						 Bus_out = D;
					end	
				
					
	end
	
endmodule
	