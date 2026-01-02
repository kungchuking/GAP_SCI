-makelib xcelium_lib/xpm -sv \
  "/CMC/tools/xilinx/Vivado_2022.1/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/nfs/vrg/cmc/cmc/tools/xilinx/Vivado_2022.1/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_5 \
  "../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../vivado.gen/sources_1/ip/bram_test/sim/bram_test.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

