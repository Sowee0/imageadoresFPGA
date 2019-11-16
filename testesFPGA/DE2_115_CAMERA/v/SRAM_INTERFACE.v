module SRAM_INTERFACE(

			oMEM_DATA, 				//Memory control ouput, data
			oMEM_ADDR,				//Memory control ouput, address
			oMEM_WE_N,				//Memory control ouput, write_enable
			oMEM_READ,	  		
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
output	[15:0]	oMEM_READ;

reg 		[15:0] 	mem_in;
wire 		[15:0] 	mem_out;
reg 		[17:0] 	mem_address;


//assignments

reg state;

parameter idle = 1'b0, write = 1'b1;

assign oMEM_WE_N = (state != write);
assign oMEM_DATA = (state==write? mem_in: 16'hzzzz);
assign oMEM_ADDR[17:0] = (state==write? iMemoryWriteAddress:iMemoryReadAddress);

assign mem_out = oMEM_DATA;


always @(posedge iCLK) begin

if(iControlState)begin

	state 	<= write;
	mem_in 	<= iMemoryData;
	end
	

else begin

	state		<= idle;
	oMemoryData <= oMEM_DATA;
	end



//if (iFrame_count == 3)
//	begin
//	mem_address[17:0] <= 16'hFF;
//	state <= idle;
//	end
//
//if (iFrame_count == 5) 
//  begin
//     state <= write; 
//     mem_in <= 16'd300;
//  end
//
//
//if (iFrame_count == 8)
//	begin
//	mem_address[17:0] <= 16'h00;
//	state <= idle;
//	
//	end
//
//if (iFrame_count == 15)
//	begin
//	mem_address[17:0] <= 16'hFF;
//	state <= idle;
//	
//	end
	
	end
endmodule