module clockDivider(

	input 		clk,
	input    	bypass,
	output	clk_out
);

parameter maxCount = 4'd5;

reg [3:0] counter = 4'd0;

reg q = 1'b0;


always @(posedge clk) begin
	
	if(counter < 4'd5)
		counter <= counter + 4'd1;
		
	else begin
		counter <= 4'd0;
		q <= ~q;
		end
end

assign clk_out = q;

endmodule