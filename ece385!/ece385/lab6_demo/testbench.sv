module testbench(); 


timeunit 10ns;  


timeprecision 1ns; 



logic [15:0] S; 
logic Clk, Reset, Run, Continue; 
logic [19:0]  ADDR; 
 logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7; 
 logic [11:0] LED; 
 logic CE, UB, LB, OE, WE;
wire  [15:0] Data;



 always begin : CLOCK_GENERATION 
 

 
 #1 Clk = ~Clk; 
 

 end 
 

 initial begin : CLOCK_INITIALIZATION  
 	Clk = 0; 
 end  
 

slc3 my_slc(.*);
 

 initial begin : TEST_VECTORS 
 	 
 	Continue = 1; 
 	Run = 1; 
 	Reset = 0;
	S =      16'b0000000000000011;
	 //S = 4'h002a;
	#2 Reset = 1;
	#2 Run =  0;	
 	
	#100 Continue = 0;
	#10   Continue = 1;
	
	#500 S = 16'b0000000000000001;
	
	#100 Continue = 0;
	#10   Continue = 1;
	#500 S = 16'b0000000000000001; 
	
	#100 Continue = 0;
	#10   Continue = 1;
	
	
//	#100 Continue = 0;
//	#10   Continue = 1;
//	
//	#1000 Continue = 0;
//	#10   Continue = 1;
//	
//	#1000 Continue = 0;
//	#10   Continue = 1;

	

	
	
	
	

end
 	 
  
endmodule
