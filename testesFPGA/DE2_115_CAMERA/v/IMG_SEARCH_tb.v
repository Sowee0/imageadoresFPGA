module img_search_tb;

	reg clock;
	reg [12:0] iX;
	reg [12:0] iY;
	wire [9:0] oValue;
	
	IMG_SEARCH im1(
		.iCLK(clock),
		.iX(iX),
		.iY(iY),
		.oVAL(oValue)
		);
		
	initial begin
		clock = 0;
		iX = 0;
		iY = 0;
	end
	
	always
		#5 clock = !clock;
		
	always begin
		#10;
		iX = 13'd1; iY = 13'd0;
		#10;
		iX = 13'd5; iY = 13'd1;
		#10;
		iX = 13'd200; iY = 13'd200;
		#10;
		iX = 13'd0; iY = 13'd120;
	end
		
endmodule
