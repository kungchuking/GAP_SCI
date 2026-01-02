// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Wed Aug 20 15:56:29 2025
// Host        : ug56 running 64-bit Debian GNU/Linux 12 (bookworm)
// Command     : write_verilog -force -mode synth_stub
//               /nfs/ug/homes-2/c/cheng520/ISML/GAP_SCI/vivado/vivado.gen/sources_1/ip/bram_test/bram_test_stub.v
// Design      : bram_test
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu13p_CIV-fsga2577-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *)
module bram_test(clka, ena, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[7:0],dina[511:0],douta[511:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [7:0]addra;
  input [511:0]dina;
  output [511:0]douta;
endmodule
