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
output	reg [31:0] 	oScore;


//Including the file with various parameters
`include "SAVE_params.h"
			

//Variables used to determine the score at the end of the process
reg [15:0] endScore = 16'b0;
reg [15:0] currentScore = 16'b0;
reg finished = 0;

assign oFinished =  finished;

//Variables used for the internal coordinate counter
reg [12:0] Xcoord = 13'b0;
reg [12:0] Ycoord = 13'b0;

reg [12:0] currentXcoord = 13'b0;
reg [12:0] currentYcoord = 13'b0;

//Displacing the X and Y coordinates accordingly to their start position
assign oX_sram = iXstart + Xcoord;
assign oY_sram = iYstart + Ycoord;

//Setting the coordinates for the search module
assign oX_search = Xcoord;
assign oY_search = Ycoord;




always @ (posedge iCLK) begin

	//Starting the correlation  process setting everything back to zero.
	if(currentXcoord != iXstart && currentYcoord != iYstart) begin
		Xcoord 			<= 0;
		Ycoord 			<= 0;
		finished 		<= 0;
		currentScore 	<= 0;
		endScore			<= 0;
		currentXcoord 	<= iXstart;
		currentYcoord	<= iYstart;
	end
	
	else begin
	
	

	if(!finished) begin
	
		if(reading_sram > reading_search)
		currentScore <= 16'd1023 - (reading_sram - reading_search);
		
		else
		if(reading_sram > reading_search)
		currentScore <= 16'd1023 - (reading_search - reading_sram);
		
		else
		if(reading_sram == reading_search)
		currentScore <= 16'd1023;
		
		endScore <= endScore + currentScore; 
		
	end
	
	else begin
		oScore <= endScore;	
	end
	
	
	if(Xcoord < SEARCH_H_RES)
		Xcoord <= Xcoord + 1'b1;
	else if(Ycoord < SEARCH_V_RES) begin
		Ycoord <= Ycoord + 1'b1;
		Xcoord <= 0;
	end 
	else
		finished <= 1'b1;
	
	end
end

endmodule
	