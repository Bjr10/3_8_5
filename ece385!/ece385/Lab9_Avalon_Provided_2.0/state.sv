module state(
input logic Clk,
input logic reset,
input logic AES_START,
output logic AES_DONE,
output logic  inv_addroundkey_enable,
output logic  inv_shiftrow_enable,
output logic  inv_mixcolumn_enable,
output logic  inv_subbyte_enable,
input logic [31:0]key_out,key_in,
//output logic  update_enable,
output logic  Initial_enable,
output logic [3:0]round,block,
output logic [127:0]inv_mixcolumn_out,
output logic [31:0]register[4],
input logic [127:0]key,
output logic [127:0]AES_MSG_DEC
);

logic [5:0]KeyExpansion_counter;
logic [1:0]FinalRound_counter;

enum logic [6:0] {  		idle,
								init, 
                        KeyEx, 
 								loop_start, 
 								loop_ten_1_1,
								loop_ten_1_2,
								loop_ten_1_3,
								loop_ten_1_4_1, 
								loop_ten_1_4_2,
								loop_ten_1_4_3,
								loop_ten_1_4_4,
								loop_ten_1_4_5,
								
								loop_ten_2_1,
								loop_ten_2_2,
								loop_ten_2_3,
								loop_ten_2_4_1, 
								loop_ten_2_4_2,
								loop_ten_2_4_3,
								loop_ten_2_4_4,
								loop_ten_2_4_5,
								
								loop_ten_3_1,
								loop_ten_3_2,
								loop_ten_3_3,
								loop_ten_3_4_1, 
								loop_ten_3_4_2,
								loop_ten_3_4_3,
								loop_ten_3_4_4,
								loop_ten_3_4_5,
								
								loop_ten_4_1,
								loop_ten_4_2,
								loop_ten_4_3,
								loop_ten_4_4_1, 
								loop_ten_4_4_2,
								loop_ten_4_4_3,
								loop_ten_4_4_4,
								loop_ten_4_4_5,
								
								loop_ten_5_1,
								loop_ten_5_2,
								loop_ten_5_3,
								loop_ten_5_4_1, 
								loop_ten_5_4_2,
								loop_ten_5_4_3,
								loop_ten_5_4_4,
								loop_ten_5_4_5,
								
								loop_ten_6_1,
								loop_ten_6_2,
								loop_ten_6_3,
								loop_ten_6_4_1, 
								loop_ten_6_4_2,
								loop_ten_6_4_3,
								loop_ten_6_4_4,
								loop_ten_6_4_5,
								
								loop_ten_7_1,
								loop_ten_7_2,
								loop_ten_7_3,
								loop_ten_7_4_1, 
								loop_ten_7_4_2,
								loop_ten_7_4_3,
								loop_ten_7_4_4,
								loop_ten_7_4_5,
								
								loop_ten_8_1,
								loop_ten_8_2,
								loop_ten_8_3,
								loop_ten_8_4_1, 
								loop_ten_8_4_2,
								loop_ten_8_4_3,
								loop_ten_8_4_4,
								loop_ten_8_4_5,
								
								loop_ten_9_1,
								loop_ten_9_2,
								loop_ten_9_3,
								loop_ten_9_4_1, 
								loop_ten_9_4_2,
								loop_ten_9_4_3,
								loop_ten_9_4_4,
								loop_ten_9_4_5,
								loop_ten_10_1,
								loop_ten_10_2,
								loop_ten_10_3,
								
 								//loop_end, 
 								over 
								}   State, Next_state;  
								


								
								
always_ff @ (posedge Clk) 
begin 
	if (reset) 
		State <= idle; 
	else
		State<=Next_state;
		//inv_mixcolumn_out  ^= key;
