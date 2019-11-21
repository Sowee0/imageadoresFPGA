	module CONTROLLER(
		iCLK,				//Control clock (50Mhz)
		iRST,				//Reset signal
		iFrameDone,		//high when whole frame saved and ready to start the correlation process
		iCorrFinished,	//Receives the end of the correlation process signal for the current XY coordinates
		iCurrentCorr,	//Value of the correlation for the current XY coordinates
		oX,				//Correlation process starting coordinates, X
		oY,				//Correlation process starting coordinates, Y
		oXresult,		//Returns the coordinate for which the correlation is maximum, X
		oYresult,		//Returns the coordinate for which the correlation is maximum, Y
		oStatusLed		//Heartbeat as to show correlation activity happening
			);

//Port declaration			
input 					iCLK;
input 					iRST;
input 					iFrameDone;
input 					iCorrFinished;
input			  [31:0] iCurrentCorr;
output	wire [12:0]	oX;
output	wire [12:0]	oY;
output	wire [12:0] oXresult;
output	wire [12:0] oYresult;
output   reg 			oStatusLed = 1'b0;

`include "SAVE_params.h"

//Variable Declaration
reg [12:0]	Xcounter = 0;
reg [12:0]	Ycounter = 0;


reg [12:0] biggestX = 0;
reg [12:0] biggestY = 0;
reg [31:0] biggestCorr = 0;
wire[31:0] currentCorr;

reg [25:0] statusCounter = 26'b0; 
reg finished = 1'b0;

assign currentCorr = iCurrentCorr;

assign oXresult = biggestX;
assign oYresult = biggestY;

assign oX =  Xcounter;
assign oY =  Ycounter;

always @ (posedge iCLK) begin
	
	if(!finished && iFrameDone)begin
		statusCounter = statusCounter + 26'b1;
		if(statusCounter > 26'h1FFFFFF)
			oStatusLed = 1'b1;
		else
			oStatusLed = 1'b0;
	end 
	else if(finished)
			oStatusLed = 1'b1;
	

//	if(iFrameDone) begin
//		biggestX 	<= 12'b0;
//		biggestY 	<= 12'b0;
//		Xcounter 	<= 12'b0;
//		Ycounter 	<= 12'b0;
//		biggestCorr <= 32'b0;
//	end
	
	if(iCorrFinished) begin
		if(currentCorr > biggestCorr) begin
			biggestCorr <= currentCorr;
			biggestX <= Xcounter;
			biggestY <= Ycounter;		
		end
	end
	
	if(iFrameDone && !iCorrFinished && !finished) begin
		
		if(Xcounter == H_RES2 && Ycounter == V_RES2)begin
			finished = 1'b1;
		end
		else if(Xcounter < H_RES2 && Ycounter < V_RES2)begin
			Xcounter <= Xcounter + 12'b1;
		end

		else if(Xcounter == H_RES2 && Ycounter < V_RES2) begin
			Ycounter <= Ycounter + 12'b1;
			if(Ycounter != V_RES2)
				Xcounter <= 12'b0;
		end 
		
	end
	
end
			
endmodule
