//`timescale 1ns/1ns

module top();
	bit clk = 1;
	always #5 clk = ~clk;

	initial $vcdpluson;

	ifc IFCN(clk);
	ifc IFCS(clk);
	ifc IFCE(clk);
	ifc IFCW(clk);
	ifc IFCL(clk);
	tb bench (IFCL.bench);


	router#(.XCOORD(0100), .YCOORD(0100),
			.NORTH(1), .SOUTH(1),
			.EAST(1), .WEST(1)) dut
	(	IFCN.router, IFCS.router,
		IFCE.router, IFCW.router, 
		IFCL.router, IFC.control
	);

endmodule
