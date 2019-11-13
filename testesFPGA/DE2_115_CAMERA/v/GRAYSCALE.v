module GRAYSCALE(
        oDATA,
        iRed,
        iGreen,
        iBlue,
        iRST,
		  iCLK
		);
		
		
input					iRST;
output reg	[9:0]	oDATA;

input			[9:0]	iRed;
input			[9:0]	iGreen;
input			[9:0]	iBlue;

input 				iCLK;

always@(iCLK)
begin
	  oDATA   <= ((iRed[9:0] * 30) /100) + ((iGreen[9:0] * 59)/100) + ((iBlue[9:0] * 11)/100);
   
end
endmodule