end 
/*
always_ff @ (posedge Clk) begin:REGISTER_FILE 
	if(reset) 
		for(int i = 0; i< 4; i++) 
				register[i] <= 0; 
				
	else 
		begin: SW_WRITE_TO_REG 
	
	
		case(block) 
			2'b11 :  
				register[3][ 31:0] <= 4'b0101;
				
			2'b10 : 
				register[2][31:0] <= key_out; 
				
			2'b01 : 
				register[1][31:0] <= key_out; 
				
			2'b00 : 
				register[0][31:0] <= key_out; 
				
			
	
	
		endcase 
	
	
	end 
end
*/			


 								
always_comb
//always_ff @ (posedge Clk)  
 begin 
	Next_state= State;
				AES_MSG_DEC=0;
				inv_mixcolumn_out =key;
				AES_DONE= 0;
				Initial_enable =0;
				inv_shiftrow_enable = 0; 
		
				inv_subbyte_enable = 0; 
					
				inv_addroundkey_enable = 0; 
					
				inv_mixcolumn_enable = 0; 	
				
				KeyExpansion_counter = 0; 
				
				FinalRound_counter= 0;
				round =4'b0000;;
				block= 2'b0;
				//inv_mixcolumn_out=0;
		
				
				//MixColumn_counter<= 0; 
				//SubByte_counter<= 0; 

	
	case (State) 


		idle : 
		begin 
			if (AES_START) Next_state = init; 
			else Next_state = idle; 
		end 


		init: 
		begin 
			Next_state = KeyEx; 
		
		end 


		KeyEx : 
		begin 

					Next_state = loop_start; 
			end


		loop_start : 
		begin 
				Next_state = loop_ten_1_1; 
		end 
		
//1		
		loop_ten_1_1:
		begin
				Next_state = loop_ten_1_2;
		end
		
		
		loop_ten_1_2:
		begin
				Next_state = loop_ten_1_3;
		end	
		
		
		loop_ten_1_3:
		begin
				Next_state = loop_ten_1_4_1;
			
		end	
		
		
		loop_ten_1_4_1:
		begin
				Next_state = loop_ten_1_4_2;
		end	
		
		
		loop_ten_1_4_2:
		begin
				Next_state = loop_ten_1_4_3;
		end	
		
		
		loop_ten_1_4_3:
		begin
				Next_state = loop_ten_1_4_4;
		end	
		
		
		loop_ten_1_4_4:
		begin
				Next_state = loop_ten_1_4_5;
		end	
		loop_ten_1_4_5:
		begin
				Next_state = loop_ten_2_1;
		end
		
//2

loop_ten_2_1:
		begin
				Next_state = loop_ten_2_2;
		end
		
		
		loop_ten_2_2:
		begin
				Next_state = loop_ten_2_3;
		end
	
	
		loop_ten_2_3:
		begin
				Next_state = loop_ten_2_4_1;
		
		end
	
	
		loop_ten_2_4_1:
		begin
				Next_state = loop_ten_2_4_2;
		end
	
	
		loop_ten_2_4_2:
		begin
				Next_state = loop_ten_2_4_3;
		end
	
	
		loop_ten_2_4_3:
		begin
				Next_state = loop_ten_2_4_4;
		end
	
	
		loop_ten_2_4_4:
		begin
				Next_state = loop_ten_2_4_5;
		end	
		loop_ten_2_4_5:
		begin
				Next_state = loop_ten_3_1;
		end
		
//3
		loop_ten_3_1:
		begin
				Next_state = loop_ten_3_2;
		end
		
		
		loop_ten_3_2:
		begin
				Next_state = loop_ten_3_3;
		end	
		
		
		loop_ten_3_3:
		begin
				Next_state = loop_ten_3_4_1;
			
		end	
		
		
		loop_ten_3_4_1:
		begin
				Next_state = loop_ten_3_4_2;
		end	
		
		
		loop_ten_3_4_2:
		begin
				Next_state = loop_ten_3_4_3;
		end	
		
		
		loop_ten_3_4_3:
		begin
				Next_state = loop_ten_3_4_4;
		end	
		
		
		loop_ten_3_4_4:
		begin
				Next_state = loop_ten_3_4_5;
		end	
		loop_ten_3_4_5:
		begin
				Next_state = loop_ten_4_1;
		end
