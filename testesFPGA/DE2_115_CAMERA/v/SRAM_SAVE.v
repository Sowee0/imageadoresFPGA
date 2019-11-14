module SRAM_SAVE(

		//Controle da SRAM
			oMEM_DATA,
			oMEM_ADDR,
			oMEM_WE_N,
			oMEM_READ,
		  
		//Controle do bloco
			iControlState,
			iMemoryAddress,
			iMemoryData,
			oMemoryData,
			

		//Sincronia do bloco
			iCLK,
			iRST,
		  
		);
		

input					iCLK;
input					iRST;

// coordenadas



//inicializações da SRAM


inout  	[15:0] 	oMEM_DATA;
output	[17:0] 	oMEM_ADDR;
output				oMEM_WE_N;
output	[15:0]	oMEM_READ;

reg 		[15:0] 	mem_in;
wire 		[15:0] 	mem_out;
reg 		[17:0] 	mem_address;

reg 		[9:0]		grayscale;
reg 		[7:0] 	least_valid;

//assignments

reg state;

parameter idle = 1'b0, write = 1'b1;

assign oMEM_WE_N = (state != write);
assign oMEM_DATA = (state==write? mem_in: 16'hzzzz);
assign oMEM_ADDR[15:0] = iMemoryAddress;

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