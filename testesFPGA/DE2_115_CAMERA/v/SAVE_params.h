/* The frame is written on the screen following these timings in order B


edit this later on


*/



//Horizontal parameters for the saved frame for a 640x480 total frame resolution the resolution
//that follows here is just what will actually be saved

//This parameter tells when on the timing counter to start reading the frame
parameter H_START  	= 12'd144;

//This parameter is the total size of the frame, which is counted after the H_START has finished
parameter H_RES		= 12'd320; 

//The same thing happens for the vertical timings
parameter V_START  	= 12'd35;
parameter V_RES		= 12'd240;

//Parameters for the search frame and its middle position 
parameter SEARCH_H_RES = 12'd127;
parameter SEARCH_V_RES = 12'd127;


//Test parameters
parameter H_RES2		= 12'd20;
parameter V_RES2		= 12'd20;

parameter SEARCH_H_RES2 = 12'd10;
parameter SEARCH_V_RES2 = 12'd10;
