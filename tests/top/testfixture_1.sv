// Test floating point subtraction IP

`timescale 1 ns / 1 ps
`define PORT_SIZE 32

module testfixture;

reg clk = 1'b0;
reg rst_n = 1'b0;
reg f_num = 2;

initial forever #10 clk = ~clk;
initial #60 rst_n = ~rst_n;

reg [15:0] a_in, b_in;
reg a_valid, b_valid;
wire r_valid;
wire [15:0] r_data;
wire [2:0] r_user;

fp16_subtract u_subtract(
	.aclk(clk),
	.aresetn(rst_n),
	.s_axis_a_tvalid(a_valid),
	.s_axis_a_tdata(a_in),
	.s_axis_b_tvalid(b_valid),
	.s_axis_b_tdata(b_in),
	.m_axis_result_tvalid(r_valid),
	.m_axis_result_tdata(r_data),
	.m_axis_result_tuser(r_user)
);

initial begin
	//$fsdbDumpfile("test_000.fsdb");
	//$fsdbDumpvars;
	$dumpfile("test_000.vcd");
	$dumpvars;
end

initial begin
	a_in <= 16'h3cf0;
	b_in <= 16'h4d56;
	// a_valid <= 1'b0;
	// b_valid <= 1'b0;
	// #120
	a_valid <= 1'b1;
	b_valid <= 1'b1;
	#60
	a_in <= 16'h7935;
	b_in <= 16'h7502;
	#20
	a_in <= 16'h770d;
	b_in <= 16'h7a7e;
	#20
	a_in <= 16'hf758;
	b_in <= 16'h69a0;
	#20
	a_in <= 16'h78da;
	b_in <= 16'h7aa4;
	#20
	a_in <= 16'hf879;
	b_in <= 16'hf45b;
	#20
	a_in <= 16'he73c;
	b_in <= 16'h781b;
	#20
	a_in <= 16'h77d3;
	b_in <= 16'h7968;
	#20
	a_in <= 16'hf8a3;
	b_in <= 16'h7741;
	#20
	a_in <= 16'h785a;
	b_in <= 16'hfac3;
	#20
	a_in <= 16'h73f4;
	b_in <= 16'h7ac3;
	#20
	a_in <= 16'heb6e;
	b_in <= 16'hf94c;
	#20
	a_in <= 16'hfa5d;
	b_in <= 16'h76b9;
	#20
	a_in <= 16'h5429;
	b_in <= 16'h7913;
	#20
	a_in <= 16'h72c1;
	b_in <= 16'h7ae8;
	#20
	a_in <= 16'h7160;
	b_in <= 16'hfad0;
	#20
	a_in <= 16'hf8c6;
	b_in <= 16'h757b;
	#20
	a_in <= 16'hf3d3;
	b_in <= 16'hf89c;
	#20
	a_in <= 16'hf0c9;
	b_in <= 16'hf877;
	#20
	a_in <= 16'h788c;
	b_in <= 16'h7712;
	#20
	a_in <= 16'h7861;
	b_in <= 16'h77e5;
	#20
	#100_000;
	$finish;
end

endmodule
