module IMG_SEARCH(

	input	[9:0]	iX,
	input [9:0] iY,
	output[9:0] oVAL
	);
	
	parameter [3:0] halving = 4'd2; 
	
	reg decX;
	reg decY;
	always @ (iX or iY) begin
	
	decX <= iX >> halving;
	decY <= iY >> halving;
	
	oVAL <= 
	
	end