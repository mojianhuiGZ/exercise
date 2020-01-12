all: add_rca_32_test.vcd

add_rca_32_test.vcd: add_rca_32_test.v add_rca_32.v fulladder.v
	iverilog -o add_rca_32_test.vvp $^
	vvp add_rca_32_test.vvp

clean:
	rm -f add_rca_32_test.vcd add_rca_32_test.vvp
