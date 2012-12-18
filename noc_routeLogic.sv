module routeLogic #(parameter XCOORD = 1111, parameter YCOORD = 1111)
(
	input [7:0] N_data_i, 
	input [7:0] S_data_i, 
	input [7:0] E_data_i,
	input [7:0] W_data_i,
	input [7:0] L_data_i,

	input N_valid_i,
	input S_valid_i,
	input E_valid_i,
	input W_valid_i,
	input L_valid_i,

	input N_port_full,
	input S_port_full,
	input E_port_full,
	input W_port_full,
	input L_port_full,

	input [4:0] N_turn,
	input [4:0] S_turn,
	input [4:0] E_turn,
	input [4:0] W_turn,
	input [4:0] L_turn,

	output reg [2:0] N_port_select, 
	output reg [2:0] S_port_select, 
	output reg [2:0] E_port_select, 
	output reg [2:0] W_port_select, 
	output reg [2:0] L_port_select, 

	output reg N_port_remove,	
	output reg S_port_remove,
	output reg E_port_remove,
	output reg W_port_remove,
	output reg L_port_remove,

	output reg N_port_enable,	
	output reg S_port_enable,
	output reg E_port_enable,
	output reg W_port_enable,
	output reg L_port_enable,

	output reg N_credit_inc,
	output reg S_credit_inc,
	output reg E_credit_inc,
	output reg W_credit_inc,
	output reg L_credit_inc
);

//reg [3:0] XCoord;
//reg [3:0] YCoord;

always_comb begin

