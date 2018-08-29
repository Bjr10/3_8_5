module Mux_3 #(N=16) (
				input logic  [N-1:0] A,B,C,
				input logic  [1:0] Select_signal,
				output logic [N-1:0] Bus_out
			
				);
				
always_comb
	begin 
				if (Select_signal== 2'b00)
					begin
						 Bus_out = A;
					end	
					
				else if(Select_signal ==2'b01)
					begin
						 Bus_out = B;
					end	
				
				else if(Select_signal ==2'b10)
					begin
						 Bus_out = C;
					end	
				else
					begin	
						 Bus_out = 16'hxxxx;
				   end
				
				
				
					
	end
	
endmodule
