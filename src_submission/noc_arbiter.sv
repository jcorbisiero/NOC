/* 
 * Arbiter Module: Decides which input port is allowed to use 
 * which output port each cycle
 *	
 * Authors: Joseph Corbisiero, Nina Berg
 * Date: 12/20/12
 *
 */

module arbiter(
	       input 	    clk,
	       input 	    rst,

	       output [4:0] N_turn_o,
	       output [4:0] S_turn_o,
	       output [4:0] E_turn_o,
	       output [4:0] W_turn_o,
	       output [4:0] L_turn_o
	       );

   reg [4:0] 		    NTurn;
   reg [4:0] 		    STurn;
   reg [4:0] 		    ETurn;
   reg [4:0] 		    WTurn;
   reg [4:0] 		    LTurn;


   assign N_turn_o = NTurn;
   assign S_turn_o = STurn;
   assign E_turn_o = ETurn;
   assign W_turn_o = WTurn;
   assign L_turn_o = LTurn;
   


   always_ff @(posedge clk) begin
      if (rst) begin

	 /* Initialize turn registers 
	  * Any changes here require an update to the bench
	  */

	 NTurn <= 5'b01000;
	 STurn <= 5'b00100;
	 ETurn <= 5'b00010;
	 WTurn <= 5'b00001;
	 LTurn <= 5'b10000;	

      end else begin
	 NTurn <= NTurn >> 1;
	 if (NTurn >> 1== 5'b00000) NTurn <= 5'b01000;

	 STurn <= STurn >> 1;
	 if (STurn >> 1== 5'b01000) STurn <= STurn >> 2;
	 else if (STurn >> 1== 5'b00000) STurn <= 5'b10000;

	 ETurn <= ETurn >> 1;
	 if (ETurn >> 1== 5'b00100) ETurn <= ETurn >> 2;
	 else if (ETurn >> 1== 5'b00000) ETurn <= 5'b10000;

	 WTurn <= WTurn >> 1;
	 if (WTurn >> 1== 5'b00010) WTurn <= WTurn >> 2;
	 else if (WTurn >> 1== 5'b00000) WTurn <= 5'b10000;

	 LTurn <= LTurn >> 1;
	 if (LTurn >> 1== 5'b00001) LTurn <= 5'b10000;
      end
   end

endmodule