//4
		loop_ten_4_1:
		begin
				Next_state = loop_ten_4_2;
		end
		
		
		loop_ten_4_2:
		begin
				Next_state = loop_ten_4_3;
		end	
		
		
		loop_ten_4_3:
		begin
				Next_state = loop_ten_4_4_1;
			
		end	
		
		
		loop_ten_4_4_1:
		begin
				Next_state = loop_ten_4_4_2;
		end	
		
		
		loop_ten_4_4_2:
		begin
				Next_state = loop_ten_4_4_3;
		end	
		
		
		loop_ten_4_4_3:
		begin
				Next_state = loop_ten_4_4_4;
		end	
		
		
		loop_ten_4_4_4:
		begin
				Next_state = loop_ten_4_4_5;
		end	
		loop_ten_4_4_5:
		begin
				Next_state = loop_ten_5_1;
		end
//5
		loop_ten_5_1:
		begin
				Next_state = loop_ten_5_2;
		end
		
		
		loop_ten_5_2:
		begin
				Next_state = loop_ten_5_3;
		end	
		
		
		loop_ten_5_3:
		begin
				Next_state = loop_ten_5_4_1;
			
		end	
		
		
		loop_ten_5_4_1:
		begin
				Next_state = loop_ten_5_4_2;
		end	
		
		
		loop_ten_5_4_2:
		begin
				Next_state = loop_ten_5_4_3;
		end	
		
		
		loop_ten_5_4_3:
		begin
				Next_state = loop_ten_5_4_4;
		end	
		
		
		loop_ten_5_4_4:
		begin
				Next_state = loop_ten_5_4_5;
		end	
		loop_ten_5_4_5:
		begin
				Next_state = loop_ten_6_1;
		end
//6
		loop_ten_6_1:
		begin
				Next_state = loop_ten_6_2;
		end
		
		
		loop_ten_6_2:
		begin
				Next_state = loop_ten_6_3;
		end	
		
		
		loop_ten_6_3:
		begin
				Next_state = loop_ten_6_4_1;
			
		end	
		
		
		loop_ten_6_4_1:
		begin
				Next_state = loop_ten_6_4_2;
		end	
		
		
		loop_ten_6_4_2:
		begin
				Next_state = loop_ten_6_4_3;
		end	
		
		
		loop_ten_6_4_3:
		begin
				Next_state = loop_ten_6_4_4;
		end	
		
		
		loop_ten_6_4_4:
		begin
				Next_state = loop_ten_6_4_5;
		end	
		loop_ten_6_4_5:
		begin
				Next_state = loop_ten_7_1;
		end
//7	
		loop_ten_7_1:
		begin
				Next_state = loop_ten_7_2;
		end
		
		
		loop_ten_7_2:
		begin
				Next_state = loop_ten_7_3;
		end	
		
		
		loop_ten_7_3:
		begin
				Next_state = loop_ten_7_4_1;
			
		end	
		
		
		loop_ten_7_4_1:
		begin
				Next_state = loop_ten_7_4_2;
		end	
		
		
		loop_ten_7_4_2:
		begin
				Next_state = loop_ten_7_4_3;
		end	
		
		
		loop_ten_7_4_3:
		begin
				Next_state = loop_ten_7_4_4;
		end	
		
		
		loop_ten_7_4_4:
		begin
				Next_state = loop_ten_7_4_5;
		end	
		loop_ten_7_4_5:
		begin
				Next_state = loop_ten_8_1;
		end
		
//8
		loop_ten_8_1:
		begin
				Next_state = loop_ten_8_2;
		end
		
		
		loop_ten_8_2:
		begin
				Next_state = loop_ten_8_3;
		end	
		
		
		loop_ten_8_3:
		begin
				Next_state = loop_ten_8_4_1;
			
		end	
		
		
		loop_ten_8_4_1:
		begin
				Next_state = loop_ten_8_4_2;
		end	
		
		
		loop_ten_8_4_2:
		begin
				Next_state = loop_ten_8_4_3;
		end	
		
		
		loop_ten_8_4_3:
		begin
				Next_state = loop_ten_8_4_4;
		end	
		
		
		loop_ten_8_4_4:
		begin
				Next_state = loop_ten_8_4_5;
		end	
		loop_ten_8_4_5:
		begin
				Next_state = loop_ten_9_1;
		end
