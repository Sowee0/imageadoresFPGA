module IMG_SEARCH(

	input		[12:0]	iX,
	input 	[12:0] 	iY,
	output	[10:0] 	oVAL
	);
	
	parameter [3:0] halving = 4'd3; 
	
	reg 			decX;
	reg 			decY;
	reg 	[7:0] memPos;
	
	always @ (iX or iY) begin
	
	decX <= iX >> halving;
	decY <= iY >> halving;
	
	oVAL <= 
	
	end