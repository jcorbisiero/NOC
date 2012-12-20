/* 
 * Output port of a router
 * 
 * Authors: Joseph Corbisiero, Nina Berg
 * Date: 12/20/12
 *
 */

module outputPort(
	  input 	clk,
	  input 	rst,

	  input [15:0] 	data_i,
	  input 	port_en,
	  input 	inc_credit_i,

	  output [15:0] data_o,
	  output logic 	send_data,
	  output reg 	full
	  );

   reg [2:0]	count;

   reg 		rst_n;
   reg 		push_n;
   reg 		pop_n;
   reg 		empty;

   DW_fifo_s1_sf #(.width(16), .depth(5), .rst_mode(1)) buffer2(
				.clk, .rst_n,
				.push_req_n(push_n), .pop_req_n(pop_n),
				.data_in(data_i),
				.empty, .full,
				.data_out(data_o),
				.error(),
				.diag_n('1), .almost_empty(), 
				.half_full(), .almost_full()
				);
   
   always_comb begin

      if (port_en && !full) begin
	 push_n = 0;
      end else begin
	 push_n = 1;
      end

      if (!empty && count != 0) begin
	 pop_n = 0;
	 send_data = 1;
      end else begin
	 pop_n = 1;
	 send_data = 0;
      end

   end 


   always_ff @(posedge clk) begin

      if (rst) begin
	 count = 3'b101;
	 rst_n = 0;
      end else begin
	 rst_n = 1;
      end

      if (inc_credit_i) begin
	 /* We shouldnt need this check, but just in case */
	 if (count == 5) count = 5;
	 else count = count + 1;
	 assert(count >= 0 && count <= 5);
      end 

      if (!empty && count != 0) begin
	 if (count == 0) count = 0;
	 else count = count - 1;
	 assert(count >= 0 && count <= 5);
      end
      
   end

endmodule
