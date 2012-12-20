
module inputPort_4 ( clk, rst, data_i, write_en, shift, data_o, read_valid_o
 );
  input [15:0] data_i;
  output [15:0] data_o;
  input clk, rst, write_en, shift;
  output read_valid_o;
  wire   \buffer/U1/U1/N56 , \buffer/U1/U1/N55 , \buffer/U1/U1/N54 ,
         \buffer/U1/U1/N44 , \buffer/U1/U1/N40 , \buffer/U1/U1/wrd_count[1] ,
         \buffer/U1/U1/wrd_count[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25;
  tri   write_en;
  tri   \buffer/U1/U1/empty_n ;
  assign read_valid_o = \buffer/U1/U1/empty_n ;

  DFFX1 \buffer/U1/U1/word_count_reg[2]  ( .D(\buffer/U1/U1/N56 ), .CLK(clk), 
        .Q(\buffer/U1/U1/wrd_count[2] ), .QN(n18) );
  DFFX1 \buffer/U1/U1/word_count_reg[1]  ( .D(\buffer/U1/U1/N55 ), .CLK(clk), 
        .Q(\buffer/U1/U1/wrd_count[1] ), .QN(n15) );
  DFFX1 \buffer/U1/U1/word_count_reg[0]  ( .D(\buffer/U1/U1/N54 ), .CLK(clk), 
        .Q(n16), .QN(n25) );
  DFFX1 \buffer/U1/U1/empty_n_reg  ( .D(\buffer/U1/U1/N40 ), .CLK(clk), .Q(
        \buffer/U1/U1/empty_n ) );
  DFFX1 \buffer/U1/U1/full_int_reg  ( .D(\buffer/U1/U1/N44 ), .CLK(clk), .QN(
        n17) );
  NAND2X1 U2 ( .IN1(write_en), .IN2(n17), .QN(n19) );
  NAND2X1 U3 ( .IN1(\buffer/U1/U1/empty_n ), .IN2(n19), .QN(n20) );
  NAND2X1 U4 ( .IN1(n20), .IN2(n22), .QN(n21) );
  NOR2X0 U5 ( .IN1(rst), .IN2(n24), .QN(\buffer/U1/U1/N44 ) );
  MUX21X1 U6 ( .IN1(n25), .IN2(n16), .S(n21), .Q(n1) );
  NOR2X0 U7 ( .IN1(rst), .IN2(n1), .QN(\buffer/U1/U1/N54 ) );
  MUX21X1 U8 ( .IN1(n22), .IN2(n20), .S(n25), .Q(n2) );
  NOR2X0 U9 ( .IN1(n25), .IN2(n20), .QN(n3) );
  NOR2X0 U10 ( .IN1(n15), .IN2(n3), .QN(n4) );
  MUX21X1 U11 ( .IN1(n4), .IN2(n15), .S(n2), .Q(n5) );
  NOR2X0 U12 ( .IN1(rst), .IN2(n5), .QN(\buffer/U1/U1/N55 ) );
  OR3X1 U13 ( .IN1(n20), .IN2(\buffer/U1/U1/wrd_count[1] ), .IN3(n16), .Q(n6)
         );
  INVX0 U14 ( .INP(\buffer/U1/U1/wrd_count[2] ), .ZN(n7) );
  INVX0 U15 ( .INP(n20), .ZN(n8) );
  INVX0 U16 ( .INP(n15), .ZN(n9) );
  OA221X1 U17 ( .IN1(n20), .IN2(n25), .IN3(n8), .IN4(n9), .IN5(n21), .Q(n10)
         );
  NOR2X0 U18 ( .IN1(n22), .IN2(n25), .QN(n11) );
  OA22X1 U19 ( .IN1(\buffer/U1/U1/wrd_count[2] ), .IN2(n11), .IN3(n25), .IN4(
        n18), .Q(n12) );
  NAND2X0 U20 ( .IN1(\buffer/U1/U1/wrd_count[1] ), .IN2(n12), .QN(n13) );
  OA221X1 U21 ( .IN1(\buffer/U1/U1/wrd_count[2] ), .IN2(n6), .IN3(n7), .IN4(
        n10), .IN5(n13), .Q(n14) );
  NOR2X0 U22 ( .IN1(n14), .IN2(rst), .QN(\buffer/U1/U1/N56 ) );
  OR2X1 U23 ( .IN1(\buffer/U1/U1/empty_n ), .IN2(n19), .Q(n22) );
  NAND3X0 U24 ( .IN1(n25), .IN2(\buffer/U1/U1/wrd_count[2] ), .IN3(n15), .QN(
        n23) );
  OA22X1 U25 ( .IN1(\buffer/U1/U1/empty_n ), .IN2(n17), .IN3(n23), .IN4(n22), 
        .Q(n24) );
  OR4X1 U26 ( .IN1(\buffer/U1/U1/N55 ), .IN2(\buffer/U1/U1/N44 ), .IN3(
        \buffer/U1/U1/N54 ), .IN4(\buffer/U1/U1/N56 ), .Q(\buffer/U1/U1/N40 )
         );
endmodule


module outputPort_4 ( clk, rst, data_i, port_en, inc_credit_i, data_o, 
        send_data, full );
  input [15:0] data_i;
  output [15:0] data_o;
  input clk, rst, port_en, inc_credit_i;
  output send_data, full;
  wire   rst_n, empty, \count[0] , n5, n6, n25, n26, n27, \buffer2/U1/U1/N56 ,
         \buffer2/U1/U1/N55 , \buffer2/U1/U1/N54 , \buffer2/U1/U1/N53 ,
         \buffer2/U1/U1/N52 , \buffer2/U1/U1/N51 , \buffer2/U1/U1/N50 ,
         \buffer2/U1/U1/N49 , \buffer2/U1/U1/N48 , \buffer2/U1/U1/N44 ,
         \buffer2/U1/U1/N40 , \buffer2/U1/U1/wrd_count[1] ,
         \buffer2/U1/U1/wrd_count[2] , \buffer2/U2/M0_1_0/tmp_mux_in[0] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[1] , \buffer2/U2/M0_1_0/tmp_mux_in[2] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[3] , \buffer2/U2/M0_1_0/tmp_mux_in[4] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[5] , \buffer2/U2/M0_1_0/tmp_mux_in[6] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[7] , \buffer2/U2/M0_1_0/tmp_mux_in[8] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[9] , \buffer2/U2/M0_1_0/tmp_mux_in[10] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[11] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[12] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[13] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[14] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[15] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[16] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[17] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[18] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[19] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[20] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[21] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[22] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[23] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[24] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[25] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[26] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[27] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[28] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[29] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[30] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[31] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[32] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[33] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[34] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[35] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[36] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[37] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[38] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[39] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[40] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[41] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[42] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[43] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[44] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[45] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[46] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[47] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[48] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[49] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[50] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[51] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[52] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[53] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[54] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[55] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[56] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[57] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[58] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[59] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[60] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[61] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[62] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[63] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[64] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[65] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[66] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[67] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[68] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[69] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[70] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[71] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[72] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[73] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[74] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[75] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[76] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[77] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[78] ,
         \buffer2/U2/M0_1_0/tmp_mux_in[79] , \buffer2/U2/M0_1_0/din[4][15] ,
         \buffer2/U2/M0_1_0/din[4][14] , \buffer2/U2/M0_1_0/din[4][13] ,
         \buffer2/U2/M0_1_0/din[4][12] , \buffer2/U2/M0_1_0/din[4][11] ,
         \buffer2/U2/M0_1_0/din[4][10] , \buffer2/U2/M0_1_0/din[4][9] ,
         \buffer2/U2/M0_1_0/din[4][8] , \buffer2/U2/M0_1_0/din[4][7] ,
         \buffer2/U2/M0_1_0/din[4][6] , \buffer2/U2/M0_1_0/din[4][5] ,
         \buffer2/U2/M0_1_0/din[4][4] , \buffer2/U2/M0_1_0/din[4][3] ,
         \buffer2/U2/M0_1_0/din[4][2] , \buffer2/U2/M0_1_0/din[4][1] ,
         \buffer2/U2/M0_1_0/din[4][0] , \buffer2/U2/M0_1_0/din[3][15] ,
         \buffer2/U2/M0_1_0/din[3][14] , \buffer2/U2/M0_1_0/din[3][13] ,
         \buffer2/U2/M0_1_0/din[3][12] , \buffer2/U2/M0_1_0/din[3][11] ,
         \buffer2/U2/M0_1_0/din[3][10] , \buffer2/U2/M0_1_0/din[3][9] ,
         \buffer2/U2/M0_1_0/din[3][8] , \buffer2/U2/M0_1_0/din[3][7] ,
         \buffer2/U2/M0_1_0/din[3][6] , \buffer2/U2/M0_1_0/din[3][5] ,
         \buffer2/U2/M0_1_0/din[3][4] , \buffer2/U2/M0_1_0/din[3][3] ,
         \buffer2/U2/M0_1_0/din[3][2] , \buffer2/U2/M0_1_0/din[3][1] ,
         \buffer2/U2/M0_1_0/din[3][0] , \buffer2/U2/M0_1_0/din[2][15] ,
         \buffer2/U2/M0_1_0/din[2][14] , \buffer2/U2/M0_1_0/din[2][13] ,
         \buffer2/U2/M0_1_0/din[2][12] , \buffer2/U2/M0_1_0/din[2][11] ,
         \buffer2/U2/M0_1_0/din[2][10] , \buffer2/U2/M0_1_0/din[2][9] ,
         \buffer2/U2/M0_1_0/din[2][8] , \buffer2/U2/M0_1_0/din[2][7] ,
         \buffer2/U2/M0_1_0/din[2][6] , \buffer2/U2/M0_1_0/din[2][5] ,
         \buffer2/U2/M0_1_0/din[2][4] , \buffer2/U2/M0_1_0/din[2][3] ,
         \buffer2/U2/M0_1_0/din[2][2] , \buffer2/U2/M0_1_0/din[2][1] ,
         \buffer2/U2/M0_1_0/din[2][0] , \buffer2/U2/M0_1_0/din[1][15] ,
         \buffer2/U2/M0_1_0/din[1][14] , \buffer2/U2/M0_1_0/din[1][13] ,
         \buffer2/U2/M0_1_0/din[1][12] , \buffer2/U2/M0_1_0/din[1][11] ,
         \buffer2/U2/M0_1_0/din[1][10] , \buffer2/U2/M0_1_0/din[1][9] ,
         \buffer2/U2/M0_1_0/din[1][8] , \buffer2/U2/M0_1_0/din[1][7] ,
         \buffer2/U2/M0_1_0/din[1][6] , \buffer2/U2/M0_1_0/din[1][5] ,
         \buffer2/U2/M0_1_0/din[1][4] , \buffer2/U2/M0_1_0/din[1][3] ,
         \buffer2/U2/M0_1_0/din[1][2] , \buffer2/U2/M0_1_0/din[1][1] ,
         \buffer2/U2/M0_1_0/din[1][0] , \buffer2/U2/M0_1_0/din[0][15] ,
         \buffer2/U2/M0_1_0/din[0][14] , \buffer2/U2/M0_1_0/din[0][13] ,
         \buffer2/U2/M0_1_0/din[0][12] , \buffer2/U2/M0_1_0/din[0][11] ,
         \buffer2/U2/M0_1_0/din[0][10] , \buffer2/U2/M0_1_0/din[0][9] ,
         \buffer2/U2/M0_1_0/din[0][8] , \buffer2/U2/M0_1_0/din[0][7] ,
         \buffer2/U2/M0_1_0/din[0][6] , \buffer2/U2/M0_1_0/din[0][5] ,
         \buffer2/U2/M0_1_0/din[0][4] , \buffer2/U2/M0_1_0/din[0][3] ,
         \buffer2/U2/M0_1_0/din[0][2] , \buffer2/U2/M0_1_0/din[0][1] ,
         \buffer2/U2/M0_1_0/din[0][0] , \buffer2/rd_addr[0] ,
         \buffer2/rd_addr[1] , \buffer2/rd_addr[2] , \buffer2/wr_addr[0] ,
         \buffer2/wr_addr[1] , \buffer2/wr_addr[2] , n1, n2, n3, n4, n7, n8,
         n9, n10, n11, n12, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155;
  tri   inc_credit_i;
  tri   [15:0] data_o;
  tri   send_data;

  DFFX1 \count_reg[0]  ( .D(n26), .CLK(clk), .Q(\count[0] ) );
  DFFX1 \count_reg[1]  ( .D(n25), .CLK(clk), .Q(n24), .QN(n6) );
  DFFX1 \count_reg[2]  ( .D(n27), .CLK(clk), .Q(n19), .QN(n5) );
  DFFX1 rst_n_reg ( .D(rst), .CLK(clk), .Q(n16), .QN(rst_n) );
  DFFX1 \buffer2/U1/U1/rd_addr_int_reg[2]  ( .D(\buffer2/U1/U1/N53 ), .CLK(clk), .Q(\buffer2/rd_addr[2] ), .QN(n15) );
  DFFX1 \buffer2/U1/U1/rd_addr_int_reg[1]  ( .D(\buffer2/U1/U1/N52 ), .CLK(clk), .Q(\buffer2/rd_addr[1] ), .QN(n23) );
  DFFX1 \buffer2/U1/U1/rd_addr_int_reg[0]  ( .D(\buffer2/U1/U1/N51 ), .CLK(clk), .Q(\buffer2/rd_addr[0] ), .QN(n20) );
  DFFX1 \buffer2/U1/U1/wr_addr_at_max_reg  ( .D(\buffer2/U1/U1/N50 ), .CLK(clk), .Q(\buffer2/wr_addr[2] ), .QN(n17) );
  DFFX1 \buffer2/U1/U1/wr_addr_int_reg[1]  ( .D(\buffer2/U1/U1/N49 ), .CLK(clk), .Q(\buffer2/wr_addr[1] ), .QN(n28) );
  DFFX1 \buffer2/U1/U1/wr_addr_int_reg[0]  ( .D(\buffer2/U1/U1/N48 ), .CLK(clk), .Q(\buffer2/wr_addr[0] ), .QN(n22) );
  DFFX1 \buffer2/U1/U1/word_count_reg[2]  ( .D(\buffer2/U1/U1/N56 ), .CLK(clk), 
        .Q(\buffer2/U1/U1/wrd_count[2] ), .QN(n31) );
  DFFX1 \buffer2/U1/U1/word_count_reg[1]  ( .D(\buffer2/U1/U1/N55 ), .CLK(clk), 
        .Q(\buffer2/U1/U1/wrd_count[1] ), .QN(n21) );
  DFFX1 \buffer2/U1/U1/word_count_reg[0]  ( .D(\buffer2/U1/U1/N54 ), .CLK(clk), 
        .Q(n18), .QN(n155) );
  DFFX1 \buffer2/U1/U1/empty_n_reg  ( .D(\buffer2/U1/U1/N40 ), .CLK(clk), .Q(
        n30), .QN(empty) );
  DFFX1 \buffer2/U1/U1/full_int_reg  ( .D(\buffer2/U1/U1/N44 ), .CLK(clk), .Q(
        full), .QN(n29) );
  DFFX1 \buffer2/U2/M0_1_0/F0_15_4  ( .D(\buffer2/U2/M0_1_0/din[4][15] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[79] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_15_3  ( .D(\buffer2/U2/M0_1_0/din[3][15] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[63] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_15_2  ( .D(\buffer2/U2/M0_1_0/din[2][15] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[47] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_15_1  ( .D(\buffer2/U2/M0_1_0/din[1][15] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[31] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_15_0  ( .D(\buffer2/U2/M0_1_0/din[0][15] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[15] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_14_4  ( .D(\buffer2/U2/M0_1_0/din[4][14] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[78] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_14_3  ( .D(\buffer2/U2/M0_1_0/din[3][14] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[62] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_14_2  ( .D(\buffer2/U2/M0_1_0/din[2][14] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[46] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_14_1  ( .D(\buffer2/U2/M0_1_0/din[1][14] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[30] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_14_0  ( .D(\buffer2/U2/M0_1_0/din[0][14] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[14] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_13_4  ( .D(\buffer2/U2/M0_1_0/din[4][13] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[77] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_13_3  ( .D(\buffer2/U2/M0_1_0/din[3][13] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[61] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_13_2  ( .D(\buffer2/U2/M0_1_0/din[2][13] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[45] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_13_1  ( .D(\buffer2/U2/M0_1_0/din[1][13] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[29] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_13_0  ( .D(\buffer2/U2/M0_1_0/din[0][13] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[13] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_12_4  ( .D(\buffer2/U2/M0_1_0/din[4][12] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[76] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_12_3  ( .D(\buffer2/U2/M0_1_0/din[3][12] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[60] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_12_2  ( .D(\buffer2/U2/M0_1_0/din[2][12] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[44] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_12_1  ( .D(\buffer2/U2/M0_1_0/din[1][12] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[28] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_12_0  ( .D(\buffer2/U2/M0_1_0/din[0][12] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[12] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_11_4  ( .D(\buffer2/U2/M0_1_0/din[4][11] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[75] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_11_3  ( .D(\buffer2/U2/M0_1_0/din[3][11] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[59] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_11_2  ( .D(\buffer2/U2/M0_1_0/din[2][11] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[43] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_11_1  ( .D(\buffer2/U2/M0_1_0/din[1][11] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[27] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_11_0  ( .D(\buffer2/U2/M0_1_0/din[0][11] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[11] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_10_4  ( .D(\buffer2/U2/M0_1_0/din[4][10] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[74] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_10_3  ( .D(\buffer2/U2/M0_1_0/din[3][10] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[58] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_10_2  ( .D(\buffer2/U2/M0_1_0/din[2][10] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[42] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_10_1  ( .D(\buffer2/U2/M0_1_0/din[1][10] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[26] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_10_0  ( .D(\buffer2/U2/M0_1_0/din[0][10] ), 
        .CLK(clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[10] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_9_4  ( .D(\buffer2/U2/M0_1_0/din[4][9] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[73] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_9_3  ( .D(\buffer2/U2/M0_1_0/din[3][9] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[57] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_9_2  ( .D(\buffer2/U2/M0_1_0/din[2][9] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[41] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_9_1  ( .D(\buffer2/U2/M0_1_0/din[1][9] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[25] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_9_0  ( .D(\buffer2/U2/M0_1_0/din[0][9] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[9] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_8_4  ( .D(\buffer2/U2/M0_1_0/din[4][8] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[72] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_8_3  ( .D(\buffer2/U2/M0_1_0/din[3][8] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[56] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_8_2  ( .D(\buffer2/U2/M0_1_0/din[2][8] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[40] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_8_1  ( .D(\buffer2/U2/M0_1_0/din[1][8] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[24] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_8_0  ( .D(\buffer2/U2/M0_1_0/din[0][8] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[8] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_7_4  ( .D(\buffer2/U2/M0_1_0/din[4][7] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[71] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_7_3  ( .D(\buffer2/U2/M0_1_0/din[3][7] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[55] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_7_2  ( .D(\buffer2/U2/M0_1_0/din[2][7] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[39] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_7_1  ( .D(\buffer2/U2/M0_1_0/din[1][7] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[23] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_7_0  ( .D(\buffer2/U2/M0_1_0/din[0][7] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[7] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_6_4  ( .D(\buffer2/U2/M0_1_0/din[4][6] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[70] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_6_3  ( .D(\buffer2/U2/M0_1_0/din[3][6] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[54] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_6_2  ( .D(\buffer2/U2/M0_1_0/din[2][6] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[38] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_6_1  ( .D(\buffer2/U2/M0_1_0/din[1][6] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[22] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_6_0  ( .D(\buffer2/U2/M0_1_0/din[0][6] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[6] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_5_4  ( .D(\buffer2/U2/M0_1_0/din[4][5] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[69] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_5_3  ( .D(\buffer2/U2/M0_1_0/din[3][5] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[53] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_5_2  ( .D(\buffer2/U2/M0_1_0/din[2][5] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[37] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_5_1  ( .D(\buffer2/U2/M0_1_0/din[1][5] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[21] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_5_0  ( .D(\buffer2/U2/M0_1_0/din[0][5] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[5] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_4_4  ( .D(\buffer2/U2/M0_1_0/din[4][4] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[68] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_4_3  ( .D(\buffer2/U2/M0_1_0/din[3][4] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[52] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_4_2  ( .D(\buffer2/U2/M0_1_0/din[2][4] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[36] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_4_1  ( .D(\buffer2/U2/M0_1_0/din[1][4] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[20] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_4_0  ( .D(\buffer2/U2/M0_1_0/din[0][4] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[4] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_3_4  ( .D(\buffer2/U2/M0_1_0/din[4][3] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[67] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_3_3  ( .D(\buffer2/U2/M0_1_0/din[3][3] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[51] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_3_2  ( .D(\buffer2/U2/M0_1_0/din[2][3] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[35] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_3_1  ( .D(\buffer2/U2/M0_1_0/din[1][3] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[19] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_3_0  ( .D(\buffer2/U2/M0_1_0/din[0][3] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[3] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_2_4  ( .D(\buffer2/U2/M0_1_0/din[4][2] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[66] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_2_3  ( .D(\buffer2/U2/M0_1_0/din[3][2] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[50] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_2_2  ( .D(\buffer2/U2/M0_1_0/din[2][2] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[34] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_2_1  ( .D(\buffer2/U2/M0_1_0/din[1][2] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[18] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_2_0  ( .D(\buffer2/U2/M0_1_0/din[0][2] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[2] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_1_4  ( .D(\buffer2/U2/M0_1_0/din[4][1] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[65] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_1_3  ( .D(\buffer2/U2/M0_1_0/din[3][1] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[49] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_1_2  ( .D(\buffer2/U2/M0_1_0/din[2][1] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[33] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_1_1  ( .D(\buffer2/U2/M0_1_0/din[1][1] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[17] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_1_0  ( .D(\buffer2/U2/M0_1_0/din[0][1] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[1] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_0_4  ( .D(\buffer2/U2/M0_1_0/din[4][0] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[64] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_0_3  ( .D(\buffer2/U2/M0_1_0/din[3][0] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[48] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_0_2  ( .D(\buffer2/U2/M0_1_0/din[2][0] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[32] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_0_1  ( .D(\buffer2/U2/M0_1_0/din[1][0] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[16] ) );
  DFFX1 \buffer2/U2/M0_1_0/F0_0_0  ( .D(\buffer2/U2/M0_1_0/din[0][0] ), .CLK(
        clk), .Q(\buffer2/U2/M0_1_0/tmp_mux_in[0] ) );
  OA221X1 U3 ( .IN1(1'b0), .IN2(n137), .IN3(n136), .IN4(\buffer2/wr_addr[1] ), 
        .IN5(n135), .Q(\buffer2/U1/U1/N49 ) );
  NAND2X1 U4 ( .IN1(n17), .IN2(n132), .QN(n113) );
  INVX0 U5 ( .INP(send_data), .ZN(n138) );
  NOR2X0 U6 ( .IN1(inc_credit_i), .IN2(rst), .QN(n144) );
  NOR2X0 U7 ( .IN1(n116), .IN2(n109), .QN(n104) );
  NAND2X1 U8 ( .IN1(n108), .IN2(n110), .QN(n103) );
  NOR2X0 U9 ( .IN1(n16), .IN2(n105), .QN(n107) );
  NOR2X0 U10 ( .IN1(n109), .IN2(n108), .QN(n112) );
  NAND2X1 U11 ( .IN1(n116), .IN2(n110), .QN(n111) );
  NOR2X0 U12 ( .IN1(n16), .IN2(n113), .QN(n114) );
  NOR2X0 U13 ( .IN1(send_data), .IN2(n133), .QN(n128) );
  NOR2X0 U14 ( .IN1(n134), .IN2(n138), .QN(n121) );
  NOR2X0 U15 ( .IN1(n128), .IN2(n121), .QN(n127) );
  NAND2X1 U16 ( .IN1(port_en), .IN2(n29), .QN(n133) );
  INVX0 U17 ( .INP(n133), .ZN(n134) );
  NOR2X0 U18 ( .IN1(n133), .IN2(n22), .QN(n136) );
  INVX0 U19 ( .INP(n135), .ZN(n132) );
  NOR2X0 U20 ( .IN1(n117), .IN2(n16), .QN(n137) );
  NOR2X0 U21 ( .IN1(n133), .IN2(n17), .QN(n117) );
  NOR2X0 U22 ( .IN1(n138), .IN2(n20), .QN(n141) );
  INVX0 U23 ( .INP(n141), .ZN(n140) );
  NOR2X0 U24 ( .IN1(n153), .IN2(n154), .QN(n149) );
  NAND2X1 U25 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[32] ), .IN2(n101), .QN(n63)
         );
  NAND2X1 U26 ( .IN1(n101), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[33] ), .QN(n49)
         );
  NAND2X1 U27 ( .IN1(n101), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[34] ), .QN(n47)
         );
  NAND2X1 U28 ( .IN1(n101), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[35] ), .QN(n45)
         );
  NAND2X1 U29 ( .IN1(n101), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[36] ), .QN(n43)
         );
  NAND2X1 U30 ( .IN1(n101), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[37] ), .QN(n41)
         );
  NAND2X1 U31 ( .IN1(n101), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[38] ), .QN(n39)
         );
  NAND2X1 U32 ( .IN1(n101), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[39] ), .QN(n37)
         );
  NAND2X1 U33 ( .IN1(n101), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[40] ), .QN(n35)
         );
  NAND2X1 U34 ( .IN1(n101), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[41] ), .QN(n33)
         );
  NAND2X1 U35 ( .IN1(n101), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[42] ), .QN(n61)
         );
  NAND2X1 U36 ( .IN1(n101), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[43] ), .QN(n59)
         );
  NOR2X0 U37 ( .IN1(n120), .IN2(empty), .QN(send_data) );
  NOR2X0 U38 ( .IN1(n16), .IN2(n130), .QN(\buffer2/U1/U1/N44 ) );
  INVX0 U39 ( .INP(n127), .ZN(n126) );
  NAND2X1 U40 ( .IN1(n6), .IN2(n19), .QN(n142) );
  INVX0 U41 ( .INP(rst), .ZN(n66) );
  NAND2X1 U42 ( .IN1(n101), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[44] ), .QN(n57)
         );
  NOR2X0 U43 ( .IN1(n134), .IN2(n155), .QN(n123) );
  NOR2X0 U44 ( .IN1(n125), .IN2(n16), .QN(\buffer2/U1/U1/N55 ) );
  NAND2X1 U45 ( .IN1(\count[0] ), .IN2(inc_credit_i), .QN(n145) );
  NOR2X0 U46 ( .IN1(n6), .IN2(n145), .QN(n146) );
  NOR2X0 U47 ( .IN1(rst), .IN2(n147), .QN(n148) );
  NAND2X1 U48 ( .IN1(n101), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[45] ), .QN(n55)
         );
  AOI21X1 U49 ( .IN1(n18), .IN2(n121), .IN3(n127), .QN(n1) );
  AND3X1 U50 ( .IN1(n121), .IN2(n21), .IN3(n155), .Q(n2) );
  AND3X1 U51 ( .IN1(n128), .IN2(n18), .IN3(\buffer2/U1/U1/wrd_count[1] ), .Q(
        n3) );
  NOR3X0 U52 ( .IN1(n2), .IN2(\buffer2/U1/U1/wrd_count[2] ), .IN3(n3), .QN(n4)
         );
  INVX0 U53 ( .INP(n21), .ZN(n7) );
  OA221X1 U54 ( .IN1(n21), .IN2(n18), .IN3(n7), .IN4(n121), .IN5(
        \buffer2/U1/U1/wrd_count[2] ), .Q(n8) );
  OA22X1 U55 ( .IN1(n31), .IN2(n1), .IN3(n4), .IN4(n8), .Q(n9) );
  NOR2X0 U56 ( .IN1(n16), .IN2(n9), .QN(\buffer2/U1/U1/N56 ) );
  NOR2X0 U57 ( .IN1(rst), .IN2(n6), .QN(n10) );
  MUX21X1 U58 ( .IN1(n143), .IN2(\count[0] ), .S(n10), .Q(n11) );
  INVX0 U59 ( .INP(n11), .ZN(n152) );
  NAND2X1 U60 ( .IN1(n101), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[46] ), .QN(n53)
         );
  INVX0 U61 ( .INP(n144), .ZN(n12) );
  OA21X1 U62 ( .IN1(\count[0] ), .IN2(n12), .IN3(n143), .Q(n153) );
  NAND2X1 U63 ( .IN1(n140), .IN2(n139), .QN(n65) );
  NOR2X0 U64 ( .IN1(\buffer2/rd_addr[0] ), .IN2(send_data), .QN(n64) );
  NAND2X1 U65 ( .IN1(n101), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[47] ), .QN(n51)
         );
  INVX0 U67 ( .INP(n151), .ZN(n14) );
  MUX21X1 U68 ( .IN1(n14), .IN2(empty), .S(n153), .Q(n26) );
  NAND2X1 U69 ( .IN1(rst_n), .IN2(n109), .QN(n110) );
  NAND2X1 U70 ( .IN1(n136), .IN2(\buffer2/wr_addr[1] ), .QN(n135) );
  NAND2X1 U71 ( .IN1(rst_n), .IN2(\buffer2/wr_addr[1] ), .QN(n108) );
  NAND2X1 U72 ( .IN1(rst_n), .IN2(n28), .QN(n116) );
  AND3X1 U73 ( .IN1(\buffer2/rd_addr[1] ), .IN2(n15), .IN3(n20), .Q(n101) );
  AO221X1 U74 ( .IN1(rst_n), .IN2(\buffer2/wr_addr[0] ), .IN3(rst_n), .IN4(
        \buffer2/wr_addr[1] ), .IN5(n137), .Q(n118) );
  NOR4X0 U75 ( .IN1(\buffer2/wr_addr[0] ), .IN2(n133), .IN3(n17), .IN4(n116), 
        .QN(n119) );
  AND2X1 U76 ( .IN1(n113), .IN2(rst_n), .Q(n115) );
  AND2X1 U77 ( .IN1(n105), .IN2(rst_n), .Q(n106) );
  NAND3X0 U78 ( .IN1(n134), .IN2(n22), .IN3(n17), .QN(n109) );
  NOR2X0 U79 ( .IN1(n80), .IN2(n79), .QN(n50) );
  NOR2X0 U80 ( .IN1(n76), .IN2(n75), .QN(n54) );
  NOR2X0 U81 ( .IN1(n74), .IN2(n73), .QN(n56) );
  NOR2X0 U82 ( .IN1(n78), .IN2(n77), .QN(n52) );
  NOR2X0 U83 ( .IN1(n72), .IN2(n71), .QN(n58) );
  NOR2X0 U84 ( .IN1(n70), .IN2(n69), .QN(n60) );
  NOR2X0 U85 ( .IN1(n102), .IN2(n100), .QN(n32) );
  NOR2X0 U86 ( .IN1(n96), .IN2(n95), .QN(n34) );
  NOR2X0 U87 ( .IN1(n94), .IN2(n93), .QN(n36) );
  NOR2X0 U88 ( .IN1(n92), .IN2(n91), .QN(n38) );
  NOR2X0 U89 ( .IN1(n90), .IN2(n89), .QN(n40) );
  NOR2X0 U90 ( .IN1(n88), .IN2(n87), .QN(n42) );
  NOR2X0 U91 ( .IN1(n86), .IN2(n85), .QN(n44) );
  NOR2X0 U92 ( .IN1(n84), .IN2(n83), .QN(n46) );
  NOR2X0 U93 ( .IN1(n82), .IN2(n81), .QN(n48) );
  NOR2X0 U94 ( .IN1(n68), .IN2(n67), .QN(n62) );
  NOR2X0 U95 ( .IN1(n64), .IN2(n65), .QN(\buffer2/U1/U1/N51 ) );
  NAND2X1 U96 ( .IN1(n48), .IN2(n49), .QN(data_o[1]) );
  NAND2X1 U97 ( .IN1(n46), .IN2(n47), .QN(data_o[2]) );
  NAND2X1 U98 ( .IN1(n44), .IN2(n45), .QN(data_o[3]) );
  NAND2X1 U99 ( .IN1(n42), .IN2(n43), .QN(data_o[4]) );
  NAND2X1 U100 ( .IN1(n40), .IN2(n41), .QN(data_o[5]) );
  NAND2X1 U101 ( .IN1(n38), .IN2(n39), .QN(data_o[6]) );
  NAND2X1 U102 ( .IN1(n36), .IN2(n37), .QN(data_o[7]) );
  NAND2X1 U103 ( .IN1(n34), .IN2(n35), .QN(data_o[8]) );
  NAND2X1 U104 ( .IN1(n32), .IN2(n33), .QN(data_o[9]) );
  NAND2X1 U105 ( .IN1(n60), .IN2(n61), .QN(data_o[10]) );
  NAND2X1 U106 ( .IN1(n58), .IN2(n59), .QN(data_o[11]) );
  NAND2X1 U107 ( .IN1(n56), .IN2(n57), .QN(data_o[12]) );
  NAND2X1 U108 ( .IN1(n54), .IN2(n55), .QN(data_o[13]) );
  NAND2X1 U109 ( .IN1(n52), .IN2(n53), .QN(data_o[14]) );
  NAND2X1 U110 ( .IN1(n50), .IN2(n51), .QN(data_o[15]) );
  NAND2X1 U111 ( .IN1(n62), .IN2(n63), .QN(data_o[0]) );
  AND3X1 U112 ( .IN1(\buffer2/rd_addr[1] ), .IN2(\buffer2/rd_addr[0] ), .IN3(
        n15), .Q(n131) );
  AND3X1 U113 ( .IN1(n15), .IN2(n23), .IN3(n20), .Q(n97) );
  AO22X1 U114 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[48] ), .IN2(n131), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[0] ), .IN4(n97), .Q(n68) );
  AND3X1 U115 ( .IN1(\buffer2/rd_addr[0] ), .IN2(n15), .IN3(n23), .Q(n99) );
  AND3X1 U116 ( .IN1(\buffer2/rd_addr[2] ), .IN2(n23), .IN3(n20), .Q(n98) );
  AO22X1 U117 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[16] ), .IN2(n99), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[64] ), .IN4(n98), .Q(n67) );
  AO22X1 U118 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[58] ), .IN2(n131), .IN3(n97), .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[10] ), .Q(n70) );
  AO22X1 U119 ( .IN1(n99), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[26] ), .IN3(n98), 
        .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[74] ), .Q(n69) );
  AO22X1 U120 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[59] ), .IN2(n131), .IN3(n97), .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[11] ), .Q(n72) );
  AO22X1 U121 ( .IN1(n99), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[27] ), .IN3(n98), 
        .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[75] ), .Q(n71) );
  AO22X1 U122 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[60] ), .IN2(n131), .IN3(n97), .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[12] ), .Q(n74) );
  AO22X1 U123 ( .IN1(n99), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[28] ), .IN3(n98), 
        .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[76] ), .Q(n73) );
  AO22X1 U124 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[61] ), .IN2(n131), .IN3(n97), .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[13] ), .Q(n76) );
  AO22X1 U125 ( .IN1(n99), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[29] ), .IN3(n98), 
        .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[77] ), .Q(n75) );
  AO22X1 U126 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[62] ), .IN2(n131), .IN3(n97), .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[14] ), .Q(n78) );
  AO22X1 U127 ( .IN1(n99), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[30] ), .IN3(n98), 
        .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[78] ), .Q(n77) );
  AO22X1 U128 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[63] ), .IN2(n131), .IN3(n97), .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[15] ), .Q(n80) );
  AO22X1 U129 ( .IN1(n99), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[31] ), .IN3(n98), 
        .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[79] ), .Q(n79) );
  AO22X1 U130 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[49] ), .IN2(n131), .IN3(n97), .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[1] ), .Q(n82) );
  AO22X1 U131 ( .IN1(n99), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[17] ), .IN3(n98), 
        .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[65] ), .Q(n81) );
  AO22X1 U132 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[50] ), .IN2(n131), .IN3(n97), .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[2] ), .Q(n84) );
  AO22X1 U133 ( .IN1(n99), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[18] ), .IN3(n98), 
        .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[66] ), .Q(n83) );
  AO22X1 U134 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[51] ), .IN2(n131), .IN3(n97), .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[3] ), .Q(n86) );
  AO22X1 U135 ( .IN1(n99), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[19] ), .IN3(n98), 
        .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[67] ), .Q(n85) );
  AO22X1 U136 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[52] ), .IN2(n131), .IN3(n97), .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[4] ), .Q(n88) );
  AO22X1 U137 ( .IN1(n99), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[20] ), .IN3(n98), 
        .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[68] ), .Q(n87) );
  AO22X1 U138 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[53] ), .IN2(n131), .IN3(n97), .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[5] ), .Q(n90) );
  AO22X1 U139 ( .IN1(n99), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[21] ), .IN3(n98), 
        .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[69] ), .Q(n89) );
  AO22X1 U140 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[54] ), .IN2(n131), .IN3(n97), .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[6] ), .Q(n92) );
  AO22X1 U141 ( .IN1(n99), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[22] ), .IN3(n98), 
        .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[70] ), .Q(n91) );
  AO22X1 U142 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[55] ), .IN2(n131), .IN3(n97), .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[7] ), .Q(n94) );
  AO22X1 U143 ( .IN1(n99), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[23] ), .IN3(n98), 
        .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[71] ), .Q(n93) );
  AO22X1 U144 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[56] ), .IN2(n131), .IN3(n97), .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[8] ), .Q(n96) );
  AO22X1 U145 ( .IN1(n99), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[24] ), .IN3(n98), 
        .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[72] ), .Q(n95) );
  AO22X1 U146 ( .IN1(\buffer2/U2/M0_1_0/tmp_mux_in[57] ), .IN2(n131), .IN3(n97), .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[9] ), .Q(n102) );
  AO22X1 U147 ( .IN1(n99), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[25] ), .IN3(n98), 
        .IN4(\buffer2/U2/M0_1_0/tmp_mux_in[73] ), .Q(n100) );
  AO22X1 U148 ( .IN1(data_i[0]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[0] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][0] ) );
  AO22X1 U149 ( .IN1(data_i[10]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[10] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][10] ) );
  AO22X1 U150 ( .IN1(data_i[11]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[11] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][11] ) );
  AO22X1 U151 ( .IN1(data_i[12]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[12] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][12] ) );
  AO22X1 U152 ( .IN1(data_i[13]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[13] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][13] ) );
  AO22X1 U153 ( .IN1(data_i[14]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[14] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][14] ) );
  AO22X1 U154 ( .IN1(data_i[15]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[15] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][15] ) );
  AO22X1 U155 ( .IN1(data_i[1]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[1] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][1] ) );
  AO22X1 U156 ( .IN1(data_i[2]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[2] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][2] ) );
  AO22X1 U157 ( .IN1(data_i[3]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[3] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][3] ) );
  AO22X1 U158 ( .IN1(data_i[4]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[4] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][4] ) );
  AO22X1 U159 ( .IN1(data_i[5]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[5] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][5] ) );
  AO22X1 U160 ( .IN1(data_i[6]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[6] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][6] ) );
  AO22X1 U161 ( .IN1(data_i[7]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[7] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][7] ) );
  AO22X1 U162 ( .IN1(data_i[8]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[8] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][8] ) );
  AO22X1 U163 ( .IN1(data_i[9]), .IN2(n104), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[9] ), .IN4(n103), .Q(
        \buffer2/U2/M0_1_0/din[0][9] ) );
  NAND3X0 U164 ( .IN1(n136), .IN2(n28), .IN3(n17), .QN(n105) );
  AO22X1 U165 ( .IN1(data_i[0]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[16] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][0] ) );
  AO22X1 U166 ( .IN1(data_i[10]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[26] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][10] ) );
  AO22X1 U167 ( .IN1(data_i[11]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[27] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][11] ) );
  AO22X1 U168 ( .IN1(data_i[12]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[28] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][12] ) );
  AO22X1 U169 ( .IN1(data_i[13]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[29] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][13] ) );
  AO22X1 U170 ( .IN1(data_i[14]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[30] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][14] ) );
  AO22X1 U171 ( .IN1(data_i[15]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[31] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][15] ) );
  AO22X1 U172 ( .IN1(data_i[1]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[17] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][1] ) );
  AO22X1 U173 ( .IN1(data_i[2]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[18] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][2] ) );
  AO22X1 U174 ( .IN1(data_i[3]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[19] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][3] ) );
  AO22X1 U175 ( .IN1(data_i[4]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[20] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][4] ) );
  AO22X1 U176 ( .IN1(data_i[5]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[21] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][5] ) );
  AO22X1 U177 ( .IN1(data_i[6]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[22] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][6] ) );
  AO22X1 U178 ( .IN1(data_i[7]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[23] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][7] ) );
  AO22X1 U179 ( .IN1(data_i[8]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[24] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][8] ) );
  AO22X1 U180 ( .IN1(data_i[9]), .IN2(n107), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[25] ), .IN4(n106), .Q(
        \buffer2/U2/M0_1_0/din[1][9] ) );
  AO22X1 U181 ( .IN1(data_i[0]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[32] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][0] ) );
  AO22X1 U182 ( .IN1(data_i[10]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[42] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][10] ) );
  AO22X1 U183 ( .IN1(data_i[11]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[43] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][11] ) );
  AO22X1 U184 ( .IN1(data_i[12]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[44] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][12] ) );
  AO22X1 U185 ( .IN1(data_i[13]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[45] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][13] ) );
  AO22X1 U186 ( .IN1(data_i[14]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[46] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][14] ) );
  AO22X1 U187 ( .IN1(data_i[15]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[47] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][15] ) );
  AO22X1 U188 ( .IN1(data_i[1]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[33] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][1] ) );
  AO22X1 U189 ( .IN1(data_i[2]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[34] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][2] ) );
  AO22X1 U190 ( .IN1(data_i[3]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[35] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][3] ) );
  AO22X1 U191 ( .IN1(data_i[4]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[36] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][4] ) );
  AO22X1 U192 ( .IN1(data_i[5]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[37] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][5] ) );
  AO22X1 U193 ( .IN1(data_i[6]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[38] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][6] ) );
  AO22X1 U194 ( .IN1(data_i[7]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[39] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][7] ) );
  AO22X1 U195 ( .IN1(data_i[8]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[40] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][8] ) );
  AO22X1 U196 ( .IN1(data_i[9]), .IN2(n112), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[41] ), .IN4(n111), .Q(
        \buffer2/U2/M0_1_0/din[2][9] ) );
  AO22X1 U197 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[48] ), .IN3(
        data_i[0]), .IN4(n114), .Q(\buffer2/U2/M0_1_0/din[3][0] ) );
  AO22X1 U198 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[58] ), .IN3(
        n114), .IN4(data_i[10]), .Q(\buffer2/U2/M0_1_0/din[3][10] ) );
  AO22X1 U199 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[59] ), .IN3(
        n114), .IN4(data_i[11]), .Q(\buffer2/U2/M0_1_0/din[3][11] ) );
  AO22X1 U200 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[60] ), .IN3(
        n114), .IN4(data_i[12]), .Q(\buffer2/U2/M0_1_0/din[3][12] ) );
  AO22X1 U201 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[61] ), .IN3(
        n114), .IN4(data_i[13]), .Q(\buffer2/U2/M0_1_0/din[3][13] ) );
  AO22X1 U202 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[62] ), .IN3(
        n114), .IN4(data_i[14]), .Q(\buffer2/U2/M0_1_0/din[3][14] ) );
  AO22X1 U203 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[63] ), .IN3(
        n114), .IN4(data_i[15]), .Q(\buffer2/U2/M0_1_0/din[3][15] ) );
  AO22X1 U204 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[49] ), .IN3(
        n114), .IN4(data_i[1]), .Q(\buffer2/U2/M0_1_0/din[3][1] ) );
  AO22X1 U205 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[50] ), .IN3(
        n114), .IN4(data_i[2]), .Q(\buffer2/U2/M0_1_0/din[3][2] ) );
  AO22X1 U206 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[51] ), .IN3(
        n114), .IN4(data_i[3]), .Q(\buffer2/U2/M0_1_0/din[3][3] ) );
  AO22X1 U207 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[52] ), .IN3(
        n114), .IN4(data_i[4]), .Q(\buffer2/U2/M0_1_0/din[3][4] ) );
  AO22X1 U208 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[53] ), .IN3(
        n114), .IN4(data_i[5]), .Q(\buffer2/U2/M0_1_0/din[3][5] ) );
  AO22X1 U209 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[54] ), .IN3(
        n114), .IN4(data_i[6]), .Q(\buffer2/U2/M0_1_0/din[3][6] ) );
  AO22X1 U210 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[55] ), .IN3(
        n114), .IN4(data_i[7]), .Q(\buffer2/U2/M0_1_0/din[3][7] ) );
  AO22X1 U211 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[56] ), .IN3(
        n114), .IN4(data_i[8]), .Q(\buffer2/U2/M0_1_0/din[3][8] ) );
  AO22X1 U212 ( .IN1(n115), .IN2(\buffer2/U2/M0_1_0/tmp_mux_in[57] ), .IN3(
        n114), .IN4(data_i[9]), .Q(\buffer2/U2/M0_1_0/din[3][9] ) );
  AO22X1 U213 ( .IN1(data_i[0]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[64] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][0] ) );
  AO22X1 U214 ( .IN1(data_i[10]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[74] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][10] ) );
  AO22X1 U215 ( .IN1(data_i[11]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[75] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][11] ) );
  AO22X1 U216 ( .IN1(data_i[12]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[76] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][12] ) );
  AO22X1 U217 ( .IN1(data_i[13]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[77] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][13] ) );
  AO22X1 U218 ( .IN1(data_i[14]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[78] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][14] ) );
  AO22X1 U219 ( .IN1(data_i[15]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[79] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][15] ) );
  AO22X1 U220 ( .IN1(data_i[1]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[65] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][1] ) );
  AO22X1 U221 ( .IN1(data_i[2]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[66] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][2] ) );
  AO22X1 U222 ( .IN1(data_i[3]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[67] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][3] ) );
  AO22X1 U223 ( .IN1(data_i[4]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[68] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][4] ) );
  AO22X1 U224 ( .IN1(data_i[5]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[69] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][5] ) );
  AO22X1 U225 ( .IN1(data_i[6]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[70] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][6] ) );
  AO22X1 U226 ( .IN1(data_i[7]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[71] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][7] ) );
  AO22X1 U227 ( .IN1(data_i[8]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[72] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][8] ) );
  AO22X1 U228 ( .IN1(data_i[9]), .IN2(n119), .IN3(
        \buffer2/U2/M0_1_0/tmp_mux_in[73] ), .IN4(n118), .Q(
        \buffer2/U2/M0_1_0/din[4][9] ) );
  NOR3X0 U229 ( .IN1(n24), .IN2(\count[0] ), .IN3(n19), .QN(n120) );
  MUX21X1 U230 ( .IN1(n155), .IN2(n134), .S(send_data), .Q(n122) );
  NOR2X0 U231 ( .IN1(n123), .IN2(n122), .QN(n124) );
  XNOR2X1 U232 ( .IN1(\buffer2/U1/U1/wrd_count[1] ), .IN2(n124), .Q(n125) );
  OA221X1 U233 ( .IN1(n127), .IN2(n155), .IN3(n126), .IN4(n18), .IN5(rst_n), 
        .Q(\buffer2/U1/U1/N54 ) );
  NAND4X0 U234 ( .IN1(n155), .IN2(n128), .IN3(\buffer2/U1/U1/wrd_count[2] ), 
        .IN4(n21), .QN(n129) );
  OA21X1 U235 ( .IN1(send_data), .IN2(n29), .IN3(n129), .Q(n130) );
  OR4X1 U236 ( .IN1(\buffer2/U1/U1/N55 ), .IN2(\buffer2/U1/U1/N44 ), .IN3(
        \buffer2/U1/U1/N54 ), .IN4(\buffer2/U1/U1/N56 ), .Q(
        \buffer2/U1/U1/N40 ) );
  OA21X1 U237 ( .IN1(n138), .IN2(n15), .IN3(rst_n), .Q(n139) );
  OA221X1 U238 ( .IN1(\buffer2/rd_addr[2] ), .IN2(send_data), .IN3(
        \buffer2/rd_addr[2] ), .IN4(n131), .IN5(n139), .Q(\buffer2/U1/U1/N53 )
         );
  OA21X1 U239 ( .IN1(n132), .IN2(\buffer2/wr_addr[2] ), .IN3(n137), .Q(
        \buffer2/U1/U1/N50 ) );
  OA221X1 U240 ( .IN1(n134), .IN2(\buffer2/wr_addr[0] ), .IN3(n133), .IN4(n22), 
        .IN5(n137), .Q(\buffer2/U1/U1/N48 ) );
  OA221X1 U241 ( .IN1(\buffer2/rd_addr[1] ), .IN2(n141), .IN3(n23), .IN4(n140), 
        .IN5(n139), .Q(\buffer2/U1/U1/N52 ) );
  NAND4X0 U242 ( .IN1(inc_credit_i), .IN2(\count[0] ), .IN3(n66), .IN4(n142), 
        .QN(n143) );
  AO21X1 U243 ( .IN1(n144), .IN2(n24), .IN3(n152), .Q(n154) );
  MUX21X1 U244 ( .IN1(n19), .IN2(n5), .S(n146), .Q(n147) );
  AOI21X1 U245 ( .IN1(n149), .IN2(n30), .IN3(n148), .QN(n27) );
  AO21X1 U246 ( .IN1(n149), .IN2(n148), .IN3(empty), .Q(n151) );
  NOR3X0 U247 ( .IN1(n151), .IN2(n153), .IN3(n154), .QN(n150) );
  AO221X1 U248 ( .IN1(n154), .IN2(n153), .IN3(n152), .IN4(n151), .IN5(n150), 
        .Q(n25) );
