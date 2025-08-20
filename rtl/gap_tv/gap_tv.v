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

	reg dx_diff_rst_n;
	reg [7:0] dx_diff_addr_row, dx_diff_addr_col;
	dx_diff dx1(clk, rst_n & dx_diff_rst_n, din, dout);

	always @(posedge clk)
		begin
			if (rst_n == 0)
				begin
					dx_diff_rst_n <= 0;
					dx_diff_addr_row <= 0;
					dx_diff_addr_col <= `COL_WIDTH - 1;
				end
			else if (dx_diff_addr_col == 0 && dx_diff_addr_row == (`ROW_NUM - 1))
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
				dx_diff_addr_col <= dx_diff_addr_col - 1;
		end

	assign raddr = dx_diff_addr_row * `COL_WIDTH + dx_diff_addr_col;
	assign waddr = dx_diff_addr_row * `COL_WIDTH + dx_diff_addr_col;

endmodule

module dx_diff(
	clk,
	rst_n,
	in,
	out
);

	input clk, rst_n;
	input [`PORT_SIZE*16-1:0] in;
	output [`PORT_SIZE*16-1:0] out;

	assign out = in;

	reg [15:0] prev;

	// make in, out array

	// always @(posedge clk)
	// 	begin
	// 		if (rst_n == 0)
	// 			prev <= 16'b0;
	// 		else
	// 			begin
	// 				for (i = 0; i < `PORT_SIZE - 1; i=i+1)
	// 					out[i] <= in[i+1] - in[i];
	// 				out[`PORT_SIZE-1] <= prev - in[`PORT_SIZE-1];
	// 				prev <= in[0];
	// 			end
	// 	end
	
endmodule