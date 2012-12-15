//`timescale 1ns/1ns

module top();
	bit clk = 1;
	always #5 clk = ~clk;

	initial $vcdpluson;

	ifc IFC(clk);
	tb bench (IFC.bench);


	router#(.XCOORD(0100), .YCOORD(0100),
			.NORTH(1), .SOUTH(1),
			.EAST(1), .WEST(1)) dut
	(	IFC.router, IFC.router,
		IFC.router, IFC.router, 
		IFC.router, IFC.control
	);

endmodule
