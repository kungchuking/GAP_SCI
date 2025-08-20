`timescale 1 ns / 1 ps
`define PORT_SIZE 32

module testfixture;

reg clk = 1'b0;
reg rst_n = 1'b0;
reg f_num = 2;

initial forever #10 clk = ~clk;
initial #20 rst_n = ~rst_n;

wire ren, wen;
wire [7:0] raddr, waddr;

reg [15:0] mem_r [0:65536];
reg [15:0] mem_w [0:65536];

reg [`PORT_SIZE*16-1:0] din;
reg [`PORT_SIZE*16-1:0] dout;

integer i;

always@(posedge clk)
	for (i = 0; i <= 31; i++)
		begin : assign_bits
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

initial begin
	//$fsdbDumpfile("test_000.fsdb");
	//$fsdbDumpvars;
	$dumpfile("test_000.vcd");
	$dumpvars;
end

initial begin
	$readmemb("bssr_frames.dat", mem_r);
	$readmemb("empty.dat", mem_w);
end

initial begin
	#100_000;
	$finish;
end

endmodule
