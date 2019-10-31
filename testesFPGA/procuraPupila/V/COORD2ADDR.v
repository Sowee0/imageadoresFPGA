module COORD2ADDR(
			input [12:0]	iX,
			input [12:0]	iY,
			output[17:0]	oAddr
			);
			
parameter [17:0] offsetY = 10'd512;
			
always @ (iX or iY) begin

		
		oAddr <= iX + iY * offsetY;
	
		
end