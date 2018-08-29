module Dreg (
				input Clk,  Reset,Load, D,Continue,
				output logic Q );
				
always_ff @ (posedge Clk )
begin
		if (Reset)
			Q <= 1'b0;
		else if(Load)
			Q <=D;
end
endmodule
