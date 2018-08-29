module bus #(N=16) (
				input logic  [N-1:0] input_MAR, input_PC, input_MDR, input_ALU,
				input logic  [3:0] Select_signal,
				output logic [N-1:0] Bus_out
			
				);
				
always_comb
	begin 
				if (Select_signal[0]==1)
					begin
						 Bus_out = input_MAR;
					end	
					
				else if(Select_signal[1]==1)
					begin
						 Bus_out =input_PC;
					end	
					
				else if(Select_signal[2]==1)
					begin
						 Bus_out = input_MDR;
					end
					
				else if(Select_signal[3]==1)
					begin
						 Bus_out = input_ALU;
					end
					
				else
					begin
						 Bus_out = 16'heceb;
					end
					
	end
	
endmodule



