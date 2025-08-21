`define PORT_SIZE 32
`define COL_WIDTH 2
`define ROW_NUM 48

module gap_tv(
	clk,
	rst_n,
	f_num,
	// BRAMs
	ren,
	raddr,
	din,
	wen,
	waddr,
	dout
);

	input clk, rst_n;
	input [6:0] f_num;
	input [`PORT_SIZE*16-1:0] din;
	output ren, wen;
	output [7:0] raddr, waddr;
	output [`PORT_SIZE*16-1:0] dout;

	wire dx_diff_rst_n, out_valid;

	dx_diff_addr_counter dx_c1(clk, rst_n, 1, dx_diff_rst_n, raddr);
	dx_diff dx1(clk, rst_n & dx_diff_rst_n, din, dout, out_valid);
	dx_diff_addr_counter dx_c2(clk, rst_n, out_valid, dx_diff_rst_n, waddr);

endmodule

module dx_diff_addr_counter(
	clk,
	rst_n,
	en,
	dx_diff_rst_n,
	addr
);
	input clk, rst_n, en;
	output reg dx_diff_rst_n;
	output [7:0] addr;
	reg [7:0] dx_diff_addr_row, dx_diff_addr_col;

	always @(posedge clk)
		begin
			dx_diff_rst_n <= 1;
			if (rst_n == 0)
				begin
					dx_diff_rst_n <= 0;
					dx_diff_addr_row <= 0;
					dx_diff_addr_col <= `COL_WIDTH - 1;
				end
			else if (en)
				begin
					if (dx_diff_addr_col == 0 && dx_diff_addr_row == (`ROW_NUM - 1))
						begin
							dx_diff_rst_n <= 0;
							dx_diff_addr_row <= 0;
							dx_diff_addr_col <= `COL_WIDTH - 1;
						end
					else if (dx_diff_addr_col == 0)
						begin
							dx_diff_rst_n <= 0;
							dx_diff_addr_row <= dx_diff_addr_row + 1;
							dx_diff_addr_col <= `COL_WIDTH - 1;
						end
					else
						begin
							dx_diff_addr_col <= dx_diff_addr_col - 1;
						end
				end
		end

	assign addr = (dx_diff_addr_row * `COL_WIDTH) + dx_diff_addr_col;

endmodule

module dx_diff(
	clk,
	rst_n,
	in,
	out,
	all_out_valid
);

	input clk, rst_n;
	input [`PORT_SIZE*16-1:0] in;
	output reg [`PORT_SIZE*16-1:0] out;
	output all_out_valid;

	reg [15:0] prev;
	reg [15:0] in_array [0:`PORT_SIZE];
	reg [15:0] out_array [0:`PORT_SIZE];
	reg [15:0] out_valid;
	reg [15:0] faults [0:2];
	reg [2:0] faults_last;

	assign all_out_valid = &out_valid;

	integer i;
	always @(*)
		begin
			for (i = 0; i <= `PORT_SIZE-1; i = i + 1)
				in_array[i] = in[i*16 +: 16];
				out[i*16 +: 16] = out_array[i];
		end

	genvar j;
	generate
		for (j = 0; j < `PORT_SIZE - 1; j = j + 1)
			fp16_subtract u_subtract(
				.aclk(clk),
				.aresetn(rst_n),
				.s_axis_a_tvalid(1),
				.s_axis_a_tdata(in_array[j+1]),
				.s_axis_b_tvalid(1),
				.s_axis_b_tdata(in_array[j]),
				.m_axis_result_tvalid(out_valid[j]),
				.m_axis_result_tdata(out_array[j]),
				.m_axis_result_tuser(faults[j])
			);
	endgenerate

	fp16_subtract u_subtract_last(
		.aclk(clk),
		.aresetn(rst_n),
		.s_axis_a_tvalid(1),
		.s_axis_a_tdata(prev),
		.s_axis_b_tvalid(1),
		.s_axis_b_tdata(in_array[`PORT_SIZE-1]),
		.m_axis_result_tvalid(out_valid[`PORT_SIZE-1]),
		.m_axis_result_tdata(out_array[`PORT_SIZE-1]),
		.m_axis_result_tuser(faults_last)
	);

	always @(posedge clk)
		begin
			if (rst_n == 0)
				prev <= 16'b0; // should be self! self - self = 0 for last col
			else
				begin
					prev <= in_array[0];
				end
		end
	
endmodule