//9	
		loop_ten_9_1:
		begin
				Next_state = loop_ten_9_2;
		end
		
		
		loop_ten_9_2:
		begin
				Next_state = loop_ten_9_3;
		end	
		
		
		loop_ten_9_3:
		begin
				Next_state = loop_ten_9_4_1;
			
		end	
		
		
		loop_ten_9_4_1:
		begin
				Next_state = loop_ten_9_4_2;
		end	
		
		
		loop_ten_9_4_2:
		begin
				Next_state = loop_ten_9_4_3;
		end	
		
		
		loop_ten_9_4_3:
		begin
				Next_state = loop_ten_9_4_4;
		end	
		
		loop_ten_9_4_4:
		begin
				Next_state = loop_ten_9_4_5;
		end	
		loop_ten_9_4_5:
		begin
				Next_state = loop_ten_10_1;
		end
		
		loop_ten_10_1:
		begin
				Next_state = loop_ten_10_2;
		end
		
		
		loop_ten_10_2:
		begin
				Next_state = loop_ten_10_3;
		end	
		
		
		loop_ten_10_3:
		begin
				Next_state = over;//loop_end;
			
		end	
		
		
		
//		loop_end : 
//		begin 
//			Next_state=over;
//		end 


		over : 
		begin 

			if (AES_START) 
				begin
					Next_state = over; 
				end
			else
				begin
					Next_state = idle; 
				end
		end 
		
		default:;
		
	endcase 
	
	
	
	case (State) 
		idle:AES_DONE=0;
			
			
		init:
			begin
					Initial_enable = 1; 
			end
		
		KeyEx : 
			begin
				KeyExpansion_counter <= KeyExpansion_counter + 1; 
			end
			
		loop_start:	
			begin
				inv_addroundkey_enable = 1;
				round=10;
			end
		
		loop_ten_1_1:
		begin
			inv_shiftrow_enable = 1;
			
		end	


		loop_ten_1_2:
		begin
			inv_subbyte_enable = 1;
			
		end	
		
		
		loop_ten_1_3:
		begin
			inv_addroundkey_enable = 1;
      	round=9;

		end	
		
		
		loop_ten_1_4_1:
		begin
			block=2'b11;
			inv_mixcolumn_enable = 1;
			inv_mixcolumn_out[127:96]=key_out;
		
		end	
		
		loop_ten_1_4_2:
		begin
				block=2'b10;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[95:64]=key_out;
				
		end
		
		loop_ten_1_4_3:
		begin
				block=2'b01;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[63:32]=key_out;
				
		end
		
		loop_ten_1_4_4:
		begin

				block=2'b00;
				inv_mixcolumn_enable = 1;				
				inv_mixcolumn_out[31:0]=key_out;
					
		end
		loop_ten_1_4_5:
		begin
			
				
					
		end
		
//2
loop_ten_2_1:
		begin
			inv_shiftrow_enable = 1;
			
		end	


		loop_ten_2_2:
		begin
			inv_subbyte_enable = 1;
			
		end	
		
		
		loop_ten_2_3:
		begin
			inv_addroundkey_enable = 1;
      	round=8;

		end	
		
		
		loop_ten_2_4_1:
		begin
			block=2'b11;
			inv_mixcolumn_enable = 1;
			inv_mixcolumn_out[127:96]=key_out;
		
		end	
		
		loop_ten_2_4_2:
		begin
				block=2'b10;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[95:64]=key_out;
				
		end
		
		loop_ten_2_4_3:
		begin
				block=2'b01;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[63:32]=key_out;
				
		end
		
		loop_ten_2_4_4:
		begin

				block=2'b00;
				inv_mixcolumn_enable = 1;				
				inv_mixcolumn_out[31:0]=key_out;
					
		end
		loop_ten_2_4_5:
		begin
			
				
					
		end
		
		
//3

loop_ten_3_1:
		begin
			inv_shiftrow_enable = 1;
			
		end	


		loop_ten_3_2:
		begin
			inv_subbyte_enable = 1;
			
		end	
		
		
		loop_ten_3_3:
		begin
			inv_addroundkey_enable = 1;
      	round=7;

		end	
		
		
		loop_ten_3_4_1:
		begin
			block=2'b11;
			inv_mixcolumn_enable = 1;
			inv_mixcolumn_out[127:96]=key_out;
		
		end	
		
		loop_ten_3_4_2:
		begin
				block=2'b10;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[95:64]=key_out;
				
		end
		
		loop_ten_3_4_3:
		begin
				block=2'b01;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[63:32]=key_out;
				
		end
		
		loop_ten_3_4_4:
		begin

				block=2'b00;
				inv_mixcolumn_enable = 1;				
				inv_mixcolumn_out[31:0]=key_out;
					
		end
		loop_ten_3_4_5:
		begin
			
				
					
		end
