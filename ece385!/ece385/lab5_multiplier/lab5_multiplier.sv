module state_flow(
						input Clk,
						input Reset,
						input Load,
						input Compute,
						input M,
						output logic reset_now,
						output logic Shift,
						output logic clearA_loadB,
						output logic Load_A,
						output logic plus, 
						output logic minus,
						output logic done,
						output logic Continue
						
						);
						
enum logic [4:0]{None, RS, Ld,Begin, End, S1, S2, S3, S4,
						S5, S6, S7,S8, A1, A2, A3, A4, A5, A6,
						A7,A8, ContinueS ,temp } now, next;

always_ff @(posedge Clk )
	begin 
		if(Reset==0)
			now <= next;
		else
			now = RS;
	end
	

						
always_comb 
	begin 
		next = now;
		unique case(now)
		
                  None:
                  		if(Compute==1)
                  			next = Begin;
                  		else if(Load ==1)
									 if(Reset==0)
									   next= RS;
									 else
										next=Ld;
									
							
								
                  RS  :
                  		   next = Ld; 
                  
                  Ld:
                  			next = None;
                  			
                  			
                  			
                  Begin:
                  			next= A1;
                  A1:
                  			next= S1;
                  S1:
                  			next= A2;
                  
                  A2:
                  			next= S2;
                  S2:
                  			next= A3;
                  
                  A3:
                  			next= S3;
                  S3:
                  			next= A4;
                  
                  A4:
                  			next= S4;
                  S4:
                  			next= A5;
                  			
                  A5:
                  			next= S5;
                  S5:
                  			next= A6;
                  			
                  A6:
                  			next= S6;
                  S6:
                  			next= A7;
                  A7:
                  			next= S7;
                  S7:
						begin
							if(M==0)
								next = S8;
							else
								next = A8;
						end
                  			
						A8:
									next= S8;
						S8:
									next = End;
						End:
						begin
							if (Compute == 0)
								next = temp;
							else
								next = End;
						end
                  
						temp:
						begin
							if (Compute == 1)
								next = ContinueS;
							else
								next = temp;
						end
						
						
						ContinueS:
							
								next=None;
						
									
			endcase
end


always_comb
begin 
			case(now)
						None: 
							begin
									reset_now = 1'b0;
                           Shift		 = 1'b0;
                           clearA_loadB		 = 1'b0;
									Load_A    = 1'b0;
                           plus 		 = 1'b0;
                           minus     = 1'b0;
                           done		 = 1'b0;
									Continue  =1'b0;
						   end			
								
							ContinueS: 
							begin
									reset_now = 1'b0;
                           Shift		 = 1'b0;
                           clearA_loadB		 = 1'b0;
									Load_A    = 1'b1;
                           plus 		 = 1'b0;
                           minus     = 1'b0;
                           done		 = 1'b0;
									Continue  =1'b1;
						   end	
					temp: 
							begin
									reset_now = 1'b0;
                           Shift		 = 1'b0;
                           clearA_loadB		 = 1'b0;
									Load_A    = 1'b0;
                           plus 		 = 1'b0;
                           minus     = 1'b0;
                           done		 = 1'b0;
									Continue  =1'b0;
						   end				
									
						RS:
							begin
									reset_now = 1'b1;
                           Shift		 = 1'b0;
                           clearA_loadB		 = 1'b0;
									Load_A    = 1'b0;								
                           plus 		 = 1'b0;
                           minus     = 1'b0;
                           done		 = 1'b0;
									Continue  =1'b0;
									
							end
							
						Ld:
							begin
									reset_now = 1'b0;
                           Shift		 = 1'b0;
                           clearA_loadB		 = 1'b1;
									Load_A    = 1'b0;
                           plus 		 = 1'b0;
                           minus     = 1'b0;
                           done		 = 1'b0;
									Continue  =1'b0;

							end
							
						Begin:
							begin
									reset_now = 1'b0;
                           Shift		 = 1'b0;
                           clearA_loadB		 = 1'b0;
									Load_A    = 1'b0;
                           plus 		 = 1'b0;
                           minus     = 1'b0;
                           done		 = 1'b0;
									Continue  =1'b0;
							
							end
							
						End:
							begin
									reset_now = 1'b0;
                           Shift		 = 1'b0;
                           clearA_loadB		 = 1'b0;
									Load_A    = 1'b0;
                           plus 		 = 1'b0;
                           minus     = 1'b0;
                           done		 = 1'b1;
									Continue  =1'b0;
							end
							
						A1, A2, A3, A4, A5, A6, A7:
							begin
									reset_now = 1'b0;
                           Shift		 = 1'b0;
                           clearA_loadB		 = 1'b0;
									
									Load_A    = 1'b0;
									plus		 = 1'b0;
                           minus     = 1'b0;
                           done		 = 1'b0;
									Continue  =1'b0;
									if(M==1)
										
										Load_A    = 1'b1;
									else
										Load_A    = 1'b0;
							end
								
								
						A8:
							begin
									reset_now = 1'b0;
                           Shift		 = 1'b0;
                           clearA_loadB		 = 1'b0;
									Load_A    = 1'b0;
										plus    = 1'b0;
										Continue  =1'b0;
									if(M==1)
									begin
										plus 		 = 1'b1;
										Load_A    = 1'b1;
									end
										
                           minus     = 1'b1;
                           done		 = 1'b0;
							
							end
							
							
						S1, S2, S3, S4, S5, S6, S7,S8:
							begin
									reset_now = 1'b0;
                           Shift		 = 1'b1;
                           clearA_loadB		 = 1'b0;
									Load_A    = 1'b0;
                           plus 		 = 1'b0;
                           minus     = 1'b0;
                           done		 = 1'b0;
									Continue  =1'b0;
							end
							
							
						default:
							begin
									reset_now = 1'b0;
                           Shift		 = 1'b0;
                           clearA_loadB		 = 1'b0;
									Load_A    = 1'b0;
                           plus 		 = 1'b0;
                           minus     = 1'b0;
                           done		 = 1'b0;
									Continue  =1'b0;
							end
			endcase
							
end							
							
endmodule									
						
						
									