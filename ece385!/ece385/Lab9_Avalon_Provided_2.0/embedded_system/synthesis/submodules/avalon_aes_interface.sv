	/************************************************************************
Avalon-MM Interface for AES Decryption IP Core

Dong Kai Wang, Fall 2017

For use with ECE 385 Experiment 9
University of Illinois ECE Department

Register Map:

 0-3 : 4x 32bit AES Key
 4-7 : 4x 32bit AES Encrypted Message
 8-11: 4x 32bit AES Decrypted Message
   12: Not Used
	13: Not Used
   14: 32bit Start Register
   15: 32bit Done Register

************************************************************************/

module avalon_aes_interface (
	// Avalon Clock Input
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,						// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,		// Avalon-MM Byte Enable
	input  logic [3:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,	// Avalon-MM Read Data
	
	// Exported Conduit
	output logic [31:0] EXPORT_DATA		// Exported Conduit Signal to LEDs
);

	logic [31:0]register[16];
	logic AES_DONE;
	logic [127:0]key;
	/*
always_ff@(posedge CLK)
	begin
		if(RESET)
			begin
				for(int i =0 ; i<16; i=i+1)
					register[i] <=0;
			end
		else if (AVL_WRITE && AVL_CS)
			begin
				 case(AVL_BYTE_EN)
					4'b1111:
								register[AVL_ADDR][31:0] <= AVL_WRITEDATA[31:0];
				
					4'b1100:
								register[AVL_ADDR][31:16] <= AVL_WRITEDATA[31:16];
								
					4'b0011:
								register[AVL_ADDR][15:0] <= AVL_WRITEDATA[15:0];
								
					4'b1000:
								register[AVL_ADDR][31:24] <= AVL_WRITEDATA[31:24];
					
					4'b0100:
								register[AVL_ADDR][23:16] <= AVL_WRITEDATA[23:16];
					
					4'b0010:
								register[AVL_ADDR][15:8] <= AVL_WRITEDATA[15:8];
					
					
					4'b0001:
								register[AVL_ADDR][7:0] <= AVL_WRITEDATA[7:0];
					
					
						
				endcase
				
			end
///week two 


					
	end*/
AES AES_unit(
	 .CLK(CLK),
	 .RESET(RESET),
	 .AES_START(register[14]),
	 .AES_DONE(AES_DONE),
	 .AES_KEY({register[3],register[2],register[1],register[0]}),
	 .AES_MSG_ENC({register[7],register[6],register[5],register[4]}),
	 .key(key)
	 

);
	
	assign AVL_READDATA = (AVL_READ && AVL_CS) ? register[AVL_ADDR] : 32'b0;
	
	assign EXPORT_DATA  =  {register[0][31:16],register[3][15:0]};

 always_ff @ (posedge CLK) begin:REGISTER_FILE 
		 
	if(RESET) 
		for(int i = 0; i< 16; i++) 
				register[i] <= 0; 
				
	else if(AVL_WRITE && AVL_CS) begin: SW_WRITE_TO_REG 
	
	
		case(AVL_BYTE_EN) 
			4'b1111 :  
				register[AVL_ADDR][ 31:0] <= AVL_WRITEDATA[ 31:0];
				
			4'b1100 : 
				register[AVL_ADDR][31:16] <= AVL_WRITEDATA[31:16]; 
				
			4'b0011 : 
				register[AVL_ADDR][ 15:0] <= AVL_WRITEDATA[ 15:0]; 
				
			4'b1000 : 
				register[AVL_ADDR][ 31:24] <= AVL_WRITEDATA[ 31:24]; 
				
			4'b0100 : 
				register[AVL_ADDR][ 23:16] <= AVL_WRITEDATA[ 23:16]; 
				
			4'b0010 : 
				register[AVL_ADDR][ 15:8] <= AVL_WRITEDATA[ 15:8]; 
				
			4'b0001 : 
				register[AVL_ADDR][ 7:0] <= AVL_WRITEDATA[ 7:0]; 
			
	
	
		endcase 
	
	
	end 

	
	else if(AES_DONE) begin: HW_WRITE_TO_REG 
		 register[11] <= key[127:96]; 
		  register[10] <= key[95:64]; 
		  register[9] <= key[63:32]; 
		  register[8] <= key[31:0]; 

		  register[15] <= AES_DONE; 
       
		  
		  
end 


end



	
endmodule
