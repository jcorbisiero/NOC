/*
 * Interface used to communicate between routers
 *
 * Authors: Ilan, Nina, Joe, Mitchell
 * Date: 12/20/12
 *
 */

interface ifc(input bit clk);
   //control
   logic rst;

   logic enable;
   logic [15:0] data;
   logic 	credit;

/*   
   clocking cb_s @(posedge clk);
      output 	posedge rst;

      output 	posedge enable;
      output 	posedge data;
      input 	posedge credit;
   endclocking
   
   clocking cb_r @(posedge clk);
      output 	posedge rst;

      input 	posedge enable;
      input 	posedge data;
      output 	posedge credit;
   endclocking
*/

   modport send (  		
		output enable,
		output data,
		input  credit
		);

   modport receive (
		    input  enable,
		    input  data,
		    output credit
		    );
   
   
   modport control (
		    input clk,
		    input rst
		    );
   
  // modport bench (clocking cb_s, clocking cb_r);

endinterface
