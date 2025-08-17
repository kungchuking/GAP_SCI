`timescale 1 ns / 1 ps

module testfixture;

reg clk = 1'b0;
reg rst_n = 1'b0;

initial forever #(500.0 / 3.33) clk = ~clk;
initial #1 rst_n = ~rst_n;

wire        ren;
wire [15:0] raddr;
reg  [63:0] dout = 64'd0;

reg  [63:0] mem [0:65535];

gap_tv u_gap_tv(.clk  (clk  ),
                .rst_n(rst_n),
                .ren  (ren  ),
                .raddr(raddr),
                .dout (dout ));

initial begin
	$fsdbDumpfile("test_000.fsdb");
	$fsdbDumpvars;
end

initial begin
	$readmemb("bssr_64.dat", mem);
end

always@(posedge clk)
	if (ren)
		dout <= mem[raddr];
	else
		dout <= 64'd0;

initial begin
	#10_000_000;
	$finish;
end

endmodule