endmodule


module routeLogic_XCOORD1111_YCOORD1111_NORTH1_SOUTH1_EAST1_WEST1 ( N_data_i, 
        S_data_i, E_data_i, W_data_i, L_data_i, N_valid_i, S_valid_i, 
        E_valid_i, W_valid_i, L_valid_i, N_port_full, S_port_full, E_port_full, 
        W_port_full, L_port_full, N_turn, S_turn, E_turn, W_turn, L_turn, 
        N_port_select, S_port_select, E_port_select, W_port_select, 
        L_port_select, N_port_remove, S_port_remove, E_port_remove, 
        W_port_remove, L_port_remove, N_port_enable, S_port_enable, 
        E_port_enable, W_port_enable, L_port_enable, N_credit_inc, 
        S_credit_inc, E_credit_inc, W_credit_inc, L_credit_inc );
  input [7:0] N_data_i;
  input [7:0] S_data_i;
  input [7:0] E_data_i;
  input [7:0] W_data_i;
  input [7:0] L_data_i;
  input [4:0] N_turn;
  input [4:0] S_turn;
  input [4:0] E_turn;
  input [4:0] W_turn;
  input [4:0] L_turn;
  output [2:0] N_port_select;
  output [2:0] S_port_select;
  output [2:0] E_port_select;
  output [2:0] W_port_select;
  output [2:0] L_port_select;
  input N_valid_i, S_valid_i, E_valid_i, W_valid_i, L_valid_i, N_port_full,
         S_port_full, E_port_full, W_port_full, L_port_full;
  output N_port_remove, S_port_remove, E_port_remove, W_port_remove,
         L_port_remove, N_port_enable, S_port_enable, E_port_enable,
         W_port_enable, L_port_enable, N_credit_inc, S_credit_inc,
         E_credit_inc, W_credit_inc, L_credit_inc;
  wire   n1, n2, n3;
  tri   N_valid_i;
  tri   E_valid_i;
  tri   W_valid_i;
  tri   S_port_remove;
  tri   L_port_remove;
  assign N_credit_inc = N_valid_i;
  assign E_credit_inc = E_valid_i;
  assign W_credit_inc = W_valid_i;
  assign S_credit_inc = S_port_remove;
  assign L_credit_inc = L_port_remove;

  NAND2X1 U3 ( .IN1(N_port_select[2]), .IN2(N_port_select[0]), .QN(
        N_port_enable) );
  INVX0 U4 ( .INP(N_turn[3]), .ZN(n2) );
  INVX0 U5 ( .INP(N_port_select[0]), .ZN(L_port_remove) );
  INVX0 U6 ( .INP(N_port_select[2]), .ZN(S_port_remove) );
  INVX0 U7 ( .INP(N_turn[0]), .ZN(n1) );
  NAND4X0 U8 ( .IN1(n3), .IN2(S_valid_i), .IN3(N_turn[3]), .IN4(n1), .QN(
        N_port_select[2]) );
  INVX0 U9 ( .INP(N_port_enable), .ZN(N_port_select[1]) );
  NOR3X0 U10 ( .IN1(N_port_full), .IN2(N_turn[1]), .IN3(N_turn[2]), .QN(n3) );
  NAND4X0 U11 ( .IN1(n3), .IN2(N_turn[0]), .IN3(L_valid_i), .IN4(n2), .QN(
        N_port_select[0]) );
endmodule


