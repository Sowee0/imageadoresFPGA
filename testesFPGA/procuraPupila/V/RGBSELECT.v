module RGBSELECT(
        oDVAL,
        oDATA_R,
		  oDATA_G,
		  oDATA_B,
		  iH_Cont,
		  iV_Cont,
		  iSW4,
		  iSW5,
        iRed,
        iGreen,
        iBlue,
        iCLK,
        iRST,
        iDVAL
		  
		);
input			iDVAL;
input			iCLK;
input			iRST;

input		[12:0]	iH_Cont;
input		[12:0]	iV_Cont;

output reg[9:0]	oDATA_R;
output reg[9:0]	oDATA_G;
output reg[9:0]	oDATA_B;
output reg		oDVAL;

input iSW4;
input iSW5;

input		[9:0]	iRed;
input		[9:0]	iGreen;
input		[9:0]	iBlue;

reg [9:0]grayscale;

always@(posedge iCLK or negedge iRST)
begin
  if(!iRST)
    begin
	  oDVAL   <= 0;
     oDATA_R   <= 10'b0;
	  oDATA_G   <= 10'b0;
	  oDATA_B   <= 10'b0;
    end
  else
	  begin
	  
		if(iH_Cont > 10'b0011111111 && iH_Cont < 10'b1010000000) begin
  
  
			if(iH_Cont > 500 && iH_Cont < 540 && iV_Cont > 400 && iV_Cont < 440)
				begin
				oDVAL   <= iDVAL;
				oDATA_R <= 9'b0;
				oDATA_G <= 9'b0;
				oDATA_B <= 9'b0;
				end
				
				else
				
				begin 
				oDVAL   <= iDVAL;
				grayscale <= ((iRed[9:0] * 30) /100) + ((iGreen[9:0] * 59)/100) + ((iBlue[9:0] * 11)/100);
				oDATA_R   <= grayscale[9:0];
				oDATA_G   <= grayscale[9:0];
				oDATA_B   <= grayscale[9:0];
				end
				
				end
				
				else begin
				
				oDVAL   <= iDVAL;
				oDATA_R   <= 0;
				oDATA_G   <= 0;
				oDATA_B   <= 0;
				end
				
		end
				
end
endmodule