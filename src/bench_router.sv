`include "router_test_classes.sv"

program tb_router (	ifc n_ds_a, ifc n_ds_b,
			ifc s_ds_a, ifc s_ds_b,
			ifc e_ds_a, ifc e_ds_b,
			ifc w_ds_a, ifc w_ds_b,
			ifc l_ds_a, ifc l_ds_b,
			ifc ctrl_ds
	);
		
    router_test test;
    router_transaction packet; 
    router_checker checker;
    router_env env;
    int cycle; // For DVE
    
    /*Temp variables*/
    logic [15:0] header1;
    logic [15:0] header2;
    logic [15:0] header3;
    logic [15:0] header4;
    logic [15:0] header5;
    int received;
    
    Constants c;

	task do_warmup;
	
		env.cycle++;
	        cycle = env.cycle;
	        packet = new(env);
        	packet.randomize();
        	
        	test.rst <= 1;
		ctrl_ds.cb_s.rst <= 1;
        
        	@(ctrl_ds.cb_s);

        	test.golden_result();
	
	endtask
	
	task activate_message(int input_port, logic [15:0] header_l);

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
		else if( input_port == c.EAST ) begin
			e_ds_b.cb_s.enable <= 1;
			e_ds_b.cb_s.data <= header_l;
			test.inputs[c.EAST - 1] = header_l;
		end
		else if( input_port == c.WEST ) begin
			w_ds_b.cb_s.enable <= 1;
			w_ds_b.cb_s.data <= header_l;
			test.inputs[c.WEST - 1] = header_l;
		end
		else if( input_port == c.LOCAL ) begin
			l_ds_b.cb_s.enable <= 1;
			l_ds_b.cb_s.data <= header_l;
			test.inputs[c.LOCAL - 1] = header_l;
		end
		else begin
			$display("NO VALID INPUT PORT FOR %d", input_port);
		end
	endtask

    task do_cycle;
        env.cycle++;
        cycle = env.cycle;
        packet = new(env);
        packet.randomize();
        
        test.clear_input();
        test.clear_delayed_output(); 
        
        //Reset inputs to DUT
        n_ds_b.cb_s.enable 	<= 0;
	n_ds_b.cb_s.data 	<= 0;
	s_ds_b.cb_s.enable 	<= 0;
	s_ds_b.cb_s.data 	<= 0;
	e_ds_b.cb_s.enable 	<= 0;
	e_ds_b.cb_s.data 	<= 0;
	w_ds_b.cb_s.enable 	<= 0;
	w_ds_b.cb_s.data 	<= 0;
	l_ds_b.cb_s.enable 	<= 0;
	l_ds_b.cb_s.data	<= 0;        
        
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
        if( env.input2_active ) begin
        	$display("Activating port 2");
        	$display("Header: %b (%d)", header2,header2);
	        activate_message(packet.input_port2,header2);
        end 
        if( env.input3_active ) begin
        	$display("Activating port 3");
        	$display("Header: %b (%d)", header3,header3);
	        activate_message(packet.input_port3,header3);
        end 
        if( env.input4_active ) begin
        	$display("Activating port 4");
        	$display("Header: %b (%d)", header4,header4);
	        activate_message(packet.input_port4,header4);
        end 
        if( env.input5_active ) begin
        	$display("Activating port 5");
        	$display("Header: %b (%d)", header5,header5);
	        activate_message(packet.input_port5,header5);
        end 
        
        @(ctrl_ds.cb_s);
        
        test.golden_result();
        
	$display("------------------------------------------");
	$display("CHECKING");
	
	/*Reset credit inputs -- here because good values to to go
		through @(ctrl_ds.cb_s) */
	n_ds_a.cb_r.credit <= 0;
	s_ds_a.cb_r.credit <= 0;
	e_ds_a.cb_r.credit <= 0;
	w_ds_a.cb_r.credit <= 0;
	l_ds_a.cb_r.credit <= 0;
	
	received = checker.check_results(n_ds_a.cb_r.data, n_ds_a.cb_r.enable, test.delayed_outputs[c.NORTH -1], c.NORTH, env);
	if( received ) begin
		n_ds_a.cb_r.credit <= 1;
		test.credits[0]++;
	end
	
	received = checker.check_results(s_ds_a.cb_r.data, s_ds_a.cb_r.enable, test.delayed_outputs[c.SOUTH -1], c.SOUTH, env);
	if( received ) begin
		s_ds_a.cb_r.credit <= 1;
		test.credits[1]++;
	end
	received = checker.check_results(e_ds_a.cb_r.data, e_ds_a.cb_r.enable, test.delayed_outputs[c.EAST -1], c.EAST, env);
	if( received ) begin 
		e_ds_a.cb_r.credit <= 1;
		test.credits[2]++;
	end
	received = checker.check_results(w_ds_a.cb_r.data, w_ds_a.cb_r.enable, test.delayed_outputs[c.WEST -1], c.WEST, env);
	if( received ) begin
		w_ds_a.cb_r.credit <= 1;
		test.credits[3]++;
	end
	received = checker.check_results(l_ds_a.cb_r.data, l_ds_a.cb_r.enable, test.delayed_outputs[c.LOCAL -1], c.LOCAL, env);
	if( received ) begin
		l_ds_a.cb_r.credit <= 1;
		test.credits[4]++;
	end
	$display("--------------------------------------");

    endtask

    initial begin
        test = new();
        checker = new();
        env = new();
        env.configure("env.txt");
        packet = new(env);
        
        test.XCOORD = env.XCOORD;
        test.YCOORD = env.YCOORD;
        
        $display("Starting validation with router at [%d,%d]",
        	test.XCOORD, test.YCOORD);

        // warm up
        repeat (env.warmup_time) begin
            do_warmup();
        end

        // testing
        repeat (env.max_transactions) begin
            do_cycle();
        end
        $display("Messages Sent To: %d %d %d %d %d",
        		test.message_counter[0],test.message_counter[1],
        		test.message_counter[2],test.message_counter[3],
        		test.message_counter[4]
        	);
        $display("Credits: %d %d %d %d %d", test.credits[0],test.credits[1],test.credits[2],test.credits[3],test.credits[4]);
        $display("\n\n----%d cycles completed succesfully ----\n\n", env.cycle);
    end
endprogram
	
