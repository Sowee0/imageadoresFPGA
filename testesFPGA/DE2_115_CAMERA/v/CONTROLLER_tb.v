module CONTROLLER_tb;

	reg 			framedone = 1;
	reg			clk;
	reg 			icorrfin = 0;
	wire [12:0] oX;
	wire [12:0] oY;
	wire 			finished;
	
CONTROLLER	controller0(
							.iCLK(clk),
							.iRST(),
							.iFrameDone(framedone),
							.iCorrFinished(icorrfin),
							.iCurrentCorr(),
							.oX(oX),
							.oY(oY),
							.oXresult(),
							.oYresult(),
							.oStatusLed(),
							.oFinished(finished)
							);

initial begin
	clk = 0;
end

always
	#1 clk = !clk;
	


endmodule
