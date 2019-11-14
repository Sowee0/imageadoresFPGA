module CORR_SCORE(
		iCLK, 				//50 Mhz clock
		iXstart,				//X coordinate of the correlation
		iYstart,				//Y coordinate of the correlation
		reading_sram,		//The reading from the SRAM in the desired coordinate
		reading_search,	//The reading from the search module in the desired coordinate
		oX_sram,				//The desired X coordinate from the SRAM
		oY_sram,				//The desired Y coordinate from the SRAM
		oX_search,			//The desired X coordinate from the search module
		oY_search,			//The desired Y coordinate from the seach module
		oFinished,			//A signal that ;means; the end of the correlation calculation 
		oScore,				//The final  score of the correlation calculation
);

input					iCLK;
input		[12:0] 	iXstart;
input		[12:0] 	iYstart;
input		[9:0] 	reading_sram;
input		[9:0] 	reading_search;
output	[12:0] 	oX_sram;
output	[12:0] 	oY_sram;
output	[12:0] 	oX_search;
output 	[12:0]	oY_search;
output   wire 		oFinished;
output	reg [15:0] 	oScore;


//Including the file with various parameters
`include "SAVE_params.h"
			

//Variables used to determine the score at the end of the process
reg [15:0] endScore;
reg [15:0] currentScore;
reg finished;

assign oFinished =  finished;

//Variables used for the internal coordinate counter
reg [12:0] Xcoord;
reg [12:0] Ycoord;

//Displacing the X and Y coordinates accordingly to their start position
assign oX_sram = iXstart + Xcoord;
assign oY_sram = iYstart + Ycoord;

//Setting the coordinates for the search module
assign oX_search = Xcoord;
assign oY_search = Ycoord;


//Starting the correlation  process setting everything back to zero.
always @ (iXstart or iYstart) begin

Xcoord 			<= 0;
Ycoord 			<= 0;
finished 		<= 0;
currentScore 	<= 0;
endScore			<= 0;

end


always @ (iCLK) begin

	if(!finished) begin
	
		if(reading_sram > reading_search)
		currentScore <= 1023 - (reading_sram - reading_search);
	
		
		if(reading_sram > reading_search)
		currentScore <= 1023 - (reading_search - reading_sram);
		
		
		if(reading_sram == reading_search)
		currentScore <= 1023;
		
		endScore = endScore + currentScore; //esse blocking tá correto?
		
	end
	
	else begin
		oScore <= endScore;	
	end
	
	if(Xcoord < SEARCH_H_RES && Ycoord < SEARCH_V_RES)
		Xcoord <= Xcoord + 1;
	
	else if(Xcoord == SEARCH_H_RES && Ycoord < SEARCH_V_RES) begin
		Xcoord <= 0;
		Ycoord <= Ycoord + 1;
		end
	
	else if(Xcoord == SEARCH_H_RES && Ycoord == SEARCH_V_RES)
		finished <= 1;
	

end

endmodule
	