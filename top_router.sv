//		`timescale 1ns/1ns

module top();
	bit clk = 1;
	always #5 clk = ~clk;

	initial $vcdpluson;

	ifc_a North_a(clk);
	ifc_b North_b(clk);
	ifc_a South_a(clk);
	ifc_b South_b(clk);
	ifc_a East_a(clk);
	ifc_b East_b(clk);
	ifc_a West_a(clk);
	ifc_b West_b(clk);
	ifc_a Local_a(clk);
	ifc_b Local_b(clk);

	ifc_a ctrl(clk);

//	tb bench (IFCN.bench, IFCS.bench, IFCE.bench, 
//		IFCW.bench, IFCL.bench, CTRL.bench);

/*
	tb bench (North_a.bench, North_b.bench,
		South_a.bench, South_b.bench,
		East_a.bench, East_b.bench,
		West_a.bench, West_b.bench,
		Local_a.bench, Local_b.benc,
		ctrl.bench );
*/
	router#(.XCOORD(2), .YCOORD(2)) dut
	(	North_a.send, North_b.receive,
		South_a.receive, South_b.send,
		East_a.send, East_b.receive,
		West_a.receive, West_b.send,
		Local_a.receive, Local_b.send,
		ctrl.control
	);

endmodule
