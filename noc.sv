module noc (
	ifc_a.control control,
	ifc_a ifc_0_0_to,
	ifc_a ifc_0_1_to,
	ifc_a ifc_0_2_to,
	ifc_a ifc_0_3_to,

	ifc_a ifc_0_0_from,
	ifc_a ifc_0_1_from,
	ifc_a ifc_0_2_from,
	ifc_a ifc_0_3_from,

	ifc_a ifc_1_0_to,
	ifc_a ifc_1_1_to,
	ifc_a ifc_1_2_to,
	ifc_a ifc_1_3_to,

	ifc_a ifc_1_0_from,
	ifc_a ifc_1_1_from,
	ifc_a ifc_1_2_from,
	ifc_a ifc_1_3_from,

	ifc_a ifc_2_0_to,
	ifc_a ifc_2_1_to,
	ifc_a ifc_2_2_to,
	ifc_a ifc_2_3_to,

	ifc_a ifc_2_0_from,
	ifc_a ifc_2_1_from,
	ifc_a ifc_2_2_from,
	ifc_a ifc_2_3_from,

	ifc_a ifc_3_0_to,
	ifc_a ifc_3_1_to,
	ifc_a ifc_3_2_to,
	ifc_a ifc_3_3_to,

	ifc_a ifc_3_0_from,
	ifc_a ifc_3_1_from,
	ifc_a ifc_3_2_from,
	ifc_a ifc_3_3_from );

//First row to second row
ifc_a ifc_00_01_d(control.clk);
ifc_a ifc_10_11_d(control.clk);
ifc_a ifc_20_21_d(control.clk);
ifc_a ifc_30_31_d(control.clk);

ifc_a ifc_00_01_u(control.clk);
ifc_a ifc_10_11_u(control.clk);
ifc_a ifc_20_21_u(control.clk);
ifc_a ifc_30_31_u(control.clk);

//Second row to third row
ifc_a ifc_01_02(control.clk);
ifc_a ifc_11_12(control.clk);
ifc_a ifc_21_22(control.clk);
ifc_a ifc_31_32(control.clk);

//Third row to fourth row
ifc_a ifc_02_03(control.clk);
ifc_a ifc_12_13(control.clk);
ifc_a ifc_22_23(control.clk);
ifc_a ifc_32_33(control.clk);

//First column to second column
ifc_a ifc_00_10_r(control.clk);
ifc_a ifc_01_11_r(control.clk);
ifc_a ifc_02_12_r(control.clk);
ifc_a ifc_03_13_r(control.clk);

ifc_a ifc_00_10_l(control.clk);
ifc_a ifc_01_11_l(control.clk);
ifc_a ifc_02_12_l(control.clk);
ifc_a ifc_03_13_l(control.clk);

//Second column to third column
ifc_a ifc_10_20_l(control.clk);
ifc_a ifc_11_21_l(control.clk);
ifc_a ifc_12_22_l(control.clk);
ifc_a ifc_13_23_l(control.clk);

ifc_a ifc_10_20_r(control.clk);
ifc_a ifc_11_21_r(control.clk);
ifc_a ifc_12_22_r(control.clk);
ifc_a ifc_13_23_r(control.clk);

//Third column to fourth column
ifc_a ifc_20_30_r(control.clk);
ifc_a ifc_21_31_r(control.clk);
ifc_a ifc_22_32_r(control.clk);
ifc_a ifc_23_33_r(control.clk);

ifc_a ifc_20_30_l(control.clk);
ifc_a ifc_21_31_l(control.clk);
ifc_a ifc_22_32_l(control.clk);
ifc_a ifc_23_33_l(control.clk);

//row 0
nw_router #(.XCOORD(0), .YCOORD(0)) r0_0(
	.control,
	.S_ifc_a(ifc_00_01_d.send),
	.S_ifc_b(ifc_00_01_u.receive),
	.E_ifc_a(ifc_00_10_r.send),
	.E_ifc_b(ifc_00_10_l.receive),
	.L_ifc_a(ifc_0_0_to.send),
	.L_ifc_b(ifc_0_0_from.receive));

