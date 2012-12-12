module outputPort(
	input clk,
	input rst,
	input [15:0] data_in,
	input port_en,
	input inc_credit_i,
	output [15:0] data_o,
	output send_data
);

//how to declare buffer from designware?
reg [3:0] count;

always_comb begin
	if (rst) begin
		count <= 101;
		buffer.rst_n = 0;
	end else
		buffer.rst_n = 1;

	data_o = buffer.data_out;
	full = buffer.full;

	if (inc_credit_i) coun <= count + 1;
	assert(count >= 0 && count <= 5);

	if (write_en && !buffer.full) begin
		buffer.data_in = data_i;
		buffer.push_req_n = 0;
	end else
		buffer.push_req_n = 1;
	

	if (!buffer.empty && count != 0) begin
		buffer.pop_req_n = 0;
		send_data = 1;
		count <= count - 1;
	end else begin
		buffer.pop_req_n = 1;
		send_data = 0;
	end

	assert(!buffer.error);
end

endmodule