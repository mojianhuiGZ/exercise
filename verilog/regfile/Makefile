all: regfile_test.vcd

regfile_test.vcd: regfile_test.v regfile.v
	iverilog -o regfile_test.vvp $^
	vvp regfile_test.vvp

clean:
	rm -f regfile_test.vcd regfile_test.vvp
