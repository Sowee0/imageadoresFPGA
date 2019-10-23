module SRAM_SAVE(
		  oMEM_DATA,
		  oMEM_ADDR,
		  oMEM_WE_N,
		  iFrame_cont,
		  iH_Cont,
		  iV_Cont,
        iRed,
        iGreen,
        iBlue,
        iCLK,
        iRST,
        iDVAL,
		  
		);
		
input					iDVAL;
input					iCLK;
input					iRST;
output reg			oDVAL;

// coordenadas
input		[12:0]	iH_Cont;
input		[12:0]	iV_Cont;
input 	[13:0]	frame_count;

input		[9:0]		iRed;
input		[9:0]		iGreen;
input		[9:0]		iBlue;

//inicializações da SRAM


inout  	[15:0] 	oMEM_DATA;
output	[17:0] 	oMEM_ADDR;
output				oMEM_WE_N;

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


always @(posedge iCLK) begin

if (frame_count < 1 && frame_count < 15) 
  begin
     state <= write;
	  oMEM_ADDR[15:0] <= frame_count[15:0]; 
     mem_in <= frame_count[15:0];
  end
else state <= idle;


end

always@(posedge iCLK or negedge iRST)
begin

//fazer aqui a transformacao para cinza e ao mesmo tempo escrever na SRAM assim que acontecer.
  if(!iRST)
    begin
	  grayscale <= 0;
    end
  else
    begin
	  if(iH_Cont > 10'b0011111111 && iH_Cont < 10'b1010000000)
	  begin
	   grayscale <= ((iRed[9:0] * 30) /100) + ((iGreen[9:1] * 59)/100) + ((iBlue[9:0] * 11)/100);
		mem_in
		
	  end
	  
    end
end
endmodule