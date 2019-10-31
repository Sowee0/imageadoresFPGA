module CONTROLLER(
			input 	iRST,
			input 	iFrameDone,
			input 	iCorrFinished
			output	oX,
			output	oY,
			output	oXresult,
			output	oYresult
			);
			
			always @ (iRST) begin
			oXresult <= 0;
			oYresult <= 0;
			Xcounter <= 0;
			Ycounter <= 0;
			biggestCorr <= 0;
			
			end
			
			always @ (iFrameDone) begin
			
			reg Xcounter;
			reg Ycounter;
			
			reg biggestCorr;
			reg currentCorr;
			reg biggestX;
			reg biggestY;
			
			assign oXresult = biggestX;
			assign oYresult = biggestY;
			
			assign oX =  Xcounter;
			assign oY =  Ycounter;
			
			
			
			end
			
			always @ (iFrameDone and iCorrFinished) begin
			
			if(Xcounter < 512 and Ycounter < 384)
				Xcounter <= Xcounter + 1;
			
			else if(Xcounter == 511 && Ycounter < 384)begin
				Xcounter <= 0;
				Ycounter <= Ycounter + 1;
			
			end
			
			else if(Xcounter == 511 && Ycoord == 383)begin
			
			end
			
			end
			
			always @ ((Xcounter or Ycounter) and icorrFinished) begin
			
			if (currentCorr > biggestCorr) begin
			
				biggestCorr <= currentCorr;
				biggestX <= Xcounter;
				biggestY <= Ycounter;
				
			end
			
			end
			
			
			
endmodule
