module gap_tv(
	clk,
	rst_n,
	ren,
	raddr,
	dout
);

input         clk;
input         rst_n;
output        ren;
output [15:0] raddr;
output [63:0] dout;

endmodule
