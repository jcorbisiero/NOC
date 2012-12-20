/* 
 * Routing Logic: Determines which output port a packet 
 * will be directed to.
 * 
 * Authors: Joseph Corbisiero, Nina Berg
 * Date : 12/20/12
 * 
 */

module routeLogic #(parameter XCOORD = 1111, parameter YCOORD = 1111,
		    NORTH = 0, SOUTH = 0, EAST = 0, WEST = 0)
   (
    input [7:0]      N_data_i, 
    input [7:0]      S_data_i, 
    input [7:0]      E_data_i,
    input [7:0]      W_data_i,
    input [7:0]      L_data_i,

    input 	     N_valid_i,
    input 	     S_valid_i,
    input 	     E_valid_i,
    input 	     W_valid_i,
    input 	     L_valid_i,

    input 	     N_port_full,
    input 	     S_port_full,
    input 	     E_port_full,
    input 	     W_port_full,
    input 	     L_port_full,

    input [4:0]      N_turn,
    input [4:0]      S_turn,
    input [4:0]      E_turn,
    input [4:0]      W_turn,
    input [4:0]      L_turn,

    output reg [2:0] N_port_select, 
    output reg [2:0] S_port_select, 
    output reg [2:0] E_port_select, 
    output reg [2:0] W_port_select, 
    output reg [2:0] L_port_select, 

    output reg 	     N_port_remove, 
    output reg 	     S_port_remove,
    output reg 	     E_port_remove,
    output reg 	     W_port_remove,
    output reg 	     L_port_remove,

    output reg 	     N_port_enable, 
    output reg 	     S_port_enable,
    output reg 	     E_port_enable,
    output reg 	     W_port_enable,
    output reg 	     L_port_enable,

    output reg 	     N_credit_inc,
    output reg 	     S_credit_inc,
    output reg 	     E_credit_inc,
    output reg 	     W_credit_inc,
    output reg 	     L_credit_inc
    );


   always_comb begin

      N_port_enable = 0;
      S_port_enable = 0;
      E_port_enable = 0;
      W_port_enable = 0;
      L_port_enable = 0;

      N_port_remove = 0;
      S_port_remove = 0;
      E_port_remove = 0;
      W_port_remove = 0;
      L_port_remove = 0;

      N_port_select = '1;
      S_port_select = '1;
      E_port_select = '1;
      W_port_select = '1;
      L_port_select = '1;

      N_credit_inc = 0;
      S_credit_inc = 0;
      E_credit_inc = 0;
      W_credit_inc = 0;
      L_credit_inc = 0;

      if(N_valid_i) begin
	 assert(NORTH);

	 //assert(OneHot(N_data_i[3:0]));
	 //assert(OneHot(N_data_i[7:4]));
	 
	 if (N_data_i[3:0] > YCOORD) begin
	    if (!S_port_full && (S_turn == 5'b10000)) begin
	       assert(SOUTH);
	       S_port_select = 3'b000;
	       N_port_remove = 1;
	       S_port_enable = 1;
	       N_credit_inc = 1;
	    end

	 end else if(N_data_i[3:0] < YCOORD) begin
	    /* Attempting to send north - drop packet */ 
	    N_port_remove = 1;
	    N_credit_inc = 1;
	 end

	 else begin
	    if (N_data_i[7:4] > XCOORD) begin
	       assert(EAST);
	       if (!E_port_full && (E_turn == 5'b10000)) begin
		  E_port_select = 3'b000;
		  N_port_remove = 1;
		  E_port_enable = 1;
		  N_credit_inc = 1;
	       end

	    end else if (N_data_i[7:4] < XCOORD) begin
	       assert(WEST);
	       if (!W_port_full && (W_turn == 5'b10000)) begin
		  W_port_select = 3'b000;
		  N_port_remove = 1; 
		  W_port_enable = 1;
		  N_credit_inc = 1;
	       end

	    end else if (!L_port_full && (L_turn == 5'b10000)) begin
	       L_port_select = 3'b000;
	       N_port_remove = 1;
	       L_port_enable = 1;
	       N_credit_inc = 1;
	    end
	 end
      end

      if(S_valid_i) begin
	 assert(SOUTH);
	 //assert(OneHot(S_data_i[3:0]));
	 //assert(OneHot(S_data_i[7:4]));

	 if (S_data_i[3:0] < YCOORD) begin
	    assert(NORTH);
	    if (!N_port_full && (N_turn == 5'b01000)) begin	
	       N_port_select = 3'b001;
	       S_port_remove = 1;
	       N_port_enable = 1;
	       S_credit_inc = 1;
	    end
	 end
 
	 else if (S_data_i[3:0] > YCOORD) begin
	    /* Attempting to send south - drop packet */
	    S_port_remove = 1;
	    S_credit_inc = 1;

	 end else begin
	    if (S_data_i[7:4] > XCOORD) begin
	       assert(EAST);
	       if (!E_port_full && (E_turn == 5'b01000)) begin
		  E_port_select = 3'b001;
		  S_port_remove = 1;
		  E_port_enable = 1;
		  S_credit_inc = 1;
	       end

	    end else if (S_data_i[7:4] < XCOORD) begin
	       assert(WEST);
	       if (!W_port_full && (W_turn == 5'b01000)) begin
		  W_port_select = 3'b001;
		  S_port_remove = 1;
		  W_port_enable = 1;
		  S_credit_inc = 1;
	       end

	    end else if (!L_port_full && (L_turn == 5'b01000)) begin
	       L_port_select = 001;
	       S_port_remove = 1;
	       L_port_enable = 1;
	       S_credit_inc = 1;
	    end 
	 end
      end

      if(E_valid_i) begin
	 assert(EAST);
	 //assert(OneHot(E_data_i[3:0]));
	 //assert(OneHot(E_data_i[7:4]));

	 if (E_data_i[7:4] < XCOORD && E_data_i[3:0] == YCOORD) begin
	    assert(WEST);
	    if (!W_port_full && (W_turn == 5'b00100)) begin
	       W_port_select = 3'b010;
	       E_port_remove = 1;
	       W_port_enable = 1;
	       E_credit_inc = 1;
	    end

	 end else if (E_data_i[7:4] == XCOORD 
			&& E_data_i[3:0] == YCOORD) begin
	    if(!L_port_full && (L_turn == 5'b00100)) begin
	       L_port_select = 010;
	       E_port_remove = 1;
	       L_port_enable = 1;
	       E_credit_inc = 1;
	    end
	 end else begin
	    /* Attempting to send data east - drop packet */
	    E_port_remove = 1;
	    E_credit_inc = 1;
	 end
      end

      if(W_valid_i) begin
	 assert(WEST);
	 //assert(OneHot(W_data_i[3:0]));
	 //assert(OneHot(W_data_i[7:4]));

	 if (W_data_i[7:4] > XCOORD && W_data_i[3:0] == YCOORD) begin
	    assert(EAST);
	    if ((!E_port_full) && (E_turn == 5'b00010)) begin
	       E_port_select = 011;
	       W_port_remove = 1;
	       E_port_enable = 1;
	       W_credit_inc = 1;
	    end
	 end

	 else if (W_data_i[7:4] == XCOORD && W_data_i[3:0] == YCOORD) begin
	    if(!L_port_full && (L_turn == 5'b00010)) begin
	       L_port_select = 011;
	       W_port_remove = 1;
	       L_port_enable = 1;
	       W_credit_inc = 1;
	    end

	 end else begin
	    /* Attempting to send packet west - drop packet */
	    W_port_remove = 1;
	    W_credit_inc = 1;
	 end
      end


      if(L_valid_i) begin
	 //assert(OneHot(L_data_i[3:0]));
	 //assert(OneHot(L_data_i[7:4]));

	 if (L_data_i[3:0] > YCOORD) begin
	    assert(SOUTH);
	    if (!S_port_full && (S_turn == 5'b00001)) begin
	       S_port_select = 3'b100;
	       L_port_remove = 1;
	       S_port_enable = 1;
	       L_credit_inc = 1;
	    end

	 end else if (L_data_i[3:0] < YCOORD) begin
	    assert(NORTH);
	    if (!N_port_full && (N_turn == 5'b00001)) begin
	       N_port_select = 3'b100;
	       L_port_remove = 1;
	       N_port_enable = 1;
	       L_credit_inc = 1;
	    end

	 end else begin
	    if (L_data_i[7:4] > XCOORD) begin
	       assert(EAST);
	       if (!E_port_full && (E_turn == 5'b00001)) begin
		  E_port_select = 3'b100;
		  L_port_remove = 1;
		  E_port_enable = 1;
		  L_credit_inc = 1;
	       end

	    end else if (L_data_i[7:4] < XCOORD) begin
	       assert(WEST);
	       if (!W_port_full && (W_turn == 5'b00001)) begin
		  W_port_select = 3'b100;
		  L_port_remove = 1;
		  W_port_enable = 1;
		  L_credit_inc = 1;
	       end

	    end else begin
	       /* Attempting to send packet on local - drop packet */
	       L_port_remove = 1;
	       L_credit_inc = 1;
	    end
	 end
      end

   end

endmodule
