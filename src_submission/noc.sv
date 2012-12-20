/* 
 * NOC module: Creates a 4x4 grid of interconnected router modules
 * 
 * Authors: Joseph Corbisiero, Nina Berg
 * Date: 12/20/12
 *
 */
module noc (
	    ifc.control control,
	    ifc ifc_0_0_to,
	    ifc ifc_0_1_to,
	    ifc ifc_0_2_to,
	    ifc ifc_0_3_to,

	    ifc ifc_0_0_from,
	    ifc ifc_0_1_from,
	    ifc ifc_0_2_from,
	    ifc ifc_0_3_from,

	    ifc ifc_1_0_to,
	    ifc ifc_1_1_to,
	    ifc ifc_1_2_to,
	    ifc ifc_1_3_to,

	    ifc ifc_1_0_from,
	    ifc ifc_1_1_from,
	    ifc ifc_1_2_from,
	    ifc ifc_1_3_from,

	    ifc ifc_2_0_to,
	    ifc ifc_2_1_to,
	    ifc ifc_2_2_to,
	    ifc ifc_2_3_to,

	    ifc ifc_2_0_from,
	    ifc ifc_2_1_from,
	    ifc ifc_2_2_from,
	    ifc ifc_2_3_from,

	    ifc ifc_3_0_to,
	    ifc ifc_3_1_to,
	    ifc ifc_3_2_to,
	    ifc ifc_3_3_to,

	    ifc ifc_3_0_from,
	    ifc ifc_3_1_from,
	    ifc ifc_3_2_from,
	    ifc ifc_3_3_from );

   //First row to second row
   ifc ifc_00_01_d(control.clk);
   ifc ifc_10_11_d(control.clk);
   ifc ifc_20_21_d(control.clk);
   ifc ifc_30_31_d(control.clk);

   ifc ifc_00_01_u(control.clk);
   ifc ifc_10_11_u(control.clk);
   ifc ifc_20_21_u(control.clk);
   ifc ifc_30_31_u(control.clk);

   //Second row to third row
   ifc ifc_01_02_d(control.clk);
   ifc ifc_11_12_d(control.clk);
   ifc ifc_21_22_d(control.clk);
   ifc ifc_31_32_d(control.clk);

   ifc ifc_01_02_u(control.clk);
   ifc ifc_11_12_u(control.clk);
   ifc ifc_21_22_u(control.clk);
   ifc ifc_31_32_u(control.clk);

   //Third row to fourth row
   ifc ifc_02_03_d(control.clk);
   ifc ifc_12_13_d(control.clk);
   ifc ifc_22_23_d(control.clk);
   ifc ifc_32_33_d(control.clk);

   ifc ifc_02_03_u(control.clk);
   ifc ifc_12_13_u(control.clk);
   ifc ifc_22_23_u(control.clk);
   ifc ifc_32_33_u(control.clk);

   //First column to second column
   ifc ifc_00_10_r(control.clk);
   ifc ifc_01_11_r(control.clk);
   ifc ifc_02_12_r(control.clk);
   ifc ifc_03_13_r(control.clk);

   ifc ifc_00_10_l(control.clk);
   ifc ifc_01_11_l(control.clk);
   ifc ifc_02_12_l(control.clk);
   ifc ifc_03_13_l(control.clk);

   //Second column to third column
   ifc ifc_10_20_l(control.clk);
   ifc ifc_11_21_l(control.clk);
   ifc ifc_12_22_l(control.clk);
   ifc ifc_13_23_l(control.clk);

   ifc ifc_10_20_r(control.clk);
   ifc ifc_11_21_r(control.clk);
   ifc ifc_12_22_r(control.clk);
   ifc ifc_13_23_r(control.clk);

   //Third column to fourth column
   ifc ifc_20_30_r(control.clk);
   ifc ifc_21_31_r(control.clk);
   ifc ifc_22_32_r(control.clk);
   ifc ifc_23_33_r(control.clk);

   ifc ifc_20_30_l(control.clk);
   ifc ifc_21_31_l(control.clk);
   ifc ifc_22_32_l(control.clk);
   ifc ifc_23_33_l(control.clk);

   //row 0
   nw_router #(.XCOORD('b0001), .YCOORD(0001)) r0_0(
		    .control,
		    .S_ifc_o(ifc_00_01_d.send),
		    .S_ifc_i(ifc_00_01_u.receive),
		    .E_ifc_o(ifc_00_10_r.send),
		    .E_ifc_i(ifc_00_10_l.receive),
		    .L_ifc_o(ifc_0_0_to.send),
		    .L_ifc_i(ifc_0_0_from.receive));

   nedge_router #(.XCOORD('b0010), .YCOORD('b0001)) r1_0(
			 .control,
			 .S_ifc_o(ifc_10_11_d.send),
			 .S_ifc_i(ifc_10_11_u.receive),
			 .E_ifc_o(ifc_10_20_r.send),
			 .E_ifc_i(ifc_10_20_l.receive),
			 .W_ifc_o(ifc_00_10_l.send),
			 .W_ifc_i(ifc_00_10_r.receive),
			 .L_ifc_o(ifc_1_0_to.send),
			 .L_ifc_i(ifc_1_0_from.receive));

   nedge_router #(.XCOORD('b0100), .YCOORD('b0001)) r2_0(
			 .control,
			 .S_ifc_o(ifc_20_21_d.send),
			 .S_ifc_i(ifc_20_21_u.receive),
			 .E_ifc_o(ifc_20_30_r.send),
			 .E_ifc_i(ifc_20_30_l.receive),
			 .W_ifc_o(ifc_10_20_l.send),
			 .W_ifc_i(ifc_10_20_r.receive),
			 .L_ifc_o(ifc_2_0_to.send),
			 .L_ifc_i(ifc_2_0_from.receive));

   ne_router #(.XCOORD('b1000), .YCOORD('b0001)) r3_0(
		      .control,
		      .S_ifc_o(ifc_30_31_d.send),
		      .S_ifc_i(ifc_30_31_u.receive),
		      .W_ifc_o(ifc_20_30_l.send),
		      .W_ifc_i(ifc_20_30_r.receive),
		      .L_ifc_o(ifc_3_0_to.send),
		      .L_ifc_i(ifc_3_0_from.receive));


   //row 1
   wedge_router #(.XCOORD('b0001), .YCOORD('b0010)) r0_1(
			 .control,
			 .N_ifc_o(ifc_00_01_u.send),
			 .N_ifc_i(ifc_00_01_d.receive),
			 .S_ifc_o(ifc_01_02_d.send),
			 .S_ifc_i(ifc_01_02_u.receive),
			 .E_ifc_o(ifc_01_11_r.send),
			 .E_ifc_i(ifc_01_11_l.receive),
			 .L_ifc_o(ifc_0_1_to.send),
			 .L_ifc_i(ifc_0_1_from.receive));

   router #(.XCOORD('b0010), .YCOORD(0010)) r1_1(
			 .control,
			 .N_ifc_o(ifc_10_11_u.send),
			 .N_ifc_i(ifc_10_11_d.receive),
			 .S_ifc_o(ifc_11_12_d.send),
			 .S_ifc_i(ifc_11_12_u.receive),
			 .E_ifc_o(ifc_11_21_r.send),
			 .E_ifc_i(ifc_11_21_l.receive),
			 .W_ifc_o(ifc_01_11_l.send),
			 .W_ifc_i(ifc_01_11_r.receive),
			 .L_ifc_o(ifc_1_1_to.send),
			 .L_ifc_i(ifc_1_1_from.receive));

   router #(.XCOORD('b0100), .YCOORD('b0010)) r2_1(
			   .control,
			   .N_ifc_o(ifc_20_21_u.send),
			   .N_ifc_i(ifc_20_21_d.receive),
			   .S_ifc_o(ifc_21_22_d.send),
			   .S_ifc_i(ifc_21_22_u.receive),
			   .E_ifc_o(ifc_21_31_r.send),
			   .E_ifc_i(ifc_21_31_l.receive),
			   .W_ifc_o(ifc_11_21_l.send),
			   .W_ifc_i(ifc_11_21_r.receive),
			   .L_ifc_o(ifc_2_1_to.send),
			   .L_ifc_i(ifc_2_1_from.receive));

   eedge_router #(.XCOORD('b1000), .YCOORD('b0010)) r3_1(
			 .control,
			 .N_ifc_o(ifc_30_31_u.send),
			 .N_ifc_i(ifc_30_31_d.receive),
			 .S_ifc_o(ifc_31_32_d.send),
			 .S_ifc_i(ifc_31_32_u.receive),
			 .W_ifc_o(ifc_21_31_l.send),
			 .W_ifc_i(ifc_21_31_r.receive),
			 .L_ifc_o(ifc_3_1_to.send),
			 .L_ifc_i(ifc_3_1_from.receive));

   //row 2
   wedge_router #(.XCOORD('b0001), .YCOORD('b0100)) r0_2(
			 .control,
			 .N_ifc_o(ifc_01_02_u.send),
			 .N_ifc_i(ifc_01_02_d.receive),
			 .S_ifc_o(ifc_02_03_d.send),
			 .S_ifc_i(ifc_02_03_u.receive),
			 .E_ifc_o(ifc_02_12_r.send),
			 .E_ifc_i(ifc_02_12_l.receive),
			 .L_ifc_o(ifc_0_2_to.send),
			 .L_ifc_i(ifc_0_2_from.receive));

   router #(.XCOORD('b0010), .YCOORD('b0100)) r1_2(
			   .control,
			   .N_ifc_o(ifc_11_12_u.send),
			   .N_ifc_i(ifc_11_12_d.receive),
			   .S_ifc_o(ifc_12_13_d.send),
			   .S_ifc_i(ifc_12_13_u.receive),
			   .E_ifc_o(ifc_12_22_r.send),
			   .E_ifc_i(ifc_12_22_l.receive),
			   .W_ifc_o(ifc_02_12_l.send),
			   .W_ifc_i(ifc_02_12_r.receive),
			   .L_ifc_o(ifc_1_2_to.send),
			   .L_ifc_i(ifc_1_2_from.receive));

   router #(.XCOORD('b0100), .YCOORD('b0100)) r2_2(
			   .control,
			   .N_ifc_o(ifc_21_22_u.send),
			   .N_ifc_i(ifc_21_22_d.receive),
			   .S_ifc_o(ifc_22_23_d.send),
			   .S_ifc_i(ifc_22_23_u.receive),
			   .E_ifc_o(ifc_22_32_r.send),
			   .E_ifc_i(ifc_22_32_l.receive),
			   .W_ifc_o(ifc_12_22_l.send),
			   .W_ifc_i(ifc_12_22_r.receive),
			   .L_ifc_o(ifc_2_2_to.send),
			   .L_ifc_i(ifc_2_2_from.receive));

   eedge_router #(.XCOORD('b1000), .YCOORD('b0100)) r3_2(
			 .control,
			 .N_ifc_o(ifc_31_32_u.send),
			 .N_ifc_i(ifc_31_32_d.receive),
			 .S_ifc_o(ifc_32_33_d.send),
			 .S_ifc_i(ifc_32_33_u.receive),
			 .W_ifc_o(ifc_22_32_l.send),
			 .W_ifc_i(ifc_22_32_r.receive),
			 .L_ifc_o(ifc_3_2_to.send),
			 .L_ifc_i(ifc_3_2_from.receive));

   //row 3

   sw_router #(.XCOORD('b0001), .YCOORD('b1000)) r0_3(
		      .control,
		      .N_ifc_o(ifc_02_03_u.send),
		      .N_ifc_i(ifc_02_03_d.receive),
		      .E_ifc_o(ifc_03_13_r.send),
		      .E_ifc_i(ifc_03_13_l.receive),
		      .L_ifc_o(ifc_0_3_to.send),
		      .L_ifc_i(ifc_0_3_from.receive));

   sedge_router #(.XCOORD('b0010), .YCOORD('b1000)) r1_3(
			 .control,
			 .N_ifc_o(ifc_12_13_u.send),
			 .N_ifc_i(ifc_12_13_d.receive),
			 .E_ifc_o(ifc_13_23_r.send),
			 .E_ifc_i(ifc_13_23_l.receive),
			 .W_ifc_o(ifc_03_13_l.send),
			 .W_ifc_i(ifc_03_13_r.receive),
			 .L_ifc_o(ifc_1_3_to.send),
			 .L_ifc_i(ifc_1_3_from.receive));

   sedge_router #(.XCOORD('b0100), .YCOORD('b1000)) r2_3(
			 .control,
			 .N_ifc_o(ifc_22_23_u.send),
			 .N_ifc_i(ifc_22_23_d.receive),
			 .E_ifc_o(ifc_23_33_r.send),
			 .E_ifc_i(ifc_23_33_l.receive),
			 .W_ifc_o(ifc_13_23_l.send),
			 .W_ifc_i(ifc_13_23_r.receive),
			 .L_ifc_o(ifc_2_3_to.send),
			 .L_ifc_i(ifc_2_3_from.receive));

   se_router #(.XCOORD('b1000), .YCOORD('b0001)) r3_3(
		      .control,
		      .N_ifc_o(ifc_32_33_u.send),
		      .N_ifc_i(ifc_32_33_d.receive),
		      .W_ifc_o(ifc_23_33_l.send),
		      .W_ifc_i(ifc_23_33_r.receive),
		      .L_ifc_o(ifc_3_3_to.send),
		      .L_ifc_i(ifc_3_3_from.receive));

endmodule
