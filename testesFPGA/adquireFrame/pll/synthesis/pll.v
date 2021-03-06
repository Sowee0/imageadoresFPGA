// pll.v

// Generated using ACDS version 13.0sp1 232 at 2019.09.19.18:55:10

`timescale 1 ps / 1 ps
module pll (
		output wire  pll_out_clk, // pll_out.clk
		input  wire  clk_in_clk,  //  clk_in.clk
		input  wire  reset_reset  //   reset.reset
	);

	pll_altpll_0 altpll_0 (
		.clk       (clk_in_clk),  //       inclk_interface.clk
		.reset     (reset_reset), // inclk_interface_reset.reset
		.read      (),            //             pll_slave.read
		.write     (),            //                      .write
		.address   (),            //                      .address
		.readdata  (),            //                      .readdata
		.writedata (),            //                      .writedata
		.c0        (pll_out_clk), //                    c0.clk
		.areset    (),            //        areset_conduit.export
		.locked    (),            //        locked_conduit.export
		.phasedone ()             //     phasedone_conduit.export
	);

endmodule
