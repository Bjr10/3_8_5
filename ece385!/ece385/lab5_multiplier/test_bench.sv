module testbench();

timeunit 10ns;

timeprecision 1ns;

			logic [7:0] S;
			logic	Clk;
			logic Reset;
			logic Run;
			logic Load;
		   logic [6:0] AhexU, AhexL, BhexU, BhexL;
		   logic [7:0] Aval, Bval;
		   logic [8:0] Sum;



always begin: CLOCK_GENERATION

#1 Clk = ~Clk;

end


initial begin : CLOCK_INITIALIZATION 
 Clk = 0; 
end


toplevel tp(.*);


initial begin: TEST_VECTORS

Reset = 0;
Load = 1;
Run = 1;


//test case 1
#2 Reset = 1;


 S = 8'b11111000; 
 
#2 Load = 0;
#2 Load = 1;

 S = 8'b11111110;

#2 Run = 0;
#2 Run = 1;

#42;


end
endmodule
