`include "router_test_classes.sv"

class noc_env;
    int cycle = 0;
    int max_transactions = 20;
    int warmup_time = 2;
    bit verbose = 1;
    
    real reset_density = 0.0;

    function configure(string filename);
        int file, value, seed, chars_returned;
        string param;
        file = $fopen(filename, "r");
        while(!$feof(file)) begin
            chars_returned = $fscanf(file, "%s %d", param, value);
            if ("RANDOM_SEED" == param) begin
                seed = value;
                $srandom(seed);
            end
            else if("TRANSACTIONS" == param) begin
                max_transactions = value;
            end
            else if("RESET_DENSITY" == param) begin
            	this.reset_density = value;
            end
            else if("INPUT1" == param) begin
            	/*$display("In input1");
            	if( value == 1 ) input1_active = 1; 
            	chars_returned = $fscanf(file, "%d %d %d %d %d", 
            		use_input1[0], use_input1[1], use_input1[2], use_input1[3], use_input1[4]);
            	$display("%d %d %d %d %d", 
            		use_input1[0], use_input1[1], use_input1[2], use_input1[3], use_input1[4]);
            	*/
            end
        end
    endfunction
endclass

class noc_checker;	//checker class
	
	Constants c;	
	
	function int check_results(int data_o, int enable_o, int value, int dir, router_env env);
		
		return 0;
	endfunction  
endclass


class router_transaction;

	router_env env;

    	rand int rst;
    
	/*Packet enters into router here*/
	rand int input_port1;
	rand int input_port2;
	rand int input_port3;
	rand int input_port4;
	rand int input_port5;
    
	function new(router_env env);
		this.env = env;
	endfunction

	function void pre_randomize();
		if( !env.input1_active ) in1_val.constraint_mode(0);
		if( !env.input2_active ) in2_val.constraint_mode(0);
		if( !env.input3_active ) in3_val.constraint_mode(0);
		if( !env.input4_active ) in4_val.constraint_mode(0);
		if( !env.input5_active ) in5_val.constraint_mode(0);
	endfunction

	constraint rst_val { rst >= 0 && rst <= 10; }
	constraint in1_val { (env.use_input1[0] && input_port1 == 1) ||  
			(env.use_input1[1] && input_port1 == 2) ||
			(env.use_input1[2] && input_port1 == 3) ||
			(env.use_input1[3] && input_port1 == 4) ||
			(env.use_input1[4] && input_port1 == 5);
			}

endclass

program tb_noc (
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
		ifc ifc_3_3_from
		);
		
    router_test test;
    noc_transaction packet; 
    noc_checker checker;
    noc_env env;
    int cycle; // For DVE
    
    Constants c;

	task do_warmup;
	
		env.cycle++;
	        cycle = env.cycle;
	        packet = new(env);
        	packet.randomize();
        	
        	/*
        	test.rst <= 1;
		ctrl_ds.cb_s.rst <= 1;
        
        	@(ctrl_ds.cb_s);
        	*/

        	test.golden_result();
	
	endtask
	
	task activate_message(int input_port, logic [15:0] header_l);

/*
		if( input_port == c.NORTH ) begin
			n_ds_b.cb_s.enable <= 1;
			n_ds_b.cb_s.data <= header_l;
			test.inputs[c.NORTH - 1] = header_l;
		end
		else if( input_port == c.SOUTH ) begin
			s_ds_b.cb_s.enable <= 1;
			s_ds_b.cb_s.data <= header_l;
			test.inputs[c.SOUTH - 1] = header_l;
		end
*/
	endtask

    task do_cycle;
        env.cycle++;
        cycle = env.cycle;
        packet = new(env);
        packet.randomize();
        
        /*
        header1 = { 8'b00000000 , packet.x1, packet.y1 };
        header2 = { 8'b00000000 , packet.x2, packet.y2 };
        header3 = { 8'b00000000 , packet.x3, packet.y3 };
        header4 = { 8'b00000000 , packet.x4, packet.y4 };
        header5 = { 8'b00000000 , packet.x5, packet.y5 };
        
        
        $display("\n------------------------------------");
	$display("After randomize - Rst:%d Reset_Density:%f",
			packet.rst,env.reset_density);
	
	
	test.rst 	<= (packet.rst < env.reset_density);
        ctrl_ds.cb_s.rst <= (packet.rst < env.reset_density);
        
        //if( packet.rst > 7) begin
        	if( env.input1_active ) begin
        		$display("Activating port 1");
        		$display("Header: %b (%d)", header1,header1);
        		activate_message(packet.input_port1,header1);
        	end 
        //end
        
        @(ctrl_ds.cb_s);
        
        test.golden_result();
        
	$display("------------------------------------------");
	$display("CHECKING");
	
	//Reset credit inputs -- here because good values to to go
	//	through @(ctrl_ds.cb_s) 
	n_ds_a.cb_r.credit <= 0;
	l_ds_a.cb_r.credit <= 0;
	
	received = checker.check_results(n_ds_a.cb_r.data, n_ds_a.cb_r.enable, test.delayed_outputs[c.NORTH -1], c.NORTH, env);
	if( received ) n_ds_a.cb_r.credit <= 1;
	
	*/
    endtask

    initial begin
        test = new();
        checker = new();
        env = new();
        env.configure("env.txt");
        packet = new(env);
       
        
        $display("Starting validation with noc");

        // warm up
        repeat (env.warmup_time) begin
            do_warmup();
        end

        // testing
        repeat (env.max_transactions) begin
            do_cycle();
        end

        $display("\n\n----%d cycles completed succesfully ----\n\n", env.cycle);
    end
endprogram
	