nedge_router #(.XCOORD(1), .YCOORD(0)) r1_0(
	.control,
	.S_ifc_a(ifc_10_11_d.send),
	.S_ifc_b(ifc_10_11_u.receive),
	.E_ifc_a(ifc_10_20_r.send),
	.E_ifc_b(ifc_10_20_l.receive),
	.W_ifc_a(ifc_00_10_l.send),
	.W_ifc_b(ifc_00_10_r.receive),
	.L_ifc_a(ifc_1_0_to.send),
	.L_ifc_b(ifc_1_0_from.receive));

nedge_router #(.XCOORD(2), .YCOORD(0)) r2_0(
	.control,
	.S_ifc_a(ifc_20_21_d.send),
	.S_ifc_b(ifc_20_21_u.receive),
	.E_ifc_a(ifc_20_30_r.send),
	.E_ifc_b(ifc_20_30_l.receive),
	.W_ifc_a(ifc_10_20_l.send),
	.W_ifc_b(ifc_10_20_r.receive),
	.L_ifc_a(ifc_2_0_to.send),
	.L_ifc_b(ifc_2_0_from.receive));

ne_router #(.XCOORD(3), .YCOORD(0)) r3_0(
	.control,
	.S_ifc_a(ifc_30_31_d.send),
	.S_ifc_b(ifc_30_31_u.receive),
	.W_ifc_a(ifc_20_30_l.send),
	.W_ifc_b(ifc_20_30_r.receive),
	.L_ifc_a(ifc_3_0_to.send),
	.L_ifc_b(ifc_3_0_from.receive));
