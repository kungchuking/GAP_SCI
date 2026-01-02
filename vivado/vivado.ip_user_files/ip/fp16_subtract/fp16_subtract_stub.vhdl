-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Thu Aug 21 12:39:56 2025
-- Host        : ug51 running 64-bit Debian GNU/Linux 12 (bookworm)
-- Command     : write_vhdl -force -mode synth_stub
--               /nfs/ug/homes-2/c/cheng520/ISML/GAP_SCI/vivado/vivado.gen/sources_1/ip/fp16_subtract/fp16_subtract_stub.vhdl
-- Design      : fp16_subtract
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu13p_CIV-fsga2577-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fp16_subtract is
  Port ( 
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tuser : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );

end fp16_subtract;

architecture stub of fp16_subtract is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,aresetn,s_axis_a_tvalid,s_axis_a_tdata[15:0],s_axis_b_tvalid,s_axis_b_tdata[15:0],m_axis_result_tvalid,m_axis_result_tdata[15:0],m_axis_result_tuser[2:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "floating_point_v7_1_14,Vivado 2022.1";
begin
end;
