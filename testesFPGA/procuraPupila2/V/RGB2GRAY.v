module RGB2GRAY(
        oDATA,
        iRed,
        iGreen,
        iBlue,
        iRST,
		);
		
input			iDVAL;
input			iCLK;
input			iRST;
output reg[9:0]	oDATA;
output reg		oDVAL;

input		[9:0]	iRed;
input		[9:0]	iGreen;
input		[9:0]	iBlue;

always@(*)
begin
  if(!iRST)
    begin
      oDATA   <= 10'b0;
    end
  else
    begin
	  oDATA   <= ((iRed[9:0] * 30) /100) + ((iGreen[9:0] * 59)/100) + ((iBlue[9:0] * 11)/100);
    end
end
endmodule