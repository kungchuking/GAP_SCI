module gap_tv(
	clk,
	rst_n,
	ren,
	raddr,
	dout
);

input         clk;
input         rst_n;
input  [63:0] dout;
output        ren;
output [15:0] raddr;

endmodule
