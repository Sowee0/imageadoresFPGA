module CONTROLLER_SCORE_tb; 
	//corr
	reg				clk;
	reg	[9:0]		reading_search;
	reg	[9:0]		reading_sram;
	wire	[12:0]	sram_x;
	wire	[12:0]	sram_y;
	wire	[12:0]	search_x;
	wire	[12:0]	search_y;
	wire				corr_finished;
	wire	[31:0]	corr_score;
	
	//controller
	reg 			framedone = 1;
	wire [12:0] oX;
	wire [12:0] oY;
	wire 			finished;

initial begin
	clk = 0;
	reading_search = 2;
	reading_sram	= 0;
end

always
	#1 clk = !clk;
	

CONTROLLER	controller0(
							.iCLK(clk),
							.iRST(),
							.iFrameDone(framedone),
							.iCorrFinished(corr_finished),
							.iCurrentCorr(corr_score),
							.oX(oX),
							.oY(oY),
							.oXresult(),
							.oYresult(),
							.oStatusLed(),
							.oFinished(finished)
							);
							
CORR_SCORE		correl1(
							.iCLK(clk),
							.iXstart(oX),
							.iYstart(oY),
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
