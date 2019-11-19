module COORD2ADDR(
		iCLK,
		iX, 		//Coordinate to be converted to SRAM address, X
		iY, 		//Coordinate to be converted to SRAM address, y
		oAddr		//SRAM address correpondent to the XY coordintes
			);

input						iCLK;			
input 		[12:0]	iX;
input 		[12:0]	iY;
output reg 	[17:0]	 oAddr;

`include "SAVE_params.h"
		

			
always @ (posedge iCLK) begin

		
		oAddr <= iX + iY * H_RES;
	
		
end

endmodule