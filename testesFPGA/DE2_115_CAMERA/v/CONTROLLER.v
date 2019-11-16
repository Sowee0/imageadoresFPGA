module CONTROLLER(
		iCLK,				//Control clock (50Mhz)
		iRST,				//Reset signal
		iFrameDone,		//high when whole frame saved and ready to start the correlation process
		iCorrFinished,	//Receives the end of the correlation process signal for the current XY coordinates
		iCurrentCorr,	//Value of the correlation for the current XY coordinates
		oX,				//Correlation process starting coordinates, X
		oY,				//Correlation process starting coordinates, Y
		oXresult,		//Returns the coordinate for which the correlation is maximum, X
		oYresult			//Returns the coordinate for which the correlation is maximum, Y
			);

//Port declaration			
input 					iCLK;
input 					iRST;
input 					iFrameDone;
input 					iCorrFinished;
input		[15:0] 		iCurrentCorr;
output	wire			oX;
output	wire			oY;
output	wire [12:0] oXresult;
output	wire [12:0] oYresult;

`include "SAVE_params.h"

//Variable Declaration
reg [12:0]	Xcounter = 13'd0;
reg [12:0]	Ycounter = 13'd0;

reg biggestCorr;
reg biggestX;
reg biggestY;
wire [15:0] currentCorr;

reg finished;

assign currentCorr = iCurrentCorr;

assign oXresult = biggestX;
assign oYresult = biggestY;

assign oX =  Xcounter;
assign oY =  Ycounter;
			
//		always @ (iFrameDone) begin
//			biggestX 	<= 12'b0;
//			biggestY 	<= 12'b0;
//			Xcounter 	<= 12'b0;
//			Ycounter 	<= 12'b0;
//			biggestCorr <= 15'b0;
//		end
			
			
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
