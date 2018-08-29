module CC(
			input logic LD_CC, Clk, Reset,
			input logic [15:0]bus,
			input logic [15:0]IR,
			output logic BEN
	
			);
			 logic     N;
			 logic	  Z;
			 logic	  P;	
			 
			 logic     N2;
			 logic	  Z2;
			 logic	  P2;	


		always_ff @(posedge Clk)
			begin
			
			if(Reset)
			begin
				N= 1'b0;
				Z= 1'b0;
				P= 1'b0;
			end
			
			if (LD_CC)
			begin
				N = N2;
				Z = Z2;
				P = P2;
			
			end
		end
		
		
always_comb
			begin
			
					N2 = 0;
					Z2 = 0;
					P2 = 0;
					
					if(bus== 16'h0000)
							begin 
								Z2= 1'b1;
							end
							
						else if(bus[15]==1)
							begin
								N2= 1'b1;
							end
						
						else
							begin 
								P2= 1'b1;
							end
			
					if( (IR[11]&N) | (IR[10]&Z) | (IR[9]&P)  )
						begin 
								 BEN = 1'b1;
						end
						
						
					else 
						begin
								 BEN = 1'b0;
						end
			
			end
endmodule
