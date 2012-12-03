TOP=top.sv
#INTERFACE=
INTERFACE=ifc_noc.sv
BENCH=bench.sv
DUT=noc.sv 

.PHONY: help

help:
	@echo "The following make targets are supported:" ;\
	echo " bench  - builds the testbench";\
        echo " wave   - convert vcd to vpd";\
	echo " expand - expands veritedium directives (autoargs, inst etc.)";\
	echo " indent - automatically indents verilog and c files" ;\
	echo " clean  - cleans testbench and intermediate files" ;\
	echo " help   - show this information";\


indent:
	emacs --batch *.sv -f verilog-batch-indent
	indent -linux *.c *.h
	rm *~

dut:  
	vcs -full64 -PP -sverilog +define+SV +define+VPD +lint=all,noVCDE -notice $(INTERFACE) $(DUT) 

test: 
	vcs -PP -sverilog +define+SV +define+VPD $(INTERFACE) $(BENCH)

bench: 
	vcs -full64 -PP -sverilog +define+SV +define+VPD $(TOP) $(INTERFACE) $(DUT) $(BENCH) -o testbench.exe
        
wave:
	vcs -vpd2vcd vcdplus.vpd waveform.vcd
	gtkwave waveform.vcd &

clean:
	rm -rf *.o *~ *.vpd sim* csrc DVEfiles *daidir *exe *.key

