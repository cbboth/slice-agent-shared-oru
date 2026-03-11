//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Thu Mar  7 21:22:30 2024
//Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
//Command     : generate_target symb_buffers.bd
//Design      : symb_buffers
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "symb_buffers,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=symb_buffers,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=15,numReposBlks=15,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=13,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "symb_buffers.hwdef" *) 
module symb_buffers
   (M_AXIS_0_00_tdata,
    M_AXIS_0_00_tready,
    M_AXIS_0_00_tvalid,
    M_AXIS_0_01_tdata,
    M_AXIS_0_01_tready,
    M_AXIS_0_01_tvalid,
    M_AXIS_0_02_tdata,
    M_AXIS_0_02_tready,
    M_AXIS_0_02_tvalid,
    M_AXIS_0_03_tdata,
    M_AXIS_0_03_tready,
    M_AXIS_0_03_tvalid,
    M_AXIS_0_04_tdata,
    M_AXIS_0_04_tready,
    M_AXIS_0_04_tvalid,
    M_AXIS_0_05_tdata,
    M_AXIS_0_05_tready,
    M_AXIS_0_05_tvalid,
    M_AXIS_0_06_tdata,
    M_AXIS_0_06_tready,
    M_AXIS_0_06_tvalid,
    M_AXIS_0_07_tdata,
    M_AXIS_0_07_tready,
    M_AXIS_0_07_tvalid,
    M_AXIS_0_08_tdata,
    M_AXIS_0_08_tready,
    M_AXIS_0_08_tvalid,
    M_AXIS_0_09_tdata,
    M_AXIS_0_09_tready,
    M_AXIS_0_09_tvalid,
    M_AXIS_0_10_tdata,
    M_AXIS_0_10_tready,
    M_AXIS_0_10_tvalid,
    M_AXIS_0_11_tdata,
    M_AXIS_0_11_tready,
    M_AXIS_0_11_tvalid,
    M_AXIS_0_12_tdata,
    M_AXIS_0_12_tready,
    M_AXIS_0_12_tvalid,
    M_AXIS_0_13_tdata,
    M_AXIS_0_13_tready,
    M_AXIS_0_13_tvalid,
    Rx_AXIS_0_00_tdata,
    Rx_AXIS_0_00_tlast,
    Rx_AXIS_0_00_tready,
    Rx_AXIS_0_00_tvalid,
    s_aclk_0,
    s_aresetn_0,
    symbEn_0);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_00 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_00, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_0_00_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_00 TREADY" *) input M_AXIS_0_00_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_00 TVALID" *) output M_AXIS_0_00_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_01 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_01, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_0_01_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_01 TREADY" *) input M_AXIS_0_01_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_01 TVALID" *) output M_AXIS_0_01_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_02 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_02, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_0_02_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_02 TREADY" *) input M_AXIS_0_02_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_02 TVALID" *) output M_AXIS_0_02_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_03 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_03, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_0_03_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_03 TREADY" *) input M_AXIS_0_03_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_03 TVALID" *) output M_AXIS_0_03_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_04 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_04, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_0_04_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_04 TREADY" *) input M_AXIS_0_04_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_04 TVALID" *) output M_AXIS_0_04_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_05 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_05, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_0_05_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_05 TREADY" *) input M_AXIS_0_05_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_05 TVALID" *) output M_AXIS_0_05_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_06 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_06, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_0_06_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_06 TREADY" *) input M_AXIS_0_06_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_06 TVALID" *) output M_AXIS_0_06_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_07 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_07, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_0_07_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_07 TREADY" *) input M_AXIS_0_07_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_07 TVALID" *) output M_AXIS_0_07_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_08 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_08, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_0_08_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_08 TREADY" *) input M_AXIS_0_08_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_08 TVALID" *) output M_AXIS_0_08_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_09 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_09, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_0_09_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_09 TREADY" *) input M_AXIS_0_09_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_09 TVALID" *) output M_AXIS_0_09_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_10 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_10, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_0_10_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_10 TREADY" *) input M_AXIS_0_10_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_10 TVALID" *) output M_AXIS_0_10_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_11 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_11, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_0_11_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_11 TREADY" *) input M_AXIS_0_11_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_11 TVALID" *) output M_AXIS_0_11_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_12 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_12, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_0_12_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_12 TREADY" *) input M_AXIS_0_12_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_12 TVALID" *) output M_AXIS_0_12_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_13 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_13, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_0_13_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_13 TREADY" *) input M_AXIS_0_13_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_13 TVALID" *) output M_AXIS_0_13_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 Rx_AXIS_0_00 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME Rx_AXIS_0_00, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [63:0]Rx_AXIS_0_00_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 Rx_AXIS_0_00 TLAST" *) input Rx_AXIS_0_00_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 Rx_AXIS_0_00 TREADY" *) output Rx_AXIS_0_00_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 Rx_AXIS_0_00 TVALID" *) input Rx_AXIS_0_00_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.S_ACLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.S_ACLK_0, ASSOCIATED_BUSIF M_AXIS_0_00:M_AXIS_0_01:M_AXIS_0_02:M_AXIS_0_03:M_AXIS_0_04:M_AXIS_0_05:M_AXIS_0_06:M_AXIS_0_07:M_AXIS_0_08:M_AXIS_0_09:M_AXIS_0_10:M_AXIS_0_11:M_AXIS_0_12:M_AXIS_0_13:Rx_AXIS_0_00, ASSOCIATED_RESET s_aresetn_0, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input s_aclk_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.S_ARESETN_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.S_ARESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input s_aresetn_0;
  input [13:0]symbEn_0;

  wire [63:0]Rx_AXIS_0_0_1_TDATA;
  wire Rx_AXIS_0_0_1_TLAST;
  wire Rx_AXIS_0_0_1_TREADY;
  wire Rx_AXIS_0_0_1_TVALID;
  wire [63:0]fifo_generator_0_M_AXIS_TDATA;
  wire fifo_generator_0_M_AXIS_TREADY;
  wire fifo_generator_0_M_AXIS_TVALID;
  wire [63:0]fifo_generator_10_M_AXIS_TDATA;
  wire fifo_generator_10_M_AXIS_TREADY;
  wire fifo_generator_10_M_AXIS_TVALID;
  wire [63:0]fifo_generator_11_M_AXIS_TDATA;
  wire fifo_generator_11_M_AXIS_TREADY;
  wire fifo_generator_11_M_AXIS_TVALID;
  wire [63:0]fifo_generator_12_M_AXIS_TDATA;
  wire fifo_generator_12_M_AXIS_TREADY;
  wire fifo_generator_12_M_AXIS_TVALID;
  wire [63:0]fifo_generator_13_M_AXIS_TDATA;
  wire fifo_generator_13_M_AXIS_TREADY;
  wire fifo_generator_13_M_AXIS_TVALID;
  wire [63:0]fifo_generator_1_M_AXIS_TDATA;
  wire fifo_generator_1_M_AXIS_TREADY;
  wire fifo_generator_1_M_AXIS_TVALID;
  wire [63:0]fifo_generator_2_M_AXIS_TDATA;
  wire fifo_generator_2_M_AXIS_TREADY;
  wire fifo_generator_2_M_AXIS_TVALID;
  wire [63:0]fifo_generator_3_M_AXIS_TDATA;
  wire fifo_generator_3_M_AXIS_TREADY;
  wire fifo_generator_3_M_AXIS_TVALID;
  wire [63:0]fifo_generator_4_M_AXIS_TDATA;
  wire fifo_generator_4_M_AXIS_TREADY;
  wire fifo_generator_4_M_AXIS_TVALID;
  wire [63:0]fifo_generator_5_M_AXIS_TDATA;
  wire fifo_generator_5_M_AXIS_TREADY;
  wire fifo_generator_5_M_AXIS_TVALID;
  wire [63:0]fifo_generator_6_M_AXIS_TDATA;
  wire fifo_generator_6_M_AXIS_TREADY;
  wire fifo_generator_6_M_AXIS_TVALID;
  wire [63:0]fifo_generator_7_M_AXIS_TDATA;
  wire fifo_generator_7_M_AXIS_TREADY;
  wire fifo_generator_7_M_AXIS_TVALID;
  wire [63:0]fifo_generator_8_M_AXIS_TDATA;
  wire fifo_generator_8_M_AXIS_TREADY;
  wire fifo_generator_8_M_AXIS_TVALID;
  wire [63:0]fifo_generator_9_M_AXIS_TDATA;
  wire fifo_generator_9_M_AXIS_TREADY;
  wire fifo_generator_9_M_AXIS_TVALID;
  wire s_aclk_0_1;
  wire s_aresetn_0_1;
  wire [13:0]symbEn_0_1;
  wire [63:0]symb_mux_0_Tx_AXIS_00_TDATA;
  wire symb_mux_0_Tx_AXIS_00_TREADY;
  wire symb_mux_0_Tx_AXIS_00_TVALID;
  wire [63:0]symb_mux_0_Tx_AXIS_01_TDATA;
  wire symb_mux_0_Tx_AXIS_01_TREADY;
  wire symb_mux_0_Tx_AXIS_01_TVALID;
  wire [63:0]symb_mux_0_Tx_AXIS_02_TDATA;
  wire symb_mux_0_Tx_AXIS_02_TREADY;
  wire symb_mux_0_Tx_AXIS_02_TVALID;
  wire [63:0]symb_mux_0_Tx_AXIS_03_TDATA;
  wire symb_mux_0_Tx_AXIS_03_TREADY;
  wire symb_mux_0_Tx_AXIS_03_TVALID;
  wire [63:0]symb_mux_0_Tx_AXIS_04_TDATA;
  wire symb_mux_0_Tx_AXIS_04_TREADY;
  wire symb_mux_0_Tx_AXIS_04_TVALID;
  wire [63:0]symb_mux_0_Tx_AXIS_05_TDATA;
  wire symb_mux_0_Tx_AXIS_05_TREADY;
  wire symb_mux_0_Tx_AXIS_05_TVALID;
  wire [63:0]symb_mux_0_Tx_AXIS_06_TDATA;
  wire symb_mux_0_Tx_AXIS_06_TREADY;
  wire symb_mux_0_Tx_AXIS_06_TVALID;
  wire [63:0]symb_mux_0_Tx_AXIS_07_TDATA;
  wire symb_mux_0_Tx_AXIS_07_TREADY;
  wire symb_mux_0_Tx_AXIS_07_TVALID;
  wire [63:0]symb_mux_0_Tx_AXIS_08_TDATA;
  wire symb_mux_0_Tx_AXIS_08_TREADY;
  wire symb_mux_0_Tx_AXIS_08_TVALID;
  wire [63:0]symb_mux_0_Tx_AXIS_09_TDATA;
  wire symb_mux_0_Tx_AXIS_09_TREADY;
  wire symb_mux_0_Tx_AXIS_09_TVALID;
  wire [63:0]symb_mux_0_Tx_AXIS_10_TDATA;
  wire symb_mux_0_Tx_AXIS_10_TREADY;
  wire symb_mux_0_Tx_AXIS_10_TVALID;
  wire [63:0]symb_mux_0_Tx_AXIS_11_TDATA;
  wire symb_mux_0_Tx_AXIS_11_TREADY;
  wire symb_mux_0_Tx_AXIS_11_TVALID;
  wire [63:0]symb_mux_0_Tx_AXIS_12_TDATA;
  wire symb_mux_0_Tx_AXIS_12_TREADY;
  wire symb_mux_0_Tx_AXIS_12_TVALID;
  wire [63:0]symb_mux_0_Tx_AXIS_13_TDATA;
  wire symb_mux_0_Tx_AXIS_13_TREADY;
  wire symb_mux_0_Tx_AXIS_13_TVALID;

  assign M_AXIS_0_00_tdata[63:0] = fifo_generator_0_M_AXIS_TDATA;
  assign M_AXIS_0_00_tvalid = fifo_generator_0_M_AXIS_TVALID;
  assign M_AXIS_0_01_tdata[63:0] = fifo_generator_1_M_AXIS_TDATA;
  assign M_AXIS_0_01_tvalid = fifo_generator_1_M_AXIS_TVALID;
  assign M_AXIS_0_02_tdata[63:0] = fifo_generator_2_M_AXIS_TDATA;
  assign M_AXIS_0_02_tvalid = fifo_generator_2_M_AXIS_TVALID;
  assign M_AXIS_0_03_tdata[63:0] = fifo_generator_3_M_AXIS_TDATA;
  assign M_AXIS_0_03_tvalid = fifo_generator_3_M_AXIS_TVALID;
  assign M_AXIS_0_04_tdata[63:0] = fifo_generator_4_M_AXIS_TDATA;
  assign M_AXIS_0_04_tvalid = fifo_generator_4_M_AXIS_TVALID;
  assign M_AXIS_0_05_tdata[63:0] = fifo_generator_5_M_AXIS_TDATA;
  assign M_AXIS_0_05_tvalid = fifo_generator_5_M_AXIS_TVALID;
  assign M_AXIS_0_06_tdata[63:0] = fifo_generator_6_M_AXIS_TDATA;
  assign M_AXIS_0_06_tvalid = fifo_generator_6_M_AXIS_TVALID;
  assign M_AXIS_0_07_tdata[63:0] = fifo_generator_7_M_AXIS_TDATA;
  assign M_AXIS_0_07_tvalid = fifo_generator_7_M_AXIS_TVALID;
  assign M_AXIS_0_08_tdata[63:0] = fifo_generator_8_M_AXIS_TDATA;
  assign M_AXIS_0_08_tvalid = fifo_generator_8_M_AXIS_TVALID;
  assign M_AXIS_0_09_tdata[63:0] = fifo_generator_9_M_AXIS_TDATA;
  assign M_AXIS_0_09_tvalid = fifo_generator_9_M_AXIS_TVALID;
  assign M_AXIS_0_10_tdata[63:0] = fifo_generator_10_M_AXIS_TDATA;
  assign M_AXIS_0_10_tvalid = fifo_generator_10_M_AXIS_TVALID;
  assign M_AXIS_0_11_tdata[63:0] = fifo_generator_11_M_AXIS_TDATA;
  assign M_AXIS_0_11_tvalid = fifo_generator_11_M_AXIS_TVALID;
  assign M_AXIS_0_12_tdata[63:0] = fifo_generator_12_M_AXIS_TDATA;
  assign M_AXIS_0_12_tvalid = fifo_generator_12_M_AXIS_TVALID;
  assign M_AXIS_0_13_tdata[63:0] = fifo_generator_13_M_AXIS_TDATA;
  assign M_AXIS_0_13_tvalid = fifo_generator_13_M_AXIS_TVALID;
  assign Rx_AXIS_0_00_tready = Rx_AXIS_0_0_1_TREADY;
  assign Rx_AXIS_0_0_1_TDATA = Rx_AXIS_0_00_tdata[63:0];
  assign Rx_AXIS_0_0_1_TLAST = Rx_AXIS_0_00_tlast;
  assign Rx_AXIS_0_0_1_TVALID = Rx_AXIS_0_00_tvalid;
  assign fifo_generator_0_M_AXIS_TREADY = M_AXIS_0_00_tready;
  assign fifo_generator_10_M_AXIS_TREADY = M_AXIS_0_10_tready;
  assign fifo_generator_11_M_AXIS_TREADY = M_AXIS_0_11_tready;
  assign fifo_generator_12_M_AXIS_TREADY = M_AXIS_0_12_tready;
  assign fifo_generator_13_M_AXIS_TREADY = M_AXIS_0_13_tready;
  assign fifo_generator_1_M_AXIS_TREADY = M_AXIS_0_01_tready;
  assign fifo_generator_2_M_AXIS_TREADY = M_AXIS_0_02_tready;
  assign fifo_generator_3_M_AXIS_TREADY = M_AXIS_0_03_tready;
  assign fifo_generator_4_M_AXIS_TREADY = M_AXIS_0_04_tready;
  assign fifo_generator_5_M_AXIS_TREADY = M_AXIS_0_05_tready;
  assign fifo_generator_6_M_AXIS_TREADY = M_AXIS_0_06_tready;
  assign fifo_generator_7_M_AXIS_TREADY = M_AXIS_0_07_tready;
  assign fifo_generator_8_M_AXIS_TREADY = M_AXIS_0_08_tready;
  assign fifo_generator_9_M_AXIS_TREADY = M_AXIS_0_09_tready;
  assign s_aclk_0_1 = s_aclk_0;
  assign s_aresetn_0_1 = s_aresetn_0;
  assign symbEn_0_1 = symbEn_0[13:0];
  symb_buffers_fifo_generator_0_0 fifo_generator_0
       (.m_axis_tdata(fifo_generator_0_M_AXIS_TDATA),
        .m_axis_tready(fifo_generator_0_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_0_M_AXIS_TVALID),
        .s_aclk(s_aclk_0_1),
        .s_aresetn(s_aresetn_0_1),
        .s_axis_tdata(symb_mux_0_Tx_AXIS_00_TDATA),
        .s_axis_tready(symb_mux_0_Tx_AXIS_00_TREADY),
        .s_axis_tvalid(symb_mux_0_Tx_AXIS_00_TVALID));
  symb_buffers_fifo_generator_0_1 fifo_generator_1
       (.m_axis_tdata(fifo_generator_1_M_AXIS_TDATA),
        .m_axis_tready(fifo_generator_1_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_1_M_AXIS_TVALID),
        .s_aclk(s_aclk_0_1),
        .s_aresetn(s_aresetn_0_1),
        .s_axis_tdata(symb_mux_0_Tx_AXIS_01_TDATA),
        .s_axis_tready(symb_mux_0_Tx_AXIS_01_TREADY),
        .s_axis_tvalid(symb_mux_0_Tx_AXIS_01_TVALID));
  symb_buffers_fifo_generator_8_1 fifo_generator_10
       (.m_axis_tdata(fifo_generator_10_M_AXIS_TDATA),
        .m_axis_tready(fifo_generator_10_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_10_M_AXIS_TVALID),
        .s_aclk(s_aclk_0_1),
        .s_aresetn(s_aresetn_0_1),
        .s_axis_tdata(symb_mux_0_Tx_AXIS_10_TDATA),
        .s_axis_tready(symb_mux_0_Tx_AXIS_10_TREADY),
        .s_axis_tvalid(symb_mux_0_Tx_AXIS_10_TVALID));
  symb_buffers_fifo_generator_8_2 fifo_generator_11
       (.m_axis_tdata(fifo_generator_11_M_AXIS_TDATA),
        .m_axis_tready(fifo_generator_11_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_11_M_AXIS_TVALID),
        .s_aclk(s_aclk_0_1),
        .s_aresetn(s_aresetn_0_1),
        .s_axis_tdata(symb_mux_0_Tx_AXIS_11_TDATA),
        .s_axis_tready(symb_mux_0_Tx_AXIS_11_TREADY),
        .s_axis_tvalid(symb_mux_0_Tx_AXIS_11_TVALID));
  symb_buffers_fifo_generator_8_3 fifo_generator_12
       (.m_axis_tdata(fifo_generator_12_M_AXIS_TDATA),
        .m_axis_tready(fifo_generator_12_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_12_M_AXIS_TVALID),
        .s_aclk(s_aclk_0_1),
        .s_aresetn(s_aresetn_0_1),
        .s_axis_tdata(symb_mux_0_Tx_AXIS_12_TDATA),
        .s_axis_tready(symb_mux_0_Tx_AXIS_12_TREADY),
        .s_axis_tvalid(symb_mux_0_Tx_AXIS_12_TVALID));
  symb_buffers_fifo_generator_8_4 fifo_generator_13
       (.m_axis_tdata(fifo_generator_13_M_AXIS_TDATA),
        .m_axis_tready(fifo_generator_13_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_13_M_AXIS_TVALID),
        .s_aclk(s_aclk_0_1),
        .s_aresetn(s_aresetn_0_1),
        .s_axis_tdata(symb_mux_0_Tx_AXIS_13_TDATA),
        .s_axis_tready(symb_mux_0_Tx_AXIS_13_TREADY),
        .s_axis_tvalid(symb_mux_0_Tx_AXIS_13_TVALID));
  symb_buffers_fifo_generator_1_0 fifo_generator_2
       (.m_axis_tdata(fifo_generator_2_M_AXIS_TDATA),
        .m_axis_tready(fifo_generator_2_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_2_M_AXIS_TVALID),
        .s_aclk(s_aclk_0_1),
        .s_aresetn(s_aresetn_0_1),
        .s_axis_tdata(symb_mux_0_Tx_AXIS_02_TDATA),
        .s_axis_tready(symb_mux_0_Tx_AXIS_02_TREADY),
        .s_axis_tvalid(symb_mux_0_Tx_AXIS_02_TVALID));
  symb_buffers_fifo_generator_2_0 fifo_generator_3
       (.m_axis_tdata(fifo_generator_3_M_AXIS_TDATA),
        .m_axis_tready(fifo_generator_3_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_3_M_AXIS_TVALID),
        .s_aclk(s_aclk_0_1),
        .s_aresetn(s_aresetn_0_1),
        .s_axis_tdata(symb_mux_0_Tx_AXIS_03_TDATA),
        .s_axis_tready(symb_mux_0_Tx_AXIS_03_TREADY),
        .s_axis_tvalid(symb_mux_0_Tx_AXIS_03_TVALID));
  symb_buffers_fifo_generator_3_0 fifo_generator_4
       (.m_axis_tdata(fifo_generator_4_M_AXIS_TDATA),
        .m_axis_tready(fifo_generator_4_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_4_M_AXIS_TVALID),
        .s_aclk(s_aclk_0_1),
        .s_aresetn(s_aresetn_0_1),
        .s_axis_tdata(symb_mux_0_Tx_AXIS_04_TDATA),
        .s_axis_tready(symb_mux_0_Tx_AXIS_04_TREADY),
        .s_axis_tvalid(symb_mux_0_Tx_AXIS_04_TVALID));
  symb_buffers_fifo_generator_4_0 fifo_generator_5
       (.m_axis_tdata(fifo_generator_5_M_AXIS_TDATA),
        .m_axis_tready(fifo_generator_5_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_5_M_AXIS_TVALID),
        .s_aclk(s_aclk_0_1),
        .s_aresetn(s_aresetn_0_1),
        .s_axis_tdata(symb_mux_0_Tx_AXIS_05_TDATA),
        .s_axis_tready(symb_mux_0_Tx_AXIS_05_TREADY),
        .s_axis_tvalid(symb_mux_0_Tx_AXIS_05_TVALID));
  symb_buffers_fifo_generator_5_0 fifo_generator_6
       (.m_axis_tdata(fifo_generator_6_M_AXIS_TDATA),
        .m_axis_tready(fifo_generator_6_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_6_M_AXIS_TVALID),
        .s_aclk(s_aclk_0_1),
        .s_aresetn(s_aresetn_0_1),
        .s_axis_tdata(symb_mux_0_Tx_AXIS_06_TDATA),
        .s_axis_tready(symb_mux_0_Tx_AXIS_06_TREADY),
        .s_axis_tvalid(symb_mux_0_Tx_AXIS_06_TVALID));
  symb_buffers_fifo_generator_6_0 fifo_generator_7
       (.m_axis_tdata(fifo_generator_7_M_AXIS_TDATA),
        .m_axis_tready(fifo_generator_7_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_7_M_AXIS_TVALID),
        .s_aclk(s_aclk_0_1),
        .s_aresetn(s_aresetn_0_1),
        .s_axis_tdata(symb_mux_0_Tx_AXIS_07_TDATA),
        .s_axis_tready(symb_mux_0_Tx_AXIS_07_TREADY),
        .s_axis_tvalid(symb_mux_0_Tx_AXIS_07_TVALID));
  symb_buffers_fifo_generator_7_0 fifo_generator_8
       (.m_axis_tdata(fifo_generator_8_M_AXIS_TDATA),
        .m_axis_tready(fifo_generator_8_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_8_M_AXIS_TVALID),
        .s_aclk(s_aclk_0_1),
        .s_aresetn(s_aresetn_0_1),
        .s_axis_tdata(symb_mux_0_Tx_AXIS_08_TDATA),
        .s_axis_tready(symb_mux_0_Tx_AXIS_08_TREADY),
        .s_axis_tvalid(symb_mux_0_Tx_AXIS_08_TVALID));
  symb_buffers_fifo_generator_8_0 fifo_generator_9
       (.m_axis_tdata(fifo_generator_9_M_AXIS_TDATA),
        .m_axis_tready(fifo_generator_9_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_9_M_AXIS_TVALID),
        .s_aclk(s_aclk_0_1),
        .s_aresetn(s_aresetn_0_1),
        .s_axis_tdata(symb_mux_0_Tx_AXIS_09_TDATA),
        .s_axis_tready(symb_mux_0_Tx_AXIS_09_TREADY),
        .s_axis_tvalid(symb_mux_0_Tx_AXIS_09_TVALID));
  symb_buffers_symb_mux_0_0 symb_mux_0
       (.Rx_AXIS_0_tdata(Rx_AXIS_0_0_1_TDATA),
        .Rx_AXIS_0_tlast(Rx_AXIS_0_0_1_TLAST),
        .Rx_AXIS_0_tready(Rx_AXIS_0_0_1_TREADY),
        .Rx_AXIS_0_tvalid(Rx_AXIS_0_0_1_TVALID),
        .Tx_AXIS_00_tdata(symb_mux_0_Tx_AXIS_00_TDATA),
        .Tx_AXIS_00_tready(symb_mux_0_Tx_AXIS_00_TREADY),
        .Tx_AXIS_00_tvalid(symb_mux_0_Tx_AXIS_00_TVALID),
        .Tx_AXIS_01_tdata(symb_mux_0_Tx_AXIS_01_TDATA),
        .Tx_AXIS_01_tready(symb_mux_0_Tx_AXIS_01_TREADY),
        .Tx_AXIS_01_tvalid(symb_mux_0_Tx_AXIS_01_TVALID),
        .Tx_AXIS_02_tdata(symb_mux_0_Tx_AXIS_02_TDATA),
        .Tx_AXIS_02_tready(symb_mux_0_Tx_AXIS_02_TREADY),
        .Tx_AXIS_02_tvalid(symb_mux_0_Tx_AXIS_02_TVALID),
        .Tx_AXIS_03_tdata(symb_mux_0_Tx_AXIS_03_TDATA),
        .Tx_AXIS_03_tready(symb_mux_0_Tx_AXIS_03_TREADY),
        .Tx_AXIS_03_tvalid(symb_mux_0_Tx_AXIS_03_TVALID),
        .Tx_AXIS_04_tdata(symb_mux_0_Tx_AXIS_04_TDATA),
        .Tx_AXIS_04_tready(symb_mux_0_Tx_AXIS_04_TREADY),
        .Tx_AXIS_04_tvalid(symb_mux_0_Tx_AXIS_04_TVALID),
        .Tx_AXIS_05_tdata(symb_mux_0_Tx_AXIS_05_TDATA),
        .Tx_AXIS_05_tready(symb_mux_0_Tx_AXIS_05_TREADY),
        .Tx_AXIS_05_tvalid(symb_mux_0_Tx_AXIS_05_TVALID),
        .Tx_AXIS_06_tdata(symb_mux_0_Tx_AXIS_06_TDATA),
        .Tx_AXIS_06_tready(symb_mux_0_Tx_AXIS_06_TREADY),
        .Tx_AXIS_06_tvalid(symb_mux_0_Tx_AXIS_06_TVALID),
        .Tx_AXIS_07_tdata(symb_mux_0_Tx_AXIS_07_TDATA),
        .Tx_AXIS_07_tready(symb_mux_0_Tx_AXIS_07_TREADY),
        .Tx_AXIS_07_tvalid(symb_mux_0_Tx_AXIS_07_TVALID),
        .Tx_AXIS_08_tdata(symb_mux_0_Tx_AXIS_08_TDATA),
        .Tx_AXIS_08_tready(symb_mux_0_Tx_AXIS_08_TREADY),
        .Tx_AXIS_08_tvalid(symb_mux_0_Tx_AXIS_08_TVALID),
        .Tx_AXIS_09_tdata(symb_mux_0_Tx_AXIS_09_TDATA),
        .Tx_AXIS_09_tready(symb_mux_0_Tx_AXIS_09_TREADY),
        .Tx_AXIS_09_tvalid(symb_mux_0_Tx_AXIS_09_TVALID),
        .Tx_AXIS_10_tdata(symb_mux_0_Tx_AXIS_10_TDATA),
        .Tx_AXIS_10_tready(symb_mux_0_Tx_AXIS_10_TREADY),
        .Tx_AXIS_10_tvalid(symb_mux_0_Tx_AXIS_10_TVALID),
        .Tx_AXIS_11_tdata(symb_mux_0_Tx_AXIS_11_TDATA),
        .Tx_AXIS_11_tready(symb_mux_0_Tx_AXIS_11_TREADY),
        .Tx_AXIS_11_tvalid(symb_mux_0_Tx_AXIS_11_TVALID),
        .Tx_AXIS_12_tdata(symb_mux_0_Tx_AXIS_12_TDATA),
        .Tx_AXIS_12_tready(symb_mux_0_Tx_AXIS_12_TREADY),
        .Tx_AXIS_12_tvalid(symb_mux_0_Tx_AXIS_12_TVALID),
        .Tx_AXIS_13_tdata(symb_mux_0_Tx_AXIS_13_TDATA),
        .Tx_AXIS_13_tready(symb_mux_0_Tx_AXIS_13_TREADY),
        .Tx_AXIS_13_tvalid(symb_mux_0_Tx_AXIS_13_TVALID),
        .clk(s_aclk_0_1),
        .rstn(s_aresetn_0_1),
        .symbEn(symbEn_0_1));
endmodule
