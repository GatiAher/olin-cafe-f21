# -Wall turns on all warnings
# -g2012 selects the 2012 version of iVerilog
IVERILOG=iverilog -Wall -g2012 -y ./ -I ./
VVP=vvp

# Look up .PHONY rules for Makefiles
.PHONY: clean

# Call this to clean up all your generated files
clean:
	rm -f *.bin *.vcd vivado*.log vivado*.jou vivado*.str

test_adder_1 : test_adder_1.sv adder_1.sv
	${IVERILOG} $^ -o test_adder_1.bin && ${VVP} test_adder_1.bin 

test_add32 : test_add32.sv add32.sv adder_cla_4.sv adder_rc_4.sv gen_prop_4.sv adder_1.sv
	${IVERILOG} $^ -o test_add32.bin && ${VVP} test_add32.bin

test_mux_4 : test_mux_4.sv mux_4.sv
	${IVERILOG} $^ -o test_mux_4.bin && ${VVP} test_mux_4.bin

test_mux_8 : test_mux_8.sv mux_8.sv mux_4.sv
	${IVERILOG} $^ -o test_mux_8.bin && ${VVP} test_mux_8.bin

test_mux_16 : test_mux_16.sv mux_16.sv mux_8.sv mux_4.sv
	${IVERILOG} $^ -o test_mux_16.bin && ${VVP} test_mux_16.bin

test_mux32 : test_mux32.sv mux32.sv mux_16.sv mux_8.sv mux_4.sv
	${IVERILOG} $^ -o test_mux32.bin && ${VVP} test_mux32.bin
