// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Thu Aug 21 12:39:56 2025
// Host        : ug51 running 64-bit Debian GNU/Linux 12 (bookworm)
// Command     : write_verilog -force -mode synth_stub
//               /nfs/ug/homes-2/c/cheng520/ISML/GAP_SCI/vivado/vivado.gen/sources_1/ip/fp16_subtract/fp16_subtract_stub.v
// Design      : fp16_subtract
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu13p_CIV-fsga2577-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "floating_point_v7_1_14,Vivado 2022.1" *)
module fp16_subtract(aclk, aresetn, s_axis_a_tvalid, s_axis_a_tdata, 
  s_axis_b_tvalid, s_axis_b_tdata, m_axis_result_tvalid, m_axis_result_tdata, 
  m_axis_result_tuser)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axis_a_tvalid,s_axis_a_tdata[15:0],s_axis_b_tvalid,s_axis_b_tdata[15:0],m_axis_result_tvalid,m_axis_result_tdata[15:0],m_axis_result_tuser[2:0]" */;
  input aclk;
  input aresetn;
  input s_axis_a_tvalid;
  input [15:0]s_axis_a_tdata;
  input s_axis_b_tvalid;
  input [15:0]s_axis_b_tdata;
  output m_axis_result_tvalid;
  output [15:0]m_axis_result_tdata;
  output [2:0]m_axis_result_tuser;
endmodule
