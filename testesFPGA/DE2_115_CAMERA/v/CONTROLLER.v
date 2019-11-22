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
		oStatusLed,		//Heartbeat as to show correlation activity happening
		oFinished
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
output	wire			oFinished;

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

assign oFinished = finished;

always @ (posedge iCLK) begin
	
	//Heartbeat LED
	if(!finished && iFrameDone)begin
		statusCounter = statusCounter + 26'b1;
		if(statusCounter > 26'h1FFFFFF)
			oStatusLed = 1'b1;
		else
			oStatusLed = 1'b0;
	end 
	else if(finished)
			oStatusLed = 1'b1;
	
end

always @(posedge iCorrFinished) begin

	if(iFrameDone && !finished) begin
		if(Xcounter < H_RES)
			Xcounter <= Xcounter + 1'b1;
		else if(Ycounter < V_RES) begin
			Ycounter <= Ycounter + 1'b1;
			Xcounter <= 0;
		end 
		else
			finished <= 1'b1;
	end
	
	if(currentCorr > biggestCorr) begin
			biggestCorr <= currentCorr;
			biggestX <= Xcounter;
			biggestY <= Ycounter;		
	end

end
			
endmodule
