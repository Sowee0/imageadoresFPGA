module CORR_SCORE(
	input				iCLK,
	input		[12:0] 	iXstart,
	input		[12:0] 	iYstart,
	input		[9:0] 	reading_sram,
	input		[9:0] 	reading_search,
	output	[12:0] 	oX_sram,
	output	[12:0] 	oY_sram,
	output	[12:0] 	oX_search,
	output 	[12:0]	oY_search,
	output    			finished
);
			


always @ (posedge iCLK) begin





end