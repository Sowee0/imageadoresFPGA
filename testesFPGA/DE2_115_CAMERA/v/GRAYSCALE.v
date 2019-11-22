module GRAYSCALE(
        oRed,
		  oGreen,
		  oBlue,
        iRed,
        iGreen,
        iBlue,
        iRST,
		  iXresult,
		  iYresult,
		  iFinished,
		  iXposition,
		  iYposition,
		  iCLK
		);
		
		
input					iRST;
output reg	[9:0]	oRed;
output reg	[9:0]	oGreen;
output reg	[9:0]	oBlue;

input			[9:0]	iRed;
input			[9:0]	iGreen;
input			[9:0]	iBlue;

input			[12:0] iXposition;
input			[12:0] iYposition;
input			[12:0] iXresult;
input			[12:0] iYresult;
input 				 iFinished;


input 				iCLK;

always@(iCLK)
begin
		
		if(iXposition < iXresult && iXposition < iXresult + 20 && iYposition < iYresult && iYposition < iYresult + 20 && iFinished)begin
			oRed 		<= 10'd1023;
			oGreen 	<= 10'd0;
			oBlue 	<= 10'd0;
		end
		
		else begin
			oRed   	<= ((iRed[9:0] * 30) /100) + ((iGreen[9:0] * 59)/100) + ((iBlue[9:0] * 11)/100);
			oGreen   <= ((iRed[9:0] * 30) /100) + ((iGreen[9:0] * 59)/100) + ((iBlue[9:0] * 11)/100);
			oBlue   	<= ((iRed[9:0] * 30) /100) + ((iGreen[9:0] * 59)/100) + ((iBlue[9:0] * 11)/100);
		end
	  
   
end
endmodule