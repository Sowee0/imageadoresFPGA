module GRAYSCALE(
        oRed,
		  oGreen,
		  oBlue,
        iRed,
        iGreen,
        iBlue,
        iRST,
		  iXresult,
		  iYresult,
		  iFinished,
		  iXposition,
		  iYposition,
		  iCLK
		);
		
		
input					iRST;
output reg	[9:0]	oRed;
output reg	[9:0]	oGreen;
output reg	[9:0]	oBlue;

input			[9:0]	iRed;
input			[9:0]	iGreen;
input			[9:0]	iBlue;

input			[12:0] iXposition;
input			[12:0] iYposition;
input			[12:0] iXresult;
input			[12:0] iYresult;
input 				 iFinished;

parameter square_size = 5;


wire [12:0] posX;
wire [12:0] posY;

assign posX = iXresult + H_START + 13'd127;
assign posY = iYresult + V_START + 13'd127;

`include "SAVE_params.h"

input 				iCLK;

always@(iCLK)
begin
		
		if(iXposition > posX && iXposition < (posX + square_size) && iYposition > posY && iYposition <(posY + square_size) && iFinished)begin
			oRed 		<= 10'd1023;
			oGreen 	<= 10'd0;
			oBlue 	<= 10'd0;
		end
		
		else begin
			oRed   	<= ((iRed[9:0] * 30) /100) + ((iGreen[9:0] * 59)/100) + ((iBlue[9:0] * 11)/100);
			oGreen   <= ((iRed[9:0] * 30) /100) + ((iGreen[9:0] * 59)/100) + ((iBlue[9:0] * 11)/100);
			oBlue   	<= ((iRed[9:0] * 30) /100) + ((iGreen[9:0] * 59)/100) + ((iBlue[9:0] * 11)/100);
		end
	  
   
end
endmodule