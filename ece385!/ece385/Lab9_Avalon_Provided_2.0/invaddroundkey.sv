module Invaddroundkey(
input logic [127:0]key,
input logic [3:0]round,
input logic [1407:0]keyschedule,
output logic[127:0]key_out

);

always_comb
	begin 
		case(round)
			4'b0000:
					key_out =key ^ keyschedule[(128*10+127):(128*10)];
			4'b0001:
					key_out =key ^ keyschedule[(128*9+127):(128*9)];
			4'b0010:
					key_out =key ^ keyschedule[(128*8+127):(128*8)];
			4'b0011:
					key_out =key ^ keyschedule[(128*7+127):(128*7)];
			4'b0100:
					key_out =key ^ keyschedule[(128*6+127):(128*6)];
			4'b0101:
					key_out =key ^ keyschedule[(128*5+127):(128*5)];
			4'b0110:
					key_out =key ^ keyschedule[(128*4+127):(128*4)];
			4'b0111:
					key_out =key ^ keyschedule[(128*3+127):(128*3)];
			4'b1000:
					key_out =key ^ keyschedule[(128*2+127):(128*2)];	

			4'b1001:
					key_out =key ^ keyschedule[(128*1+127):(128*1)];	
			
			4'b1010:
					key_out =key ^ keyschedule[(128*0+127):(128*0)];	
			default:
					key_out =key ^ keyschedule[(128*10+127):(128*10)];
		endcase
	end
endmodule 
