all: hello_world_tb.vcd

hello_world_tb.vcd: hello_world_tb.v
	iverilog -o hello_world_tb.vvp $<
	vvp hello_world_tb.vvp

clean:
	rm -f hello_world_tb.vcd hello_world_tb.vvp
