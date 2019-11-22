module CORR_SCORE_tb;
	reg				clk;
	reg 	[12:0]	Xstart;
	reg 	[12:0]	Ystart;
	reg	[9:0]		reading_search;
	reg	[9:0]		reading_sram;
	wire	[12:0]	sram_x;
	wire	[12:0]	sram_y;
	wire	[12:0]	search_x;
	wire	[12:0]	search_y;
	wire				corr_finished;
	wire				corr_score;
	

initial begin
	clk = 0;
	reading_search = 2;
	reading_sram	= 0;
	Xstart = 0;
	Ystart = 0;
end

always 
#1 clk <= !clk;

always @(posedge clk)begin 
	if(corr_finished)
	Xstart <= Xstart + 1'b1;
end

//always begin 
//	#1		Xstart = Xstart + 1'b1;
//	if(Xstart > 20)
//	Xstart <= 0;
//	end
//
//always begin
//	#20	Ystart = Ystart + 1'b1;
//	if(Ystart >20)
//	Ystart <=0;
//	end

CORR_SCORE		correl1(
							.iCLK(clk),
							.iXstart(Xstart),
							.iYstart(Ystart),
							.reading_sram(reading_sram),
							.reading_search(reading_search),
							.oX_sram(sram_x),
							.oY_sram(sram_y),
							.oX_search(search_x),
							.oY_search(search_y),
							.oFinished(corr_finished),
							.oScore(corr_score)
							);
endmodule
