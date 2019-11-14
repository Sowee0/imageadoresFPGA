module CONTROLLER(
		iCLK,
		iRST,
		iFrameDone,
		iCorrFinished,
		iCurrentCorr,
		oX,
		oY,
		oXresult,
		oYresult
			);

//Port declaration			
input 	iCLK;
input 	iRST;
input 	iFrameDone;
input 	iCorrFinished;
input 	iCurrentCorr;
output	oX;
output	oY;
output	wire [12:0] oXresult;
output	wire [12:0] oYresult;

//Variable Declaration
reg [12:0]	Xcounter;
reg [12:0]	Ycounter;

reg biggestCorr;
reg currentCorr;
reg biggestX;
reg biggestY;

reg finished;

assign oXresult = biggestX;
assign oYresult = biggestY;

assign oX =  Xcounter;
assign oY =  Ycounter;

`include "SAVE_params.h"

//Reset 
			
		always @ (iFrameDone) begin
			biggestX 	<= 0;
			biggestY 	<= 0;
			Xcounter 	<= 0;
			Ycounter 	<= 0;
			biggestCorr <= 0;
		end
			
			
		always @ (iCLK) begin 
		
		if(iFrameDone && iCorrFinished && !finished) begin
			
			if(Xcounter < H_RES && Ycounter < V_RES)
				Xcounter <= Xcounter + 1;
	
			else if(Xcounter == H_RES && Ycounter < V_RES) begin
				Xcounter <= 0;
				Ycounter <= Ycounter + 1;
			end
	
			else if(Xcounter == H_RES && Ycounter == V_RES) begin
				finished <= 1;
			end
		end
		end
		
		always @ (iCorrFinished) begin 
		
			if (currentCorr > biggestCorr) begin
				biggestCorr <= currentCorr;
				biggestX <= Xcounter;
				biggestY <= Ycounter;
				
			end
		end
			
			
			
endmodule
