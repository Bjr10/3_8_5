module ripple_adder
(
    input   logic[7:0]     A,
    input   logic[7:0]     B,
	 input 	logic control_signal,
	 input  	logic Continue,
    output  logic[8:0]     Sum
   // output  logic           CO
);


	logic temp1, temp2;
	logic [7:0]B_mux;
	logic [7:0]A_mux;
	
			assign B_mux=((B^{8{control_signal}})&{8{~Continue}});
			assign A_mux =   (A&{8{~Continue}});
	
			
			
	four_bit_ripple_adder FRA0(.x(A_mux[3 :0 ]),  .y(B_mux[3 :0]),  .cin(control_signal),  .s(Sum[3:0]),   .cout(temp1) );				// the 16 bit is composed of 4 4-bit ripple adder
	four_bit_ripple_adder FRA1(.x(A_mux[7 :4 ]),  .y(B_mux[7 :4]),  .cin(temp1), .s(Sum[7:4]),   .cout(temp2) );
	full_addr 				 FRA2(.x(A_mux[7]),  .y(B_mux[7]),  .cin(temp2),  .s(Sum[8]),   .cout());
	
     
endmodule

module four_bit_ripple_adder(
									input [3:0] x,			
									input [3:0] y,
									input cin,
									output logic [3:0]s,
									output logic cout
									  );
									  
	logic c0, c1, c2;
	
	full_addr fa0(.x(x[0]),.y(y[0]),.cin(cin),.s(s[0]),.cout(c0) );			// the 4 bit full adder is combination of 4 one bit full adder
	full_addr fa1(.x(x[1]),.y(y[1]),.cin(c0),.s(s[1]),.cout(c1));	
	full_addr fa2(.x(x[2]),.y(y[2]),.cin(c1),.s(s[2]),.cout(c2));				// the cout is set connected to next cin
	full_addr fa3(.x(x[3]),.y(y[3]),.cin(c2),.s(s[3]),.cout(cout));	

	
endmodule									  
module full_addr(
						input x,					
						input y,
						input cin,
						output logic s, 
						output logic cout
					 );
																										// the one-bit full adder, which is the most  basic element 
	assign s = x^y^cin ;
	assign cout= (x&y)| (y&cin) |(cin&x);													// cout is 1 when either 2 of x, y  or cin is one
	
endmodule					 