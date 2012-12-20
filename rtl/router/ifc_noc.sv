interface ifc(input bit clk);
  	//control
  	logic rst;

	logic enable;
	logic [15:0] data;
	logic credit;
  	
	/*clocking cb_s @(negedge clk);
		output posedge rst;

		output posedge enable;
		output posedge data;
		input posedge credit;
  	endclocking
  	
  	clocking cb_r @(negedge clk);
		output posedge rst;

		input negedge enable;
		input negedge data;
		output negedge credit;
  	endclocking*/

  	modport send (  		
		output enable,
		output data,
		input credit
	);

	modport receive (
		input enable,
		input data,
		output credit
	);
	
	
	modport control (
		input clk,
		input rst
	);
	
	//modport bench (clocking cb_s, clocking cb_r);

endinterface