/*
sw_router #(.XCOORD(0), .YCOORD(3)) r0_3(
	.control,
	.N_ifc(ifc_02_03.router),
	.E_ifc(ifc_03_13.router),
	.L_ifc(ifc_0_3));
*/
/*
//first row, x = 0
router #(.XCOORD(0), .YCOORD(0), .SOUTH(1), .EAST(1))r0_0 (	
		.control, .N_ifc(dummy.router), .S_ifc(ifc_00_10.router),
		.E_ifc(ifc_00_01.router), .W_ifc(dummy.router), .L_ifc(ifc_0_0));

router #(.XCOORD(0), .YCOORD(1), .SOUTH(1), .EAST(1), .WEST(1))r0_1 (
		.control, .N_ifc(dummy.router), .S_ifc(ifc_01_11.router),
		.E_ifc(ifc_01_02.router), .W_ifc(ifc_00_01.router), .L_ifc(ifc_0_1));

router #(.XCOORD(0), .YCOORD(2), .SOUTH(1), .EAST(1), .WEST(1))r0_2 (
		.control, .N_ifc(dummy.router), .S_ifc(ifc_02_12.router),
		.E_ifc(ifc_02_03.router), .W_ifc(ifc_01_02.router), .L_ifc(ifc_0_2));

router #(.XCOORD(0), .YCOORD(3), .SOUTH(1), .WEST(1))r0_3 (	
		.control, .N_ifc(dummy.router), .S_ifc(ifc_03_13.router),
		.E_ifc(dummy.router), .W_ifc(ifc_02_03.router), .L_ifc(ifc_0_3));

//second row, x = 1
router #(.XCOORD(1), .YCOORD(0), .NORTH(1), .SOUTH(1), 
		.EAST(0), .WEST(1))r1_0 (
			.control, .N_ifc(ifc_00_10.router), .S_ifc(ifc_10_20.router),
			.E_ifc(ifc_10_11.router), .W_ifc(dummy.router), .L_ifc(ifc_1_0));

router #(.XCOORD(1), .YCOORD(1), .NORTH(1), .SOUTH(1), 
		.EAST(1), .WEST(1))r1_1 (
			.control, .N_ifc(ifc_01_11.router), .S_ifc(ifc_11_21.router),
			.E_ifc(ifc_11_12.router), .W_ifc(ifc_10_11.router), .L_ifc(ifc_1_1));

router #(.XCOORD(1), .YCOORD(2), .NORTH(1), .SOUTH(1), 
		.EAST(1), .WEST(1))r1_2 (
			.control, .N_ifc(ifc_02_12.router), .S_ifc(ifc_12_22.router),
			.E_ifc(ifc_12_13.router), .W_ifc(ifc_11_12.router), .L_ifc(ifc_1_2));

router #(.XCOORD(1), .YCOORD(3), .NORTH(1), .SOUTH(1), 
		.EAST(0), .WEST(1))r1_3 (
			.control, .N_ifc(ifc_03_13.router), .S_ifc(ifc_13_23.router),
			.E_ifc(dummy.router), .W_ifc(ifc_12_13.router), .L_ifc(ifc_1_3));

//third row, x = 2
router #(.XCOORD(2), .YCOORD(0), .NORTH(1), .SOUTH(1), 
		.EAST(1), .WEST(0))r2_0 (
			.control, .N_ifc(ifc_10_20.router), .S_ifc(ifc_20_30.router),
			.E_ifc(ifc_20_21.router), .W_ifc(dummy.router), .L_ifc(ifc_2_0));

router #(.XCOORD(2), .YCOORD(1), .NORTH(1), .SOUTH(1), 
		.EAST(1), .WEST(1))r2_1 (
			.control, .N_ifc(ifc_11_21.router), .S_ifc(ifc_21_31.router),
			.E_ifc(ifc_21_22.router), .W_ifc(ifc_20_21.router), .L_ifc(ifc_2_1));

router #(.XCOORD(2), .YCOORD(2), .NORTH(1), .SOUTH(1), 
		.EAST(1), .WEST(1))r2_2 (
			.control, .N_ifc(ifc_12_22.router), .S_ifc(ifc_22_32.router),
			.E_ifc(ifc_22_23.router), .W_ifc(ifc_21_22.router), .L_ifc(ifc_2_2));

router #(.XCOORD(2), .YCOORD(3), .NORTH(1), .SOUTH(1), 
		.EAST(0), .WEST(1))r2_3 (
			.control, .N_ifc(ifc_13_23.router), .S_ifc(ifc_23_33.router),
			.E_ifc(dummy.router), .W_ifc(ifc_22_23.router), .L_ifc(ifc_2_3));

//fourth row, x = 3
router #(.XCOORD(3), .YCOORD(0), .NORTH(1), .SOUTH(0), 
		.EAST(1), .WEST(0))r3_0 (
			.control, .N_ifc(ifc_20_30.router), .S_ifc(dummy.router),
			.E_ifc(ifc_30_31.router), .W_ifc(dummy.router), .L_ifc(ifc_3_0));

router #(.XCOORD(3), .YCOORD(1), .NORTH(1), .SOUTH(0), 
		.EAST(1), .WEST(1))r3_1 (
			.control, .N_ifc(ifc_21_31.router), .S_ifc(dummy.router),
			.E_ifc(ifc_31_32.router), .W_ifc(ifc_30_31.router), .L_ifc(ifc_3_1));

router #(.XCOORD(3), .YCOORD(2), .NORTH(1), .SOUTH(0), 
		.EAST(1), .WEST(1))r3_2 (
			.control, .N_ifc(ifc_22_32.router), .S_ifc(dummy.router),
			.E_ifc(ifc_32_33.router), .W_ifc(ifc_31_32.router), .L_ifc(ifc_3_2));

router #(.XCOORD(3), .YCOORD(3), .NORTH(1), .SOUTH(0), 
		.EAST(0), .WEST(1))r3_3 (
			.control, .N_ifc(ifc_23_33.router), .S_ifc(dummy.router),
			.E_ifc(dummy.router), .W_ifc(ifc_32_33.router), .L_ifc(ifc_3_3));
*/

endmodule
