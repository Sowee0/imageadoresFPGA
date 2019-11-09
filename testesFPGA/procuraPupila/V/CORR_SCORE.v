module CORR_SCORE(
	input					iCLK,
	input		[12:0] 	iXstart,
	input		[12:0] 	iYstart,
	input		[9:0] 	reading_sram,
	input		[9:0] 	reading_search,
	output	[12:0] 	oX_sram,
	output	[12:0] 	oY_sram,
	output	[12:0] 	oX_search,
	output 	[12:0]	oY_search,
	output   reg 		finished
);
			

reg [15:0] endScore;
reg [15:0] currentScore;
reg [12:0] Xcoord;
reg [12:0] Ycoord;

assign oX_sram = iXstart + Xcoord;
assign oY_sram = iYstart + Ycoord;

assign oX_search = Xcoord;
assign oY_search = Ycoord;


always @ (iXstart or iYstart) begin

Xcoord 			<= 0;
Ycoord 			<= 0;
finished 		<= 0;
currentScore 	<= 0;
endsScore		<= 0;

end


always @ (posedge iCLK and finished = 0) begin


if(reading_sram > reading_search) begin

currentScore <= 1023 - (reading_sram - reading_search);

end

if(reading_sram > reading_search) begin

currentScore <= 1023 - (reading_search - reading_sram);

end

if(reading_sram == reading_search) begin

currentScore <= 1023;

end

//daqui pra baixo tá tudo errado com a mais absoluta certeza.
endScore = endScore + currentScore;

if(Xcoord < 512 && Ycoord < 384)
	Xcoord = Xcoord + 1;

else if(Xcoord == 511 && Ycoord < 384) begin
	Xcoord <= 0;
	Ycoord = Ycoord + 1;
	
	end

else if(Xcoord == 511 && Ycoord == 383) begin
	finished = 1;

	end





end

endmodule
	