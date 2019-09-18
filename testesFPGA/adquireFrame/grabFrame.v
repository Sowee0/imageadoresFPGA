module grabFrame(
	input 	bypass,
	input 	clock,
	input 	cameraD0,	cameraD1,	cameraD2,	cameraD3,	cameraD4,	cameraD5,	cameraD6,	cameraD7,
	input		HSYNC,		VSYNC,		PXCLK,
	
	output 	ce, wr, done,
	
	output 	mem_addr0,	mem_addr1,	mem_addr2,	mem_addr3,	mem_addr4,	mem_addr5,	mem_addr6,	mem_addr7,
				mem_addr8, 	mem_addr9, 	mem_addr10,	mem_addr11,	mem_addr12,	mem_addr13,	mem_addr14,	mem_addr15,
				mem_addr16,	mem_addr17,	mem_addr18,	mem_addr19,	mem_addr20,	mem_addr21,			
	output	mem_data0, 	mem_data1, 	mem_data2, 	mem_data3, 	mem_data4, 	mem_data5, 	mem_data6, 	mem_data7,	
	
	output	clockOut	
);




wire 	clk_out;


clockDivider divider(clock, bypass, clockOut);
flashMemory memory(PXCLK, ce, wr, done,
									mem_addr0, 	mem_addr1, 	mem_addr2, 	mem_addr3, 	mem_addr4, 	mem_addr5, 	mem_addr6, 	mem_addr7, 	mem_addr8, 	mem_addr9,	mem_addr10,
									mem_addr11,	mem_addr12, mem_addr13, mem_addr14, mem_addr15, mem_addr16, mem_addr17, mem_addr18, mem_addr19, mem_addr20, mem_addr21,
									mem_data0,	mem_data1,	mem_data2,	mem_data3,	mem_data4,	mem_data5,	mem_data6,	mem_data7
								);


endmodule