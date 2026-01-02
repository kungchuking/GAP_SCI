// Test dx_diff counter and dx_diff

`timescale 1 ns / 1 ps
`define PORT_SIZE 16
`define COL_WIDTH 4
`define ROW_NUM 48

module testfixture;

reg clk = 1'b0;
reg rst_n = 1'b0;
reg f_num = 2;

initial forever #10 clk = ~clk;
initial #60 rst_n = ~rst_n;

wire ren, wen;
wire [7:0] raddr, waddr;

reg [15:0] mem_r [0:65536];
reg [15:0] mem_w [0:65536];

reg [`PORT_SIZE*16-1:0] din;
reg [`PORT_SIZE*16-1:0] dout;

integer i;
always@(posedge clk)
	for (i = 0; i <= `PORT_SIZE - 1; i = i + 1)
		begin
			if (ren)
					din[i*16 +: 16] <= mem_r[raddr * `PORT_SIZE + i];
			else
					din[i*16 +: 16] <= 16'b0;
			if (wen)
					mem_w[waddr * `PORT_SIZE + i] <= dout[i*16 +: 16];
		end

gap_tv uut1(
	.clk(clk),
	.rst_n(rst_n),
	.f_num(f_num),
	.ren(ren),
	.raddr(raddr),
	.din(din),
	.wen(wen),
	.waddr(waddr),
	.dout(dout)
);

reg en = 0;
wire dx_diff_rst_n;
wire [7:0] addr;

dx_diff_addr_counter uut2(
	.clk(clk),
	.rst_n(rst_n),
	.en(en),
	.dx_diff_rst_n(dx_diff_rst_n),
	.addr(addr)
);

initial begin
	//$fsdbDumpfile("test_000.fsdb");
	//$fsdbDumpvars;
	$dumpfile("test_000.vcd");
	$dumpvars;
end

initial begin
	$readmemh("bssr_64_h.dat", mem_r);
	$readmemh("empty_h.dat", mem_w);
end

initial begin
	#40
	en <= 1;
	#160
	en <= 0;
	#40
	en <= 1;
	#100
	en <= 0;
	#40
	en <= 1;
	#5000;
	$writememh("bssr_64_output_h.dat", mem_w);
	$finish;
end

endmodule
