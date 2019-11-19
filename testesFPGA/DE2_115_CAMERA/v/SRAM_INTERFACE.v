module SRAM_INTERFACE(

			oMEM_DATA, 				//Memory control ouput, data
			oMEM_ADDR,				//Memory control ouput, address
			oMEM_WE_N,				//Memory control ouput, write_enable  		
			iControlState,			//Module control, input state
			iMemoryWriteAddress,	//Module control, address for writing
			iMemoryReadAddress,	//Module control, address for reading
			iMemoryData,			//Module control, input data for writing
			oMemoryData,			//Module control, output data for reading
			iCLK,						//50 Mhz clock (20ns access time)
			iRST 					//Reset signal
		);
		

input					iCLK;
input					iRST;

input 				iControlState;
input 	[17:0] 	iMemoryWriteAddress;
input 	[17:0] 	iMemoryReadAddress;
input 	[15:0] 	iMemoryData;
output reg[15:0]	oMemoryData;

inout  	[15:0] 	oMEM_DATA;
output	[17:0] 	oMEM_ADDR;
output				oMEM_WE_N;

reg 		[15:0] 	mem_in;
reg 		[17:0] 	mem_address;


//assignments

reg state = 1'b0;

parameter idle = 1'b0, write = 1'b1;

assign oMEM_WE_N = (state != write);
assign oMEM_DATA = (state==write? mem_in: 16'hzzzz);
assign oMEM_ADDR[17:0] = (state==write? iMemoryWriteAddress:iMemoryReadAddress);


always @(posedge iCLK) begin

	if(iControlState)begin
		state 	<= write;
		mem_in 	<= iMemoryData;
		end
	

	else begin
		state		<= idle;
		oMemoryData <= oMEM_DATA;
		end
end

endmodule