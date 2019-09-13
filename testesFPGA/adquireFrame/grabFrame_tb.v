module grabFrame_tb;
	
	reg clk;
   wire clk_out;
	
	grabFrame gb1(clk, clk_out);
	
	
	always
		#5 clk = ~clk;
		
	initial
		clk = 0;	
		
endmodule