//4		
loop_ten_4_1:
		begin
			inv_shiftrow_enable = 1;
			
		end	


		loop_ten_4_2:
		begin
			inv_subbyte_enable = 1;
			
		end	
		
		
		loop_ten_4_3:
		begin
			inv_addroundkey_enable = 1;
      	round=6;

		end	
		
		
		loop_ten_4_4_1:
		begin
			block=2'b11;
			inv_mixcolumn_enable = 1;
			inv_mixcolumn_out[127:96]=key_out;
		
		end	
		
		loop_ten_4_4_2:
		begin
				block=2'b10;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[95:64]=key_out;
				
		end
		
		loop_ten_4_4_3:
		begin
				block=2'b01;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[63:32]=key_out;
				
		end
		
		loop_ten_4_4_4:
		begin

				block=2'b00;
				inv_mixcolumn_enable = 1;				
				inv_mixcolumn_out[31:0]=key_out;
					
		end
		loop_ten_4_4_5:
		begin
			
				
					
		end
//5
loop_ten_5_1:
		begin
			inv_shiftrow_enable = 1;
			
		end	


		loop_ten_5_2:
		begin
			inv_subbyte_enable = 1;
			
		end	
		
		
		loop_ten_5_3:
		begin
			inv_addroundkey_enable = 1;
      	round=5;

		end	
		
		
		loop_ten_5_4_1:
		begin
			block=2'b11;
			inv_mixcolumn_enable = 1;
			inv_mixcolumn_out[127:96]=key_out;
		
		end	
		
		loop_ten_5_4_2:
		begin
				block=2'b10;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[95:64]=key_out;
				
		end
		
		loop_ten_5_4_3:
		begin
				block=2'b01;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[63:32]=key_out;
				
		end
		
		loop_ten_5_4_4:
		begin

				block=2'b00;
				inv_mixcolumn_enable = 1;				
				inv_mixcolumn_out[31:0]=key_out;
					
		end
		loop_ten_5_4_5:
		begin
			
				
					
		end
//6

loop_ten_6_1:
		begin
			inv_shiftrow_enable = 1;
			
		end	


		loop_ten_6_2:
		begin
			inv_subbyte_enable = 1;
			
		end	
		
		
		loop_ten_6_3:
		begin
			inv_addroundkey_enable = 1;
      	round=4;

		end	
		
		
		loop_ten_6_4_1:
		begin
			block=2'b11;
			inv_mixcolumn_enable = 1;
			inv_mixcolumn_out[127:96]=key_out;
		
		end	
		
		loop_ten_6_4_2:
		begin
				block=2'b10;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[95:64]=key_out;
				
		end
		
		loop_ten_6_4_3:
		begin
				block=2'b01;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[63:32]=key_out;
				
		end
		
		loop_ten_6_4_4:
		begin

				block=2'b00;
				inv_mixcolumn_enable = 1;				
				inv_mixcolumn_out[31:0]=key_out;
					
		end
		loop_ten_6_4_5:
		begin
			
				
					
		end

		//7
loop_ten_7_1:
		begin
			inv_shiftrow_enable = 1;
			
		end	


		loop_ten_7_2:
		begin
			inv_subbyte_enable = 1;
			
		end	
		
		
		loop_ten_7_3:
		begin
			inv_addroundkey_enable = 1;
      	round=3;

		end	
		
		
		loop_ten_7_4_1:
		begin
			block=2'b11;
			inv_mixcolumn_enable = 1;
			inv_mixcolumn_out[127:96]=key_out;
		
		end	
		
		loop_ten_7_4_2:
		begin
				block=2'b10;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[95:64]=key_out;
				
		end
		
		loop_ten_7_4_3:
		begin
				block=2'b01;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[63:32]=key_out;
				
		end
		
		loop_ten_7_4_4:
		begin

				block=2'b00;
				inv_mixcolumn_enable = 1;				
				inv_mixcolumn_out[31:0]=key_out;
					
		end
		loop_ten_7_4_5:
		begin
			
				
					
		end
