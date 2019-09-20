module grabFrame(
	input 	bypass,
	input 	clock,
	input 	[7:0] camera_data,
	input		HSYNC,		VSYNC,		PXCLK,
	
	output 	ce, wr, done,
	
	output 	[11:0] mem_addr,		
	output	[15:0] mem_data,	
	
	output	clockOut,
	output	clockPLL,
	output 	[7:0] teste
);




wire 	clk_out;


clockDivider divider(clock, bypass, clockOut);
//flashMemory memory(PXCLK, ce, wr, done,
//									mem_addr0, 	mem_addr1, 	mem_addr2, 	mem_addr3, 	mem_addr4, 	mem_addr5, 	mem_addr6, 	mem_addr7, 	mem_addr8, 	mem_addr9,	mem_addr10,
//									mem_addr11,	mem_addr12, mem_addr13, mem_addr14, mem_addr15, mem_addr16, mem_addr17, mem_addr18, mem_addr19, mem_addr20, mem_addr21,
//									mem_data0,	mem_data1,	mem_data2,	mem_data3,	mem_data4,	mem_data5,	mem_data6,	mem_data7
//								);
								


    pll u0 (
        .pll_out_clk (clockPLL), // pll_out.clk
        .clk_in_clk  (clock),  //  clk_in.clk
        .reset_reset (bypass)  //   reset.reset
    );

endmodule