module SRAM_SAVE(
		  oMEM_DATA,
		  oMEM_ADDR,
		  oMEM_WE_N,
		  oMEM_READ,
		  iFrame_count,
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

// coordenadas
input		[12:0]	iH_Cont;
input		[12:0]	iV_Cont;
input 	[13:0]	iFrame_count;

input		[9:0]		iRed;
input		[9:0]		iGreen;
input		[9:0]		iBlue;

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
assign oMEM_ADDR[15:0] = mem_address;

assign mem_out = oMEM_DATA;


always @(posedge iCLK) begin

if (iFrame_count == 3)
	begin
	mem_address[17:0] <= 16'hFF;
	state <= idle;
	end

if (iFrame_count == 5) 
  begin
     state <= write; 
     mem_in <= 16'd300;
  end


if (iFrame_count == 8)
	begin
	mem_address[17:0] <= 16'h00;
	state <= idle;
	
	end

if (iFrame_count == 15)
	begin
	mem_address[17:0] <= 16'hFF;
	state <= idle;
	
	end
	
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
		
	  end
	  
    end
end
endmodule