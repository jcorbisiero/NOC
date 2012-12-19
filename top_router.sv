//		`timescale 1ns/1ns

module top();
	bit clk = 1;
	always #5 clk = ~clk;

	initial $vcdpluson;

	ifc North_a(clk);
	ifc North_b(clk);
	ifc South_a(clk);
	ifc South_b(clk);
	ifc East_a(clk);
	ifc East_b(clk);
	ifc West_a(clk);
	ifc West_b(clk);
	ifc Local_a(clk);
	ifc Local_b(clk);

	ifc ctrl(clk);

//	tb bench (IFCN.bench, IFCS.bench, IFCE.bench, 
//		IFCW.bench, IFCL.bench, CTRL.bench);


	tb_router bench (North_a.bench, North_b.bench,
		South_a.bench, South_b.bench,
		East_a.bench, East_b.bench,
		West_a.bench, West_b.bench,
		Local_a.bench, Local_b.bench,
		ctrl.bench );

	router#(.XCOORD(2), .YCOORD(2)) dut
	(	North_a.send, North_b.receive,
		South_a.send, South_b.receive,
		East_a.send, East_b.receive,
		West_a.send, West_b.receive,
		Local_a.send, Local_b.receive,
		ctrl.control
	);

endmodule
