module testbench(); 
timeunit 10ns; // Half clock cycle at 50 MHz 
// This is the amount of time represented by #1 
timeprecision 1ns; 
// These signals are internal because the processor will be 
// instantiated as a submodule in testbench. 
logic CLK ; 
logic RESET ; 
					// Avalon-MM Chip Select 
 logic AES_START;
 logic AES_DONE;
 logic [127:0] AES_MSG_ENC; 
 logic [127:0] key; 
 logic [127:0] AES_KEY ; 
logic [127:0] inv_addroundkey_out;
 static int i = 0; 
logic [5:0]LoopRounds_counter;
logic [31:0]now[16];
 // Instantiating 
 AES aes(.*); 
 

 // Toggle the clock 
 // #1 means wait for a delay of 1 timeunit 
 always begin : CLOCK_GENERATION 
 #1 CLK = ~CLK; 
 end 
 initial begin: CLOCK_INITIALIZATION 
 	CLK = 0; 
 end 
 // Testing begins here 
 // The initial block is not synthesizable 
 // Everything happens sequentially inside an initial block 
 // as in a software program 
 initial begin: TEST_VECTORS 
# 3 AES_MSG_ENC = 128'h439d619920ce415661019634f59fcf63; 
# 3  AES_KEY =    128'h3b280014beaac269d613a16bfdc2be03; 
# 3  RESET = 1;
# 3  RESET = 0 ;
# 3  AES_START=0;
# 3  AES_START=1;

 
  end
endmodule

