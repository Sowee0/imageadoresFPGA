module SAVE_FRAME(
				iRed, 			//Pixel color input from VGA, red
				iGreen,			//Pixel color input from VGA, green
				iBlue,			//Pixel color input from VGA, blue
				iSwitch,			//Control switch to start the capture
				iX,				//X coordinate for the pixel data captured
				iY,				//Y coordinate for the pixel data captured
				iCLK,				//Input clock, same as the VGA controller
				iSync,			//Sync signal
				oReady,			//Output signal for capture completion
				oStopCapture,	//Output signal to stop the capture and keep the same frame on screen
				oMemAddr,		//Memory control ouput, address
				oMemData,		//Memory control ouput, data
				oMemWE,			//Memory control ouput, write enable
				oLed				//Status LED
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
output reg			oMemWE;
output wire [14:0] oMemAddr;


reg [15:0] frameCounter = 16'd0;
reg [14:0] memoryAddress = 0;
reg [14:0] memoryData;


assign oMemAddr = memoryAddress;

`include "SAVE_params.h"

always @(posedge iCLK) begin


		if(iSwitch && (frameCounter == 300)) begin
		
			if(iX >= H_START && iX <= H_START + H_RES && iY >= V_START && iY <= V_START + V_RES) begin
			
			memoryAddress <= (iX - H_START) + (V_RES * (iY - V_START));
			memoryData <= iRed;
			oMemWE <= 1'b1;
			end	
		
		end
		else
		oMemWE <= 1'b0;
		
		
		//Choosing a recurring frame position as to count frames
		if(iX == 143 && iY == 34)
		frameCounter <= frameCounter + 1;
	
		if(frameCounter > 16'd300)
		oLed <= 1'b1;
	
		else
		oLed <= 1'b0;


end


				
endmodule
