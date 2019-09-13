module clockDivider(

	input 		clk,
	input    	bypass,
	output reg	clk_out
);

parameter maxCount = 4'd10;

reg [3:0] counter = 4'd0;


always @(posedge clk) begin
	
	if(counter < maxCount)
		counter <= counter + 4'd1;
		
	else begin
		counter <= 0;
		clk_out <= !clk_out;
		end
end

endmodule