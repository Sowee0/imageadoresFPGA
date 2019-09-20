module sdram(

input 	clock_hf, reset,

output reg ce, wr, done,

output reg 	addr0,	addr1,	addr2,	addr3,	addr4,	addr5,	addr6,	addr7,	addr8,	addr9,
				addr10,	addr11,	addr12,	addr13,	addr14,	addr15,	addr16,	addr17,	addr18,	addr19,
				addr20,	addr21, [11:0]addr,

output reg 	data0,	data1,	data2,	data3,	data4,	data5,	data6,	data7, [15:0]data,
);

    sdram u0 (
        .clk_hf_clk                     (clock_hf),                     //           clk_hf.clk
        .reset_reset_n                  (reset),                  //            reset.reset_n
        .sdram_conn_addr                (data[7:0]),                //       sdram_conn.addr
        .sdram_conn_ba                  (<connected-to-sdram_conn_ba>),                  //                 .ba
        .sdram_conn_cas_n               (<connected-to-sdram_conn_cas_n>),               //                 .cas_n
        .sdram_conn_cke                 (<connected-to-sdram_conn_cke>),                 //                 .cke
        .sdram_conn_cs_n                (<connected-to-sdram_conn_cs_n>),                //                 .cs_n
        .sdram_conn_dq                  (<connected-to-sdram_conn_dq>),                  //                 .dq
        .sdram_conn_dqm                 (<connected-to-sdram_conn_dqm>),                 //                 .dqm
        .sdram_conn_ras_n               (<connected-to-sdram_conn_ras_n>),               //                 .ras_n
        .sdram_conn_we_n                (<connected-to-sdram_conn_we_n>),                //                 .we_n
        .sdram_controller_address       (<connected-to-sdram_controller_address>),       // sdram_controller.address
        .sdram_controller_byteenable_n  (<connected-to-sdram_controller_byteenable_n>),  //                 .byteenable_n
        .sdram_controller_chipselect    (<connected-to-sdram_controller_chipselect>),    //                 .chipselect
        .sdram_controller_writedata     (<connected-to-sdram_controller_writedata>),     //                 .writedata
        .sdram_controller_read_n        (<connected-to-sdram_controller_read_n>),        //                 .read_n
        .sdram_controller_write_n       (<connected-to-sdram_controller_write_n>),       //                 .write_n
        .sdram_controller_readdata      (<connected-to-sdram_controller_readdata>),      //                 .readdata
        .sdram_controller_readdatavalid (<connected-to-sdram_controller_readdatavalid>), //                 .readdatavalid
        .sdram_controller_waitrequest   (<connected-to-sdram_controller_waitrequest>)    //                 .waitrequest
    );

parameter maxCount = 21'd200;

reg [7:0] 	memData 	= 8'd0;
reg [21:0]	memAddr 	= 22'b0;

always @(posedge clock) begin

ce <= 0;
wr <= 0;

if(memAddr < maxCount) begin

addr0 	<= memAddr[0];
addr1 	<= memAddr[1];
addr2 	<= memAddr[2];
addr3 	<= memAddr[3];
addr4 	<= memAddr[4];
addr5 	<= memAddr[5];
addr6 	<= memAddr[6];
addr7 	<= memAddr[7];
addr8 	<= memAddr[8];
addr9 	<= memAddr[9];
addr10 	<= memAddr[10];
addr11 	<= memAddr[11];
addr12 	<= memAddr[12];
addr13 	<= memAddr[13];
addr14 	<= memAddr[14];
addr15 	<= memAddr[15];
addr16 	<= memAddr[16];
addr17 	<= memAddr[17];
addr18 	<= memAddr[18];
addr19 	<= memAddr[19];
addr20	<= memAddr[20];
addr21	<= memAddr[21];

data0		<= memData[0];
data1		<= memData[1];
data2		<= memData[2];
data3		<= memData[3];
data4		<= memData[4];
data5		<= memData[5];
data6		<= memData[6];
data7		<= memData[7];

memAddr = memAddr + 22'd1;
memData = memData + 1'd1;
end

else
done <= 1;





end

endmodule 