module inputPort_0 ( clk, rst, data_i, write_en, shift, data_o, read_valid_o
 );
  input [15:0] data_i;
  output [15:0] data_o;
  input clk, rst, write_en, shift;
  output read_valid_o;
  wire   full, \buffer/U1/U1/N56 , \buffer/U1/U1/N55 , \buffer/U1/U1/N54 ,
         \buffer/U1/U1/N53 , \buffer/U1/U1/N52 , \buffer/U1/U1/N51 ,
         \buffer/U1/U1/N50 , \buffer/U1/U1/N49 , \buffer/U1/U1/N48 ,
         \buffer/U1/U1/N44 , \buffer/U1/U1/N40 , \buffer/U1/U1/wrd_count[1] ,
         \buffer/U1/U1/wrd_count[2] , \buffer/U2/M0_1_0/tmp_mux_in[0] ,
         \buffer/U2/M0_1_0/tmp_mux_in[1] , \buffer/U2/M0_1_0/tmp_mux_in[2] ,
         \buffer/U2/M0_1_0/tmp_mux_in[3] , \buffer/U2/M0_1_0/tmp_mux_in[4] ,
         \buffer/U2/M0_1_0/tmp_mux_in[5] , \buffer/U2/M0_1_0/tmp_mux_in[6] ,
         \buffer/U2/M0_1_0/tmp_mux_in[7] , \buffer/U2/M0_1_0/tmp_mux_in[8] ,
         \buffer/U2/M0_1_0/tmp_mux_in[9] , \buffer/U2/M0_1_0/tmp_mux_in[10] ,
         \buffer/U2/M0_1_0/tmp_mux_in[11] , \buffer/U2/M0_1_0/tmp_mux_in[12] ,
         \buffer/U2/M0_1_0/tmp_mux_in[13] , \buffer/U2/M0_1_0/tmp_mux_in[14] ,
         \buffer/U2/M0_1_0/tmp_mux_in[15] , \buffer/U2/M0_1_0/tmp_mux_in[16] ,
         \buffer/U2/M0_1_0/tmp_mux_in[17] , \buffer/U2/M0_1_0/tmp_mux_in[18] ,
         \buffer/U2/M0_1_0/tmp_mux_in[19] , \buffer/U2/M0_1_0/tmp_mux_in[20] ,
         \buffer/U2/M0_1_0/tmp_mux_in[21] , \buffer/U2/M0_1_0/tmp_mux_in[22] ,
         \buffer/U2/M0_1_0/tmp_mux_in[23] , \buffer/U2/M0_1_0/tmp_mux_in[24] ,
         \buffer/U2/M0_1_0/tmp_mux_in[25] , \buffer/U2/M0_1_0/tmp_mux_in[26] ,
         \buffer/U2/M0_1_0/tmp_mux_in[27] , \buffer/U2/M0_1_0/tmp_mux_in[28] ,
         \buffer/U2/M0_1_0/tmp_mux_in[29] , \buffer/U2/M0_1_0/tmp_mux_in[30] ,
         \buffer/U2/M0_1_0/tmp_mux_in[31] , \buffer/U2/M0_1_0/tmp_mux_in[32] ,
         \buffer/U2/M0_1_0/tmp_mux_in[33] , \buffer/U2/M0_1_0/tmp_mux_in[34] ,
         \buffer/U2/M0_1_0/tmp_mux_in[35] , \buffer/U2/M0_1_0/tmp_mux_in[36] ,
         \buffer/U2/M0_1_0/tmp_mux_in[37] , \buffer/U2/M0_1_0/tmp_mux_in[38] ,
         \buffer/U2/M0_1_0/tmp_mux_in[39] , \buffer/U2/M0_1_0/tmp_mux_in[40] ,
         \buffer/U2/M0_1_0/tmp_mux_in[41] , \buffer/U2/M0_1_0/tmp_mux_in[42] ,
         \buffer/U2/M0_1_0/tmp_mux_in[43] , \buffer/U2/M0_1_0/tmp_mux_in[44] ,
         \buffer/U2/M0_1_0/tmp_mux_in[45] , \buffer/U2/M0_1_0/tmp_mux_in[46] ,
         \buffer/U2/M0_1_0/tmp_mux_in[47] , \buffer/U2/M0_1_0/tmp_mux_in[48] ,
         \buffer/U2/M0_1_0/tmp_mux_in[49] , \buffer/U2/M0_1_0/tmp_mux_in[50] ,
         \buffer/U2/M0_1_0/tmp_mux_in[51] , \buffer/U2/M0_1_0/tmp_mux_in[52] ,
         \buffer/U2/M0_1_0/tmp_mux_in[53] , \buffer/U2/M0_1_0/tmp_mux_in[54] ,
         \buffer/U2/M0_1_0/tmp_mux_in[55] , \buffer/U2/M0_1_0/tmp_mux_in[56] ,
         \buffer/U2/M0_1_0/tmp_mux_in[57] , \buffer/U2/M0_1_0/tmp_mux_in[58] ,
         \buffer/U2/M0_1_0/tmp_mux_in[59] , \buffer/U2/M0_1_0/tmp_mux_in[60] ,
         \buffer/U2/M0_1_0/tmp_mux_in[61] , \buffer/U2/M0_1_0/tmp_mux_in[62] ,
         \buffer/U2/M0_1_0/tmp_mux_in[63] , \buffer/U2/M0_1_0/tmp_mux_in[64] ,
         \buffer/U2/M0_1_0/tmp_mux_in[65] , \buffer/U2/M0_1_0/tmp_mux_in[66] ,
         \buffer/U2/M0_1_0/tmp_mux_in[67] , \buffer/U2/M0_1_0/tmp_mux_in[68] ,
         \buffer/U2/M0_1_0/tmp_mux_in[69] , \buffer/U2/M0_1_0/tmp_mux_in[70] ,
         \buffer/U2/M0_1_0/tmp_mux_in[71] , \buffer/U2/M0_1_0/tmp_mux_in[72] ,
         \buffer/U2/M0_1_0/tmp_mux_in[73] , \buffer/U2/M0_1_0/tmp_mux_in[74] ,
         \buffer/U2/M0_1_0/tmp_mux_in[75] , \buffer/U2/M0_1_0/tmp_mux_in[76] ,
         \buffer/U2/M0_1_0/tmp_mux_in[77] , \buffer/U2/M0_1_0/tmp_mux_in[78] ,
         \buffer/U2/M0_1_0/tmp_mux_in[79] , \buffer/U2/M0_1_0/din[4][15] ,
         \buffer/U2/M0_1_0/din[4][14] , \buffer/U2/M0_1_0/din[4][13] ,
         \buffer/U2/M0_1_0/din[4][12] , \buffer/U2/M0_1_0/din[4][11] ,
         \buffer/U2/M0_1_0/din[4][10] , \buffer/U2/M0_1_0/din[4][9] ,
         \buffer/U2/M0_1_0/din[4][8] , \buffer/U2/M0_1_0/din[4][7] ,
         \buffer/U2/M0_1_0/din[4][6] , \buffer/U2/M0_1_0/din[4][5] ,
         \buffer/U2/M0_1_0/din[4][4] , \buffer/U2/M0_1_0/din[4][3] ,
         \buffer/U2/M0_1_0/din[4][2] , \buffer/U2/M0_1_0/din[4][1] ,
         \buffer/U2/M0_1_0/din[4][0] , \buffer/U2/M0_1_0/din[3][15] ,
         \buffer/U2/M0_1_0/din[3][14] , \buffer/U2/M0_1_0/din[3][13] ,
         \buffer/U2/M0_1_0/din[3][12] , \buffer/U2/M0_1_0/din[3][11] ,
         \buffer/U2/M0_1_0/din[3][10] , \buffer/U2/M0_1_0/din[3][9] ,
         \buffer/U2/M0_1_0/din[3][8] , \buffer/U2/M0_1_0/din[3][7] ,
         \buffer/U2/M0_1_0/din[3][6] , \buffer/U2/M0_1_0/din[3][5] ,
         \buffer/U2/M0_1_0/din[3][4] , \buffer/U2/M0_1_0/din[3][3] ,
         \buffer/U2/M0_1_0/din[3][2] , \buffer/U2/M0_1_0/din[3][1] ,
         \buffer/U2/M0_1_0/din[3][0] , \buffer/U2/M0_1_0/din[2][15] ,
         \buffer/U2/M0_1_0/din[2][14] , \buffer/U2/M0_1_0/din[2][13] ,
         \buffer/U2/M0_1_0/din[2][12] , \buffer/U2/M0_1_0/din[2][11] ,
         \buffer/U2/M0_1_0/din[2][10] , \buffer/U2/M0_1_0/din[2][9] ,
         \buffer/U2/M0_1_0/din[2][8] , \buffer/U2/M0_1_0/din[2][7] ,
         \buffer/U2/M0_1_0/din[2][6] , \buffer/U2/M0_1_0/din[2][5] ,
         \buffer/U2/M0_1_0/din[2][4] , \buffer/U2/M0_1_0/din[2][3] ,
         \buffer/U2/M0_1_0/din[2][2] , \buffer/U2/M0_1_0/din[2][1] ,
         \buffer/U2/M0_1_0/din[2][0] , \buffer/U2/M0_1_0/din[1][15] ,
         \buffer/U2/M0_1_0/din[1][14] , \buffer/U2/M0_1_0/din[1][13] ,
         \buffer/U2/M0_1_0/din[1][12] , \buffer/U2/M0_1_0/din[1][11] ,
         \buffer/U2/M0_1_0/din[1][10] , \buffer/U2/M0_1_0/din[1][9] ,
         \buffer/U2/M0_1_0/din[1][8] , \buffer/U2/M0_1_0/din[1][7] ,
         \buffer/U2/M0_1_0/din[1][6] , \buffer/U2/M0_1_0/din[1][5] ,
         \buffer/U2/M0_1_0/din[1][4] , \buffer/U2/M0_1_0/din[1][3] ,
         \buffer/U2/M0_1_0/din[1][2] , \buffer/U2/M0_1_0/din[1][1] ,
         \buffer/U2/M0_1_0/din[1][0] , \buffer/U2/M0_1_0/din[0][15] ,
         \buffer/U2/M0_1_0/din[0][14] , \buffer/U2/M0_1_0/din[0][13] ,
         \buffer/U2/M0_1_0/din[0][12] , \buffer/U2/M0_1_0/din[0][11] ,
         \buffer/U2/M0_1_0/din[0][10] , \buffer/U2/M0_1_0/din[0][9] ,
         \buffer/U2/M0_1_0/din[0][8] , \buffer/U2/M0_1_0/din[0][7] ,
         \buffer/U2/M0_1_0/din[0][6] , \buffer/U2/M0_1_0/din[0][5] ,
         \buffer/U2/M0_1_0/din[0][4] , \buffer/U2/M0_1_0/din[0][3] ,
         \buffer/U2/M0_1_0/din[0][2] , \buffer/U2/M0_1_0/din[0][1] ,
         \buffer/U2/M0_1_0/din[0][0] , \buffer/rd_addr[0] ,
         \buffer/rd_addr[1] , \buffer/rd_addr[2] , \buffer/wr_addr[0] ,
         \buffer/wr_addr[1] , \buffer/wr_addr[2] , n2, n3, n4, n5, n6, n8, n9,
         n10, n11, n12, n13, n15, n17, n19, n20, n21, n22, n23, n24, n25, n26,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126;
  tri   [15:0] data_i;
  tri   write_en;
  tri   shift;

  DFFX1 \buffer/U1/U1/rd_addr_int_reg[2]  ( .D(\buffer/U1/U1/N53 ), .CLK(clk), 
        .Q(\buffer/rd_addr[2] ), .QN(n22) );
  DFFX1 \buffer/U1/U1/rd_addr_int_reg[1]  ( .D(\buffer/U1/U1/N52 ), .CLK(clk), 
        .Q(\buffer/rd_addr[1] ), .QN(n24) );
  DFFX1 \buffer/U1/U1/rd_addr_int_reg[0]  ( .D(\buffer/U1/U1/N51 ), .CLK(clk), 
        .Q(\buffer/rd_addr[0] ) );
  DFFX1 \buffer/U1/U1/wr_addr_at_max_reg  ( .D(\buffer/U1/U1/N50 ), .CLK(clk), 
        .Q(\buffer/wr_addr[2] ), .QN(n20) );
  DFFX1 \buffer/U1/U1/wr_addr_int_reg[1]  ( .D(\buffer/U1/U1/N49 ), .CLK(clk), 
        .Q(\buffer/wr_addr[1] ), .QN(n25) );
  DFFX1 \buffer/U1/U1/wr_addr_int_reg[0]  ( .D(\buffer/U1/U1/N48 ), .CLK(clk), 
        .Q(\buffer/wr_addr[0] ), .QN(n23) );
  DFFX1 \buffer/U1/U1/word_count_reg[2]  ( .D(\buffer/U1/U1/N56 ), .CLK(clk), 
        .Q(\buffer/U1/U1/wrd_count[2] ), .QN(n26) );
  DFFX1 \buffer/U1/U1/word_count_reg[1]  ( .D(\buffer/U1/U1/N55 ), .CLK(clk), 
        .Q(\buffer/U1/U1/wrd_count[1] ), .QN(n28) );
  DFFX1 \buffer/U1/U1/word_count_reg[0]  ( .D(\buffer/U1/U1/N54 ), .CLK(clk), 
        .Q(n21), .QN(n126) );
  DFFX1 \buffer/U1/U1/empty_n_reg  ( .D(\buffer/U1/U1/N40 ), .CLK(clk), .Q(
        read_valid_o) );
  DFFX1 \buffer/U1/U1/full_int_reg  ( .D(\buffer/U1/U1/N44 ), .CLK(clk), .Q(
        full), .QN(n29) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_4  ( .D(\buffer/U2/M0_1_0/din[4][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[79] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_3  ( .D(\buffer/U2/M0_1_0/din[3][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[63] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_2  ( .D(\buffer/U2/M0_1_0/din[2][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[47] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_1  ( .D(\buffer/U2/M0_1_0/din[1][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[31] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_0  ( .D(\buffer/U2/M0_1_0/din[0][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[15] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_4  ( .D(\buffer/U2/M0_1_0/din[4][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[78] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_3  ( .D(\buffer/U2/M0_1_0/din[3][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[62] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_2  ( .D(\buffer/U2/M0_1_0/din[2][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[46] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_1  ( .D(\buffer/U2/M0_1_0/din[1][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[30] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_0  ( .D(\buffer/U2/M0_1_0/din[0][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[14] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_4  ( .D(\buffer/U2/M0_1_0/din[4][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[77] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_3  ( .D(\buffer/U2/M0_1_0/din[3][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[61] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_2  ( .D(\buffer/U2/M0_1_0/din[2][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[45] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_1  ( .D(\buffer/U2/M0_1_0/din[1][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[29] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_0  ( .D(\buffer/U2/M0_1_0/din[0][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[13] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_4  ( .D(\buffer/U2/M0_1_0/din[4][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[76] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_3  ( .D(\buffer/U2/M0_1_0/din[3][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[60] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_2  ( .D(\buffer/U2/M0_1_0/din[2][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[44] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_1  ( .D(\buffer/U2/M0_1_0/din[1][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[28] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_0  ( .D(\buffer/U2/M0_1_0/din[0][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[12] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_4  ( .D(\buffer/U2/M0_1_0/din[4][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[75] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_3  ( .D(\buffer/U2/M0_1_0/din[3][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[59] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_2  ( .D(\buffer/U2/M0_1_0/din[2][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[43] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_1  ( .D(\buffer/U2/M0_1_0/din[1][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[27] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_0  ( .D(\buffer/U2/M0_1_0/din[0][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[11] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_4  ( .D(\buffer/U2/M0_1_0/din[4][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[74] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_3  ( .D(\buffer/U2/M0_1_0/din[3][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[58] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_2  ( .D(\buffer/U2/M0_1_0/din[2][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[42] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_1  ( .D(\buffer/U2/M0_1_0/din[1][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[26] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_0  ( .D(\buffer/U2/M0_1_0/din[0][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[10] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_4  ( .D(\buffer/U2/M0_1_0/din[4][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[73] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_3  ( .D(\buffer/U2/M0_1_0/din[3][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[57] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_2  ( .D(\buffer/U2/M0_1_0/din[2][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[41] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_1  ( .D(\buffer/U2/M0_1_0/din[1][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[25] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_0  ( .D(\buffer/U2/M0_1_0/din[0][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[9] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_4  ( .D(\buffer/U2/M0_1_0/din[4][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[72] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_3  ( .D(\buffer/U2/M0_1_0/din[3][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[56] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_2  ( .D(\buffer/U2/M0_1_0/din[2][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[40] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_1  ( .D(\buffer/U2/M0_1_0/din[1][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[24] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_0  ( .D(\buffer/U2/M0_1_0/din[0][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[8] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_4  ( .D(\buffer/U2/M0_1_0/din[4][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[71] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_3  ( .D(\buffer/U2/M0_1_0/din[3][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[55] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_2  ( .D(\buffer/U2/M0_1_0/din[2][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[39] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_1  ( .D(\buffer/U2/M0_1_0/din[1][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[23] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_0  ( .D(\buffer/U2/M0_1_0/din[0][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[7] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_4  ( .D(\buffer/U2/M0_1_0/din[4][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[70] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_3  ( .D(\buffer/U2/M0_1_0/din[3][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[54] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_2  ( .D(\buffer/U2/M0_1_0/din[2][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[38] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_1  ( .D(\buffer/U2/M0_1_0/din[1][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[22] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_0  ( .D(\buffer/U2/M0_1_0/din[0][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[6] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_4  ( .D(\buffer/U2/M0_1_0/din[4][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[69] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_3  ( .D(\buffer/U2/M0_1_0/din[3][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[53] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_2  ( .D(\buffer/U2/M0_1_0/din[2][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[37] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_1  ( .D(\buffer/U2/M0_1_0/din[1][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[21] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_0  ( .D(\buffer/U2/M0_1_0/din[0][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[5] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_4  ( .D(\buffer/U2/M0_1_0/din[4][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[68] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_3  ( .D(\buffer/U2/M0_1_0/din[3][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[52] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_2  ( .D(\buffer/U2/M0_1_0/din[2][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[36] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_1  ( .D(\buffer/U2/M0_1_0/din[1][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[20] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_0  ( .D(\buffer/U2/M0_1_0/din[0][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[4] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_4  ( .D(\buffer/U2/M0_1_0/din[4][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[67] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_3  ( .D(\buffer/U2/M0_1_0/din[3][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[51] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_2  ( .D(\buffer/U2/M0_1_0/din[2][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[35] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_1  ( .D(\buffer/U2/M0_1_0/din[1][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[19] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_0  ( .D(\buffer/U2/M0_1_0/din[0][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[3] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_4  ( .D(\buffer/U2/M0_1_0/din[4][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[66] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_3  ( .D(\buffer/U2/M0_1_0/din[3][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[50] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_2  ( .D(\buffer/U2/M0_1_0/din[2][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[34] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_1  ( .D(\buffer/U2/M0_1_0/din[1][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[18] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_0  ( .D(\buffer/U2/M0_1_0/din[0][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[2] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_4  ( .D(\buffer/U2/M0_1_0/din[4][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[65] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_3  ( .D(\buffer/U2/M0_1_0/din[3][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[49] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_2  ( .D(\buffer/U2/M0_1_0/din[2][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[33] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_1  ( .D(\buffer/U2/M0_1_0/din[1][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[17] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_0  ( .D(\buffer/U2/M0_1_0/din[0][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[1] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_4  ( .D(\buffer/U2/M0_1_0/din[4][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[64] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_3  ( .D(\buffer/U2/M0_1_0/din[3][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[48] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_2  ( .D(\buffer/U2/M0_1_0/din[2][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[32] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_1  ( .D(\buffer/U2/M0_1_0/din[1][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[16] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_0  ( .D(\buffer/U2/M0_1_0/din[0][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[0] ) );
  AO221X1 U2 ( .IN1(1'b1), .IN2(n71), .IN3(\buffer/U2/M0_1_0/tmp_mux_in[47] ), 
        .IN4(n92), .IN5(n70), .Q(data_o[15]) );
  AO221X1 U3 ( .IN1(1'b1), .IN2(n69), .IN3(\buffer/U2/M0_1_0/tmp_mux_in[46] ), 
        .IN4(n92), .IN5(n68), .Q(data_o[14]) );
  AO221X1 U4 ( .IN1(1'b1), .IN2(n67), .IN3(\buffer/U2/M0_1_0/tmp_mux_in[45] ), 
        .IN4(n92), .IN5(n66), .Q(data_o[13]) );
  OA221X1 U5 ( .IN1(1'b0), .IN2(n122), .IN3(n121), .IN4(\buffer/wr_addr[1] ), 
        .IN5(n120), .Q(\buffer/U1/U1/N49 ) );
  OA221X1 U6 ( .IN1(1'b0), .IN2(n124), .IN3(n123), .IN4(\buffer/rd_addr[0] ), 
        .IN5(n125), .Q(\buffer/U1/U1/N51 ) );
  NOR2X0 U7 ( .IN1(\buffer/rd_addr[1] ), .IN2(n57), .QN(n90) );
  NAND2X1 U8 ( .IN1(\buffer/rd_addr[0] ), .IN2(n22), .QN(n57) );
  NAND2X1 U9 ( .IN1(n56), .IN2(n100), .QN(n101) );
  NAND2X1 U10 ( .IN1(n20), .IN2(n117), .QN(n104) );
  INVX0 U11 ( .INP(rst), .ZN(n56) );
  NAND2X1 U12 ( .IN1(shift), .IN2(read_valid_o), .QN(n115) );
  NOR2X0 U13 ( .IN1(n107), .IN2(n100), .QN(n95) );
  NAND2X1 U14 ( .IN1(n99), .IN2(n101), .QN(n94) );
  NOR2X0 U15 ( .IN1(rst), .IN2(n96), .QN(n98) );
  NOR2X0 U16 ( .IN1(n100), .IN2(n99), .QN(n103) );
  NAND2X1 U17 ( .IN1(n107), .IN2(n101), .QN(n102) );
  NOR2X0 U18 ( .IN1(rst), .IN2(n104), .QN(n105) );
  NAND2X1 U19 ( .IN1(n119), .IN2(n115), .QN(n110) );
  NAND2X1 U20 ( .IN1(n123), .IN2(n118), .QN(n111) );
  INVX0 U21 ( .INP(n118), .ZN(n119) );
  NOR2X0 U22 ( .IN1(n118), .IN2(n23), .QN(n121) );
  INVX0 U23 ( .INP(n120), .ZN(n117) );
  NAND2X1 U24 ( .IN1(n123), .IN2(\buffer/rd_addr[0] ), .QN(n125) );
  INVX0 U25 ( .INP(n115), .ZN(n123) );
  NAND2X1 U26 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[33] ), .QN(n47)
         );
  NAND2X1 U27 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[35] ), .QN(n43)
         );
  NAND2X1 U28 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[37] ), .QN(n39)
         );
  NAND2X1 U29 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[39] ), .QN(n35)
         );
  NAND2X1 U30 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[41] ), .QN(n31)
         );
  NAND2X1 U31 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[43] ), .QN(n51)
         );
  NAND2X1 U32 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[44] ), .QN(n49)
         );
  INVX0 U34 ( .INP(n119), .ZN(n2) );
  INVX0 U35 ( .INP(n126), .ZN(n3) );
  INVX0 U36 ( .INP(n123), .ZN(n4) );
  OA222X1 U37 ( .IN1(n119), .IN2(n123), .IN3(n2), .IN4(n3), .IN5(n4), .IN6(
        n126), .Q(n5) );
  XNOR2X1 U38 ( .IN1(\buffer/U1/U1/wrd_count[1] ), .IN2(n5), .Q(n6) );
  NOR2X0 U39 ( .IN1(rst), .IN2(n6), .QN(\buffer/U1/U1/N55 ) );
  MUX21X1 U41 ( .IN1(n21), .IN2(n28), .S(n111), .Q(n8) );
  NOR4X0 U42 ( .IN1(n111), .IN2(\buffer/U1/U1/wrd_count[2] ), .IN3(
        \buffer/U1/U1/wrd_count[1] ), .IN4(n21), .QN(n9) );
  AO221X1 U43 ( .IN1(\buffer/U1/U1/wrd_count[2] ), .IN2(n112), .IN3(
        \buffer/U1/U1/wrd_count[2] ), .IN4(n8), .IN5(n9), .Q(n10) );
  NOR2X0 U44 ( .IN1(n110), .IN2(n126), .QN(n11) );
  OA22X1 U45 ( .IN1(\buffer/U1/U1/wrd_count[2] ), .IN2(n11), .IN3(n126), .IN4(
        n26), .Q(n12) );
  INVX0 U46 ( .INP(rst), .ZN(n13) );
  OA221X1 U47 ( .IN1(n10), .IN2(n12), .IN3(n10), .IN4(
        \buffer/U1/U1/wrd_count[1] ), .IN5(n13), .Q(\buffer/U1/U1/N56 ) );
  NOR2X0 U49 ( .IN1(n118), .IN2(n20), .QN(n15) );
  NOR2X0 U50 ( .IN1(n15), .IN2(rst), .QN(n122) );
  MUX21X1 U52 ( .IN1(n21), .IN2(n126), .S(n112), .Q(n17) );
  NOR2X0 U53 ( .IN1(rst), .IN2(n17), .QN(\buffer/U1/U1/N54 ) );
  INVX0 U55 ( .INP(n125), .ZN(n19) );
  OA221X1 U56 ( .IN1(n125), .IN2(n24), .IN3(n19), .IN4(\buffer/rd_addr[1] ), 
        .IN5(n124), .Q(\buffer/U1/U1/N52 ) );
  NAND2X1 U57 ( .IN1(n121), .IN2(\buffer/wr_addr[1] ), .QN(n120) );
  NAND2X1 U58 ( .IN1(n56), .IN2(n25), .QN(n107) );
  NAND2X1 U59 ( .IN1(\buffer/wr_addr[1] ), .IN2(n56), .QN(n99) );
  AO221X1 U60 ( .IN1(n56), .IN2(\buffer/wr_addr[0] ), .IN3(n56), .IN4(
        \buffer/wr_addr[1] ), .IN5(n122), .Q(n108) );
  NOR4X0 U61 ( .IN1(\buffer/wr_addr[0] ), .IN2(n118), .IN3(n20), .IN4(n107), 
        .QN(n109) );
  AND2X1 U62 ( .IN1(n56), .IN2(n104), .Q(n106) );
  AND2X1 U63 ( .IN1(n56), .IN2(n96), .Q(n97) );
  NAND2X0 U64 ( .IN1(write_en), .IN2(n29), .QN(n118) );
  NAND2X1 U65 ( .IN1(n48), .IN2(n49), .QN(data_o[12]) );
  NAND2X1 U66 ( .IN1(n50), .IN2(n51), .QN(data_o[11]) );
  NAND2X1 U67 ( .IN1(n52), .IN2(n53), .QN(data_o[10]) );
  NAND2X1 U68 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[42] ), .QN(n53)
         );
  NAND2X1 U69 ( .IN1(n30), .IN2(n31), .QN(data_o[9]) );
  NAND2X1 U70 ( .IN1(n32), .IN2(n33), .QN(data_o[8]) );
  NAND2X1 U71 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[40] ), .QN(n33)
         );
  NAND2X1 U72 ( .IN1(n34), .IN2(n35), .QN(data_o[7]) );
  NAND2X1 U73 ( .IN1(n36), .IN2(n37), .QN(data_o[6]) );
  NAND2X1 U74 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[38] ), .QN(n37)
         );
  NAND2X1 U75 ( .IN1(n38), .IN2(n39), .QN(data_o[5]) );
  NAND2X1 U76 ( .IN1(n40), .IN2(n41), .QN(data_o[4]) );
  NAND2X1 U77 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[36] ), .QN(n41)
         );
  NAND2X1 U78 ( .IN1(n42), .IN2(n43), .QN(data_o[3]) );
  NAND2X1 U79 ( .IN1(n44), .IN2(n45), .QN(data_o[2]) );
  NAND2X1 U80 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[34] ), .QN(n45)
         );
  NAND2X1 U81 ( .IN1(n46), .IN2(n47), .QN(data_o[1]) );
  NAND2X1 U82 ( .IN1(n54), .IN2(n55), .QN(data_o[0]) );
  NAND2X1 U83 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[32] ), .IN2(n92), .QN(n55)
         );
  NAND3X0 U84 ( .IN1(n119), .IN2(n23), .IN3(n20), .QN(n100) );
  NOR2X0 U85 ( .IN1(n65), .IN2(n64), .QN(n48) );
  NOR2X0 U86 ( .IN1(n63), .IN2(n62), .QN(n50) );
  NOR2X0 U87 ( .IN1(n61), .IN2(n60), .QN(n52) );
  NOR2X0 U88 ( .IN1(n93), .IN2(n91), .QN(n30) );
  NOR2X0 U89 ( .IN1(n87), .IN2(n86), .QN(n32) );
  NOR2X0 U90 ( .IN1(n85), .IN2(n84), .QN(n34) );
  NOR2X0 U91 ( .IN1(n83), .IN2(n82), .QN(n36) );
  NOR2X0 U92 ( .IN1(n81), .IN2(n80), .QN(n38) );
  NOR2X0 U93 ( .IN1(n79), .IN2(n78), .QN(n40) );
  NOR2X0 U94 ( .IN1(n77), .IN2(n76), .QN(n42) );
  NOR2X0 U95 ( .IN1(n75), .IN2(n74), .QN(n44) );
  NOR2X0 U96 ( .IN1(n73), .IN2(n72), .QN(n46) );
  NOR2X0 U97 ( .IN1(n59), .IN2(n58), .QN(n54) );
  AND3X1 U98 ( .IN1(\buffer/rd_addr[1] ), .IN2(\buffer/rd_addr[0] ), .IN3(n22), 
        .Q(n116) );
  NOR3X0 U99 ( .IN1(\buffer/rd_addr[1] ), .IN2(\buffer/rd_addr[2] ), .IN3(
        \buffer/rd_addr[0] ), .QN(n88) );
  AO22X1 U100 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[48] ), .IN2(n116), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[0] ), .IN4(n88), .Q(n59) );
  NOR3X0 U101 ( .IN1(\buffer/rd_addr[2] ), .IN2(\buffer/rd_addr[0] ), .IN3(n24), .QN(n92) );
  NOR3X0 U102 ( .IN1(\buffer/rd_addr[1] ), .IN2(\buffer/rd_addr[0] ), .IN3(n22), .QN(n89) );
  AO22X1 U103 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[16] ), .IN2(n90), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[64] ), .IN4(n89), .Q(n58) );
  AO22X1 U104 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[58] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[10] ), .Q(n61) );
  AO22X1 U105 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[26] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[74] ), .Q(n60) );
  AO22X1 U106 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[59] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[11] ), .Q(n63) );
  AO22X1 U107 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[27] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[75] ), .Q(n62) );
  AO22X1 U108 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[60] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[12] ), .Q(n65) );
  AO22X1 U109 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[28] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[76] ), .Q(n64) );
  AO22X1 U110 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[61] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[13] ), .Q(n67) );
  AO22X1 U111 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[29] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[77] ), .Q(n66) );
  AO22X1 U112 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[62] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[14] ), .Q(n69) );
  AO22X1 U113 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[30] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[78] ), .Q(n68) );
  AO22X1 U114 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[63] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[15] ), .Q(n71) );
  AO22X1 U115 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[31] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[79] ), .Q(n70) );
  AO22X1 U116 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[49] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[1] ), .Q(n73) );
  AO22X1 U117 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[17] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[65] ), .Q(n72) );
  AO22X1 U118 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[50] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[2] ), .Q(n75) );
  AO22X1 U119 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[18] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[66] ), .Q(n74) );
  AO22X1 U120 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[51] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[3] ), .Q(n77) );
  AO22X1 U121 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[19] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[67] ), .Q(n76) );
  AO22X1 U122 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[52] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[4] ), .Q(n79) );
  AO22X1 U123 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[20] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[68] ), .Q(n78) );
  AO22X1 U124 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[53] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[5] ), .Q(n81) );
  AO22X1 U125 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[21] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[69] ), .Q(n80) );
  AO22X1 U126 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[54] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[6] ), .Q(n83) );
  AO22X1 U127 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[22] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[70] ), .Q(n82) );
  AO22X1 U128 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[55] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[7] ), .Q(n85) );
  AO22X1 U129 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[23] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[71] ), .Q(n84) );
  AO22X1 U130 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[56] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[8] ), .Q(n87) );
  AO22X1 U131 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[24] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[72] ), .Q(n86) );
  AO22X1 U132 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[57] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[9] ), .Q(n93) );
  AO22X1 U133 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[25] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[73] ), .Q(n91) );
  AO22X1 U134 ( .IN1(data_i[0]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[0] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][0] ) );
  AO22X1 U135 ( .IN1(data_i[10]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[10] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][10] ) );
  AO22X1 U136 ( .IN1(data_i[11]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[11] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][11] ) );
  AO22X1 U137 ( .IN1(data_i[12]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[12] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][12] ) );
  AO22X1 U138 ( .IN1(data_i[13]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[13] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][13] ) );
  AO22X1 U139 ( .IN1(data_i[14]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[14] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][14] ) );
  AO22X1 U140 ( .IN1(data_i[15]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[15] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][15] ) );
  AO22X1 U141 ( .IN1(data_i[1]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[1] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][1] ) );
  AO22X1 U142 ( .IN1(data_i[2]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[2] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][2] ) );
  AO22X1 U143 ( .IN1(data_i[3]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[3] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][3] ) );
  AO22X1 U144 ( .IN1(data_i[4]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[4] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][4] ) );
  AO22X1 U145 ( .IN1(data_i[5]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[5] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][5] ) );
  AO22X1 U146 ( .IN1(data_i[6]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[6] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][6] ) );
  AO22X1 U147 ( .IN1(data_i[7]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[7] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][7] ) );
  AO22X1 U148 ( .IN1(data_i[8]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[8] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][8] ) );
  AO22X1 U149 ( .IN1(data_i[9]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[9] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][9] ) );
  NAND3X0 U150 ( .IN1(n121), .IN2(n25), .IN3(n20), .QN(n96) );
  AO22X1 U151 ( .IN1(data_i[0]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[16] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][0] ) );
  AO22X1 U152 ( .IN1(data_i[10]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[26] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][10] ) );
  AO22X1 U153 ( .IN1(data_i[11]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[27] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][11] ) );
  AO22X1 U154 ( .IN1(data_i[12]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[28] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][12] ) );
  AO22X1 U155 ( .IN1(data_i[13]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[29] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][13] ) );
  AO22X1 U156 ( .IN1(data_i[14]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[30] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][14] ) );
  AO22X1 U157 ( .IN1(data_i[15]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[31] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][15] ) );
  AO22X1 U158 ( .IN1(data_i[1]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[17] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][1] ) );
  AO22X1 U159 ( .IN1(data_i[2]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[18] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][2] ) );
  AO22X1 U160 ( .IN1(data_i[3]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[19] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][3] ) );
  AO22X1 U161 ( .IN1(data_i[4]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[20] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][4] ) );
  AO22X1 U162 ( .IN1(data_i[5]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[21] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][5] ) );
  AO22X1 U163 ( .IN1(data_i[6]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[22] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][6] ) );
  AO22X1 U164 ( .IN1(data_i[7]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[23] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][7] ) );
  AO22X1 U165 ( .IN1(data_i[8]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[24] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][8] ) );
  AO22X1 U166 ( .IN1(data_i[9]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[25] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][9] ) );
  AO22X1 U167 ( .IN1(data_i[0]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[32] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][0] ) );
  AO22X1 U168 ( .IN1(data_i[10]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[42] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][10] ) );
  AO22X1 U169 ( .IN1(data_i[11]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[43] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][11] ) );
  AO22X1 U170 ( .IN1(data_i[12]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[44] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][12] ) );
  AO22X1 U171 ( .IN1(data_i[13]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[45] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][13] ) );
  AO22X1 U172 ( .IN1(data_i[14]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[46] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][14] ) );
  AO22X1 U173 ( .IN1(data_i[15]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[47] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][15] ) );
  AO22X1 U174 ( .IN1(data_i[1]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[33] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][1] ) );
  AO22X1 U175 ( .IN1(data_i[2]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[34] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][2] ) );
  AO22X1 U176 ( .IN1(data_i[3]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[35] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][3] ) );
  AO22X1 U177 ( .IN1(data_i[4]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[36] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][4] ) );
  AO22X1 U178 ( .IN1(data_i[5]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[37] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][5] ) );
  AO22X1 U179 ( .IN1(data_i[6]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[38] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][6] ) );
  AO22X1 U180 ( .IN1(data_i[7]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[39] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][7] ) );
  AO22X1 U181 ( .IN1(data_i[8]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[40] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][8] ) );
  AO22X1 U182 ( .IN1(data_i[9]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[41] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][9] ) );
  AO22X1 U183 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[48] ), .IN3(
        data_i[0]), .IN4(n105), .Q(\buffer/U2/M0_1_0/din[3][0] ) );
  AO22X1 U184 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[58] ), .IN3(n105), .IN4(data_i[10]), .Q(\buffer/U2/M0_1_0/din[3][10] ) );
  AO22X1 U185 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[59] ), .IN3(n105), .IN4(data_i[11]), .Q(\buffer/U2/M0_1_0/din[3][11] ) );
  AO22X1 U186 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[60] ), .IN3(n105), .IN4(data_i[12]), .Q(\buffer/U2/M0_1_0/din[3][12] ) );
  AO22X1 U187 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[61] ), .IN3(n105), .IN4(data_i[13]), .Q(\buffer/U2/M0_1_0/din[3][13] ) );
  AO22X1 U188 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[62] ), .IN3(n105), .IN4(data_i[14]), .Q(\buffer/U2/M0_1_0/din[3][14] ) );
  AO22X1 U189 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[63] ), .IN3(n105), .IN4(data_i[15]), .Q(\buffer/U2/M0_1_0/din[3][15] ) );
  AO22X1 U190 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[49] ), .IN3(n105), .IN4(data_i[1]), .Q(\buffer/U2/M0_1_0/din[3][1] ) );
  AO22X1 U191 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[50] ), .IN3(n105), .IN4(data_i[2]), .Q(\buffer/U2/M0_1_0/din[3][2] ) );
  AO22X1 U192 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[51] ), .IN3(n105), .IN4(data_i[3]), .Q(\buffer/U2/M0_1_0/din[3][3] ) );
  AO22X1 U193 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[52] ), .IN3(n105), .IN4(data_i[4]), .Q(\buffer/U2/M0_1_0/din[3][4] ) );
  AO22X1 U194 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[53] ), .IN3(n105), .IN4(data_i[5]), .Q(\buffer/U2/M0_1_0/din[3][5] ) );
  AO22X1 U195 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[54] ), .IN3(n105), .IN4(data_i[6]), .Q(\buffer/U2/M0_1_0/din[3][6] ) );
  AO22X1 U196 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[55] ), .IN3(n105), .IN4(data_i[7]), .Q(\buffer/U2/M0_1_0/din[3][7] ) );
  AO22X1 U197 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[56] ), .IN3(n105), .IN4(data_i[8]), .Q(\buffer/U2/M0_1_0/din[3][8] ) );
  AO22X1 U198 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[57] ), .IN3(n105), .IN4(data_i[9]), .Q(\buffer/U2/M0_1_0/din[3][9] ) );
  AO22X1 U199 ( .IN1(data_i[0]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[64] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][0] ) );
  AO22X1 U200 ( .IN1(data_i[10]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[74] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][10] ) );
  AO22X1 U201 ( .IN1(data_i[11]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[75] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][11] ) );
  AO22X1 U202 ( .IN1(data_i[12]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[76] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][12] ) );
  AO22X1 U203 ( .IN1(data_i[13]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[77] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][13] ) );
  AO22X1 U204 ( .IN1(data_i[14]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[78] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][14] ) );
  AO22X1 U205 ( .IN1(data_i[15]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[79] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][15] ) );
  AO22X1 U206 ( .IN1(data_i[1]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[65] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][1] ) );
  AO22X1 U207 ( .IN1(data_i[2]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[66] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][2] ) );
  AO22X1 U208 ( .IN1(data_i[3]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[67] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][3] ) );
  AO22X1 U209 ( .IN1(data_i[4]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[68] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][4] ) );
  AO22X1 U210 ( .IN1(data_i[5]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[69] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][5] ) );
  AO22X1 U211 ( .IN1(data_i[6]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[70] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][6] ) );
  AO22X1 U212 ( .IN1(data_i[7]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[71] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][7] ) );
  AO22X1 U213 ( .IN1(data_i[8]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[72] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][8] ) );
  AO22X1 U214 ( .IN1(data_i[9]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[73] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][9] ) );
  AND2X1 U215 ( .IN1(n111), .IN2(n110), .Q(n112) );
  NOR4X0 U216 ( .IN1(n118), .IN2(n21), .IN3(n26), .IN4(
        \buffer/U1/U1/wrd_count[1] ), .QN(n113) );
  NOR2X0 U217 ( .IN1(full), .IN2(n113), .QN(n114) );
  NOR3X0 U218 ( .IN1(n114), .IN2(rst), .IN3(shift), .QN(\buffer/U1/U1/N44 ) );
  OR4X1 U219 ( .IN1(\buffer/U1/U1/N55 ), .IN2(\buffer/U1/U1/N44 ), .IN3(
        \buffer/U1/U1/N54 ), .IN4(\buffer/U1/U1/N56 ), .Q(\buffer/U1/U1/N40 )
         );
  OA21X1 U220 ( .IN1(n115), .IN2(n22), .IN3(n56), .Q(n124) );
  OA221X1 U221 ( .IN1(\buffer/rd_addr[2] ), .IN2(n123), .IN3(
        \buffer/rd_addr[2] ), .IN4(n116), .IN5(n124), .Q(\buffer/U1/U1/N53 )
         );
  OA21X1 U222 ( .IN1(n117), .IN2(\buffer/wr_addr[2] ), .IN3(n122), .Q(
        \buffer/U1/U1/N50 ) );
  OA221X1 U223 ( .IN1(n119), .IN2(\buffer/wr_addr[0] ), .IN3(n118), .IN4(n23), 
        .IN5(n122), .Q(\buffer/U1/U1/N48 ) );
endmodule


module inputPort_1 ( clk, rst, data_i, write_en, shift, data_o, read_valid_o
 );
  input [15:0] data_i;
  output [15:0] data_o;
  input clk, rst, write_en, shift;
  output read_valid_o;
  wire   \buffer/U1/U1/N56 , \buffer/U1/U1/N55 , \buffer/U1/U1/N54 ,
         \buffer/U1/U1/N53 , \buffer/U1/U1/N52 , \buffer/U1/U1/N51 ,
         \buffer/U1/U1/N50 , \buffer/U1/U1/N49 , \buffer/U1/U1/N48 ,
         \buffer/U1/U1/N44 , \buffer/U1/U1/N40 , \buffer/U1/U1/wrd_count[1] ,
         \buffer/U1/U1/wrd_count[2] , \buffer/U2/M0_1_0/tmp_mux_in[0] ,
         \buffer/U2/M0_1_0/tmp_mux_in[1] , \buffer/U2/M0_1_0/tmp_mux_in[2] ,
         \buffer/U2/M0_1_0/tmp_mux_in[3] , \buffer/U2/M0_1_0/tmp_mux_in[4] ,
         \buffer/U2/M0_1_0/tmp_mux_in[5] , \buffer/U2/M0_1_0/tmp_mux_in[6] ,
         \buffer/U2/M0_1_0/tmp_mux_in[7] , \buffer/U2/M0_1_0/tmp_mux_in[8] ,
         \buffer/U2/M0_1_0/tmp_mux_in[9] , \buffer/U2/M0_1_0/tmp_mux_in[10] ,
         \buffer/U2/M0_1_0/tmp_mux_in[11] , \buffer/U2/M0_1_0/tmp_mux_in[12] ,
         \buffer/U2/M0_1_0/tmp_mux_in[13] , \buffer/U2/M0_1_0/tmp_mux_in[14] ,
         \buffer/U2/M0_1_0/tmp_mux_in[15] , \buffer/U2/M0_1_0/tmp_mux_in[16] ,
         \buffer/U2/M0_1_0/tmp_mux_in[17] , \buffer/U2/M0_1_0/tmp_mux_in[18] ,
         \buffer/U2/M0_1_0/tmp_mux_in[19] , \buffer/U2/M0_1_0/tmp_mux_in[20] ,
         \buffer/U2/M0_1_0/tmp_mux_in[21] , \buffer/U2/M0_1_0/tmp_mux_in[22] ,
         \buffer/U2/M0_1_0/tmp_mux_in[23] , \buffer/U2/M0_1_0/tmp_mux_in[24] ,
         \buffer/U2/M0_1_0/tmp_mux_in[25] , \buffer/U2/M0_1_0/tmp_mux_in[26] ,
         \buffer/U2/M0_1_0/tmp_mux_in[27] , \buffer/U2/M0_1_0/tmp_mux_in[28] ,
         \buffer/U2/M0_1_0/tmp_mux_in[29] , \buffer/U2/M0_1_0/tmp_mux_in[30] ,
         \buffer/U2/M0_1_0/tmp_mux_in[31] , \buffer/U2/M0_1_0/tmp_mux_in[32] ,
         \buffer/U2/M0_1_0/tmp_mux_in[33] , \buffer/U2/M0_1_0/tmp_mux_in[34] ,
         \buffer/U2/M0_1_0/tmp_mux_in[35] , \buffer/U2/M0_1_0/tmp_mux_in[36] ,
         \buffer/U2/M0_1_0/tmp_mux_in[37] , \buffer/U2/M0_1_0/tmp_mux_in[38] ,
         \buffer/U2/M0_1_0/tmp_mux_in[39] , \buffer/U2/M0_1_0/tmp_mux_in[40] ,
         \buffer/U2/M0_1_0/tmp_mux_in[41] , \buffer/U2/M0_1_0/tmp_mux_in[42] ,
         \buffer/U2/M0_1_0/tmp_mux_in[43] , \buffer/U2/M0_1_0/tmp_mux_in[44] ,
         \buffer/U2/M0_1_0/tmp_mux_in[45] , \buffer/U2/M0_1_0/tmp_mux_in[46] ,
         \buffer/U2/M0_1_0/tmp_mux_in[47] , \buffer/U2/M0_1_0/tmp_mux_in[48] ,
         \buffer/U2/M0_1_0/tmp_mux_in[49] , \buffer/U2/M0_1_0/tmp_mux_in[50] ,
         \buffer/U2/M0_1_0/tmp_mux_in[51] , \buffer/U2/M0_1_0/tmp_mux_in[52] ,
         \buffer/U2/M0_1_0/tmp_mux_in[53] , \buffer/U2/M0_1_0/tmp_mux_in[54] ,
         \buffer/U2/M0_1_0/tmp_mux_in[55] , \buffer/U2/M0_1_0/tmp_mux_in[56] ,
         \buffer/U2/M0_1_0/tmp_mux_in[57] , \buffer/U2/M0_1_0/tmp_mux_in[58] ,
         \buffer/U2/M0_1_0/tmp_mux_in[59] , \buffer/U2/M0_1_0/tmp_mux_in[60] ,
         \buffer/U2/M0_1_0/tmp_mux_in[61] , \buffer/U2/M0_1_0/tmp_mux_in[62] ,
         \buffer/U2/M0_1_0/tmp_mux_in[63] , \buffer/U2/M0_1_0/tmp_mux_in[64] ,
         \buffer/U2/M0_1_0/tmp_mux_in[65] , \buffer/U2/M0_1_0/tmp_mux_in[66] ,
         \buffer/U2/M0_1_0/tmp_mux_in[67] , \buffer/U2/M0_1_0/tmp_mux_in[68] ,
         \buffer/U2/M0_1_0/tmp_mux_in[69] , \buffer/U2/M0_1_0/tmp_mux_in[70] ,
         \buffer/U2/M0_1_0/tmp_mux_in[71] , \buffer/U2/M0_1_0/tmp_mux_in[72] ,
         \buffer/U2/M0_1_0/tmp_mux_in[73] , \buffer/U2/M0_1_0/tmp_mux_in[74] ,
         \buffer/U2/M0_1_0/tmp_mux_in[75] , \buffer/U2/M0_1_0/tmp_mux_in[76] ,
         \buffer/U2/M0_1_0/tmp_mux_in[77] , \buffer/U2/M0_1_0/tmp_mux_in[78] ,
         \buffer/U2/M0_1_0/tmp_mux_in[79] , \buffer/U2/M0_1_0/din[4][15] ,
         \buffer/U2/M0_1_0/din[4][14] , \buffer/U2/M0_1_0/din[4][13] ,
         \buffer/U2/M0_1_0/din[4][12] , \buffer/U2/M0_1_0/din[4][11] ,
         \buffer/U2/M0_1_0/din[4][10] , \buffer/U2/M0_1_0/din[4][9] ,
         \buffer/U2/M0_1_0/din[4][8] , \buffer/U2/M0_1_0/din[4][7] ,
         \buffer/U2/M0_1_0/din[4][6] , \buffer/U2/M0_1_0/din[4][5] ,
         \buffer/U2/M0_1_0/din[4][4] , \buffer/U2/M0_1_0/din[4][3] ,
         \buffer/U2/M0_1_0/din[4][2] , \buffer/U2/M0_1_0/din[4][1] ,
         \buffer/U2/M0_1_0/din[4][0] , \buffer/U2/M0_1_0/din[3][15] ,
         \buffer/U2/M0_1_0/din[3][14] , \buffer/U2/M0_1_0/din[3][13] ,
         \buffer/U2/M0_1_0/din[3][12] , \buffer/U2/M0_1_0/din[3][11] ,
         \buffer/U2/M0_1_0/din[3][10] , \buffer/U2/M0_1_0/din[3][9] ,
         \buffer/U2/M0_1_0/din[3][8] , \buffer/U2/M0_1_0/din[3][7] ,
         \buffer/U2/M0_1_0/din[3][6] , \buffer/U2/M0_1_0/din[3][5] ,
         \buffer/U2/M0_1_0/din[3][4] , \buffer/U2/M0_1_0/din[3][3] ,
         \buffer/U2/M0_1_0/din[3][2] , \buffer/U2/M0_1_0/din[3][1] ,
         \buffer/U2/M0_1_0/din[3][0] , \buffer/U2/M0_1_0/din[2][15] ,
         \buffer/U2/M0_1_0/din[2][14] , \buffer/U2/M0_1_0/din[2][13] ,
         \buffer/U2/M0_1_0/din[2][12] , \buffer/U2/M0_1_0/din[2][11] ,
         \buffer/U2/M0_1_0/din[2][10] , \buffer/U2/M0_1_0/din[2][9] ,
         \buffer/U2/M0_1_0/din[2][8] , \buffer/U2/M0_1_0/din[2][7] ,
         \buffer/U2/M0_1_0/din[2][6] , \buffer/U2/M0_1_0/din[2][5] ,
         \buffer/U2/M0_1_0/din[2][4] , \buffer/U2/M0_1_0/din[2][3] ,
         \buffer/U2/M0_1_0/din[2][2] , \buffer/U2/M0_1_0/din[2][1] ,
         \buffer/U2/M0_1_0/din[2][0] , \buffer/U2/M0_1_0/din[1][15] ,
         \buffer/U2/M0_1_0/din[1][14] , \buffer/U2/M0_1_0/din[1][13] ,
         \buffer/U2/M0_1_0/din[1][12] , \buffer/U2/M0_1_0/din[1][11] ,
         \buffer/U2/M0_1_0/din[1][10] , \buffer/U2/M0_1_0/din[1][9] ,
         \buffer/U2/M0_1_0/din[1][8] , \buffer/U2/M0_1_0/din[1][7] ,
         \buffer/U2/M0_1_0/din[1][6] , \buffer/U2/M0_1_0/din[1][5] ,
         \buffer/U2/M0_1_0/din[1][4] , \buffer/U2/M0_1_0/din[1][3] ,
         \buffer/U2/M0_1_0/din[1][2] , \buffer/U2/M0_1_0/din[1][1] ,
         \buffer/U2/M0_1_0/din[1][0] , \buffer/U2/M0_1_0/din[0][15] ,
         \buffer/U2/M0_1_0/din[0][14] , \buffer/U2/M0_1_0/din[0][13] ,
         \buffer/U2/M0_1_0/din[0][12] , \buffer/U2/M0_1_0/din[0][11] ,
         \buffer/U2/M0_1_0/din[0][10] , \buffer/U2/M0_1_0/din[0][9] ,
         \buffer/U2/M0_1_0/din[0][8] , \buffer/U2/M0_1_0/din[0][7] ,
         \buffer/U2/M0_1_0/din[0][6] , \buffer/U2/M0_1_0/din[0][5] ,
         \buffer/U2/M0_1_0/din[0][4] , \buffer/U2/M0_1_0/din[0][3] ,
         \buffer/U2/M0_1_0/din[0][2] , \buffer/U2/M0_1_0/din[0][1] ,
         \buffer/U2/M0_1_0/din[0][0] , \buffer/rd_addr[0] ,
         \buffer/rd_addr[1] , \buffer/rd_addr[2] , \buffer/wr_addr[0] ,
         \buffer/wr_addr[1] , \buffer/wr_addr[2] , n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125;
  tri   [15:0] data_i;
  tri   write_en;
  tri   \buffer/U1/U1/empty_n ;
  assign read_valid_o = \buffer/U1/U1/empty_n ;

  DFFX1 \buffer/U1/U1/rd_addr_int_reg[2]  ( .D(\buffer/U1/U1/N53 ), .CLK(clk), 
        .Q(\buffer/rd_addr[2] ), .QN(n17) );
  DFFX1 \buffer/U1/U1/rd_addr_int_reg[1]  ( .D(\buffer/U1/U1/N52 ), .CLK(clk), 
        .Q(\buffer/rd_addr[1] ), .QN(n19) );
  DFFX1 \buffer/U1/U1/rd_addr_int_reg[0]  ( .D(\buffer/U1/U1/N51 ), .CLK(clk), 
        .Q(\buffer/rd_addr[0] ) );
  DFFX1 \buffer/U1/U1/wr_addr_at_max_reg  ( .D(\buffer/U1/U1/N50 ), .CLK(clk), 
        .Q(\buffer/wr_addr[2] ), .QN(n15) );
  DFFX1 \buffer/U1/U1/wr_addr_int_reg[1]  ( .D(\buffer/U1/U1/N49 ), .CLK(clk), 
        .Q(\buffer/wr_addr[1] ), .QN(n20) );
  DFFX1 \buffer/U1/U1/wr_addr_int_reg[0]  ( .D(\buffer/U1/U1/N48 ), .CLK(clk), 
        .Q(\buffer/wr_addr[0] ), .QN(n16) );
  DFFX1 \buffer/U1/U1/word_count_reg[2]  ( .D(\buffer/U1/U1/N56 ), .CLK(clk), 
        .Q(\buffer/U1/U1/wrd_count[2] ), .QN(n21) );
  DFFX1 \buffer/U1/U1/word_count_reg[1]  ( .D(\buffer/U1/U1/N55 ), .CLK(clk), 
        .Q(\buffer/U1/U1/wrd_count[1] ), .QN(n18) );
  DFFX1 \buffer/U1/U1/word_count_reg[0]  ( .D(\buffer/U1/U1/N54 ), .CLK(clk), 
        .Q(n22), .QN(n125) );
  DFFX1 \buffer/U1/U1/empty_n_reg  ( .D(\buffer/U1/U1/N40 ), .CLK(clk), .Q(
        \buffer/U1/U1/empty_n ) );
  DFFX1 \buffer/U1/U1/full_int_reg  ( .D(\buffer/U1/U1/N44 ), .CLK(clk), .QN(
        n23) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_4  ( .D(\buffer/U2/M0_1_0/din[4][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[79] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_3  ( .D(\buffer/U2/M0_1_0/din[3][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[63] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_2  ( .D(\buffer/U2/M0_1_0/din[2][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[47] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_1  ( .D(\buffer/U2/M0_1_0/din[1][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[31] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_0  ( .D(\buffer/U2/M0_1_0/din[0][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[15] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_4  ( .D(\buffer/U2/M0_1_0/din[4][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[78] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_3  ( .D(\buffer/U2/M0_1_0/din[3][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[62] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_2  ( .D(\buffer/U2/M0_1_0/din[2][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[46] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_1  ( .D(\buffer/U2/M0_1_0/din[1][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[30] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_0  ( .D(\buffer/U2/M0_1_0/din[0][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[14] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_4  ( .D(\buffer/U2/M0_1_0/din[4][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[77] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_3  ( .D(\buffer/U2/M0_1_0/din[3][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[61] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_2  ( .D(\buffer/U2/M0_1_0/din[2][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[45] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_1  ( .D(\buffer/U2/M0_1_0/din[1][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[29] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_0  ( .D(\buffer/U2/M0_1_0/din[0][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[13] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_4  ( .D(\buffer/U2/M0_1_0/din[4][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[76] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_3  ( .D(\buffer/U2/M0_1_0/din[3][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[60] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_2  ( .D(\buffer/U2/M0_1_0/din[2][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[44] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_1  ( .D(\buffer/U2/M0_1_0/din[1][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[28] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_0  ( .D(\buffer/U2/M0_1_0/din[0][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[12] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_4  ( .D(\buffer/U2/M0_1_0/din[4][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[75] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_3  ( .D(\buffer/U2/M0_1_0/din[3][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[59] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_2  ( .D(\buffer/U2/M0_1_0/din[2][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[43] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_1  ( .D(\buffer/U2/M0_1_0/din[1][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[27] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_0  ( .D(\buffer/U2/M0_1_0/din[0][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[11] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_4  ( .D(\buffer/U2/M0_1_0/din[4][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[74] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_3  ( .D(\buffer/U2/M0_1_0/din[3][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[58] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_2  ( .D(\buffer/U2/M0_1_0/din[2][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[42] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_1  ( .D(\buffer/U2/M0_1_0/din[1][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[26] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_0  ( .D(\buffer/U2/M0_1_0/din[0][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[10] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_4  ( .D(\buffer/U2/M0_1_0/din[4][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[73] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_3  ( .D(\buffer/U2/M0_1_0/din[3][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[57] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_2  ( .D(\buffer/U2/M0_1_0/din[2][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[41] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_1  ( .D(\buffer/U2/M0_1_0/din[1][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[25] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_0  ( .D(\buffer/U2/M0_1_0/din[0][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[9] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_4  ( .D(\buffer/U2/M0_1_0/din[4][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[72] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_3  ( .D(\buffer/U2/M0_1_0/din[3][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[56] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_2  ( .D(\buffer/U2/M0_1_0/din[2][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[40] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_1  ( .D(\buffer/U2/M0_1_0/din[1][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[24] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_0  ( .D(\buffer/U2/M0_1_0/din[0][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[8] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_4  ( .D(\buffer/U2/M0_1_0/din[4][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[71] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_3  ( .D(\buffer/U2/M0_1_0/din[3][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[55] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_2  ( .D(\buffer/U2/M0_1_0/din[2][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[39] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_1  ( .D(\buffer/U2/M0_1_0/din[1][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[23] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_0  ( .D(\buffer/U2/M0_1_0/din[0][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[7] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_4  ( .D(\buffer/U2/M0_1_0/din[4][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[70] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_3  ( .D(\buffer/U2/M0_1_0/din[3][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[54] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_2  ( .D(\buffer/U2/M0_1_0/din[2][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[38] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_1  ( .D(\buffer/U2/M0_1_0/din[1][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[22] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_0  ( .D(\buffer/U2/M0_1_0/din[0][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[6] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_4  ( .D(\buffer/U2/M0_1_0/din[4][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[69] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_3  ( .D(\buffer/U2/M0_1_0/din[3][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[53] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_2  ( .D(\buffer/U2/M0_1_0/din[2][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[37] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_1  ( .D(\buffer/U2/M0_1_0/din[1][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[21] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_0  ( .D(\buffer/U2/M0_1_0/din[0][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[5] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_4  ( .D(\buffer/U2/M0_1_0/din[4][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[68] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_3  ( .D(\buffer/U2/M0_1_0/din[3][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[52] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_2  ( .D(\buffer/U2/M0_1_0/din[2][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[36] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_1  ( .D(\buffer/U2/M0_1_0/din[1][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[20] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_0  ( .D(\buffer/U2/M0_1_0/din[0][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[4] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_4  ( .D(\buffer/U2/M0_1_0/din[4][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[67] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_3  ( .D(\buffer/U2/M0_1_0/din[3][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[51] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_2  ( .D(\buffer/U2/M0_1_0/din[2][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[35] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_1  ( .D(\buffer/U2/M0_1_0/din[1][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[19] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_0  ( .D(\buffer/U2/M0_1_0/din[0][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[3] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_4  ( .D(\buffer/U2/M0_1_0/din[4][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[66] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_3  ( .D(\buffer/U2/M0_1_0/din[3][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[50] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_2  ( .D(\buffer/U2/M0_1_0/din[2][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[34] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_1  ( .D(\buffer/U2/M0_1_0/din[1][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[18] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_0  ( .D(\buffer/U2/M0_1_0/din[0][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[2] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_4  ( .D(\buffer/U2/M0_1_0/din[4][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[65] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_3  ( .D(\buffer/U2/M0_1_0/din[3][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[49] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_2  ( .D(\buffer/U2/M0_1_0/din[2][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[33] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_1  ( .D(\buffer/U2/M0_1_0/din[1][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[17] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_0  ( .D(\buffer/U2/M0_1_0/din[0][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[1] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_4  ( .D(\buffer/U2/M0_1_0/din[4][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[64] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_3  ( .D(\buffer/U2/M0_1_0/din[3][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[48] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_2  ( .D(\buffer/U2/M0_1_0/din[2][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[32] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_1  ( .D(\buffer/U2/M0_1_0/din[1][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[16] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_0  ( .D(\buffer/U2/M0_1_0/din[0][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[0] ) );
  AO221X1 U2 ( .IN1(1'b1), .IN2(n67), .IN3(\buffer/U2/M0_1_0/tmp_mux_in[47] ), 
        .IN4(n88), .IN5(n66), .Q(data_o[15]) );
  AO221X1 U3 ( .IN1(1'b1), .IN2(n65), .IN3(\buffer/U2/M0_1_0/tmp_mux_in[46] ), 
        .IN4(n88), .IN5(n64), .Q(data_o[14]) );
  AO221X1 U4 ( .IN1(1'b1), .IN2(n63), .IN3(\buffer/U2/M0_1_0/tmp_mux_in[45] ), 
        .IN4(n88), .IN5(n62), .Q(data_o[13]) );
  OA221X1 U5 ( .IN1(1'b0), .IN2(n122), .IN3(n121), .IN4(\buffer/wr_addr[1] ), 
        .IN5(n120), .Q(\buffer/U1/U1/N49 ) );
  NOR2X0 U6 ( .IN1(\buffer/rd_addr[1] ), .IN2(n53), .QN(n86) );
  NAND2X1 U7 ( .IN1(\buffer/rd_addr[0] ), .IN2(n17), .QN(n53) );
  NAND2X1 U8 ( .IN1(n52), .IN2(n96), .QN(n97) );
  NAND2X1 U9 ( .IN1(n15), .IN2(n117), .QN(n100) );
  NOR2X0 U10 ( .IN1(n103), .IN2(n96), .QN(n91) );
  NAND2X1 U11 ( .IN1(n95), .IN2(n97), .QN(n90) );
  NOR2X0 U12 ( .IN1(rst), .IN2(n92), .QN(n94) );
  NOR2X0 U13 ( .IN1(n96), .IN2(n95), .QN(n99) );
  NAND2X1 U14 ( .IN1(n103), .IN2(n97), .QN(n98) );
  NOR2X0 U15 ( .IN1(rst), .IN2(n100), .QN(n101) );
  NOR2X0 U16 ( .IN1(\buffer/U1/U1/empty_n ), .IN2(n118), .QN(n113) );
  INVX0 U17 ( .INP(n113), .ZN(n106) );
  NAND2X1 U18 ( .IN1(n107), .IN2(n106), .QN(n112) );
  INVX0 U19 ( .INP(rst), .ZN(n52) );
  NAND2X1 U20 ( .IN1(write_en), .IN2(n23), .QN(n118) );
  INVX0 U21 ( .INP(n118), .ZN(n119) );
  NOR2X0 U22 ( .IN1(n118), .IN2(n16), .QN(n121) );
  INVX0 U23 ( .INP(n120), .ZN(n117) );
  NAND2X1 U24 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[33] ), .QN(n41)
         );
  NAND2X1 U25 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[34] ), .QN(n39)
         );
  NAND2X1 U26 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[35] ), .QN(n37)
         );
  NAND2X1 U27 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[37] ), .QN(n33)
         );
  NAND2X1 U28 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[38] ), .QN(n31)
         );
  NAND2X1 U29 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[41] ), .QN(n25)
         );
  NAND2X1 U30 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[44] ), .QN(n43)
         );
  NOR2X0 U32 ( .IN1(rst), .IN2(n115), .QN(\buffer/U1/U1/N44 ) );
  NOR2X0 U34 ( .IN1(n119), .IN2(\buffer/U1/U1/empty_n ), .QN(n109) );
  NOR2X0 U35 ( .IN1(rst), .IN2(n111), .QN(\buffer/U1/U1/N55 ) );
  INVX0 U37 ( .INP(n107), .ZN(n4) );
  OAI221X1 U38 ( .IN1(n4), .IN2(n5), .IN3(n107), .IN4(n125), .IN5(n112), .QN(
        n6) );
  AND3X1 U39 ( .IN1(n18), .IN2(n125), .IN3(n4), .Q(n7) );
  NOR2X0 U40 ( .IN1(n106), .IN2(n125), .QN(n8) );
  OA22X1 U41 ( .IN1(\buffer/U1/U1/wrd_count[2] ), .IN2(n8), .IN3(n125), .IN4(
        n21), .Q(n9) );
  AO222X1 U42 ( .IN1(n6), .IN2(\buffer/U1/U1/wrd_count[2] ), .IN3(n21), .IN4(
        n7), .IN5(\buffer/U1/U1/wrd_count[1] ), .IN6(n9), .Q(n10) );
  AND2X1 U43 ( .IN1(n52), .IN2(n10), .Q(\buffer/U1/U1/N56 ) );
  INVX0 U44 ( .INP(n18), .ZN(n5) );
  NOR2X0 U45 ( .IN1(n118), .IN2(n15), .QN(n11) );
  NOR2X0 U46 ( .IN1(n11), .IN2(rst), .QN(n122) );
  NOR2X0 U47 ( .IN1(\buffer/rd_addr[0] ), .IN2(\buffer/U1/U1/empty_n ), .QN(
        n50) );
  INVX0 U48 ( .INP(n112), .ZN(n12) );
  OA221X1 U49 ( .IN1(n112), .IN2(n22), .IN3(n12), .IN4(n125), .IN5(n52), .Q(
        \buffer/U1/U1/N54 ) );
  INVX0 U51 ( .INP(n124), .ZN(n14) );
  OA221X1 U52 ( .IN1(n124), .IN2(n19), .IN3(n14), .IN4(\buffer/rd_addr[1] ), 
        .IN5(n123), .Q(\buffer/U1/U1/N52 ) );
  NAND2X1 U53 ( .IN1(n121), .IN2(\buffer/wr_addr[1] ), .QN(n120) );
  NAND2X1 U54 ( .IN1(n118), .IN2(\buffer/U1/U1/empty_n ), .QN(n107) );
  NAND2X1 U55 ( .IN1(n124), .IN2(n123), .QN(n51) );
  NAND2X1 U56 ( .IN1(n52), .IN2(n20), .QN(n103) );
  NAND2X1 U57 ( .IN1(\buffer/U1/U1/empty_n ), .IN2(\buffer/rd_addr[0] ), .QN(
        n124) );
  NAND2X1 U58 ( .IN1(\buffer/wr_addr[1] ), .IN2(n52), .QN(n95) );
  AO221X1 U59 ( .IN1(n52), .IN2(\buffer/wr_addr[0] ), .IN3(n52), .IN4(
        \buffer/wr_addr[1] ), .IN5(n122), .Q(n104) );
  NOR4X0 U60 ( .IN1(\buffer/wr_addr[0] ), .IN2(n118), .IN3(n15), .IN4(n103), 
        .QN(n105) );
  AND2X1 U61 ( .IN1(n52), .IN2(n100), .Q(n102) );
  AND2X1 U62 ( .IN1(n52), .IN2(n92), .Q(n93) );
  NAND2X1 U63 ( .IN1(n42), .IN2(n43), .QN(data_o[12]) );
  NAND2X1 U64 ( .IN1(n44), .IN2(n45), .QN(data_o[11]) );
  NAND2X1 U65 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[43] ), .QN(n45)
         );
  NAND2X1 U66 ( .IN1(n46), .IN2(n47), .QN(data_o[10]) );
  NAND2X1 U67 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[42] ), .QN(n47)
         );
  NAND2X1 U68 ( .IN1(n24), .IN2(n25), .QN(data_o[9]) );
  NAND2X1 U69 ( .IN1(n26), .IN2(n27), .QN(data_o[8]) );
  NAND2X1 U70 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[40] ), .QN(n27)
         );
  NAND2X1 U71 ( .IN1(n28), .IN2(n29), .QN(data_o[7]) );
  NAND2X1 U72 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[39] ), .QN(n29)
         );
  NAND2X1 U73 ( .IN1(n30), .IN2(n31), .QN(data_o[6]) );
  NAND2X1 U74 ( .IN1(n32), .IN2(n33), .QN(data_o[5]) );
  NAND2X1 U75 ( .IN1(n34), .IN2(n35), .QN(data_o[4]) );
  NAND2X1 U76 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[36] ), .QN(n35)
         );
  NAND2X1 U77 ( .IN1(n36), .IN2(n37), .QN(data_o[3]) );
  NAND2X1 U78 ( .IN1(n38), .IN2(n39), .QN(data_o[2]) );
  NAND2X1 U79 ( .IN1(n40), .IN2(n41), .QN(data_o[1]) );
  NAND2X1 U80 ( .IN1(n48), .IN2(n49), .QN(data_o[0]) );
  NAND2X1 U81 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[32] ), .IN2(n88), .QN(n49)
         );
  NAND3X0 U82 ( .IN1(n119), .IN2(n16), .IN3(n15), .QN(n96) );
  NOR2X0 U83 ( .IN1(n50), .IN2(n51), .QN(\buffer/U1/U1/N51 ) );
  NOR2X0 U84 ( .IN1(n61), .IN2(n60), .QN(n42) );
  NOR2X0 U85 ( .IN1(n59), .IN2(n58), .QN(n44) );
  NOR2X0 U86 ( .IN1(n57), .IN2(n56), .QN(n46) );
  NOR2X0 U87 ( .IN1(n89), .IN2(n87), .QN(n24) );
  NOR2X0 U88 ( .IN1(n83), .IN2(n82), .QN(n26) );
  NOR2X0 U89 ( .IN1(n81), .IN2(n80), .QN(n28) );
  NOR2X0 U90 ( .IN1(n79), .IN2(n78), .QN(n30) );
  NOR2X0 U91 ( .IN1(n77), .IN2(n76), .QN(n32) );
  NOR2X0 U92 ( .IN1(n75), .IN2(n74), .QN(n34) );
  NOR2X0 U93 ( .IN1(n73), .IN2(n72), .QN(n36) );
  NOR2X0 U94 ( .IN1(n71), .IN2(n70), .QN(n38) );
  NOR2X0 U95 ( .IN1(n69), .IN2(n68), .QN(n40) );
  NOR2X0 U96 ( .IN1(n55), .IN2(n54), .QN(n48) );
  AND3X1 U97 ( .IN1(\buffer/rd_addr[1] ), .IN2(\buffer/rd_addr[0] ), .IN3(n17), 
        .Q(n116) );
  NOR3X0 U98 ( .IN1(\buffer/rd_addr[1] ), .IN2(\buffer/rd_addr[2] ), .IN3(
        \buffer/rd_addr[0] ), .QN(n84) );
  AO22X1 U99 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[48] ), .IN2(n116), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[0] ), .IN4(n84), .Q(n55) );
  NOR3X0 U100 ( .IN1(\buffer/rd_addr[2] ), .IN2(\buffer/rd_addr[0] ), .IN3(n19), .QN(n88) );
  NOR3X0 U101 ( .IN1(\buffer/rd_addr[1] ), .IN2(\buffer/rd_addr[0] ), .IN3(n17), .QN(n85) );
  AO22X1 U102 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[16] ), .IN2(n86), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[64] ), .IN4(n85), .Q(n54) );
  AO22X1 U103 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[58] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[10] ), .Q(n57) );
  AO22X1 U104 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[26] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[74] ), .Q(n56) );
  AO22X1 U105 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[59] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[11] ), .Q(n59) );
  AO22X1 U106 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[27] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[75] ), .Q(n58) );
  AO22X1 U107 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[60] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[12] ), .Q(n61) );
  AO22X1 U108 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[28] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[76] ), .Q(n60) );
  AO22X1 U109 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[61] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[13] ), .Q(n63) );
  AO22X1 U110 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[29] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[77] ), .Q(n62) );
  AO22X1 U111 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[62] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[14] ), .Q(n65) );
  AO22X1 U112 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[30] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[78] ), .Q(n64) );
  AO22X1 U113 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[63] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[15] ), .Q(n67) );
  AO22X1 U114 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[31] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[79] ), .Q(n66) );
  AO22X1 U115 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[49] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[1] ), .Q(n69) );
  AO22X1 U116 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[17] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[65] ), .Q(n68) );
  AO22X1 U117 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[50] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[2] ), .Q(n71) );
  AO22X1 U118 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[18] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[66] ), .Q(n70) );
  AO22X1 U119 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[51] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[3] ), .Q(n73) );
  AO22X1 U120 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[19] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[67] ), .Q(n72) );
  AO22X1 U121 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[52] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[4] ), .Q(n75) );
  AO22X1 U122 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[20] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[68] ), .Q(n74) );
  AO22X1 U123 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[53] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[5] ), .Q(n77) );
  AO22X1 U124 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[21] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[69] ), .Q(n76) );
  AO22X1 U125 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[54] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[6] ), .Q(n79) );
  AO22X1 U126 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[22] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[70] ), .Q(n78) );
  AO22X1 U127 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[55] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[7] ), .Q(n81) );
  AO22X1 U128 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[23] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[71] ), .Q(n80) );
  AO22X1 U129 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[56] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[8] ), .Q(n83) );
  AO22X1 U130 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[24] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[72] ), .Q(n82) );
  AO22X1 U131 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[57] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[9] ), .Q(n89) );
  AO22X1 U132 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[25] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[73] ), .Q(n87) );
  AO22X1 U133 ( .IN1(data_i[0]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[0] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][0] ) );
  AO22X1 U134 ( .IN1(data_i[10]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[10] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][10] ) );
  AO22X1 U135 ( .IN1(data_i[11]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[11] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][11] ) );
  AO22X1 U136 ( .IN1(data_i[12]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[12] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][12] ) );
  AO22X1 U137 ( .IN1(data_i[13]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[13] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][13] ) );
  AO22X1 U138 ( .IN1(data_i[14]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[14] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][14] ) );
  AO22X1 U139 ( .IN1(data_i[15]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[15] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][15] ) );
  AO22X1 U140 ( .IN1(data_i[1]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[1] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][1] ) );
  AO22X1 U141 ( .IN1(data_i[2]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[2] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][2] ) );
  AO22X1 U142 ( .IN1(data_i[3]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[3] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][3] ) );
  AO22X1 U143 ( .IN1(data_i[4]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[4] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][4] ) );
  AO22X1 U144 ( .IN1(data_i[5]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[5] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][5] ) );
  AO22X1 U145 ( .IN1(data_i[6]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[6] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][6] ) );
  AO22X1 U146 ( .IN1(data_i[7]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[7] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][7] ) );
  AO22X1 U147 ( .IN1(data_i[8]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[8] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][8] ) );
  AO22X1 U148 ( .IN1(data_i[9]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[9] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][9] ) );
  NAND3X0 U149 ( .IN1(n121), .IN2(n20), .IN3(n15), .QN(n92) );
  AO22X1 U150 ( .IN1(data_i[0]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[16] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][0] ) );
  AO22X1 U151 ( .IN1(data_i[10]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[26] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][10] ) );
  AO22X1 U152 ( .IN1(data_i[11]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[27] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][11] ) );
  AO22X1 U153 ( .IN1(data_i[12]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[28] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][12] ) );
  AO22X1 U154 ( .IN1(data_i[13]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[29] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][13] ) );
  AO22X1 U155 ( .IN1(data_i[14]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[30] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][14] ) );
  AO22X1 U156 ( .IN1(data_i[15]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[31] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][15] ) );
  AO22X1 U157 ( .IN1(data_i[1]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[17] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][1] ) );
  AO22X1 U158 ( .IN1(data_i[2]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[18] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][2] ) );
  AO22X1 U159 ( .IN1(data_i[3]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[19] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][3] ) );
  AO22X1 U160 ( .IN1(data_i[4]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[20] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][4] ) );
  AO22X1 U161 ( .IN1(data_i[5]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[21] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][5] ) );
  AO22X1 U162 ( .IN1(data_i[6]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[22] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][6] ) );
  AO22X1 U163 ( .IN1(data_i[7]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[23] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][7] ) );
  AO22X1 U164 ( .IN1(data_i[8]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[24] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][8] ) );
  AO22X1 U165 ( .IN1(data_i[9]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[25] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][9] ) );
  AO22X1 U166 ( .IN1(data_i[0]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[32] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][0] ) );
  AO22X1 U167 ( .IN1(data_i[10]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[42] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][10] ) );
  AO22X1 U168 ( .IN1(data_i[11]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[43] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][11] ) );
  AO22X1 U169 ( .IN1(data_i[12]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[44] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][12] ) );
  AO22X1 U170 ( .IN1(data_i[13]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[45] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][13] ) );
  AO22X1 U171 ( .IN1(data_i[14]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[46] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][14] ) );
  AO22X1 U172 ( .IN1(data_i[15]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[47] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][15] ) );
  AO22X1 U173 ( .IN1(data_i[1]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[33] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][1] ) );
  AO22X1 U174 ( .IN1(data_i[2]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[34] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][2] ) );
  AO22X1 U175 ( .IN1(data_i[3]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[35] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][3] ) );
  AO22X1 U176 ( .IN1(data_i[4]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[36] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][4] ) );
  AO22X1 U177 ( .IN1(data_i[5]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[37] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][5] ) );
  AO22X1 U178 ( .IN1(data_i[6]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[38] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][6] ) );
  AO22X1 U179 ( .IN1(data_i[7]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[39] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][7] ) );
  AO22X1 U180 ( .IN1(data_i[8]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[40] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][8] ) );
  AO22X1 U181 ( .IN1(data_i[9]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[41] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][9] ) );
  AO22X1 U182 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[48] ), .IN3(
        data_i[0]), .IN4(n101), .Q(\buffer/U2/M0_1_0/din[3][0] ) );
  AO22X1 U183 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[58] ), .IN3(n101), .IN4(data_i[10]), .Q(\buffer/U2/M0_1_0/din[3][10] ) );
  AO22X1 U184 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[59] ), .IN3(n101), .IN4(data_i[11]), .Q(\buffer/U2/M0_1_0/din[3][11] ) );
  AO22X1 U185 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[60] ), .IN3(n101), .IN4(data_i[12]), .Q(\buffer/U2/M0_1_0/din[3][12] ) );
  AO22X1 U186 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[61] ), .IN3(n101), .IN4(data_i[13]), .Q(\buffer/U2/M0_1_0/din[3][13] ) );
  AO22X1 U187 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[62] ), .IN3(n101), .IN4(data_i[14]), .Q(\buffer/U2/M0_1_0/din[3][14] ) );
  AO22X1 U188 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[63] ), .IN3(n101), .IN4(data_i[15]), .Q(\buffer/U2/M0_1_0/din[3][15] ) );
  AO22X1 U189 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[49] ), .IN3(n101), .IN4(data_i[1]), .Q(\buffer/U2/M0_1_0/din[3][1] ) );
  AO22X1 U190 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[50] ), .IN3(n101), .IN4(data_i[2]), .Q(\buffer/U2/M0_1_0/din[3][2] ) );
  AO22X1 U191 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[51] ), .IN3(n101), .IN4(data_i[3]), .Q(\buffer/U2/M0_1_0/din[3][3] ) );
  AO22X1 U192 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[52] ), .IN3(n101), .IN4(data_i[4]), .Q(\buffer/U2/M0_1_0/din[3][4] ) );
  AO22X1 U193 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[53] ), .IN3(n101), .IN4(data_i[5]), .Q(\buffer/U2/M0_1_0/din[3][5] ) );
  AO22X1 U194 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[54] ), .IN3(n101), .IN4(data_i[6]), .Q(\buffer/U2/M0_1_0/din[3][6] ) );
  AO22X1 U195 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[55] ), .IN3(n101), .IN4(data_i[7]), .Q(\buffer/U2/M0_1_0/din[3][7] ) );
  AO22X1 U196 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[56] ), .IN3(n101), .IN4(data_i[8]), .Q(\buffer/U2/M0_1_0/din[3][8] ) );
  AO22X1 U197 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[57] ), .IN3(n101), .IN4(data_i[9]), .Q(\buffer/U2/M0_1_0/din[3][9] ) );
  AO22X1 U198 ( .IN1(data_i[0]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[64] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][0] ) );
  AO22X1 U199 ( .IN1(data_i[10]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[74] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][10] ) );
  AO22X1 U200 ( .IN1(data_i[11]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[75] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][11] ) );
  AO22X1 U201 ( .IN1(data_i[12]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[76] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][12] ) );
  AO22X1 U202 ( .IN1(data_i[13]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[77] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][13] ) );
  AO22X1 U203 ( .IN1(data_i[14]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[78] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][14] ) );
  AO22X1 U204 ( .IN1(data_i[15]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[79] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][15] ) );
  AO22X1 U205 ( .IN1(data_i[1]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[65] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][1] ) );
  AO22X1 U206 ( .IN1(data_i[2]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[66] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][2] ) );
  AO22X1 U207 ( .IN1(data_i[3]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[67] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][3] ) );
  AO22X1 U208 ( .IN1(data_i[4]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[68] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][4] ) );
  AO22X1 U209 ( .IN1(data_i[5]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[69] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][5] ) );
  AO22X1 U210 ( .IN1(data_i[6]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[70] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][6] ) );
  AO22X1 U211 ( .IN1(data_i[7]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[71] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][7] ) );
  AO22X1 U212 ( .IN1(data_i[8]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[72] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][8] ) );
  AO22X1 U213 ( .IN1(data_i[9]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[73] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][9] ) );
  MUX21X1 U214 ( .IN1(\buffer/U1/U1/empty_n ), .IN2(n119), .S(n125), .Q(n108)
         );
  NOR2X0 U215 ( .IN1(n109), .IN2(n108), .QN(n110) );
  XNOR2X1 U216 ( .IN1(\buffer/U1/U1/wrd_count[1] ), .IN2(n110), .Q(n111) );
  NAND4X0 U217 ( .IN1(n113), .IN2(n125), .IN3(\buffer/U1/U1/wrd_count[2] ), 
        .IN4(n18), .QN(n114) );
  OA21X1 U218 ( .IN1(\buffer/U1/U1/empty_n ), .IN2(n23), .IN3(n114), .Q(n115)
         );
  OR4X1 U219 ( .IN1(\buffer/U1/U1/N55 ), .IN2(\buffer/U1/U1/N44 ), .IN3(
        \buffer/U1/U1/N54 ), .IN4(\buffer/U1/U1/N56 ), .Q(\buffer/U1/U1/N40 )
         );
  AOI21X1 U220 ( .IN1(\buffer/U1/U1/empty_n ), .IN2(\buffer/rd_addr[2] ), 
        .IN3(rst), .QN(n123) );
  OA221X1 U221 ( .IN1(\buffer/rd_addr[2] ), .IN2(\buffer/U1/U1/empty_n ), 
        .IN3(\buffer/rd_addr[2] ), .IN4(n116), .IN5(n123), .Q(
        \buffer/U1/U1/N53 ) );
  OA21X1 U222 ( .IN1(n117), .IN2(\buffer/wr_addr[2] ), .IN3(n122), .Q(
        \buffer/U1/U1/N50 ) );
  OA221X1 U223 ( .IN1(n119), .IN2(\buffer/wr_addr[0] ), .IN3(n118), .IN4(n16), 
        .IN5(n122), .Q(\buffer/U1/U1/N48 ) );
endmodule


module inputPort_2 ( clk, rst, data_i, write_en, shift, data_o, read_valid_o
 );
  input [15:0] data_i;
  output [15:0] data_o;
  input clk, rst, write_en, shift;
  output read_valid_o;
  wire   \buffer/U1/U1/N56 , \buffer/U1/U1/N55 , \buffer/U1/U1/N54 ,
         \buffer/U1/U1/N53 , \buffer/U1/U1/N52 , \buffer/U1/U1/N51 ,
         \buffer/U1/U1/N50 , \buffer/U1/U1/N49 , \buffer/U1/U1/N48 ,
         \buffer/U1/U1/N44 , \buffer/U1/U1/N40 , \buffer/U1/U1/wrd_count[1] ,
         \buffer/U1/U1/wrd_count[2] , \buffer/U2/M0_1_0/tmp_mux_in[0] ,
         \buffer/U2/M0_1_0/tmp_mux_in[1] , \buffer/U2/M0_1_0/tmp_mux_in[2] ,
         \buffer/U2/M0_1_0/tmp_mux_in[3] , \buffer/U2/M0_1_0/tmp_mux_in[4] ,
         \buffer/U2/M0_1_0/tmp_mux_in[5] , \buffer/U2/M0_1_0/tmp_mux_in[6] ,
         \buffer/U2/M0_1_0/tmp_mux_in[7] , \buffer/U2/M0_1_0/tmp_mux_in[8] ,
         \buffer/U2/M0_1_0/tmp_mux_in[9] , \buffer/U2/M0_1_0/tmp_mux_in[10] ,
         \buffer/U2/M0_1_0/tmp_mux_in[11] , \buffer/U2/M0_1_0/tmp_mux_in[12] ,
         \buffer/U2/M0_1_0/tmp_mux_in[13] , \buffer/U2/M0_1_0/tmp_mux_in[14] ,
         \buffer/U2/M0_1_0/tmp_mux_in[15] , \buffer/U2/M0_1_0/tmp_mux_in[16] ,
         \buffer/U2/M0_1_0/tmp_mux_in[17] , \buffer/U2/M0_1_0/tmp_mux_in[18] ,
         \buffer/U2/M0_1_0/tmp_mux_in[19] , \buffer/U2/M0_1_0/tmp_mux_in[20] ,
         \buffer/U2/M0_1_0/tmp_mux_in[21] , \buffer/U2/M0_1_0/tmp_mux_in[22] ,
         \buffer/U2/M0_1_0/tmp_mux_in[23] , \buffer/U2/M0_1_0/tmp_mux_in[24] ,
         \buffer/U2/M0_1_0/tmp_mux_in[25] , \buffer/U2/M0_1_0/tmp_mux_in[26] ,
         \buffer/U2/M0_1_0/tmp_mux_in[27] , \buffer/U2/M0_1_0/tmp_mux_in[28] ,
         \buffer/U2/M0_1_0/tmp_mux_in[29] , \buffer/U2/M0_1_0/tmp_mux_in[30] ,
         \buffer/U2/M0_1_0/tmp_mux_in[31] , \buffer/U2/M0_1_0/tmp_mux_in[32] ,
         \buffer/U2/M0_1_0/tmp_mux_in[33] , \buffer/U2/M0_1_0/tmp_mux_in[34] ,
         \buffer/U2/M0_1_0/tmp_mux_in[35] , \buffer/U2/M0_1_0/tmp_mux_in[36] ,
         \buffer/U2/M0_1_0/tmp_mux_in[37] , \buffer/U2/M0_1_0/tmp_mux_in[38] ,
         \buffer/U2/M0_1_0/tmp_mux_in[39] , \buffer/U2/M0_1_0/tmp_mux_in[40] ,
         \buffer/U2/M0_1_0/tmp_mux_in[41] , \buffer/U2/M0_1_0/tmp_mux_in[42] ,
         \buffer/U2/M0_1_0/tmp_mux_in[43] , \buffer/U2/M0_1_0/tmp_mux_in[44] ,
         \buffer/U2/M0_1_0/tmp_mux_in[45] , \buffer/U2/M0_1_0/tmp_mux_in[46] ,
         \buffer/U2/M0_1_0/tmp_mux_in[47] , \buffer/U2/M0_1_0/tmp_mux_in[48] ,
         \buffer/U2/M0_1_0/tmp_mux_in[49] , \buffer/U2/M0_1_0/tmp_mux_in[50] ,
         \buffer/U2/M0_1_0/tmp_mux_in[51] , \buffer/U2/M0_1_0/tmp_mux_in[52] ,
         \buffer/U2/M0_1_0/tmp_mux_in[53] , \buffer/U2/M0_1_0/tmp_mux_in[54] ,
         \buffer/U2/M0_1_0/tmp_mux_in[55] , \buffer/U2/M0_1_0/tmp_mux_in[56] ,
         \buffer/U2/M0_1_0/tmp_mux_in[57] , \buffer/U2/M0_1_0/tmp_mux_in[58] ,
         \buffer/U2/M0_1_0/tmp_mux_in[59] , \buffer/U2/M0_1_0/tmp_mux_in[60] ,
         \buffer/U2/M0_1_0/tmp_mux_in[61] , \buffer/U2/M0_1_0/tmp_mux_in[62] ,
         \buffer/U2/M0_1_0/tmp_mux_in[63] , \buffer/U2/M0_1_0/tmp_mux_in[64] ,
         \buffer/U2/M0_1_0/tmp_mux_in[65] , \buffer/U2/M0_1_0/tmp_mux_in[66] ,
         \buffer/U2/M0_1_0/tmp_mux_in[67] , \buffer/U2/M0_1_0/tmp_mux_in[68] ,
         \buffer/U2/M0_1_0/tmp_mux_in[69] , \buffer/U2/M0_1_0/tmp_mux_in[70] ,
         \buffer/U2/M0_1_0/tmp_mux_in[71] , \buffer/U2/M0_1_0/tmp_mux_in[72] ,
         \buffer/U2/M0_1_0/tmp_mux_in[73] , \buffer/U2/M0_1_0/tmp_mux_in[74] ,
         \buffer/U2/M0_1_0/tmp_mux_in[75] , \buffer/U2/M0_1_0/tmp_mux_in[76] ,
         \buffer/U2/M0_1_0/tmp_mux_in[77] , \buffer/U2/M0_1_0/tmp_mux_in[78] ,
         \buffer/U2/M0_1_0/tmp_mux_in[79] , \buffer/U2/M0_1_0/din[4][15] ,
         \buffer/U2/M0_1_0/din[4][14] , \buffer/U2/M0_1_0/din[4][13] ,
         \buffer/U2/M0_1_0/din[4][12] , \buffer/U2/M0_1_0/din[4][11] ,
         \buffer/U2/M0_1_0/din[4][10] , \buffer/U2/M0_1_0/din[4][9] ,
         \buffer/U2/M0_1_0/din[4][8] , \buffer/U2/M0_1_0/din[4][7] ,
         \buffer/U2/M0_1_0/din[4][6] , \buffer/U2/M0_1_0/din[4][5] ,
         \buffer/U2/M0_1_0/din[4][4] , \buffer/U2/M0_1_0/din[4][3] ,
         \buffer/U2/M0_1_0/din[4][2] , \buffer/U2/M0_1_0/din[4][1] ,
         \buffer/U2/M0_1_0/din[4][0] , \buffer/U2/M0_1_0/din[3][15] ,
         \buffer/U2/M0_1_0/din[3][14] , \buffer/U2/M0_1_0/din[3][13] ,
         \buffer/U2/M0_1_0/din[3][12] , \buffer/U2/M0_1_0/din[3][11] ,
         \buffer/U2/M0_1_0/din[3][10] , \buffer/U2/M0_1_0/din[3][9] ,
         \buffer/U2/M0_1_0/din[3][8] , \buffer/U2/M0_1_0/din[3][7] ,
         \buffer/U2/M0_1_0/din[3][6] , \buffer/U2/M0_1_0/din[3][5] ,
         \buffer/U2/M0_1_0/din[3][4] , \buffer/U2/M0_1_0/din[3][3] ,
         \buffer/U2/M0_1_0/din[3][2] , \buffer/U2/M0_1_0/din[3][1] ,
         \buffer/U2/M0_1_0/din[3][0] , \buffer/U2/M0_1_0/din[2][15] ,
         \buffer/U2/M0_1_0/din[2][14] , \buffer/U2/M0_1_0/din[2][13] ,
         \buffer/U2/M0_1_0/din[2][12] , \buffer/U2/M0_1_0/din[2][11] ,
         \buffer/U2/M0_1_0/din[2][10] , \buffer/U2/M0_1_0/din[2][9] ,
         \buffer/U2/M0_1_0/din[2][8] , \buffer/U2/M0_1_0/din[2][7] ,
         \buffer/U2/M0_1_0/din[2][6] , \buffer/U2/M0_1_0/din[2][5] ,
         \buffer/U2/M0_1_0/din[2][4] , \buffer/U2/M0_1_0/din[2][3] ,
         \buffer/U2/M0_1_0/din[2][2] , \buffer/U2/M0_1_0/din[2][1] ,
         \buffer/U2/M0_1_0/din[2][0] , \buffer/U2/M0_1_0/din[1][15] ,
         \buffer/U2/M0_1_0/din[1][14] , \buffer/U2/M0_1_0/din[1][13] ,
         \buffer/U2/M0_1_0/din[1][12] , \buffer/U2/M0_1_0/din[1][11] ,
         \buffer/U2/M0_1_0/din[1][10] , \buffer/U2/M0_1_0/din[1][9] ,
         \buffer/U2/M0_1_0/din[1][8] , \buffer/U2/M0_1_0/din[1][7] ,
         \buffer/U2/M0_1_0/din[1][6] , \buffer/U2/M0_1_0/din[1][5] ,
         \buffer/U2/M0_1_0/din[1][4] , \buffer/U2/M0_1_0/din[1][3] ,
         \buffer/U2/M0_1_0/din[1][2] , \buffer/U2/M0_1_0/din[1][1] ,
         \buffer/U2/M0_1_0/din[1][0] , \buffer/U2/M0_1_0/din[0][15] ,
         \buffer/U2/M0_1_0/din[0][14] , \buffer/U2/M0_1_0/din[0][13] ,
         \buffer/U2/M0_1_0/din[0][12] , \buffer/U2/M0_1_0/din[0][11] ,
         \buffer/U2/M0_1_0/din[0][10] , \buffer/U2/M0_1_0/din[0][9] ,
         \buffer/U2/M0_1_0/din[0][8] , \buffer/U2/M0_1_0/din[0][7] ,
         \buffer/U2/M0_1_0/din[0][6] , \buffer/U2/M0_1_0/din[0][5] ,
         \buffer/U2/M0_1_0/din[0][4] , \buffer/U2/M0_1_0/din[0][3] ,
         \buffer/U2/M0_1_0/din[0][2] , \buffer/U2/M0_1_0/din[0][1] ,
         \buffer/U2/M0_1_0/din[0][0] , \buffer/rd_addr[0] ,
         \buffer/rd_addr[1] , \buffer/rd_addr[2] , \buffer/wr_addr[0] ,
         \buffer/wr_addr[1] , \buffer/wr_addr[2] , n1, n2, n4, n5, n7, n8, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125;
  tri   [15:0] data_i;
  tri   write_en;
  tri   \buffer/U1/U1/empty_n ;
  assign read_valid_o = \buffer/U1/U1/empty_n ;

  DFFX1 \buffer/U1/U1/rd_addr_int_reg[2]  ( .D(\buffer/U1/U1/N53 ), .CLK(clk), 
        .Q(\buffer/rd_addr[2] ), .QN(n23) );
  DFFX1 \buffer/U1/U1/rd_addr_int_reg[1]  ( .D(\buffer/U1/U1/N52 ), .CLK(clk), 
        .Q(\buffer/rd_addr[1] ), .QN(n25) );
  DFFX1 \buffer/U1/U1/rd_addr_int_reg[0]  ( .D(\buffer/U1/U1/N51 ), .CLK(clk), 
        .Q(\buffer/rd_addr[0] ) );
  DFFX1 \buffer/U1/U1/wr_addr_at_max_reg  ( .D(\buffer/U1/U1/N50 ), .CLK(clk), 
        .Q(\buffer/wr_addr[2] ), .QN(n21) );
  DFFX1 \buffer/U1/U1/wr_addr_int_reg[1]  ( .D(\buffer/U1/U1/N49 ), .CLK(clk), 
        .Q(\buffer/wr_addr[1] ), .QN(n26) );
  DFFX1 \buffer/U1/U1/wr_addr_int_reg[0]  ( .D(\buffer/U1/U1/N48 ), .CLK(clk), 
        .Q(\buffer/wr_addr[0] ), .QN(n22) );
  DFFX1 \buffer/U1/U1/word_count_reg[2]  ( .D(\buffer/U1/U1/N56 ), .CLK(clk), 
        .Q(\buffer/U1/U1/wrd_count[2] ), .QN(n27) );
  DFFX1 \buffer/U1/U1/word_count_reg[1]  ( .D(\buffer/U1/U1/N55 ), .CLK(clk), 
        .Q(\buffer/U1/U1/wrd_count[1] ), .QN(n24) );
  DFFX1 \buffer/U1/U1/word_count_reg[0]  ( .D(\buffer/U1/U1/N54 ), .CLK(clk), 
        .Q(n28), .QN(n125) );
  DFFX1 \buffer/U1/U1/empty_n_reg  ( .D(\buffer/U1/U1/N40 ), .CLK(clk), .Q(
        \buffer/U1/U1/empty_n ) );
  DFFX1 \buffer/U1/U1/full_int_reg  ( .D(\buffer/U1/U1/N44 ), .CLK(clk), .QN(
        n29) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_4  ( .D(\buffer/U2/M0_1_0/din[4][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[79] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_3  ( .D(\buffer/U2/M0_1_0/din[3][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[63] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_2  ( .D(\buffer/U2/M0_1_0/din[2][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[47] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_1  ( .D(\buffer/U2/M0_1_0/din[1][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[31] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_0  ( .D(\buffer/U2/M0_1_0/din[0][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[15] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_4  ( .D(\buffer/U2/M0_1_0/din[4][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[78] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_3  ( .D(\buffer/U2/M0_1_0/din[3][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[62] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_2  ( .D(\buffer/U2/M0_1_0/din[2][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[46] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_1  ( .D(\buffer/U2/M0_1_0/din[1][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[30] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_0  ( .D(\buffer/U2/M0_1_0/din[0][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[14] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_4  ( .D(\buffer/U2/M0_1_0/din[4][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[77] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_3  ( .D(\buffer/U2/M0_1_0/din[3][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[61] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_2  ( .D(\buffer/U2/M0_1_0/din[2][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[45] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_1  ( .D(\buffer/U2/M0_1_0/din[1][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[29] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_0  ( .D(\buffer/U2/M0_1_0/din[0][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[13] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_4  ( .D(\buffer/U2/M0_1_0/din[4][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[76] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_3  ( .D(\buffer/U2/M0_1_0/din[3][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[60] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_2  ( .D(\buffer/U2/M0_1_0/din[2][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[44] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_1  ( .D(\buffer/U2/M0_1_0/din[1][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[28] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_0  ( .D(\buffer/U2/M0_1_0/din[0][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[12] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_4  ( .D(\buffer/U2/M0_1_0/din[4][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[75] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_3  ( .D(\buffer/U2/M0_1_0/din[3][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[59] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_2  ( .D(\buffer/U2/M0_1_0/din[2][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[43] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_1  ( .D(\buffer/U2/M0_1_0/din[1][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[27] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_0  ( .D(\buffer/U2/M0_1_0/din[0][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[11] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_4  ( .D(\buffer/U2/M0_1_0/din[4][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[74] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_3  ( .D(\buffer/U2/M0_1_0/din[3][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[58] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_2  ( .D(\buffer/U2/M0_1_0/din[2][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[42] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_1  ( .D(\buffer/U2/M0_1_0/din[1][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[26] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_0  ( .D(\buffer/U2/M0_1_0/din[0][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[10] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_4  ( .D(\buffer/U2/M0_1_0/din[4][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[73] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_3  ( .D(\buffer/U2/M0_1_0/din[3][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[57] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_2  ( .D(\buffer/U2/M0_1_0/din[2][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[41] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_1  ( .D(\buffer/U2/M0_1_0/din[1][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[25] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_0  ( .D(\buffer/U2/M0_1_0/din[0][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[9] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_4  ( .D(\buffer/U2/M0_1_0/din[4][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[72] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_3  ( .D(\buffer/U2/M0_1_0/din[3][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[56] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_2  ( .D(\buffer/U2/M0_1_0/din[2][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[40] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_1  ( .D(\buffer/U2/M0_1_0/din[1][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[24] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_0  ( .D(\buffer/U2/M0_1_0/din[0][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[8] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_4  ( .D(\buffer/U2/M0_1_0/din[4][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[71] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_3  ( .D(\buffer/U2/M0_1_0/din[3][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[55] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_2  ( .D(\buffer/U2/M0_1_0/din[2][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[39] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_1  ( .D(\buffer/U2/M0_1_0/din[1][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[23] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_0  ( .D(\buffer/U2/M0_1_0/din[0][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[7] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_4  ( .D(\buffer/U2/M0_1_0/din[4][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[70] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_3  ( .D(\buffer/U2/M0_1_0/din[3][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[54] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_2  ( .D(\buffer/U2/M0_1_0/din[2][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[38] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_1  ( .D(\buffer/U2/M0_1_0/din[1][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[22] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_0  ( .D(\buffer/U2/M0_1_0/din[0][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[6] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_4  ( .D(\buffer/U2/M0_1_0/din[4][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[69] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_3  ( .D(\buffer/U2/M0_1_0/din[3][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[53] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_2  ( .D(\buffer/U2/M0_1_0/din[2][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[37] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_1  ( .D(\buffer/U2/M0_1_0/din[1][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[21] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_0  ( .D(\buffer/U2/M0_1_0/din[0][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[5] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_4  ( .D(\buffer/U2/M0_1_0/din[4][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[68] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_3  ( .D(\buffer/U2/M0_1_0/din[3][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[52] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_2  ( .D(\buffer/U2/M0_1_0/din[2][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[36] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_1  ( .D(\buffer/U2/M0_1_0/din[1][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[20] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_0  ( .D(\buffer/U2/M0_1_0/din[0][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[4] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_4  ( .D(\buffer/U2/M0_1_0/din[4][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[67] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_3  ( .D(\buffer/U2/M0_1_0/din[3][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[51] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_2  ( .D(\buffer/U2/M0_1_0/din[2][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[35] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_1  ( .D(\buffer/U2/M0_1_0/din[1][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[19] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_0  ( .D(\buffer/U2/M0_1_0/din[0][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[3] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_4  ( .D(\buffer/U2/M0_1_0/din[4][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[66] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_3  ( .D(\buffer/U2/M0_1_0/din[3][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[50] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_2  ( .D(\buffer/U2/M0_1_0/din[2][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[34] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_1  ( .D(\buffer/U2/M0_1_0/din[1][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[18] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_0  ( .D(\buffer/U2/M0_1_0/din[0][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[2] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_4  ( .D(\buffer/U2/M0_1_0/din[4][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[65] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_3  ( .D(\buffer/U2/M0_1_0/din[3][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[49] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_2  ( .D(\buffer/U2/M0_1_0/din[2][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[33] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_1  ( .D(\buffer/U2/M0_1_0/din[1][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[17] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_0  ( .D(\buffer/U2/M0_1_0/din[0][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[1] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_4  ( .D(\buffer/U2/M0_1_0/din[4][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[64] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_3  ( .D(\buffer/U2/M0_1_0/din[3][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[48] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_2  ( .D(\buffer/U2/M0_1_0/din[2][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[32] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_1  ( .D(\buffer/U2/M0_1_0/din[1][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[16] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_0  ( .D(\buffer/U2/M0_1_0/din[0][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[0] ) );
  AO221X1 U2 ( .IN1(1'b1), .IN2(n7), .IN3(n88), .IN4(
        \buffer/U2/M0_1_0/tmp_mux_in[47] ), .IN5(n8), .Q(data_o[15]) );
  AO221X1 U3 ( .IN1(1'b1), .IN2(n4), .IN3(n88), .IN4(
        \buffer/U2/M0_1_0/tmp_mux_in[46] ), .IN5(n5), .Q(data_o[14]) );
  AO221X1 U4 ( .IN1(1'b1), .IN2(n1), .IN3(n88), .IN4(
        \buffer/U2/M0_1_0/tmp_mux_in[45] ), .IN5(n2), .Q(data_o[13]) );
  OA221X1 U5 ( .IN1(1'b0), .IN2(n122), .IN3(n121), .IN4(\buffer/wr_addr[1] ), 
        .IN5(n120), .Q(\buffer/U1/U1/N49 ) );
  NAND2X1 U6 ( .IN1(n58), .IN2(n96), .QN(n97) );
  NAND2X1 U7 ( .IN1(n21), .IN2(n117), .QN(n100) );
  NOR2X0 U8 ( .IN1(\buffer/rd_addr[1] ), .IN2(n59), .QN(n86) );
  NAND2X1 U9 ( .IN1(\buffer/rd_addr[0] ), .IN2(n23), .QN(n59) );
  NOR2X0 U10 ( .IN1(n103), .IN2(n96), .QN(n91) );
  NAND2X1 U11 ( .IN1(n95), .IN2(n97), .QN(n90) );
  NOR2X0 U12 ( .IN1(rst), .IN2(n92), .QN(n94) );
  NOR2X0 U13 ( .IN1(n96), .IN2(n95), .QN(n99) );
  NAND2X1 U14 ( .IN1(n103), .IN2(n97), .QN(n98) );
  NOR2X0 U15 ( .IN1(rst), .IN2(n100), .QN(n101) );
  NOR2X0 U16 ( .IN1(\buffer/U1/U1/empty_n ), .IN2(n118), .QN(n113) );
  INVX0 U17 ( .INP(n113), .ZN(n106) );
  NAND2X1 U18 ( .IN1(n107), .IN2(n106), .QN(n112) );
  INVX0 U19 ( .INP(rst), .ZN(n58) );
  NAND2X1 U20 ( .IN1(write_en), .IN2(n29), .QN(n118) );
  INVX0 U21 ( .INP(n118), .ZN(n119) );
  NOR2X0 U22 ( .IN1(n118), .IN2(n22), .QN(n121) );
  INVX0 U23 ( .INP(n120), .ZN(n117) );
  NAND2X1 U24 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[33] ), .QN(n47)
         );
  NAND2X1 U25 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[35] ), .QN(n43)
         );
  NAND2X1 U26 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[37] ), .QN(n39)
         );
  NAND2X1 U27 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[38] ), .QN(n37)
         );
  NAND2X1 U28 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[41] ), .QN(n31)
         );
  NAND2X1 U29 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[43] ), .QN(n51)
         );
  NAND2X1 U30 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[44] ), .QN(n49)
         );
  AO22X1 U31 ( .IN1(n85), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[77] ), .IN3(n86), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[29] ), .Q(n1) );
  AO22X1 U32 ( .IN1(n116), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[61] ), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[13] ), .Q(n2) );
  NOR2X0 U34 ( .IN1(rst), .IN2(n115), .QN(\buffer/U1/U1/N44 ) );
  AO22X1 U35 ( .IN1(n85), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[78] ), .IN3(n86), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[30] ), .Q(n4) );
  AO22X1 U36 ( .IN1(n84), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[14] ), .IN3(n116), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[62] ), .Q(n5) );
  NOR2X0 U38 ( .IN1(n119), .IN2(\buffer/U1/U1/empty_n ), .QN(n109) );
  NOR2X0 U39 ( .IN1(rst), .IN2(n111), .QN(\buffer/U1/U1/N55 ) );
  AO22X1 U40 ( .IN1(n85), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[79] ), .IN3(n86), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[31] ), .Q(n7) );
  AO22X1 U41 ( .IN1(n84), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[15] ), .IN3(n116), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[63] ), .Q(n8) );
  INVX0 U43 ( .INP(n107), .ZN(n10) );
  INVX0 U44 ( .INP(n24), .ZN(n11) );
  OAI221X1 U45 ( .IN1(n10), .IN2(n11), .IN3(n107), .IN4(n125), .IN5(n112), 
        .QN(n12) );
  AND3X1 U46 ( .IN1(n24), .IN2(n125), .IN3(n10), .Q(n13) );
  NOR2X0 U47 ( .IN1(n106), .IN2(n125), .QN(n14) );
  OA22X1 U48 ( .IN1(\buffer/U1/U1/wrd_count[2] ), .IN2(n14), .IN3(n125), .IN4(
        n27), .Q(n15) );
  AO222X1 U49 ( .IN1(n12), .IN2(\buffer/U1/U1/wrd_count[2] ), .IN3(n27), .IN4(
        n13), .IN5(\buffer/U1/U1/wrd_count[1] ), .IN6(n15), .Q(n16) );
  AND2X1 U50 ( .IN1(n58), .IN2(n16), .Q(\buffer/U1/U1/N56 ) );
  NOR2X0 U51 ( .IN1(n118), .IN2(n21), .QN(n17) );
  NOR2X0 U52 ( .IN1(n17), .IN2(rst), .QN(n122) );
  NOR2X0 U53 ( .IN1(\buffer/rd_addr[0] ), .IN2(\buffer/U1/U1/empty_n ), .QN(
        n56) );
  INVX0 U54 ( .INP(n112), .ZN(n18) );
  OA221X1 U55 ( .IN1(n112), .IN2(n28), .IN3(n18), .IN4(n125), .IN5(n58), .Q(
        \buffer/U1/U1/N54 ) );
  INVX0 U57 ( .INP(n124), .ZN(n20) );
  OA221X1 U58 ( .IN1(n124), .IN2(n25), .IN3(n20), .IN4(\buffer/rd_addr[1] ), 
        .IN5(n123), .Q(\buffer/U1/U1/N52 ) );
  NAND2X1 U59 ( .IN1(n121), .IN2(\buffer/wr_addr[1] ), .QN(n120) );
  NAND2X1 U60 ( .IN1(n124), .IN2(n123), .QN(n57) );
  NAND2X1 U61 ( .IN1(n118), .IN2(\buffer/U1/U1/empty_n ), .QN(n107) );
  NAND2X1 U62 ( .IN1(\buffer/wr_addr[1] ), .IN2(n58), .QN(n95) );
  NAND2X1 U63 ( .IN1(\buffer/U1/U1/empty_n ), .IN2(\buffer/rd_addr[0] ), .QN(
        n124) );
  NAND2X1 U64 ( .IN1(n58), .IN2(n26), .QN(n103) );
  AND2X1 U65 ( .IN1(n58), .IN2(n92), .Q(n93) );
  AO221X1 U66 ( .IN1(n58), .IN2(\buffer/wr_addr[0] ), .IN3(n58), .IN4(
        \buffer/wr_addr[1] ), .IN5(n122), .Q(n104) );
  NOR4X0 U67 ( .IN1(\buffer/wr_addr[0] ), .IN2(n118), .IN3(n21), .IN4(n103), 
        .QN(n105) );
  AND2X1 U68 ( .IN1(n58), .IN2(n100), .Q(n102) );
  NAND2X1 U69 ( .IN1(n48), .IN2(n49), .QN(data_o[12]) );
  NAND2X1 U70 ( .IN1(n50), .IN2(n51), .QN(data_o[11]) );
  NAND2X1 U71 ( .IN1(n52), .IN2(n53), .QN(data_o[10]) );
  NAND2X1 U72 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[42] ), .QN(n53)
         );
  NAND2X1 U73 ( .IN1(n30), .IN2(n31), .QN(data_o[9]) );
  NAND2X1 U74 ( .IN1(n32), .IN2(n33), .QN(data_o[8]) );
  NAND2X1 U75 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[40] ), .QN(n33)
         );
  NAND2X1 U76 ( .IN1(n34), .IN2(n35), .QN(data_o[7]) );
  NAND2X1 U77 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[39] ), .QN(n35)
         );
  NAND2X1 U78 ( .IN1(n36), .IN2(n37), .QN(data_o[6]) );
  NAND2X1 U79 ( .IN1(n38), .IN2(n39), .QN(data_o[5]) );
  NAND2X1 U80 ( .IN1(n40), .IN2(n41), .QN(data_o[4]) );
  NAND2X1 U81 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[36] ), .QN(n41)
         );
  NAND2X1 U82 ( .IN1(n42), .IN2(n43), .QN(data_o[3]) );
  NAND2X1 U83 ( .IN1(n44), .IN2(n45), .QN(data_o[2]) );
  NAND2X1 U84 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[34] ), .QN(n45)
         );
  NAND2X1 U85 ( .IN1(n46), .IN2(n47), .QN(data_o[1]) );
  NAND2X1 U86 ( .IN1(n54), .IN2(n55), .QN(data_o[0]) );
  NAND2X1 U87 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[32] ), .IN2(n88), .QN(n55)
         );
  NAND3X0 U88 ( .IN1(n119), .IN2(n22), .IN3(n21), .QN(n96) );
  NOR2X0 U89 ( .IN1(n67), .IN2(n66), .QN(n48) );
  NOR2X0 U90 ( .IN1(n65), .IN2(n64), .QN(n50) );
  NOR2X0 U91 ( .IN1(n63), .IN2(n62), .QN(n52) );
  NOR2X0 U92 ( .IN1(n89), .IN2(n87), .QN(n30) );
  NOR2X0 U93 ( .IN1(n83), .IN2(n82), .QN(n32) );
  NOR2X0 U94 ( .IN1(n81), .IN2(n80), .QN(n34) );
  NOR2X0 U95 ( .IN1(n79), .IN2(n78), .QN(n36) );
  NOR2X0 U96 ( .IN1(n77), .IN2(n76), .QN(n38) );
  NOR2X0 U97 ( .IN1(n75), .IN2(n74), .QN(n40) );
  NOR2X0 U98 ( .IN1(n73), .IN2(n72), .QN(n42) );
  NOR2X0 U99 ( .IN1(n71), .IN2(n70), .QN(n44) );
  NOR2X0 U100 ( .IN1(n69), .IN2(n68), .QN(n46) );
  NOR2X0 U101 ( .IN1(n61), .IN2(n60), .QN(n54) );
  NOR2X0 U102 ( .IN1(n56), .IN2(n57), .QN(\buffer/U1/U1/N51 ) );
  AND3X1 U103 ( .IN1(\buffer/rd_addr[1] ), .IN2(\buffer/rd_addr[0] ), .IN3(n23), .Q(n116) );
  NOR3X0 U104 ( .IN1(\buffer/rd_addr[1] ), .IN2(\buffer/rd_addr[2] ), .IN3(
        \buffer/rd_addr[0] ), .QN(n84) );
  AO22X1 U105 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[48] ), .IN2(n116), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[0] ), .IN4(n84), .Q(n61) );
  NOR3X0 U106 ( .IN1(\buffer/rd_addr[2] ), .IN2(\buffer/rd_addr[0] ), .IN3(n25), .QN(n88) );
  NOR3X0 U107 ( .IN1(\buffer/rd_addr[1] ), .IN2(\buffer/rd_addr[0] ), .IN3(n23), .QN(n85) );
  AO22X1 U108 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[16] ), .IN2(n86), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[64] ), .IN4(n85), .Q(n60) );
  AO22X1 U109 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[58] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[10] ), .Q(n63) );
  AO22X1 U110 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[26] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[74] ), .Q(n62) );
  AO22X1 U111 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[59] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[11] ), .Q(n65) );
  AO22X1 U112 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[27] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[75] ), .Q(n64) );
  AO22X1 U113 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[60] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[12] ), .Q(n67) );
  AO22X1 U114 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[28] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[76] ), .Q(n66) );
  AO22X1 U115 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[49] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[1] ), .Q(n69) );
  AO22X1 U116 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[17] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[65] ), .Q(n68) );
  AO22X1 U117 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[50] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[2] ), .Q(n71) );
  AO22X1 U118 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[18] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[66] ), .Q(n70) );
  AO22X1 U119 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[51] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[3] ), .Q(n73) );
  AO22X1 U120 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[19] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[67] ), .Q(n72) );
  AO22X1 U121 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[52] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[4] ), .Q(n75) );
  AO22X1 U122 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[20] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[68] ), .Q(n74) );
  AO22X1 U123 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[53] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[5] ), .Q(n77) );
  AO22X1 U124 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[21] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[69] ), .Q(n76) );
  AO22X1 U125 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[54] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[6] ), .Q(n79) );
  AO22X1 U126 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[22] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[70] ), .Q(n78) );
  AO22X1 U127 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[55] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[7] ), .Q(n81) );
  AO22X1 U128 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[23] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[71] ), .Q(n80) );
  AO22X1 U129 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[56] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[8] ), .Q(n83) );
  AO22X1 U130 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[24] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[72] ), .Q(n82) );
  AO22X1 U131 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[57] ), .IN2(n116), .IN3(n84), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[9] ), .Q(n89) );
  AO22X1 U132 ( .IN1(n86), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[25] ), .IN3(n85), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[73] ), .Q(n87) );
  AO22X1 U133 ( .IN1(data_i[0]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[0] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][0] ) );
  AO22X1 U134 ( .IN1(data_i[10]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[10] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][10] ) );
  AO22X1 U135 ( .IN1(data_i[11]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[11] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][11] ) );
  AO22X1 U136 ( .IN1(data_i[12]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[12] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][12] ) );
  AO22X1 U137 ( .IN1(data_i[13]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[13] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][13] ) );
  AO22X1 U138 ( .IN1(data_i[14]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[14] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][14] ) );
  AO22X1 U139 ( .IN1(data_i[15]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[15] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][15] ) );
  AO22X1 U140 ( .IN1(data_i[1]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[1] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][1] ) );
  AO22X1 U141 ( .IN1(data_i[2]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[2] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][2] ) );
  AO22X1 U142 ( .IN1(data_i[3]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[3] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][3] ) );
  AO22X1 U143 ( .IN1(data_i[4]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[4] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][4] ) );
  AO22X1 U144 ( .IN1(data_i[5]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[5] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][5] ) );
  AO22X1 U145 ( .IN1(data_i[6]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[6] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][6] ) );
  AO22X1 U146 ( .IN1(data_i[7]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[7] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][7] ) );
  AO22X1 U147 ( .IN1(data_i[8]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[8] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][8] ) );
  AO22X1 U148 ( .IN1(data_i[9]), .IN2(n91), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[9] ), .IN4(n90), .Q(
        \buffer/U2/M0_1_0/din[0][9] ) );
  NAND3X0 U149 ( .IN1(n121), .IN2(n26), .IN3(n21), .QN(n92) );
  AO22X1 U150 ( .IN1(data_i[0]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[16] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][0] ) );
  AO22X1 U151 ( .IN1(data_i[10]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[26] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][10] ) );
  AO22X1 U152 ( .IN1(data_i[11]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[27] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][11] ) );
  AO22X1 U153 ( .IN1(data_i[12]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[28] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][12] ) );
  AO22X1 U154 ( .IN1(data_i[13]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[29] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][13] ) );
  AO22X1 U155 ( .IN1(data_i[14]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[30] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][14] ) );
  AO22X1 U156 ( .IN1(data_i[15]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[31] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][15] ) );
  AO22X1 U157 ( .IN1(data_i[1]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[17] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][1] ) );
  AO22X1 U158 ( .IN1(data_i[2]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[18] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][2] ) );
  AO22X1 U159 ( .IN1(data_i[3]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[19] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][3] ) );
  AO22X1 U160 ( .IN1(data_i[4]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[20] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][4] ) );
  AO22X1 U161 ( .IN1(data_i[5]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[21] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][5] ) );
  AO22X1 U162 ( .IN1(data_i[6]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[22] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][6] ) );
  AO22X1 U163 ( .IN1(data_i[7]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[23] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][7] ) );
  AO22X1 U164 ( .IN1(data_i[8]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[24] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][8] ) );
  AO22X1 U165 ( .IN1(data_i[9]), .IN2(n94), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[25] ), .IN4(n93), .Q(
        \buffer/U2/M0_1_0/din[1][9] ) );
  AO22X1 U166 ( .IN1(data_i[0]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[32] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][0] ) );
  AO22X1 U167 ( .IN1(data_i[10]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[42] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][10] ) );
  AO22X1 U168 ( .IN1(data_i[11]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[43] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][11] ) );
  AO22X1 U169 ( .IN1(data_i[12]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[44] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][12] ) );
  AO22X1 U170 ( .IN1(data_i[13]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[45] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][13] ) );
  AO22X1 U171 ( .IN1(data_i[14]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[46] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][14] ) );
  AO22X1 U172 ( .IN1(data_i[15]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[47] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][15] ) );
  AO22X1 U173 ( .IN1(data_i[1]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[33] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][1] ) );
  AO22X1 U174 ( .IN1(data_i[2]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[34] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][2] ) );
  AO22X1 U175 ( .IN1(data_i[3]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[35] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][3] ) );
  AO22X1 U176 ( .IN1(data_i[4]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[36] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][4] ) );
  AO22X1 U177 ( .IN1(data_i[5]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[37] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][5] ) );
  AO22X1 U178 ( .IN1(data_i[6]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[38] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][6] ) );
  AO22X1 U179 ( .IN1(data_i[7]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[39] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][7] ) );
  AO22X1 U180 ( .IN1(data_i[8]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[40] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][8] ) );
  AO22X1 U181 ( .IN1(data_i[9]), .IN2(n99), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[41] ), .IN4(n98), .Q(
        \buffer/U2/M0_1_0/din[2][9] ) );
  AO22X1 U182 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[48] ), .IN3(
        data_i[0]), .IN4(n101), .Q(\buffer/U2/M0_1_0/din[3][0] ) );
  AO22X1 U183 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[58] ), .IN3(n101), .IN4(data_i[10]), .Q(\buffer/U2/M0_1_0/din[3][10] ) );
  AO22X1 U184 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[59] ), .IN3(n101), .IN4(data_i[11]), .Q(\buffer/U2/M0_1_0/din[3][11] ) );
  AO22X1 U185 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[60] ), .IN3(n101), .IN4(data_i[12]), .Q(\buffer/U2/M0_1_0/din[3][12] ) );
  AO22X1 U186 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[61] ), .IN3(n101), .IN4(data_i[13]), .Q(\buffer/U2/M0_1_0/din[3][13] ) );
  AO22X1 U187 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[62] ), .IN3(n101), .IN4(data_i[14]), .Q(\buffer/U2/M0_1_0/din[3][14] ) );
  AO22X1 U188 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[63] ), .IN3(n101), .IN4(data_i[15]), .Q(\buffer/U2/M0_1_0/din[3][15] ) );
  AO22X1 U189 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[49] ), .IN3(n101), .IN4(data_i[1]), .Q(\buffer/U2/M0_1_0/din[3][1] ) );
  AO22X1 U190 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[50] ), .IN3(n101), .IN4(data_i[2]), .Q(\buffer/U2/M0_1_0/din[3][2] ) );
  AO22X1 U191 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[51] ), .IN3(n101), .IN4(data_i[3]), .Q(\buffer/U2/M0_1_0/din[3][3] ) );
  AO22X1 U192 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[52] ), .IN3(n101), .IN4(data_i[4]), .Q(\buffer/U2/M0_1_0/din[3][4] ) );
  AO22X1 U193 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[53] ), .IN3(n101), .IN4(data_i[5]), .Q(\buffer/U2/M0_1_0/din[3][5] ) );
  AO22X1 U194 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[54] ), .IN3(n101), .IN4(data_i[6]), .Q(\buffer/U2/M0_1_0/din[3][6] ) );
  AO22X1 U195 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[55] ), .IN3(n101), .IN4(data_i[7]), .Q(\buffer/U2/M0_1_0/din[3][7] ) );
  AO22X1 U196 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[56] ), .IN3(n101), .IN4(data_i[8]), .Q(\buffer/U2/M0_1_0/din[3][8] ) );
  AO22X1 U197 ( .IN1(n102), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[57] ), .IN3(n101), .IN4(data_i[9]), .Q(\buffer/U2/M0_1_0/din[3][9] ) );
  AO22X1 U198 ( .IN1(data_i[0]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[64] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][0] ) );
  AO22X1 U199 ( .IN1(data_i[10]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[74] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][10] ) );
  AO22X1 U200 ( .IN1(data_i[11]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[75] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][11] ) );
  AO22X1 U201 ( .IN1(data_i[12]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[76] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][12] ) );
  AO22X1 U202 ( .IN1(data_i[13]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[77] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][13] ) );
  AO22X1 U203 ( .IN1(data_i[14]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[78] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][14] ) );
  AO22X1 U204 ( .IN1(data_i[15]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[79] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][15] ) );
  AO22X1 U205 ( .IN1(data_i[1]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[65] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][1] ) );
  AO22X1 U206 ( .IN1(data_i[2]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[66] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][2] ) );
  AO22X1 U207 ( .IN1(data_i[3]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[67] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][3] ) );
  AO22X1 U208 ( .IN1(data_i[4]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[68] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][4] ) );
  AO22X1 U209 ( .IN1(data_i[5]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[69] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][5] ) );
  AO22X1 U210 ( .IN1(data_i[6]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[70] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][6] ) );
  AO22X1 U211 ( .IN1(data_i[7]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[71] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][7] ) );
  AO22X1 U212 ( .IN1(data_i[8]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[72] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][8] ) );
  AO22X1 U213 ( .IN1(data_i[9]), .IN2(n105), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[73] ), .IN4(n104), .Q(
        \buffer/U2/M0_1_0/din[4][9] ) );
  MUX21X1 U214 ( .IN1(\buffer/U1/U1/empty_n ), .IN2(n119), .S(n125), .Q(n108)
         );
  NOR2X0 U215 ( .IN1(n109), .IN2(n108), .QN(n110) );
  XNOR2X1 U216 ( .IN1(\buffer/U1/U1/wrd_count[1] ), .IN2(n110), .Q(n111) );
  NAND4X0 U217 ( .IN1(n113), .IN2(n125), .IN3(\buffer/U1/U1/wrd_count[2] ), 
        .IN4(n24), .QN(n114) );
  OA21X1 U218 ( .IN1(\buffer/U1/U1/empty_n ), .IN2(n29), .IN3(n114), .Q(n115)
         );
  OR4X1 U219 ( .IN1(\buffer/U1/U1/N55 ), .IN2(\buffer/U1/U1/N44 ), .IN3(
        \buffer/U1/U1/N54 ), .IN4(\buffer/U1/U1/N56 ), .Q(\buffer/U1/U1/N40 )
         );
  AOI21X1 U220 ( .IN1(\buffer/U1/U1/empty_n ), .IN2(\buffer/rd_addr[2] ), 
        .IN3(rst), .QN(n123) );
  OA221X1 U221 ( .IN1(\buffer/rd_addr[2] ), .IN2(\buffer/U1/U1/empty_n ), 
        .IN3(\buffer/rd_addr[2] ), .IN4(n116), .IN5(n123), .Q(
        \buffer/U1/U1/N53 ) );
  OA21X1 U222 ( .IN1(n117), .IN2(\buffer/wr_addr[2] ), .IN3(n122), .Q(
        \buffer/U1/U1/N50 ) );
  OA221X1 U223 ( .IN1(n119), .IN2(\buffer/wr_addr[0] ), .IN3(n118), .IN4(n22), 
        .IN5(n122), .Q(\buffer/U1/U1/N48 ) );
endmodule


module inputPort_3 ( clk, rst, data_i, write_en, shift, data_o, read_valid_o
 );
  input [15:0] data_i;
  output [15:0] data_o;
  input clk, rst, write_en, shift;
  output read_valid_o;
  wire   full, \buffer/U1/U1/N56 , \buffer/U1/U1/N55 , \buffer/U1/U1/N54 ,
         \buffer/U1/U1/N53 , \buffer/U1/U1/N52 , \buffer/U1/U1/N51 ,
         \buffer/U1/U1/N50 , \buffer/U1/U1/N49 , \buffer/U1/U1/N48 ,
         \buffer/U1/U1/N44 , \buffer/U1/U1/N40 , \buffer/U1/U1/wrd_count[1] ,
         \buffer/U1/U1/wrd_count[2] , \buffer/U2/M0_1_0/tmp_mux_in[0] ,
         \buffer/U2/M0_1_0/tmp_mux_in[1] , \buffer/U2/M0_1_0/tmp_mux_in[2] ,
         \buffer/U2/M0_1_0/tmp_mux_in[3] , \buffer/U2/M0_1_0/tmp_mux_in[4] ,
         \buffer/U2/M0_1_0/tmp_mux_in[5] , \buffer/U2/M0_1_0/tmp_mux_in[6] ,
         \buffer/U2/M0_1_0/tmp_mux_in[7] , \buffer/U2/M0_1_0/tmp_mux_in[8] ,
         \buffer/U2/M0_1_0/tmp_mux_in[9] , \buffer/U2/M0_1_0/tmp_mux_in[10] ,
         \buffer/U2/M0_1_0/tmp_mux_in[11] , \buffer/U2/M0_1_0/tmp_mux_in[12] ,
         \buffer/U2/M0_1_0/tmp_mux_in[13] , \buffer/U2/M0_1_0/tmp_mux_in[14] ,
         \buffer/U2/M0_1_0/tmp_mux_in[15] , \buffer/U2/M0_1_0/tmp_mux_in[16] ,
         \buffer/U2/M0_1_0/tmp_mux_in[17] , \buffer/U2/M0_1_0/tmp_mux_in[18] ,
         \buffer/U2/M0_1_0/tmp_mux_in[19] , \buffer/U2/M0_1_0/tmp_mux_in[20] ,
         \buffer/U2/M0_1_0/tmp_mux_in[21] , \buffer/U2/M0_1_0/tmp_mux_in[22] ,
         \buffer/U2/M0_1_0/tmp_mux_in[23] , \buffer/U2/M0_1_0/tmp_mux_in[24] ,
         \buffer/U2/M0_1_0/tmp_mux_in[25] , \buffer/U2/M0_1_0/tmp_mux_in[26] ,
         \buffer/U2/M0_1_0/tmp_mux_in[27] , \buffer/U2/M0_1_0/tmp_mux_in[28] ,
         \buffer/U2/M0_1_0/tmp_mux_in[29] , \buffer/U2/M0_1_0/tmp_mux_in[30] ,
         \buffer/U2/M0_1_0/tmp_mux_in[31] , \buffer/U2/M0_1_0/tmp_mux_in[32] ,
         \buffer/U2/M0_1_0/tmp_mux_in[33] , \buffer/U2/M0_1_0/tmp_mux_in[34] ,
         \buffer/U2/M0_1_0/tmp_mux_in[35] , \buffer/U2/M0_1_0/tmp_mux_in[36] ,
         \buffer/U2/M0_1_0/tmp_mux_in[37] , \buffer/U2/M0_1_0/tmp_mux_in[38] ,
         \buffer/U2/M0_1_0/tmp_mux_in[39] , \buffer/U2/M0_1_0/tmp_mux_in[40] ,
         \buffer/U2/M0_1_0/tmp_mux_in[41] , \buffer/U2/M0_1_0/tmp_mux_in[42] ,
         \buffer/U2/M0_1_0/tmp_mux_in[43] , \buffer/U2/M0_1_0/tmp_mux_in[44] ,
         \buffer/U2/M0_1_0/tmp_mux_in[45] , \buffer/U2/M0_1_0/tmp_mux_in[46] ,
         \buffer/U2/M0_1_0/tmp_mux_in[47] , \buffer/U2/M0_1_0/tmp_mux_in[48] ,
         \buffer/U2/M0_1_0/tmp_mux_in[49] , \buffer/U2/M0_1_0/tmp_mux_in[50] ,
         \buffer/U2/M0_1_0/tmp_mux_in[51] , \buffer/U2/M0_1_0/tmp_mux_in[52] ,
         \buffer/U2/M0_1_0/tmp_mux_in[53] , \buffer/U2/M0_1_0/tmp_mux_in[54] ,
         \buffer/U2/M0_1_0/tmp_mux_in[55] , \buffer/U2/M0_1_0/tmp_mux_in[56] ,
         \buffer/U2/M0_1_0/tmp_mux_in[57] , \buffer/U2/M0_1_0/tmp_mux_in[58] ,
         \buffer/U2/M0_1_0/tmp_mux_in[59] , \buffer/U2/M0_1_0/tmp_mux_in[60] ,
         \buffer/U2/M0_1_0/tmp_mux_in[61] , \buffer/U2/M0_1_0/tmp_mux_in[62] ,
         \buffer/U2/M0_1_0/tmp_mux_in[63] , \buffer/U2/M0_1_0/tmp_mux_in[64] ,
         \buffer/U2/M0_1_0/tmp_mux_in[65] , \buffer/U2/M0_1_0/tmp_mux_in[66] ,
         \buffer/U2/M0_1_0/tmp_mux_in[67] , \buffer/U2/M0_1_0/tmp_mux_in[68] ,
         \buffer/U2/M0_1_0/tmp_mux_in[69] , \buffer/U2/M0_1_0/tmp_mux_in[70] ,
         \buffer/U2/M0_1_0/tmp_mux_in[71] , \buffer/U2/M0_1_0/tmp_mux_in[72] ,
         \buffer/U2/M0_1_0/tmp_mux_in[73] , \buffer/U2/M0_1_0/tmp_mux_in[74] ,
         \buffer/U2/M0_1_0/tmp_mux_in[75] , \buffer/U2/M0_1_0/tmp_mux_in[76] ,
         \buffer/U2/M0_1_0/tmp_mux_in[77] , \buffer/U2/M0_1_0/tmp_mux_in[78] ,
         \buffer/U2/M0_1_0/tmp_mux_in[79] , \buffer/U2/M0_1_0/din[4][15] ,
         \buffer/U2/M0_1_0/din[4][14] , \buffer/U2/M0_1_0/din[4][13] ,
         \buffer/U2/M0_1_0/din[4][12] , \buffer/U2/M0_1_0/din[4][11] ,
         \buffer/U2/M0_1_0/din[4][10] , \buffer/U2/M0_1_0/din[4][9] ,
         \buffer/U2/M0_1_0/din[4][8] , \buffer/U2/M0_1_0/din[4][7] ,
         \buffer/U2/M0_1_0/din[4][6] , \buffer/U2/M0_1_0/din[4][5] ,
         \buffer/U2/M0_1_0/din[4][4] , \buffer/U2/M0_1_0/din[4][3] ,
         \buffer/U2/M0_1_0/din[4][2] , \buffer/U2/M0_1_0/din[4][1] ,
         \buffer/U2/M0_1_0/din[4][0] , \buffer/U2/M0_1_0/din[3][15] ,
         \buffer/U2/M0_1_0/din[3][14] , \buffer/U2/M0_1_0/din[3][13] ,
         \buffer/U2/M0_1_0/din[3][12] , \buffer/U2/M0_1_0/din[3][11] ,
         \buffer/U2/M0_1_0/din[3][10] , \buffer/U2/M0_1_0/din[3][9] ,
         \buffer/U2/M0_1_0/din[3][8] , \buffer/U2/M0_1_0/din[3][7] ,
         \buffer/U2/M0_1_0/din[3][6] , \buffer/U2/M0_1_0/din[3][5] ,
         \buffer/U2/M0_1_0/din[3][4] , \buffer/U2/M0_1_0/din[3][3] ,
         \buffer/U2/M0_1_0/din[3][2] , \buffer/U2/M0_1_0/din[3][1] ,
         \buffer/U2/M0_1_0/din[3][0] , \buffer/U2/M0_1_0/din[2][15] ,
         \buffer/U2/M0_1_0/din[2][14] , \buffer/U2/M0_1_0/din[2][13] ,
         \buffer/U2/M0_1_0/din[2][12] , \buffer/U2/M0_1_0/din[2][11] ,
         \buffer/U2/M0_1_0/din[2][10] , \buffer/U2/M0_1_0/din[2][9] ,
         \buffer/U2/M0_1_0/din[2][8] , \buffer/U2/M0_1_0/din[2][7] ,
         \buffer/U2/M0_1_0/din[2][6] , \buffer/U2/M0_1_0/din[2][5] ,
         \buffer/U2/M0_1_0/din[2][4] , \buffer/U2/M0_1_0/din[2][3] ,
         \buffer/U2/M0_1_0/din[2][2] , \buffer/U2/M0_1_0/din[2][1] ,
         \buffer/U2/M0_1_0/din[2][0] , \buffer/U2/M0_1_0/din[1][15] ,
         \buffer/U2/M0_1_0/din[1][14] , \buffer/U2/M0_1_0/din[1][13] ,
         \buffer/U2/M0_1_0/din[1][12] , \buffer/U2/M0_1_0/din[1][11] ,
         \buffer/U2/M0_1_0/din[1][10] , \buffer/U2/M0_1_0/din[1][9] ,
         \buffer/U2/M0_1_0/din[1][8] , \buffer/U2/M0_1_0/din[1][7] ,
         \buffer/U2/M0_1_0/din[1][6] , \buffer/U2/M0_1_0/din[1][5] ,
         \buffer/U2/M0_1_0/din[1][4] , \buffer/U2/M0_1_0/din[1][3] ,
         \buffer/U2/M0_1_0/din[1][2] , \buffer/U2/M0_1_0/din[1][1] ,
         \buffer/U2/M0_1_0/din[1][0] , \buffer/U2/M0_1_0/din[0][15] ,
         \buffer/U2/M0_1_0/din[0][14] , \buffer/U2/M0_1_0/din[0][13] ,
         \buffer/U2/M0_1_0/din[0][12] , \buffer/U2/M0_1_0/din[0][11] ,
         \buffer/U2/M0_1_0/din[0][10] , \buffer/U2/M0_1_0/din[0][9] ,
         \buffer/U2/M0_1_0/din[0][8] , \buffer/U2/M0_1_0/din[0][7] ,
         \buffer/U2/M0_1_0/din[0][6] , \buffer/U2/M0_1_0/din[0][5] ,
         \buffer/U2/M0_1_0/din[0][4] , \buffer/U2/M0_1_0/din[0][3] ,
         \buffer/U2/M0_1_0/din[0][2] , \buffer/U2/M0_1_0/din[0][1] ,
         \buffer/U2/M0_1_0/din[0][0] , \buffer/rd_addr[0] ,
         \buffer/rd_addr[1] , \buffer/rd_addr[2] , \buffer/wr_addr[0] ,
         \buffer/wr_addr[1] , \buffer/wr_addr[2] , n1, n3, n4, n5, n6, n7, n8,
         n10, n11, n12, n13, n14, n15, n16, n18, n20, n22, n23, n24, n25, n26,
         n27, n28, n29, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126;
  tri   [15:0] data_i;
  tri   write_en;
  tri   shift;

  DFFX1 \buffer/U1/U1/rd_addr_int_reg[2]  ( .D(\buffer/U1/U1/N53 ), .CLK(clk), 
        .Q(\buffer/rd_addr[2] ), .QN(n25) );
  DFFX1 \buffer/U1/U1/rd_addr_int_reg[1]  ( .D(\buffer/U1/U1/N52 ), .CLK(clk), 
        .Q(\buffer/rd_addr[1] ), .QN(n27) );
  DFFX1 \buffer/U1/U1/rd_addr_int_reg[0]  ( .D(\buffer/U1/U1/N51 ), .CLK(clk), 
        .Q(\buffer/rd_addr[0] ) );
  DFFX1 \buffer/U1/U1/wr_addr_at_max_reg  ( .D(\buffer/U1/U1/N50 ), .CLK(clk), 
        .Q(\buffer/wr_addr[2] ), .QN(n23) );
  DFFX1 \buffer/U1/U1/wr_addr_int_reg[1]  ( .D(\buffer/U1/U1/N49 ), .CLK(clk), 
        .Q(\buffer/wr_addr[1] ), .QN(n28) );
  DFFX1 \buffer/U1/U1/wr_addr_int_reg[0]  ( .D(\buffer/U1/U1/N48 ), .CLK(clk), 
        .Q(\buffer/wr_addr[0] ), .QN(n26) );
  DFFX1 \buffer/U1/U1/word_count_reg[2]  ( .D(\buffer/U1/U1/N56 ), .CLK(clk), 
        .Q(\buffer/U1/U1/wrd_count[2] ), .QN(n29) );
  DFFX1 \buffer/U1/U1/word_count_reg[1]  ( .D(\buffer/U1/U1/N55 ), .CLK(clk), 
        .Q(\buffer/U1/U1/wrd_count[1] ), .QN(n31) );
  DFFX1 \buffer/U1/U1/word_count_reg[0]  ( .D(\buffer/U1/U1/N54 ), .CLK(clk), 
        .Q(n24), .QN(n126) );
  DFFX1 \buffer/U1/U1/empty_n_reg  ( .D(\buffer/U1/U1/N40 ), .CLK(clk), .Q(
        read_valid_o) );
  DFFX1 \buffer/U1/U1/full_int_reg  ( .D(\buffer/U1/U1/N44 ), .CLK(clk), .Q(
        full), .QN(n32) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_4  ( .D(\buffer/U2/M0_1_0/din[4][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[79] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_3  ( .D(\buffer/U2/M0_1_0/din[3][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[63] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_2  ( .D(\buffer/U2/M0_1_0/din[2][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[47] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_1  ( .D(\buffer/U2/M0_1_0/din[1][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[31] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_15_0  ( .D(\buffer/U2/M0_1_0/din[0][15] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[15] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_4  ( .D(\buffer/U2/M0_1_0/din[4][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[78] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_3  ( .D(\buffer/U2/M0_1_0/din[3][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[62] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_2  ( .D(\buffer/U2/M0_1_0/din[2][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[46] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_1  ( .D(\buffer/U2/M0_1_0/din[1][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[30] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_14_0  ( .D(\buffer/U2/M0_1_0/din[0][14] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[14] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_4  ( .D(\buffer/U2/M0_1_0/din[4][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[77] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_3  ( .D(\buffer/U2/M0_1_0/din[3][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[61] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_2  ( .D(\buffer/U2/M0_1_0/din[2][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[45] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_1  ( .D(\buffer/U2/M0_1_0/din[1][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[29] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_13_0  ( .D(\buffer/U2/M0_1_0/din[0][13] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[13] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_4  ( .D(\buffer/U2/M0_1_0/din[4][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[76] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_3  ( .D(\buffer/U2/M0_1_0/din[3][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[60] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_2  ( .D(\buffer/U2/M0_1_0/din[2][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[44] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_1  ( .D(\buffer/U2/M0_1_0/din[1][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[28] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_12_0  ( .D(\buffer/U2/M0_1_0/din[0][12] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[12] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_4  ( .D(\buffer/U2/M0_1_0/din[4][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[75] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_3  ( .D(\buffer/U2/M0_1_0/din[3][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[59] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_2  ( .D(\buffer/U2/M0_1_0/din[2][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[43] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_1  ( .D(\buffer/U2/M0_1_0/din[1][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[27] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_11_0  ( .D(\buffer/U2/M0_1_0/din[0][11] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[11] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_4  ( .D(\buffer/U2/M0_1_0/din[4][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[74] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_3  ( .D(\buffer/U2/M0_1_0/din[3][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[58] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_2  ( .D(\buffer/U2/M0_1_0/din[2][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[42] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_1  ( .D(\buffer/U2/M0_1_0/din[1][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[26] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_10_0  ( .D(\buffer/U2/M0_1_0/din[0][10] ), .CLK(
        clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[10] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_4  ( .D(\buffer/U2/M0_1_0/din[4][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[73] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_3  ( .D(\buffer/U2/M0_1_0/din[3][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[57] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_2  ( .D(\buffer/U2/M0_1_0/din[2][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[41] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_1  ( .D(\buffer/U2/M0_1_0/din[1][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[25] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_9_0  ( .D(\buffer/U2/M0_1_0/din[0][9] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[9] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_4  ( .D(\buffer/U2/M0_1_0/din[4][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[72] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_3  ( .D(\buffer/U2/M0_1_0/din[3][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[56] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_2  ( .D(\buffer/U2/M0_1_0/din[2][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[40] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_1  ( .D(\buffer/U2/M0_1_0/din[1][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[24] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_8_0  ( .D(\buffer/U2/M0_1_0/din[0][8] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[8] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_4  ( .D(\buffer/U2/M0_1_0/din[4][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[71] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_3  ( .D(\buffer/U2/M0_1_0/din[3][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[55] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_2  ( .D(\buffer/U2/M0_1_0/din[2][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[39] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_1  ( .D(\buffer/U2/M0_1_0/din[1][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[23] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_7_0  ( .D(\buffer/U2/M0_1_0/din[0][7] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[7] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_4  ( .D(\buffer/U2/M0_1_0/din[4][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[70] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_3  ( .D(\buffer/U2/M0_1_0/din[3][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[54] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_2  ( .D(\buffer/U2/M0_1_0/din[2][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[38] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_1  ( .D(\buffer/U2/M0_1_0/din[1][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[22] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_6_0  ( .D(\buffer/U2/M0_1_0/din[0][6] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[6] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_4  ( .D(\buffer/U2/M0_1_0/din[4][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[69] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_3  ( .D(\buffer/U2/M0_1_0/din[3][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[53] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_2  ( .D(\buffer/U2/M0_1_0/din[2][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[37] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_1  ( .D(\buffer/U2/M0_1_0/din[1][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[21] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_5_0  ( .D(\buffer/U2/M0_1_0/din[0][5] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[5] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_4  ( .D(\buffer/U2/M0_1_0/din[4][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[68] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_3  ( .D(\buffer/U2/M0_1_0/din[3][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[52] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_2  ( .D(\buffer/U2/M0_1_0/din[2][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[36] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_1  ( .D(\buffer/U2/M0_1_0/din[1][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[20] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_4_0  ( .D(\buffer/U2/M0_1_0/din[0][4] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[4] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_4  ( .D(\buffer/U2/M0_1_0/din[4][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[67] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_3  ( .D(\buffer/U2/M0_1_0/din[3][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[51] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_2  ( .D(\buffer/U2/M0_1_0/din[2][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[35] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_1  ( .D(\buffer/U2/M0_1_0/din[1][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[19] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_3_0  ( .D(\buffer/U2/M0_1_0/din[0][3] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[3] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_4  ( .D(\buffer/U2/M0_1_0/din[4][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[66] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_3  ( .D(\buffer/U2/M0_1_0/din[3][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[50] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_2  ( .D(\buffer/U2/M0_1_0/din[2][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[34] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_1  ( .D(\buffer/U2/M0_1_0/din[1][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[18] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_2_0  ( .D(\buffer/U2/M0_1_0/din[0][2] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[2] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_4  ( .D(\buffer/U2/M0_1_0/din[4][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[65] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_3  ( .D(\buffer/U2/M0_1_0/din[3][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[49] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_2  ( .D(\buffer/U2/M0_1_0/din[2][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[33] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_1  ( .D(\buffer/U2/M0_1_0/din[1][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[17] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_1_0  ( .D(\buffer/U2/M0_1_0/din[0][1] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[1] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_4  ( .D(\buffer/U2/M0_1_0/din[4][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[64] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_3  ( .D(\buffer/U2/M0_1_0/din[3][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[48] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_2  ( .D(\buffer/U2/M0_1_0/din[2][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[32] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_1  ( .D(\buffer/U2/M0_1_0/din[1][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[16] ) );
  DFFX1 \buffer/U2/M0_1_0/F0_0_0  ( .D(\buffer/U2/M0_1_0/din[0][0] ), .CLK(clk), .Q(\buffer/U2/M0_1_0/tmp_mux_in[0] ) );
  AO221X1 U2 ( .IN1(1'b1), .IN2(n71), .IN3(\buffer/U2/M0_1_0/tmp_mux_in[47] ), 
        .IN4(n92), .IN5(n16), .Q(data_o[15]) );
  AO221X1 U3 ( .IN1(1'b1), .IN2(n70), .IN3(\buffer/U2/M0_1_0/tmp_mux_in[46] ), 
        .IN4(n92), .IN5(n8), .Q(data_o[14]) );
  AO221X1 U4 ( .IN1(1'b1), .IN2(n69), .IN3(\buffer/U2/M0_1_0/tmp_mux_in[45] ), 
        .IN4(n92), .IN5(n1), .Q(data_o[13]) );
  OA221X1 U5 ( .IN1(1'b0), .IN2(n122), .IN3(n121), .IN4(\buffer/wr_addr[1] ), 
        .IN5(n120), .Q(\buffer/U1/U1/N49 ) );
  OA221X1 U6 ( .IN1(1'b0), .IN2(n124), .IN3(n123), .IN4(\buffer/rd_addr[0] ), 
        .IN5(n125), .Q(\buffer/U1/U1/N51 ) );
  NOR2X0 U7 ( .IN1(\buffer/rd_addr[1] ), .IN2(n60), .QN(n90) );
  NAND2X1 U8 ( .IN1(\buffer/rd_addr[0] ), .IN2(n25), .QN(n60) );
  NAND2X1 U9 ( .IN1(n59), .IN2(n100), .QN(n101) );
  NAND2X1 U10 ( .IN1(n23), .IN2(n117), .QN(n104) );
  INVX0 U11 ( .INP(rst), .ZN(n59) );
  NAND2X1 U12 ( .IN1(shift), .IN2(read_valid_o), .QN(n115) );
  NOR2X0 U13 ( .IN1(n107), .IN2(n100), .QN(n95) );
  NAND2X1 U14 ( .IN1(n99), .IN2(n101), .QN(n94) );
  NOR2X0 U15 ( .IN1(rst), .IN2(n96), .QN(n98) );
  NOR2X0 U16 ( .IN1(n100), .IN2(n99), .QN(n103) );
  NAND2X1 U17 ( .IN1(n107), .IN2(n101), .QN(n102) );
  NOR2X0 U18 ( .IN1(rst), .IN2(n104), .QN(n105) );
  NAND2X1 U19 ( .IN1(n119), .IN2(n115), .QN(n110) );
  NAND2X1 U20 ( .IN1(n123), .IN2(n118), .QN(n111) );
  INVX0 U21 ( .INP(n118), .ZN(n119) );
  NOR2X0 U22 ( .IN1(n118), .IN2(n26), .QN(n121) );
  INVX0 U23 ( .INP(n120), .ZN(n117) );
  NAND2X1 U24 ( .IN1(n123), .IN2(\buffer/rd_addr[0] ), .QN(n125) );
  INVX0 U25 ( .INP(n115), .ZN(n123) );
  NAND2X1 U26 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[34] ), .QN(n48)
         );
  NAND2X1 U27 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[35] ), .QN(n46)
         );
  NAND2X1 U28 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[38] ), .QN(n40)
         );
  NAND2X1 U29 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[39] ), .QN(n38)
         );
  NAND2X1 U30 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[40] ), .QN(n36)
         );
  NAND2X1 U31 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[42] ), .QN(n56)
         );
  NAND2X1 U32 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[43] ), .QN(n54)
         );
  AO22X1 U33 ( .IN1(n116), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[61] ), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[13] ), .Q(n1) );
  INVX0 U35 ( .INP(n119), .ZN(n3) );
  INVX0 U36 ( .INP(n126), .ZN(n4) );
  INVX0 U37 ( .INP(n123), .ZN(n5) );
  OA222X1 U38 ( .IN1(n119), .IN2(n123), .IN3(n3), .IN4(n4), .IN5(n5), .IN6(
        n126), .Q(n6) );
  XNOR2X1 U39 ( .IN1(\buffer/U1/U1/wrd_count[1] ), .IN2(n6), .Q(n7) );
  NOR2X0 U40 ( .IN1(rst), .IN2(n7), .QN(\buffer/U1/U1/N55 ) );
  AO22X1 U41 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[14] ), .IN3(n116), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[62] ), .Q(n8) );
  MUX21X1 U43 ( .IN1(n24), .IN2(n31), .S(n111), .Q(n10) );
  NOR4X0 U44 ( .IN1(n111), .IN2(\buffer/U1/U1/wrd_count[2] ), .IN3(
        \buffer/U1/U1/wrd_count[1] ), .IN4(n24), .QN(n11) );
  AO221X1 U45 ( .IN1(\buffer/U1/U1/wrd_count[2] ), .IN2(n112), .IN3(
        \buffer/U1/U1/wrd_count[2] ), .IN4(n10), .IN5(n11), .Q(n12) );
  NOR2X0 U46 ( .IN1(n110), .IN2(n126), .QN(n13) );
  OA22X1 U47 ( .IN1(\buffer/U1/U1/wrd_count[2] ), .IN2(n13), .IN3(n126), .IN4(
        n29), .Q(n14) );
  INVX0 U48 ( .INP(rst), .ZN(n15) );
  OA221X1 U49 ( .IN1(n12), .IN2(n14), .IN3(n12), .IN4(
        \buffer/U1/U1/wrd_count[1] ), .IN5(n15), .Q(\buffer/U1/U1/N56 ) );
  AO22X1 U50 ( .IN1(n88), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[15] ), .IN3(n116), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[63] ), .Q(n16) );
  NOR2X0 U52 ( .IN1(n118), .IN2(n23), .QN(n18) );
  NOR2X0 U53 ( .IN1(n18), .IN2(rst), .QN(n122) );
  MUX21X1 U55 ( .IN1(n24), .IN2(n126), .S(n112), .Q(n20) );
  NOR2X0 U56 ( .IN1(rst), .IN2(n20), .QN(\buffer/U1/U1/N54 ) );
  INVX0 U58 ( .INP(n125), .ZN(n22) );
  OA221X1 U59 ( .IN1(n125), .IN2(n27), .IN3(n22), .IN4(\buffer/rd_addr[1] ), 
        .IN5(n124), .Q(\buffer/U1/U1/N52 ) );
  NAND2X1 U60 ( .IN1(n121), .IN2(\buffer/wr_addr[1] ), .QN(n120) );
  NAND2X1 U61 ( .IN1(\buffer/wr_addr[1] ), .IN2(n59), .QN(n99) );
  NAND2X1 U62 ( .IN1(n59), .IN2(n28), .QN(n107) );
  AO221X1 U63 ( .IN1(n59), .IN2(\buffer/wr_addr[0] ), .IN3(n59), .IN4(
        \buffer/wr_addr[1] ), .IN5(n122), .Q(n108) );
  NOR4X0 U64 ( .IN1(\buffer/wr_addr[0] ), .IN2(n118), .IN3(n23), .IN4(n107), 
        .QN(n109) );
  AND2X1 U65 ( .IN1(n59), .IN2(n104), .Q(n106) );
  AND2X1 U66 ( .IN1(n59), .IN2(n96), .Q(n97) );
  NAND2X0 U67 ( .IN1(write_en), .IN2(n32), .QN(n118) );
  NAND2X1 U68 ( .IN1(n51), .IN2(n52), .QN(data_o[12]) );
  NAND2X1 U69 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[44] ), .QN(n52)
         );
  NAND2X1 U70 ( .IN1(n53), .IN2(n54), .QN(data_o[11]) );
  NAND2X1 U71 ( .IN1(n55), .IN2(n56), .QN(data_o[10]) );
  NAND2X1 U72 ( .IN1(n33), .IN2(n34), .QN(data_o[9]) );
  NAND2X1 U73 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[41] ), .QN(n34)
         );
  NAND2X1 U74 ( .IN1(n35), .IN2(n36), .QN(data_o[8]) );
  NAND2X1 U75 ( .IN1(n37), .IN2(n38), .QN(data_o[7]) );
  NAND2X1 U76 ( .IN1(n39), .IN2(n40), .QN(data_o[6]) );
  NAND2X1 U77 ( .IN1(n41), .IN2(n42), .QN(data_o[5]) );
  NAND2X1 U78 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[37] ), .QN(n42)
         );
  NAND2X1 U79 ( .IN1(n43), .IN2(n44), .QN(data_o[4]) );
  NAND2X1 U80 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[36] ), .QN(n44)
         );
  NAND2X1 U81 ( .IN1(n45), .IN2(n46), .QN(data_o[3]) );
  NAND2X1 U82 ( .IN1(n47), .IN2(n48), .QN(data_o[2]) );
  NAND2X1 U83 ( .IN1(n49), .IN2(n50), .QN(data_o[1]) );
  NAND2X1 U84 ( .IN1(n92), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[33] ), .QN(n50)
         );
  NAND2X1 U85 ( .IN1(n57), .IN2(n58), .QN(data_o[0]) );
  NAND2X1 U86 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[32] ), .IN2(n92), .QN(n58)
         );
  NAND3X0 U87 ( .IN1(n119), .IN2(n26), .IN3(n23), .QN(n100) );
  NOR2X0 U88 ( .IN1(n68), .IN2(n67), .QN(n51) );
  NOR2X0 U89 ( .IN1(n66), .IN2(n65), .QN(n53) );
  NOR2X0 U90 ( .IN1(n64), .IN2(n63), .QN(n55) );
  NOR2X0 U91 ( .IN1(n93), .IN2(n91), .QN(n33) );
  NOR2X0 U92 ( .IN1(n87), .IN2(n86), .QN(n35) );
  NOR2X0 U93 ( .IN1(n85), .IN2(n84), .QN(n37) );
  NOR2X0 U94 ( .IN1(n83), .IN2(n82), .QN(n39) );
  NOR2X0 U95 ( .IN1(n81), .IN2(n80), .QN(n41) );
  NOR2X0 U96 ( .IN1(n79), .IN2(n78), .QN(n43) );
  NOR2X0 U97 ( .IN1(n77), .IN2(n76), .QN(n45) );
  NOR2X0 U98 ( .IN1(n75), .IN2(n74), .QN(n47) );
  NOR2X0 U99 ( .IN1(n73), .IN2(n72), .QN(n49) );
  NOR2X0 U100 ( .IN1(n62), .IN2(n61), .QN(n57) );
  AND3X1 U101 ( .IN1(\buffer/rd_addr[1] ), .IN2(\buffer/rd_addr[0] ), .IN3(n25), .Q(n116) );
  NOR3X0 U102 ( .IN1(\buffer/rd_addr[1] ), .IN2(\buffer/rd_addr[2] ), .IN3(
        \buffer/rd_addr[0] ), .QN(n88) );
  AO22X1 U103 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[48] ), .IN2(n116), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[0] ), .IN4(n88), .Q(n62) );
  NOR3X0 U104 ( .IN1(\buffer/rd_addr[2] ), .IN2(\buffer/rd_addr[0] ), .IN3(n27), .QN(n92) );
  NOR3X0 U105 ( .IN1(\buffer/rd_addr[1] ), .IN2(\buffer/rd_addr[0] ), .IN3(n25), .QN(n89) );
  AO22X1 U106 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[16] ), .IN2(n90), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[64] ), .IN4(n89), .Q(n61) );
  AO22X1 U107 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[58] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[10] ), .Q(n64) );
  AO22X1 U108 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[26] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[74] ), .Q(n63) );
  AO22X1 U109 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[59] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[11] ), .Q(n66) );
  AO22X1 U110 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[27] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[75] ), .Q(n65) );
  AO22X1 U111 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[60] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[12] ), .Q(n68) );
  AO22X1 U112 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[28] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[76] ), .Q(n67) );
  AO22X1 U113 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[29] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[77] ), .Q(n69) );
  AO22X1 U114 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[30] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[78] ), .Q(n70) );
  AO22X1 U115 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[31] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[79] ), .Q(n71) );
  AO22X1 U116 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[49] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[1] ), .Q(n73) );
  AO22X1 U117 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[17] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[65] ), .Q(n72) );
  AO22X1 U118 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[50] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[2] ), .Q(n75) );
  AO22X1 U119 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[18] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[66] ), .Q(n74) );
  AO22X1 U120 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[51] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[3] ), .Q(n77) );
  AO22X1 U121 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[19] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[67] ), .Q(n76) );
  AO22X1 U122 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[52] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[4] ), .Q(n79) );
  AO22X1 U123 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[20] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[68] ), .Q(n78) );
  AO22X1 U124 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[53] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[5] ), .Q(n81) );
  AO22X1 U125 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[21] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[69] ), .Q(n80) );
  AO22X1 U126 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[54] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[6] ), .Q(n83) );
  AO22X1 U127 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[22] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[70] ), .Q(n82) );
  AO22X1 U128 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[55] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[7] ), .Q(n85) );
  AO22X1 U129 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[23] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[71] ), .Q(n84) );
  AO22X1 U130 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[56] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[8] ), .Q(n87) );
  AO22X1 U131 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[24] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[72] ), .Q(n86) );
  AO22X1 U132 ( .IN1(\buffer/U2/M0_1_0/tmp_mux_in[57] ), .IN2(n116), .IN3(n88), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[9] ), .Q(n93) );
  AO22X1 U133 ( .IN1(n90), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[25] ), .IN3(n89), 
        .IN4(\buffer/U2/M0_1_0/tmp_mux_in[73] ), .Q(n91) );
  AO22X1 U134 ( .IN1(data_i[0]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[0] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][0] ) );
  AO22X1 U135 ( .IN1(data_i[10]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[10] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][10] ) );
  AO22X1 U136 ( .IN1(data_i[11]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[11] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][11] ) );
  AO22X1 U137 ( .IN1(data_i[12]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[12] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][12] ) );
  AO22X1 U138 ( .IN1(data_i[13]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[13] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][13] ) );
  AO22X1 U139 ( .IN1(data_i[14]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[14] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][14] ) );
  AO22X1 U140 ( .IN1(data_i[15]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[15] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][15] ) );
  AO22X1 U141 ( .IN1(data_i[1]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[1] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][1] ) );
  AO22X1 U142 ( .IN1(data_i[2]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[2] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][2] ) );
  AO22X1 U143 ( .IN1(data_i[3]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[3] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][3] ) );
  AO22X1 U144 ( .IN1(data_i[4]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[4] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][4] ) );
  AO22X1 U145 ( .IN1(data_i[5]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[5] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][5] ) );
  AO22X1 U146 ( .IN1(data_i[6]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[6] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][6] ) );
  AO22X1 U147 ( .IN1(data_i[7]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[7] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][7] ) );
  AO22X1 U148 ( .IN1(data_i[8]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[8] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][8] ) );
  AO22X1 U149 ( .IN1(data_i[9]), .IN2(n95), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[9] ), .IN4(n94), .Q(
        \buffer/U2/M0_1_0/din[0][9] ) );
  NAND3X0 U150 ( .IN1(n121), .IN2(n28), .IN3(n23), .QN(n96) );
  AO22X1 U151 ( .IN1(data_i[0]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[16] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][0] ) );
  AO22X1 U152 ( .IN1(data_i[10]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[26] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][10] ) );
  AO22X1 U153 ( .IN1(data_i[11]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[27] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][11] ) );
  AO22X1 U154 ( .IN1(data_i[12]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[28] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][12] ) );
  AO22X1 U155 ( .IN1(data_i[13]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[29] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][13] ) );
  AO22X1 U156 ( .IN1(data_i[14]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[30] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][14] ) );
  AO22X1 U157 ( .IN1(data_i[15]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[31] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][15] ) );
  AO22X1 U158 ( .IN1(data_i[1]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[17] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][1] ) );
  AO22X1 U159 ( .IN1(data_i[2]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[18] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][2] ) );
  AO22X1 U160 ( .IN1(data_i[3]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[19] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][3] ) );
  AO22X1 U161 ( .IN1(data_i[4]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[20] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][4] ) );
  AO22X1 U162 ( .IN1(data_i[5]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[21] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][5] ) );
  AO22X1 U163 ( .IN1(data_i[6]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[22] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][6] ) );
  AO22X1 U164 ( .IN1(data_i[7]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[23] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][7] ) );
  AO22X1 U165 ( .IN1(data_i[8]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[24] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][8] ) );
  AO22X1 U166 ( .IN1(data_i[9]), .IN2(n98), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[25] ), .IN4(n97), .Q(
        \buffer/U2/M0_1_0/din[1][9] ) );
  AO22X1 U167 ( .IN1(data_i[0]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[32] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][0] ) );
  AO22X1 U168 ( .IN1(data_i[10]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[42] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][10] ) );
  AO22X1 U169 ( .IN1(data_i[11]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[43] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][11] ) );
  AO22X1 U170 ( .IN1(data_i[12]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[44] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][12] ) );
  AO22X1 U171 ( .IN1(data_i[13]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[45] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][13] ) );
  AO22X1 U172 ( .IN1(data_i[14]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[46] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][14] ) );
  AO22X1 U173 ( .IN1(data_i[15]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[47] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][15] ) );
  AO22X1 U174 ( .IN1(data_i[1]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[33] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][1] ) );
  AO22X1 U175 ( .IN1(data_i[2]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[34] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][2] ) );
  AO22X1 U176 ( .IN1(data_i[3]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[35] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][3] ) );
  AO22X1 U177 ( .IN1(data_i[4]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[36] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][4] ) );
  AO22X1 U178 ( .IN1(data_i[5]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[37] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][5] ) );
  AO22X1 U179 ( .IN1(data_i[6]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[38] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][6] ) );
  AO22X1 U180 ( .IN1(data_i[7]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[39] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][7] ) );
  AO22X1 U181 ( .IN1(data_i[8]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[40] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][8] ) );
  AO22X1 U182 ( .IN1(data_i[9]), .IN2(n103), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[41] ), .IN4(n102), .Q(
        \buffer/U2/M0_1_0/din[2][9] ) );
  AO22X1 U183 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[48] ), .IN3(
        data_i[0]), .IN4(n105), .Q(\buffer/U2/M0_1_0/din[3][0] ) );
  AO22X1 U184 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[58] ), .IN3(n105), .IN4(data_i[10]), .Q(\buffer/U2/M0_1_0/din[3][10] ) );
  AO22X1 U185 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[59] ), .IN3(n105), .IN4(data_i[11]), .Q(\buffer/U2/M0_1_0/din[3][11] ) );
  AO22X1 U186 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[60] ), .IN3(n105), .IN4(data_i[12]), .Q(\buffer/U2/M0_1_0/din[3][12] ) );
  AO22X1 U187 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[61] ), .IN3(n105), .IN4(data_i[13]), .Q(\buffer/U2/M0_1_0/din[3][13] ) );
  AO22X1 U188 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[62] ), .IN3(n105), .IN4(data_i[14]), .Q(\buffer/U2/M0_1_0/din[3][14] ) );
  AO22X1 U189 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[63] ), .IN3(n105), .IN4(data_i[15]), .Q(\buffer/U2/M0_1_0/din[3][15] ) );
  AO22X1 U190 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[49] ), .IN3(n105), .IN4(data_i[1]), .Q(\buffer/U2/M0_1_0/din[3][1] ) );
  AO22X1 U191 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[50] ), .IN3(n105), .IN4(data_i[2]), .Q(\buffer/U2/M0_1_0/din[3][2] ) );
  AO22X1 U192 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[51] ), .IN3(n105), .IN4(data_i[3]), .Q(\buffer/U2/M0_1_0/din[3][3] ) );
  AO22X1 U193 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[52] ), .IN3(n105), .IN4(data_i[4]), .Q(\buffer/U2/M0_1_0/din[3][4] ) );
  AO22X1 U194 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[53] ), .IN3(n105), .IN4(data_i[5]), .Q(\buffer/U2/M0_1_0/din[3][5] ) );
  AO22X1 U195 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[54] ), .IN3(n105), .IN4(data_i[6]), .Q(\buffer/U2/M0_1_0/din[3][6] ) );
  AO22X1 U196 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[55] ), .IN3(n105), .IN4(data_i[7]), .Q(\buffer/U2/M0_1_0/din[3][7] ) );
  AO22X1 U197 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[56] ), .IN3(n105), .IN4(data_i[8]), .Q(\buffer/U2/M0_1_0/din[3][8] ) );
  AO22X1 U198 ( .IN1(n106), .IN2(\buffer/U2/M0_1_0/tmp_mux_in[57] ), .IN3(n105), .IN4(data_i[9]), .Q(\buffer/U2/M0_1_0/din[3][9] ) );
  AO22X1 U199 ( .IN1(data_i[0]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[64] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][0] ) );
  AO22X1 U200 ( .IN1(data_i[10]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[74] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][10] ) );
  AO22X1 U201 ( .IN1(data_i[11]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[75] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][11] ) );
  AO22X1 U202 ( .IN1(data_i[12]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[76] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][12] ) );
  AO22X1 U203 ( .IN1(data_i[13]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[77] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][13] ) );
  AO22X1 U204 ( .IN1(data_i[14]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[78] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][14] ) );
  AO22X1 U205 ( .IN1(data_i[15]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[79] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][15] ) );
  AO22X1 U206 ( .IN1(data_i[1]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[65] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][1] ) );
  AO22X1 U207 ( .IN1(data_i[2]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[66] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][2] ) );
  AO22X1 U208 ( .IN1(data_i[3]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[67] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][3] ) );
  AO22X1 U209 ( .IN1(data_i[4]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[68] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][4] ) );
  AO22X1 U210 ( .IN1(data_i[5]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[69] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][5] ) );
  AO22X1 U211 ( .IN1(data_i[6]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[70] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][6] ) );
  AO22X1 U212 ( .IN1(data_i[7]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[71] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][7] ) );
  AO22X1 U213 ( .IN1(data_i[8]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[72] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][8] ) );
  AO22X1 U214 ( .IN1(data_i[9]), .IN2(n109), .IN3(
        \buffer/U2/M0_1_0/tmp_mux_in[73] ), .IN4(n108), .Q(
        \buffer/U2/M0_1_0/din[4][9] ) );
  AND2X1 U215 ( .IN1(n111), .IN2(n110), .Q(n112) );
  NOR4X0 U216 ( .IN1(n118), .IN2(n24), .IN3(n29), .IN4(
        \buffer/U1/U1/wrd_count[1] ), .QN(n113) );
  NOR2X0 U217 ( .IN1(full), .IN2(n113), .QN(n114) );
  NOR3X0 U218 ( .IN1(n114), .IN2(rst), .IN3(shift), .QN(\buffer/U1/U1/N44 ) );
  OR4X1 U219 ( .IN1(\buffer/U1/U1/N55 ), .IN2(\buffer/U1/U1/N44 ), .IN3(
        \buffer/U1/U1/N54 ), .IN4(\buffer/U1/U1/N56 ), .Q(\buffer/U1/U1/N40 )
         );
  OA21X1 U220 ( .IN1(n115), .IN2(n25), .IN3(n59), .Q(n124) );
  OA221X1 U221 ( .IN1(\buffer/rd_addr[2] ), .IN2(n123), .IN3(
        \buffer/rd_addr[2] ), .IN4(n116), .IN5(n124), .Q(\buffer/U1/U1/N53 )
         );
  OA21X1 U222 ( .IN1(n117), .IN2(\buffer/wr_addr[2] ), .IN3(n122), .Q(
        \buffer/U1/U1/N50 ) );
  OA221X1 U223 ( .IN1(n119), .IN2(\buffer/wr_addr[0] ), .IN3(n118), .IN4(n26), 
        .IN5(n122), .Q(\buffer/U1/U1/N48 ) );
endmodule


module router ( \N_ifc_o.clk , \N_ifc_o.rst , \N_ifc_o.enable , \N_ifc_o.data , 
        \N_ifc_o.credit , \N_ifc_i.clk , \N_ifc_i.rst , \N_ifc_i.enable , 
        \N_ifc_i.data , \N_ifc_i.credit , \S_ifc_o.clk , \S_ifc_o.rst , 
        \S_ifc_o.enable , \S_ifc_o.data , \S_ifc_o.credit , \S_ifc_i.clk , 
        \S_ifc_i.rst , \S_ifc_i.enable , \S_ifc_i.data , \S_ifc_i.credit , 
        \E_ifc_o.clk , \E_ifc_o.rst , \E_ifc_o.enable , \E_ifc_o.data , 
        \E_ifc_o.credit , \E_ifc_i.clk , \E_ifc_i.rst , \E_ifc_i.enable , 
        \E_ifc_i.data , \E_ifc_i.credit , \W_ifc_o.clk , \W_ifc_o.rst , 
        \W_ifc_o.enable , \W_ifc_o.data , \W_ifc_o.credit , \W_ifc_i.clk , 
        \W_ifc_i.rst , \W_ifc_i.enable , \W_ifc_i.data , \W_ifc_i.credit , 
        \L_ifc_o.clk , \L_ifc_o.rst , \L_ifc_o.enable , \L_ifc_o.data , 
        \L_ifc_o.credit , \L_ifc_i.clk , \L_ifc_i.rst , \L_ifc_i.enable , 
        \L_ifc_i.data , \L_ifc_i.credit , \control.clk , \control.rst  );
  inout [15:0] \N_ifc_o.data ;
  inout [15:0] \N_ifc_i.data ;
  inout [15:0] \S_ifc_o.data ;
  inout [15:0] \S_ifc_i.data ;
  inout [15:0] \E_ifc_o.data ;
  inout [15:0] \E_ifc_i.data ;
  inout [15:0] \W_ifc_o.data ;
  inout [15:0] \W_ifc_i.data ;
  inout [15:0] \L_ifc_o.data ;
  inout [15:0] \L_ifc_i.data ;
  input \N_ifc_o.clk , \N_ifc_i.clk , \S_ifc_o.clk , \S_ifc_i.clk ,
         \E_ifc_o.clk , \E_ifc_i.clk , \W_ifc_o.clk , \W_ifc_i.clk ,
         \L_ifc_o.clk , \L_ifc_i.clk , \control.clk , \control.rst ;
  inout \N_ifc_o.rst ,  \N_ifc_o.enable ,  \N_ifc_o.credit ,  \N_ifc_i.rst , 
     \N_ifc_i.enable ,  \N_ifc_i.credit ,  \S_ifc_o.rst ,  \S_ifc_o.enable , 
     \S_ifc_o.credit ,  \S_ifc_i.rst ,  \S_ifc_i.enable ,  \S_ifc_i.credit , 
     \E_ifc_o.rst ,  \E_ifc_o.enable ,  \E_ifc_o.credit ,  \E_ifc_i.rst , 
     \E_ifc_i.enable ,  \E_ifc_i.credit ,  \W_ifc_o.rst ,  \W_ifc_o.enable , 
     \W_ifc_o.credit ,  \W_ifc_i.rst ,  \W_ifc_i.enable ,  \W_ifc_i.credit , 
     \L_ifc_o.rst ,  \L_ifc_o.enable ,  \L_ifc_o.credit ,  \L_ifc_i.rst , 
     \L_ifc_i.enable ,  \L_ifc_i.credit ;
  wire   N_send_enable, N_full, S_rcvd_valid, L_rcvd_valid, n32, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179;
  wire   [15:0] N_send_data;
  wire   [15:0] S_rcvd_data;
  wire   [15:0] E_rcvd_data;
  wire   [15:0] W_send_data;
  wire   [15:0] L_send_data;
  wire   [4:0] N_turn;
  wire   [2:0] N_port_select;
  tri   \N_ifc_o.enable ;
  tri   [15:0] \N_ifc_o.data ;
  tri   \N_ifc_o.credit ;
  tri   \N_ifc_i.enable ;
  tri   [15:0] \N_ifc_i.data ;
  tri   \N_ifc_i.credit ;
  tri   \S_ifc_o.enable ;
  tri   [15:0] \S_ifc_o.data ;
  tri   \S_ifc_o.credit ;
  tri   \S_ifc_i.enable ;
  tri   [15:0] \S_ifc_i.data ;
  tri   \E_ifc_o.enable ;
  tri   [15:0] \E_ifc_o.data ;
  tri   \E_ifc_o.credit ;
  tri   \E_ifc_i.enable ;
  tri   [15:0] \E_ifc_i.data ;
  tri   \E_ifc_i.credit ;
  tri   \W_ifc_o.enable ;
  tri   [15:0] \W_ifc_o.data ;
  tri   \W_ifc_o.credit ;
  tri   \W_ifc_i.enable ;
  tri   [15:0] \W_ifc_i.data ;
  tri   \L_ifc_o.enable ;
  tri   [15:0] \L_ifc_o.data ;
  tri   \L_ifc_o.credit ;
  tri   \L_ifc_i.enable ;
  tri   [15:0] \L_ifc_i.data ;
  tri   N_rcvd_valid;
  tri   S_pop;
  tri   E_rcvd_valid;
  tri   W_rcvd_valid;
  tri   L_pop;
  assign \S_ifc_o.enable  = 1'b0;
  assign \S_ifc_o.data  [15] = 1'b0;
  assign \S_ifc_o.data  [14] = 1'b0;
  assign \S_ifc_o.data  [13] = 1'b0;
  assign \S_ifc_o.data  [12] = 1'b0;
  assign \S_ifc_o.data  [11] = 1'b0;
  assign \S_ifc_o.data  [10] = 1'b0;
  assign \S_ifc_o.data  [9] = 1'b0;
  assign \S_ifc_o.data  [8] = 1'b0;
  assign \S_ifc_o.data  [7] = 1'b0;
  assign \S_ifc_o.data  [6] = 1'b0;
  assign \S_ifc_o.data  [5] = 1'b0;
  assign \S_ifc_o.data  [4] = 1'b0;
  assign \S_ifc_o.data  [3] = 1'b0;
  assign \S_ifc_o.data  [2] = 1'b0;
  assign \S_ifc_o.data  [1] = 1'b0;
  assign \S_ifc_o.data  [0] = 1'b0;
  assign \E_ifc_o.enable  = 1'b0;
  assign \E_ifc_o.data  [15] = 1'b0;
  assign \E_ifc_o.data  [14] = 1'b0;
  assign \E_ifc_o.data  [13] = 1'b0;
  assign \E_ifc_o.data  [12] = 1'b0;
  assign \E_ifc_o.data  [11] = 1'b0;
  assign \E_ifc_o.data  [10] = 1'b0;
  assign \E_ifc_o.data  [9] = 1'b0;
  assign \E_ifc_o.data  [8] = 1'b0;
  assign \E_ifc_o.data  [7] = 1'b0;
  assign \E_ifc_o.data  [6] = 1'b0;
  assign \E_ifc_o.data  [5] = 1'b0;
  assign \E_ifc_o.data  [4] = 1'b0;
  assign \E_ifc_o.data  [3] = 1'b0;
  assign \E_ifc_o.data  [2] = 1'b0;
  assign \E_ifc_o.data  [1] = 1'b0;
  assign \E_ifc_o.data  [0] = 1'b0;
  assign \W_ifc_o.enable  = 1'b0;
  assign \W_ifc_o.data  [15] = 1'b0;
  assign \W_ifc_o.data  [14] = 1'b0;
  assign \W_ifc_o.data  [13] = 1'b0;
  assign \W_ifc_o.data  [12] = 1'b0;
  assign \W_ifc_o.data  [11] = 1'b0;
  assign \W_ifc_o.data  [10] = 1'b0;
  assign \W_ifc_o.data  [9] = 1'b0;
  assign \W_ifc_o.data  [8] = 1'b0;
  assign \W_ifc_o.data  [7] = 1'b0;
  assign \W_ifc_o.data  [6] = 1'b0;
  assign \W_ifc_o.data  [5] = 1'b0;
  assign \W_ifc_o.data  [4] = 1'b0;
  assign \W_ifc_o.data  [3] = 1'b0;
  assign \W_ifc_o.data  [2] = 1'b0;
  assign \W_ifc_o.data  [1] = 1'b0;
  assign \W_ifc_o.data  [0] = 1'b0;
  assign \L_ifc_o.enable  = 1'b0;
  assign \L_ifc_o.data  [15] = 1'b0;
  assign \L_ifc_o.data  [14] = 1'b0;
  assign \L_ifc_o.data  [13] = 1'b0;
  assign \L_ifc_o.data  [12] = 1'b0;
  assign \L_ifc_o.data  [11] = 1'b0;
  assign \L_ifc_o.data  [10] = 1'b0;
  assign \L_ifc_o.data  [9] = 1'b0;
  assign \L_ifc_o.data  [8] = 1'b0;
  assign \L_ifc_o.data  [7] = 1'b0;
  assign \L_ifc_o.data  [6] = 1'b0;
  assign \L_ifc_o.data  [5] = 1'b0;
  assign \L_ifc_o.data  [4] = 1'b0;
  assign \L_ifc_o.data  [3] = 1'b0;
  assign \L_ifc_o.data  [2] = 1'b0;
  assign \L_ifc_o.data  [1] = 1'b0;
  assign \L_ifc_o.data  [0] = 1'b0;

  inputPort_4 nInPort ( .clk(\control.clk ), .rst(\control.rst ), .data_i({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0}), .write_en(\N_ifc_i.enable ), .shift(1'b0), 
        .read_valid_o(N_rcvd_valid) );
  outputPort_4 nOutPort ( .clk(\control.clk ), .rst(\control.rst ), .data_i(
        N_send_data), .port_en(N_send_enable), .inc_credit_i(\N_ifc_o.credit ), 
        .data_o(\N_ifc_o.data ), .send_data(\N_ifc_o.enable ), .full(N_full)
         );
  inputPort_3 sInPort ( .clk(\control.clk ), .rst(\control.rst ), .data_i(
        \S_ifc_i.data ), .write_en(\S_ifc_i.enable ), .shift(S_pop), .data_o(
        S_rcvd_data), .read_valid_o(S_rcvd_valid) );
  inputPort_2 eInPort ( .clk(\control.clk ), .rst(\control.rst ), .data_i(
        \E_ifc_i.data ), .write_en(\E_ifc_i.enable ), .shift(1'b0), .data_o(
        E_rcvd_data), .read_valid_o(E_rcvd_valid) );
  inputPort_1 wInPort ( .clk(\control.clk ), .rst(\control.rst ), .data_i(
        \W_ifc_i.data ), .write_en(\W_ifc_i.enable ), .shift(1'b0), .data_o(
        L_send_data), .read_valid_o(W_rcvd_valid) );
  inputPort_0 lInPort ( .clk(\control.clk ), .rst(\control.rst ), .data_i(
        \L_ifc_i.data ), .write_en(\L_ifc_i.enable ), .shift(L_pop), .data_o(
        W_send_data), .read_valid_o(L_rcvd_valid) );
  routeLogic_XCOORD1111_YCOORD1111_NORTH1_SOUTH1_EAST1_WEST1 route ( 
        .N_data_i({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .S_data_i({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .E_data_i({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .W_data_i({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .L_data_i({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .N_valid_i(N_rcvd_valid), .S_valid_i(S_rcvd_valid), .E_valid_i(
        E_rcvd_valid), .W_valid_i(W_rcvd_valid), .L_valid_i(L_rcvd_valid), 
        .N_port_full(N_full), .S_port_full(1'b0), .E_port_full(1'b0), 
        .W_port_full(1'b0), .L_port_full(1'b0), .N_turn({1'b0, N_turn[3:0]}), 
        .S_turn({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .E_turn({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .W_turn({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .L_turn({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0}), .N_port_select(N_port_select), 
        .S_port_remove(S_pop), .L_port_remove(L_pop), .N_port_enable(
        N_send_enable), .N_credit_inc(\N_ifc_i.credit ), .S_credit_inc(
        \S_ifc_o.credit ), .E_credit_inc(\E_ifc_i.credit ), .W_credit_inc(
        \W_ifc_o.credit ), .L_credit_inc(\L_ifc_o.credit ) );
  DFFSSRX1 \arb/NTurn_reg[3]  ( .D(n124), .RSTB(n32), .SETB(1'b1), .CLK(
        \control.clk ), .QN(N_turn[3]) );
  DFFSSRX1 \arb/NTurn_reg[2]  ( .D(N_turn[3]), .RSTB(n124), .SETB(1'b1), .CLK(
        \control.clk ), .Q(N_turn[2]) );
  DFFSSRX1 \arb/NTurn_reg[1]  ( .D(N_turn[2]), .RSTB(n124), .SETB(1'b1), .CLK(
        \control.clk ), .Q(N_turn[1]) );
  DFFSSRX1 \arb/NTurn_reg[0]  ( .D(N_turn[1]), .RSTB(n124), .SETB(1'b1), .CLK(
        \control.clk ), .Q(N_turn[0]) );
  NOR2X0 U196 ( .IN1(N_port_select[0]), .IN2(N_send_enable), .QN(n175) );
  NAND2X1 U197 ( .IN1(n175), .IN2(E_rcvd_data[0]), .QN(n126) );
  NAND2X1 U198 ( .IN1(n173), .IN2(S_rcvd_data[0]), .QN(n128) );
  NAND2X1 U199 ( .IN1(n174), .IN2(L_send_data[0]), .QN(n127) );
  NAND2X1 U200 ( .IN1(n175), .IN2(E_rcvd_data[1]), .QN(n142) );
  NAND2X1 U201 ( .IN1(n173), .IN2(S_rcvd_data[1]), .QN(n144) );
  NAND2X1 U202 ( .IN1(n174), .IN2(L_send_data[1]), .QN(n143) );
  NAND2X1 U203 ( .IN1(N_port_select[2]), .IN2(W_send_data[1]), .QN(n141) );
  NAND2X1 U204 ( .IN1(n175), .IN2(E_rcvd_data[2]), .QN(n146) );
  NAND2X1 U205 ( .IN1(n173), .IN2(S_rcvd_data[2]), .QN(n148) );
  NAND2X1 U206 ( .IN1(n174), .IN2(L_send_data[2]), .QN(n147) );
  NAND2X1 U207 ( .IN1(N_port_select[2]), .IN2(W_send_data[2]), .QN(n145) );
  NAND2X1 U208 ( .IN1(n175), .IN2(E_rcvd_data[3]), .QN(n150) );
  NAND2X1 U209 ( .IN1(n173), .IN2(S_rcvd_data[3]), .QN(n152) );
  NAND2X1 U210 ( .IN1(n174), .IN2(L_send_data[3]), .QN(n151) );
  NAND2X1 U211 ( .IN1(n175), .IN2(E_rcvd_data[4]), .QN(n154) );
  NAND2X1 U212 ( .IN1(n173), .IN2(S_rcvd_data[4]), .QN(n156) );
  NAND2X1 U213 ( .IN1(n174), .IN2(L_send_data[4]), .QN(n155) );
  NAND2X1 U214 ( .IN1(n175), .IN2(E_rcvd_data[5]), .QN(n158) );
  NAND2X1 U215 ( .IN1(n173), .IN2(S_rcvd_data[5]), .QN(n160) );
  NAND2X1 U216 ( .IN1(n174), .IN2(L_send_data[5]), .QN(n159) );
  NAND2X1 U217 ( .IN1(n175), .IN2(E_rcvd_data[6]), .QN(n162) );
  NAND2X1 U218 ( .IN1(n173), .IN2(S_rcvd_data[6]), .QN(n164) );
  NAND2X1 U219 ( .IN1(n174), .IN2(L_send_data[6]), .QN(n163) );
  NAND2X1 U220 ( .IN1(n175), .IN2(E_rcvd_data[7]), .QN(n166) );
  NAND2X1 U221 ( .IN1(n173), .IN2(S_rcvd_data[7]), .QN(n168) );
  NAND2X1 U222 ( .IN1(n174), .IN2(L_send_data[7]), .QN(n167) );
  NAND2X1 U223 ( .IN1(n175), .IN2(E_rcvd_data[8]), .QN(n170) );
  NAND2X1 U224 ( .IN1(n173), .IN2(S_rcvd_data[8]), .QN(n172) );
  NAND2X1 U225 ( .IN1(n174), .IN2(L_send_data[8]), .QN(n171) );
  NAND2X1 U226 ( .IN1(n175), .IN2(E_rcvd_data[9]), .QN(n177) );
  NAND2X1 U227 ( .IN1(n173), .IN2(S_rcvd_data[9]), .QN(n179) );
  NAND2X1 U228 ( .IN1(n174), .IN2(L_send_data[9]), .QN(n178) );
  NAND2X1 U229 ( .IN1(n175), .IN2(E_rcvd_data[10]), .QN(n130) );
  NAND2X1 U230 ( .IN1(n173), .IN2(S_rcvd_data[10]), .QN(n132) );
  NAND2X1 U231 ( .IN1(n174), .IN2(L_send_data[10]), .QN(n131) );
  NAND2X1 U232 ( .IN1(n175), .IN2(E_rcvd_data[11]), .QN(n134) );
  NAND2X1 U233 ( .IN1(n173), .IN2(S_rcvd_data[11]), .QN(n136) );
  NAND2X1 U234 ( .IN1(n174), .IN2(L_send_data[11]), .QN(n135) );
  NAND2X1 U235 ( .IN1(n175), .IN2(E_rcvd_data[12]), .QN(n138) );
  NAND2X1 U236 ( .IN1(n173), .IN2(S_rcvd_data[12]), .QN(n140) );
  NAND2X1 U237 ( .IN1(n174), .IN2(L_send_data[12]), .QN(n139) );
  NAND2X1 U238 ( .IN1(N_port_select[2]), .IN2(W_send_data[12]), .QN(n137) );
  INVX0 U239 ( .INP(\control.rst ), .ZN(n124) );
  NAND2X0 U240 ( .IN1(n175), .IN2(E_rcvd_data[13]), .QN(n109) );
  NAND2X0 U241 ( .IN1(N_port_select[2]), .IN2(W_send_data[13]), .QN(n110) );
  NAND2X0 U242 ( .IN1(n173), .IN2(S_rcvd_data[13]), .QN(n111) );
  NAND2X0 U243 ( .IN1(n174), .IN2(L_send_data[13]), .QN(n112) );
  NAND4X0 U244 ( .IN1(n109), .IN2(n110), .IN3(n111), .IN4(n112), .QN(
        N_send_data[13]) );
  NAND2X0 U245 ( .IN1(n175), .IN2(E_rcvd_data[14]), .QN(n113) );
  NAND2X0 U246 ( .IN1(N_port_select[2]), .IN2(W_send_data[14]), .QN(n114) );
  NAND2X0 U247 ( .IN1(n173), .IN2(S_rcvd_data[14]), .QN(n115) );
  NAND2X0 U248 ( .IN1(n174), .IN2(L_send_data[14]), .QN(n116) );
  NAND4X0 U249 ( .IN1(n113), .IN2(n114), .IN3(n115), .IN4(n116), .QN(
        N_send_data[14]) );
  NAND2X0 U250 ( .IN1(n175), .IN2(E_rcvd_data[15]), .QN(n117) );
  NAND2X0 U251 ( .IN1(N_port_select[2]), .IN2(W_send_data[15]), .QN(n118) );
  NAND2X0 U252 ( .IN1(n173), .IN2(S_rcvd_data[15]), .QN(n119) );
  NAND2X0 U253 ( .IN1(n174), .IN2(L_send_data[15]), .QN(n120) );
  NAND4X0 U254 ( .IN1(n117), .IN2(n118), .IN3(n119), .IN4(n120), .QN(
        N_send_data[15]) );
  NAND2X1 U255 ( .IN1(N_port_select[2]), .IN2(W_send_data[11]), .QN(n133) );
  NAND2X1 U256 ( .IN1(N_port_select[2]), .IN2(W_send_data[10]), .QN(n129) );
  NAND2X1 U257 ( .IN1(N_port_select[2]), .IN2(W_send_data[9]), .QN(n176) );
  NAND2X1 U258 ( .IN1(N_port_select[2]), .IN2(W_send_data[8]), .QN(n169) );
  NAND2X1 U259 ( .IN1(N_port_select[2]), .IN2(W_send_data[7]), .QN(n165) );
  NAND2X1 U260 ( .IN1(N_port_select[2]), .IN2(W_send_data[6]), .QN(n161) );
  NAND2X1 U261 ( .IN1(N_port_select[2]), .IN2(W_send_data[5]), .QN(n157) );
  NAND2X1 U262 ( .IN1(N_port_select[2]), .IN2(W_send_data[4]), .QN(n153) );
  NAND2X1 U263 ( .IN1(N_port_select[2]), .IN2(W_send_data[3]), .QN(n149) );
  NAND2X1 U264 ( .IN1(N_port_select[2]), .IN2(W_send_data[0]), .QN(n125) );
  AND2X1 U265 ( .IN1(N_port_select[1]), .IN2(N_port_select[0]), .Q(n174) );
  AND2X1 U266 ( .IN1(N_send_enable), .IN2(N_port_select[0]), .Q(n173) );
  NAND4X0 U271 ( .IN1(n128), .IN2(n127), .IN3(n126), .IN4(n125), .QN(
        N_send_data[0]) );
  NAND4X0 U272 ( .IN1(n132), .IN2(n131), .IN3(n130), .IN4(n129), .QN(
        N_send_data[10]) );
  NAND4X0 U273 ( .IN1(n136), .IN2(n135), .IN3(n134), .IN4(n133), .QN(
        N_send_data[11]) );
  NAND4X0 U274 ( .IN1(n140), .IN2(n139), .IN3(n138), .IN4(n137), .QN(
        N_send_data[12]) );
  NAND4X0 U275 ( .IN1(n144), .IN2(n143), .IN3(n142), .IN4(n141), .QN(
        N_send_data[1]) );
  NAND4X0 U276 ( .IN1(n148), .IN2(n147), .IN3(n146), .IN4(n145), .QN(
        N_send_data[2]) );
  NAND4X0 U277 ( .IN1(n152), .IN2(n151), .IN3(n150), .IN4(n149), .QN(
        N_send_data[3]) );
  NAND4X0 U278 ( .IN1(n156), .IN2(n155), .IN3(n154), .IN4(n153), .QN(
        N_send_data[4]) );
  NAND4X0 U279 ( .IN1(n160), .IN2(n159), .IN3(n158), .IN4(n157), .QN(
        N_send_data[5]) );
  NAND4X0 U280 ( .IN1(n164), .IN2(n163), .IN3(n162), .IN4(n161), .QN(
        N_send_data[6]) );
  NAND4X0 U281 ( .IN1(n168), .IN2(n167), .IN3(n166), .IN4(n165), .QN(
        N_send_data[7]) );
  NAND4X0 U282 ( .IN1(n172), .IN2(n171), .IN3(n170), .IN4(n169), .QN(
        N_send_data[8]) );
  NAND4X0 U283 ( .IN1(n179), .IN2(n178), .IN3(n177), .IN4(n176), .QN(
        N_send_data[9]) );
  OR3X1 U284 ( .IN1(N_turn[2]), .IN2(N_turn[1]), .IN3(N_turn[3]), .Q(n32) );
endmodule