//8

loop_ten_8_1:
		begin
			inv_shiftrow_enable = 1;
			
		end	


		loop_ten_8_2:
		begin
			inv_subbyte_enable = 1;
			
		end	
		
		
		loop_ten_8_3:
		begin
			inv_addroundkey_enable = 1;
      	round=2;

		end	
		
		
		loop_ten_8_4_1:
		begin
			block=2'b11;
			inv_mixcolumn_enable = 1;
			inv_mixcolumn_out[127:96]=key_out;
		
		end	
		
		loop_ten_8_4_2:
		begin
				block=2'b10;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[95:64]=key_out;
				
		end
		
		loop_ten_8_4_3:
		begin
				block=2'b01;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[63:32]=key_out;
				
		end
		
		loop_ten_8_4_4:
		begin

				block=2'b00;
				inv_mixcolumn_enable = 1;				
				inv_mixcolumn_out[31:0]=key_out;
					
		end
		loop_ten_8_4_5:
		begin
			
				
					
		end

//9
loop_ten_9_1:
		begin
			inv_shiftrow_enable = 1;
			
		end	


		loop_ten_9_2:
		begin
			inv_subbyte_enable = 1;
			
		end	
		
		
		loop_ten_9_3:
		begin
			inv_addroundkey_enable = 1;
      	round=1;

		end	
		
		
		loop_ten_9_4_1:
		begin
			block=2'b11;
			inv_mixcolumn_enable = 1;
			inv_mixcolumn_out[127:96]=key_out;
		
		end	
		
		loop_ten_9_4_2:
		begin
				block=2'b10;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[95:64]=key_out;
				
		end
		
		loop_ten_9_4_3:
		begin
				block=2'b01;
				inv_mixcolumn_enable = 1;
				inv_mixcolumn_out[63:32]=key_out;
				
		end
		
		loop_ten_9_4_4:
		begin

				block=2'b00;
				inv_mixcolumn_enable = 1;				
				inv_mixcolumn_out[31:0]=key_out;
					
		end
		loop_ten_9_4_5:
		begin
			
				
					
		end	
	
loop_ten_10_1:
		begin
			inv_shiftrow_enable = 1;
			
		end	


		loop_ten_10_2:
		begin
			inv_subbyte_enable = 1;
			
		end	
		
		
		loop_ten_10_3:
		begin
			inv_addroundkey_enable = 1;
      	round=0;

		end		
/*	
		loop_ten : 
			begin 	
						Initial_enable = 1; 
						inv_shiftrow_enable = 0; 
						inv_subbyte_enable = 0; 
						inv_addroundkey_enable = 0; 
						inv_mixcolumn_enable = 0;
				case (LoopRounds_counter % 4) 
					0: 
						begin
						inv_shiftrow_enable = 1; 
						 
						LoopRounds_counter<= LoopRounds_counter+1;
						end
					1: 
						begin
						
						inv_subbyte_enable = 1; 
						 
						LoopRounds_counter<= LoopRounds_counter+1;
						end
					2: 
						begin
						
						inv_addroundkey_enable = 1;  
						round = 4'b1010-(LoopRounds_counter/4'b0100);
						LoopRounds_counter<= LoopRounds_counter+1;
						end
					3: 
						begin
						 
						inv_mixcolumn_enable = 1; 
						LoopRounds_counter<= LoopRounds_counter+1;

						end
				endcase 
				
					
			end 
			
	*/	
			

//		loop_end : 
//			begin 
//				case (FinalRound_counter) 
//				0: 
//					inv_shiftrow_enable = 1; 
//				1: 
//					inv_subbyte_enable = 1; 
//				2: 
//				 
//					inv_addroundkey_enable = 1; 
//
//				endcase 
//				
//				//FinalRound_counter <= FinalRound_counter + 1; 
//			end 
			
			
		 over : 
			begin 
				AES_MSG_DEC	=inv_mixcolumn_out;
		 	   AES_DONE = 1; 
			end 


		default : ;
		
		
	endcase
	
end 




endmodule