$display("----- Routing Logic -------");
$display(" %d %d %d %d ", N_valid_i, S_valid_i,E_valid_i, W_valid_i, L_valid_i);
$display("L_port_remove: %d", L_port_remove);

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

	if(N_valid_i) begin
		//assert(OneHot(N_data_i[3:0]));
		//assert(OneHot(N_data_i[7:4]));
		
		//assert(!(N_data_i[3:0] < YCOORD));
	       $display("Ndata x: %b", N_data_i[7:4]);
	       $display("Ndata y: %b", N_data_i[3:0]);

		$display("South port enable: %d", S_port_enable);
		$display("Local port enable: %d", L_port_enable);

		if (N_data_i[3:0] > YCOORD) begin
			$display("N Attempting south %d %d %d %b", N_data_i[3:0], YCOORD, S_port_full, S_turn);
			if (!S_port_full && (S_turn == 5'b10000)) begin
				S_port_select = 3'b000;
				N_port_remove = 1;
				S_port_enable = 1;
				N_credit_inc = 1;
			end

		end else if(N_data_i[3:0] < YCOORD) begin 
			$display("Dropping packet sent to North");
			N_port_remove = 1;
			N_credit_inc = 1;
		end
		else begin
			if (N_data_i[7:4] > XCOORD) begin
				$display("Attempting East %d ", N_data_i[3:0]);
				if (!E_port_full && (E_turn == 5'b10000)) begin
					$display("N IN EAST -- N TURN %d ", N_data_i[3:0]);
					E_port_select = 3'b000;
					N_port_remove = 1;
					E_port_enable = 1;
					N_credit_inc = 1;
				end
			end else if (N_data_i[7:4] < XCOORD) begin
				$display("N Attempting West %d ", N_data_i[3:0]);
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
		//assert(OneHot(S_data_i[3:0]));
		//assert(OneHot(S_data_i[7:4]));

		//assert(!(S_data_i[3:0] > YCOORD));
 		$display("Sdata x: %b", S_data_i[7:4]);
	       $display("Sdata y: %b", S_data_i[3:0]);

		if (S_data_i[3:0] < YCOORD) begin
			if (!N_port_full && (N_turn == 5'b01000)) begin	
				N_port_select = 3'b001;
				S_port_remove = 1;
				N_port_enable = 1;
				S_credit_inc = 1;
			end
		end 
		/* Added this in for the situation where if you are at 1,1 and want to send to 4,4
		 * We can only go North/South first, then East/West
		 * Here S_data_i's ycoord will be 4 and YCOORD will be 1 so the above if fails	
		 * However, in the big else block below this if...else, S_data_i's xcoord will
		 * be greater than XCOORD and so will attempt to send East but this will violate
		 * the direction we are sending a packet because we must send South first
		 * So the data packet will be dropped
		 */
		else if (S_data_i[3:0] > YCOORD) begin
			$display("Dropping packet sent to South");
			S_port_remove = 1;
			S_credit_inc = 1;
		end else begin
			if (S_data_i[7:4] > XCOORD) begin
				if (!E_port_full && (E_turn == 5'b01000)) begin
					E_port_select = 3'b001;
					S_port_remove = 1;
					E_port_enable = 1;
					S_credit_inc = 1;
				end
			end else if (S_data_i[7:4] < XCOORD) begin
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
		//assert(OneHot(E_data_i[3:0]));
		//assert(OneHot(E_data_i[7:4]));

		//assert(E_data_i[3:0] == YCOORD);
		//assert(!(E_data_i[7:4] > XCOORD));
 		$display("Edata x: %b", E_data_i[7:4]);
	       $display("Edata y: %b", E_data_i[3:0]);

		if (E_data_i[7:4] < XCOORD) begin
			if (!W_port_full && (W_turn == 5'b00100)) begin
				W_port_select = 3'b010;
				E_port_remove = 1;
				W_port_enable = 1;
				E_credit_inc = 1;
			end
		end else if (!L_port_full && (L_turn == 5'b00100) && E_data_i[7:4] == XCOORD) begin
			L_port_select = 010;
			E_port_remove = 1;
			L_port_enable = 1;
			E_credit_inc = 1;
		end else begin
			$display("Dropping packet sent to East");
			E_port_remove = 1;
			E_credit_inc = 1;
		end
	end

	if(W_valid_i) begin
		//assert(OneHot(W_data_i[3:0]));
		//assert(OneHot(W_data_i[7:4]));
 		$display("Wdata x: %b", W_data_i[7:4]);
	       $display("Wdata y: %b", W_data_i[3:0]);

		//assert(W_data_i[3:0] == YCOORD);
		//assert(!(W_data_i[7:4] < XCOORD));

		if (W_data_i[7:4] > XCOORD) begin
			if ((!E_port_full) && (E_turn == 5'b00010)) begin
				E_port_select = 011;
				W_port_remove = 1;
				E_port_enable = 1;
				W_credit_inc = 1;
			end
		end
		/*
		 * added necessary check to see that packet's coordinate is indeed local
		 * needed this to make sure that if we receive from west and are attempting to send
		 * out west that since that cannot happen, we don't want the packet to go to local
		 * because it is local's turn. it should only go local if it's local's turn and the
		 * coordinate of the packet is to go local. Done for other ports as well
		 */
		else if (!L_port_full && (L_turn == 5'b00010)  && W_data_i[7:4] == XCOORD) begin
			L_port_select = 011;
			W_port_remove = 1;
			L_port_enable = 1;
			W_credit_inc = 1;
		end else begin
			$display("Dropping packet sent to West");
			W_port_remove = 1;
			W_credit_inc = 1;
		end
	end


	if(L_valid_i) begin
		//assert(OneHot(L_data_i[3:0]));
		//assert(OneHot(L_data_i[7:4]));

		//assert(!((L_data_i[3:0] == YCOORD) 
		//	&& (L_data_i[7:4] == XCOORD)));
 		$display("Ldata x: %b", L_data_i[7:4]);
	       $display("Ldata y: %b", L_data_i[3:0]);
	       $display("%b %b %b %b", N_turn, S_turn, E_turn, W_turn);

		if (L_data_i[3:0] > YCOORD) begin
			$display("Local attempting south %b", S_turn);
			if (!S_port_full && (S_turn == 5'b00001)) begin
				$display("Local going south %d %b", L_data_i, S_turn);
				S_port_select = 3'b100;
				L_port_remove = 1;
				S_port_enable = 1;
				L_credit_inc = 1;
				$display("Local S Port Select: %d", S_port_select);
			end
		end else if (L_data_i[3:0] < YCOORD) begin
			if (!N_port_full && (N_turn == 5'b00001)) begin
			$display("Local going north %d", L_data_i);
				N_port_select = 3'b100;
				L_port_remove = 1;
				N_port_enable = 1;
				L_credit_inc = 1;
			end
		end else begin
			$display("L In Else %d ", L_data_i[3:0]);
			if (L_data_i[7:4] > XCOORD) begin
				$display("L Attempting east %d ", L_data_i[3:0]);
				if (!E_port_full && (E_turn == 5'b00001)) begin
					$display("Local going east %d ", L_data_i[3:0]);
					E_port_select = 3'b100;
					L_port_remove = 1;
					E_port_enable = 1;
					L_credit_inc = 1;
				end
			end else if (L_data_i[7:4] < XCOORD) begin
				$display("L Attempting west %d ", L_data_i[3:0]);
				if (!W_port_full && (W_turn == 5'b00001)) begin
					$display("Local going west %d ", L_data_i[3:0]);
					W_port_select = 3'b100;
					L_port_remove = 1;
					W_port_enable = 1;
					L_credit_inc = 1;
				end
			end else begin
				$display("Dropping packet sent to Local");
				L_port_remove = 1;
				L_credit_inc = 1;
			end
		end
	end

end

endmodule
