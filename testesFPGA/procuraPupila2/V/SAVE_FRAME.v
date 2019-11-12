module SAVE_FRAME(
				iRed,
				iGreen,
				iBlue,
				iSwitch,
				iX,
				iY,
				iCLK,
				iSync,
				oReady,
				oStopCapture,
				oMemAddr,
				oMemData,
				oMemWE,
				oLed
				);
				
input [9:0] 	iRed;
input [9:0] 	iGreen;
input [9:0] 	iBlue;
input				iSwitch;
input	[12:0]	iX;
input	[12:0]   iY;
input 			iCLK;
input				iSync;
output			oReady;
output			oStopCapture;
output reg		oLed;
output			oMemData;
output			oMemWE;
output reg [14:0] oMemAddr;


reg [7:0] frameCounter = 8'd0;
reg [14:0] memoryPosition = 0;
reg [14:0] memoryData;


//assign oMemAddr = memoryPosition;

`include "SAVE_params.h"

always @(posedge iCLK) begin

		if(iSwitch && (frameCounter == 5)) begin
		
			if(iX >= H_START && iX <= H_START + H_RES && iY >= V_START && iY <= V_START + V_RES) begin
			
			memoryPosition <= (iX - H_START) + (V_RES * (iY - V_START));
			memoryData <= iRed;
			
			end	
		
		
		
		end
		
		if(iX == 143 && iY == 34)
			frameCounter <= frameCounter + 1;
	
	if(frameCounter > 20)
	oLed <= 1'b1;
	
	else
	oLed <= 1'b0;
		

		


end


				
endmodule
