//		`timescale 1ns/1ns

module top();
	bit clk = 1;
	always #5 clk = ~clk;

	initial $vcdpluson;

	ifc_a ifc_0_0_to (clk);
	ifc_a ifc_0_1_to (clk);
	ifc_a ifc_0_2_to (clk);
	ifc_a ifc_0_3_to (clk);

	ifc_a ifc_0_0_from (clk);
	ifc_a ifc_0_1_from (clk);
	ifc_a ifc_0_2_from (clk);
	ifc_a ifc_0_3_from (clk);

	ifc_a ifc_1_0_to (clk);
	ifc_a ifc_1_1_to (clk);
	ifc_a ifc_1_2_to (clk);
	ifc_a ifc_1_3_to (clk);

	ifc_a ifc_1_0_from (clk);
	ifc_a ifc_1_1_from (clk);
	ifc_a ifc_1_2_from (clk);
	ifc_a ifc_1_3_from (clk);

	ifc_a ifc_2_0_to (clk);
	ifc_a ifc_2_1_to (clk);
	ifc_a ifc_2_2_to (clk);
	ifc_a ifc_2_3_to (clk);

	ifc_a ifc_2_0_from (clk);
	ifc_a ifc_2_1_from (clk);
	ifc_a ifc_2_2_from (clk);
	ifc_a ifc_2_3_from (clk);

	ifc_a ifc_3_0_to (clk);
	ifc_a ifc_3_1_to (clk);
	ifc_a ifc_3_2_to (clk);
	ifc_a ifc_3_3_to (clk);

	ifc_a ifc_3_0_from (clk);
	ifc_a ifc_3_1_from (clk);
	ifc_a ifc_3_2_from (clk);
	ifc_a ifc_3_3_from (clk);

	ifc_a CTRL(clk);

//	tb bench ();

	noc dut(.control(CTRL.control),
		.ifc_0_0_to,
		.ifc_0_1_to,
		.ifc_0_2_to,
		.ifc_0_3_to,

		.ifc_0_0_from,
		.ifc_0_1_from,
		.ifc_0_2_from,
		.ifc_0_3_from,

		.ifc_1_0_to,
		.ifc_1_1_to,
		.ifc_1_2_to,
		.ifc_1_3_to,

		.ifc_1_0_from,
		.ifc_1_1_from,
		.ifc_1_2_from,
		.ifc_1_3_from,

		.ifc_2_0_to,
		.ifc_2_1_to,
		.ifc_2_2_to,
		.ifc_2_3_to,

		.ifc_2_0_from,
		.ifc_2_1_from,
		.ifc_2_2_from,
		.ifc_2_3_from,

		.ifc_3_0_to,
		.ifc_3_1_to,
		.ifc_3_2_to,
		.ifc_3_3_to,

		.ifc_3_0_from,
		.ifc_3_1_from,
		.ifc_3_2_from,
		.ifc_3_3_from );

endmodule
