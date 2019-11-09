module RGB2GRAY(
        oDVAL,
        oDATA,
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
output reg[9:0]	oDATA;
output reg		oDVAL;

input		[9:0]	iRed;
input		[9:0]	iGreen;
input		[9:0]	iBlue;

always@(posedge iCLK or negedge iRST)
begin
  if(!iRST)
    begin
	  oDVAL   <= 0;
      oDATA   <= 10'b0;
    end
  else
    begin
	  oDVAL   <= iDVAL;
	  oDATA   <= ((iRed[9:0] * 30) /100) + ((iGreen[9:1] * 59)/100) + ((iBlue[9:0] * 11)/100);
    end
end
endmodule