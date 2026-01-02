-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Wed Aug 20 16:06:48 2025
-- Host        : ug56 running 64-bit Debian GNU/Linux 12 (bookworm)
-- Command     : write_vhdl -force -mode synth_stub
--               /nfs/ug/homes-2/c/cheng520/ISML/GAP_SCI/vivado/vivado.gen/sources_1/ip/bram_vga_16f/bram_vga_16f_stub.vhdl
-- Design      : bram_vga_16f
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu13p_CIV-fsga2577-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bram_vga_16f is
  Port ( 
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 17 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 511 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 511 downto 0 )
  );

end bram_vga_16f;

architecture stub of bram_vga_16f is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,ena,wea[0:0],addra[17:0],dina[511:0],douta[511:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_5,Vivado 2022.1";
begin
end;
