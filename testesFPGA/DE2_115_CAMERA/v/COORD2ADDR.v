module COORD2ADDR(
		iX, 		//Coordinate to be converted to SRAM address, X
		iY, 		//Coordinate to be converted to SRAM address, y
		oAddr		//SRAM address correpondent to the XY coordintes
			);
			
input 		[12:0]	iX;
input 		[12:0]	iY;
output reg 	[17:0]	 oAddr;
			
parameter [17:0] offsetY = 10'd512;
			
always @ (*) begin

		
		oAddr <= iX + iY * offsetY;
	
		
end

endmodule