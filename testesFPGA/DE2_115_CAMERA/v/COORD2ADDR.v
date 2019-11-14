module COORD2ADDR(
		iX,
		iY,
		oAddr
			);
			
input 		[12:0]	iX;
input 		[12:0]	iY;
output reg 	[17:0]	 oAddr;
			
parameter [17:0] offsetY = 10'd512;
			
always @ (*) begin

		
		oAddr <= iX + iY * offsetY;
	
		
end

endmodule