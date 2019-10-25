module COORD2ADDR(
			input [13:0]	iX,
			input [13:0]	iY,
			output[13:0]	oAddr
			);
			
parameter [10:0] offsetY = 10'd512;
			
always @ (iX or iY) begin

		
		oAddr <= iX + iY * offsetY;
	
		
end