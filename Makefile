
INTERFACE=ifc_noc.sv
BENCH=bench.sv
NOC=noc.sv noc_router.sv top_noc.sv $(INTERFACE) $(MODULES) $(BENCH)
ROUTER=noc_router.sv top_router.sv $(INTERFACE) $(MODULES) $(BENCH)
MODULES=noc_inputPort.sv noc_outputPort.sv noc_arbiter.sv noc_routeLogic.sv noc_switch.sv
LIB_DIR=/sim/synopsys64/icc/dw/sim_ver
LIB_EXT=+libext+.v


.PHONY: help

help:
	@echo "The following make targets are supported:" ;\
	echo " router - builds a single router";\
	echo " noc    - build the noc";\
        echo " wave   - convert vcd to vpd";\
	echo " indent - automatically indents verilog and c files" ;\
	echo " clean  - cleans testbench and intermediate files" ;\
	echo " help   - show this information";

indent:
	emacs --batch *.sv -f verilog-batch-indent
	indent -linux *.c *.h
	rm *~

noc:  
	vcs -full64 -PP -sverilog +define+SV +define+VPD +lint=all,noVCDE -notice -y $(LIB_DIR) +incdir+$(LIB_DIR) $(LIB_EXT) $(NOC) 

router:  
	vcs -full64 -PP -sverilog +define+SV +define+VPD +lint=all,noVCDE -notice -y $(LIB_DIR) +incdir+$(LIB_DIR) $(LIB_EXT) $(ROUTER)
        
wave:
	vcs -vpd2vcd vcdplus.vpd waveform.vcd
	gtkwave waveform.vcd &


.PHONY: clean

clean:
	rm -rf *.o *~ *.vpd sim* csrc DVEfiles *daidir *exe *.key

