interface ifc_a(input bit clk);
  	//control
  	logic rst;

	logic enable;
	logic [15:0] data;
	logic credit;
  	
	clocking cb @(negedge clk);
		output rst;
  	endclocking

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
	
	modport bench (clocking cb);

endinterface
