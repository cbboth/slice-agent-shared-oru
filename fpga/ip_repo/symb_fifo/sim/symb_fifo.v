//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Tue Mar  5 00:05:55 2024
//Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
//Command     : generate_target symb_fifo.bd
//Design      : symb_fifo
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module m00_couplers_imp_GINQ39
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tready,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tready,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [63:0]M_AXIS_tdata;
  input [0:0]M_AXIS_tready;
  output [0:0]M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [63:0]S_AXIS_tdata;
  output [0:0]S_AXIS_tready;
  input [0:0]S_AXIS_tvalid;

  wire [63:0]m00_couplers_to_m00_couplers_TDATA;
  wire [0:0]m00_couplers_to_m00_couplers_TREADY;
  wire [0:0]m00_couplers_to_m00_couplers_TVALID;

  assign M_AXIS_tdata[63:0] = m00_couplers_to_m00_couplers_TDATA;
  assign M_AXIS_tvalid[0] = m00_couplers_to_m00_couplers_TVALID;
  assign S_AXIS_tready[0] = m00_couplers_to_m00_couplers_TREADY;
  assign m00_couplers_to_m00_couplers_TDATA = S_AXIS_tdata[63:0];
  assign m00_couplers_to_m00_couplers_TREADY = M_AXIS_tready[0];
  assign m00_couplers_to_m00_couplers_TVALID = S_AXIS_tvalid[0];
endmodule

module s00_couplers_imp_19EJD6X
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tready,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tready,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [63:0]M_AXIS_tdata;
  input [0:0]M_AXIS_tready;
  output [0:0]M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [63:0]S_AXIS_tdata;
  output [0:0]S_AXIS_tready;
  input [0:0]S_AXIS_tvalid;

  wire [63:0]s00_couplers_to_s00_couplers_TDATA;
  wire [0:0]s00_couplers_to_s00_couplers_TREADY;
  wire [0:0]s00_couplers_to_s00_couplers_TVALID;

  assign M_AXIS_tdata[63:0] = s00_couplers_to_s00_couplers_TDATA;
  assign M_AXIS_tvalid[0] = s00_couplers_to_s00_couplers_TVALID;
  assign S_AXIS_tready[0] = s00_couplers_to_s00_couplers_TREADY;
  assign s00_couplers_to_s00_couplers_TDATA = S_AXIS_tdata[63:0];
  assign s00_couplers_to_s00_couplers_TREADY = M_AXIS_tready[0];
  assign s00_couplers_to_s00_couplers_TVALID = S_AXIS_tvalid[0];
endmodule

module s01_couplers_imp_W99HW1
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tready,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tready,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [63:0]M_AXIS_tdata;
  input [0:0]M_AXIS_tready;
  output [0:0]M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [63:0]S_AXIS_tdata;
  output [0:0]S_AXIS_tready;
  input [0:0]S_AXIS_tvalid;

  wire [63:0]s01_couplers_to_s01_couplers_TDATA;
  wire [0:0]s01_couplers_to_s01_couplers_TREADY;
  wire [0:0]s01_couplers_to_s01_couplers_TVALID;

  assign M_AXIS_tdata[63:0] = s01_couplers_to_s01_couplers_TDATA;
  assign M_AXIS_tvalid[0] = s01_couplers_to_s01_couplers_TVALID;
  assign S_AXIS_tready[0] = s01_couplers_to_s01_couplers_TREADY;
  assign s01_couplers_to_s01_couplers_TDATA = S_AXIS_tdata[63:0];
  assign s01_couplers_to_s01_couplers_TREADY = M_AXIS_tready[0];
  assign s01_couplers_to_s01_couplers_TVALID = S_AXIS_tvalid[0];
endmodule

(* CORE_GENERATION_INFO = "symb_fifo,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=symb_fifo,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=4,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=2,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "symb_fifo.hwdef" *) 
module symb_fifo
   (M_AXIS_0_tdata,
    M_AXIS_0_tready,
    M_AXIS_0_tvalid,
    S_AXIS_0_tdata,
    S_AXIS_0_tready,
    S_AXIS_0_tvalid,
    S_AXIS_1_tdata,
    S_AXIS_1_tready,
    S_AXIS_1_tvalid,
    s_aclk,
    s_aresetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0, CLK_DOMAIN symb_fifo_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0 TREADY" *) input M_AXIS_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0 TVALID" *) output M_AXIS_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_0, CLK_DOMAIN symb_fifo_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [63:0]S_AXIS_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0 TREADY" *) output [0:0]S_AXIS_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0 TVALID" *) input [0:0]S_AXIS_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_1, CLK_DOMAIN symb_fifo_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [63:0]S_AXIS_1_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1 TREADY" *) output [0:0]S_AXIS_1_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1 TVALID" *) input [0:0]S_AXIS_1_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.S_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.S_ACLK, ASSOCIATED_BUSIF M_AXIS_0:S_AXIS_0:S_AXIS_1, ASSOCIATED_RESET s_aresetn, CLK_DOMAIN symb_fifo_s_aclk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input s_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.S_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.S_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input s_aresetn;

  wire [63:0]S_AXIS_0_1_TDATA;
  wire [0:0]S_AXIS_0_1_TREADY;
  wire [0:0]S_AXIS_0_1_TVALID;
  wire [63:0]S_AXIS_1_1_TDATA;
  wire [0:0]S_AXIS_1_1_TREADY;
  wire [0:0]S_AXIS_1_1_TVALID;
  wire [63:0]axis_interconnect_0_M00_AXIS_TDATA;
  wire axis_interconnect_0_M00_AXIS_TREADY;
  wire [0:0]axis_interconnect_0_M00_AXIS_TVALID;
  wire [63:0]fifo_generator_0_M_AXIS_TDATA;
  wire fifo_generator_0_M_AXIS_TREADY;
  wire fifo_generator_0_M_AXIS_TVALID;
  wire rst_s_aclk_0_100M_peripheral_aresetn;
  wire s_aclk_0_1;

  assign M_AXIS_0_tdata[63:0] = fifo_generator_0_M_AXIS_TDATA;
  assign M_AXIS_0_tvalid = fifo_generator_0_M_AXIS_TVALID;
  assign S_AXIS_0_1_TDATA = S_AXIS_0_tdata[63:0];
  assign S_AXIS_0_1_TVALID = S_AXIS_0_tvalid[0];
  assign S_AXIS_0_tready[0] = S_AXIS_0_1_TREADY;
  assign S_AXIS_1_1_TDATA = S_AXIS_1_tdata[63:0];
  assign S_AXIS_1_1_TVALID = S_AXIS_1_tvalid[0];
  assign S_AXIS_1_tready[0] = S_AXIS_1_1_TREADY;
  assign fifo_generator_0_M_AXIS_TREADY = M_AXIS_0_tready;
  assign rst_s_aclk_0_100M_peripheral_aresetn = s_aresetn;
  assign s_aclk_0_1 = s_aclk;
  symb_fifo_axis_interconnect_0_0 axis_interconnect_0
       (.ACLK(s_aclk_0_1),
        .ARESETN(rst_s_aclk_0_100M_peripheral_aresetn),
        .M00_AXIS_ACLK(s_aclk_0_1),
        .M00_AXIS_ARESETN(rst_s_aclk_0_100M_peripheral_aresetn),
        .M00_AXIS_tdata(axis_interconnect_0_M00_AXIS_TDATA),
        .M00_AXIS_tready(axis_interconnect_0_M00_AXIS_TREADY),
        .M00_AXIS_tvalid(axis_interconnect_0_M00_AXIS_TVALID),
        .S00_ARB_REQ_SUPPRESS(1'b0),
        .S00_AXIS_ACLK(s_aclk_0_1),
        .S00_AXIS_ARESETN(rst_s_aclk_0_100M_peripheral_aresetn),
        .S00_AXIS_tdata(S_AXIS_0_1_TDATA),
        .S00_AXIS_tready(S_AXIS_0_1_TREADY),
        .S00_AXIS_tvalid(S_AXIS_0_1_TVALID),
        .S01_ARB_REQ_SUPPRESS(1'b0),
        .S01_AXIS_ACLK(s_aclk_0_1),
        .S01_AXIS_ARESETN(rst_s_aclk_0_100M_peripheral_aresetn),
        .S01_AXIS_tdata(S_AXIS_1_1_TDATA),
        .S01_AXIS_tready(S_AXIS_1_1_TREADY),
        .S01_AXIS_tvalid(S_AXIS_1_1_TVALID));
  symb_fifo_fifo_generator_0_0 fifo_generator_0
       (.m_axis_tdata(fifo_generator_0_M_AXIS_TDATA),
        .m_axis_tready(fifo_generator_0_M_AXIS_TREADY),
        .m_axis_tvalid(fifo_generator_0_M_AXIS_TVALID),
        .s_aclk(s_aclk_0_1),
        .s_aresetn(rst_s_aclk_0_100M_peripheral_aresetn),
        .s_axis_tdata(axis_interconnect_0_M00_AXIS_TDATA),
        .s_axis_tready(axis_interconnect_0_M00_AXIS_TREADY),
        .s_axis_tvalid(axis_interconnect_0_M00_AXIS_TVALID));
endmodule

module symb_fifo_axis_interconnect_0_0
   (ACLK,
    ARESETN,
    M00_AXIS_ACLK,
    M00_AXIS_ARESETN,
    M00_AXIS_tdata,
    M00_AXIS_tready,
    M00_AXIS_tvalid,
    S00_ARB_REQ_SUPPRESS,
    S00_AXIS_ACLK,
    S00_AXIS_ARESETN,
    S00_AXIS_tdata,
    S00_AXIS_tready,
    S00_AXIS_tvalid,
    S01_ARB_REQ_SUPPRESS,
    S01_AXIS_ACLK,
    S01_AXIS_ARESETN,
    S01_AXIS_tdata,
    S01_AXIS_tready,
    S01_AXIS_tvalid);
  input ACLK;
  input ARESETN;
  input M00_AXIS_ACLK;
  input M00_AXIS_ARESETN;
  output [63:0]M00_AXIS_tdata;
  input [0:0]M00_AXIS_tready;
  output [0:0]M00_AXIS_tvalid;
  input S00_ARB_REQ_SUPPRESS;
  input S00_AXIS_ACLK;
  input S00_AXIS_ARESETN;
  input [63:0]S00_AXIS_tdata;
  output [0:0]S00_AXIS_tready;
  input [0:0]S00_AXIS_tvalid;
  input S01_ARB_REQ_SUPPRESS;
  input S01_AXIS_ACLK;
  input S01_AXIS_ARESETN;
  input [63:0]S01_AXIS_tdata;
  output [0:0]S01_AXIS_tready;
  input [0:0]S01_AXIS_tvalid;

  wire axis_interconnect_0_ACLK_net;
  wire axis_interconnect_0_ARESETN_net;
  wire [63:0]axis_interconnect_0_to_s00_couplers_TDATA;
  wire [0:0]axis_interconnect_0_to_s00_couplers_TREADY;
  wire [0:0]axis_interconnect_0_to_s00_couplers_TVALID;
  wire [63:0]axis_interconnect_0_to_s01_couplers_TDATA;
  wire [0:0]axis_interconnect_0_to_s01_couplers_TREADY;
  wire [0:0]axis_interconnect_0_to_s01_couplers_TVALID;
  wire [63:0]m00_couplers_to_axis_interconnect_0_TDATA;
  wire [0:0]m00_couplers_to_axis_interconnect_0_TREADY;
  wire [0:0]m00_couplers_to_axis_interconnect_0_TVALID;
  wire s00_arb_req_suppress_to_s_arb_req_suppress_concat;
  wire [63:0]s00_couplers_to_xbar_TDATA;
  wire [0:0]s00_couplers_to_xbar_TREADY;
  wire [0:0]s00_couplers_to_xbar_TVALID;
  wire s01_arb_req_suppress_to_s_arb_req_suppress_concat;
  wire [63:0]s01_couplers_to_xbar_TDATA;
  wire [1:1]s01_couplers_to_xbar_TREADY;
  wire [0:0]s01_couplers_to_xbar_TVALID;
  wire [1:0]s_arb_req_suppress_concat_dout;
  wire [63:0]xbar_to_m00_couplers_TDATA;
  wire [0:0]xbar_to_m00_couplers_TREADY;
  wire [0:0]xbar_to_m00_couplers_TVALID;

  assign M00_AXIS_tdata[63:0] = m00_couplers_to_axis_interconnect_0_TDATA;
  assign M00_AXIS_tvalid[0] = m00_couplers_to_axis_interconnect_0_TVALID;
  assign S00_AXIS_tready[0] = axis_interconnect_0_to_s00_couplers_TREADY;
  assign S01_AXIS_tready[0] = axis_interconnect_0_to_s01_couplers_TREADY;
  assign axis_interconnect_0_ACLK_net = ACLK;
  assign axis_interconnect_0_ARESETN_net = ARESETN;
  assign axis_interconnect_0_to_s00_couplers_TDATA = S00_AXIS_tdata[63:0];
  assign axis_interconnect_0_to_s00_couplers_TVALID = S00_AXIS_tvalid[0];
  assign axis_interconnect_0_to_s01_couplers_TDATA = S01_AXIS_tdata[63:0];
  assign axis_interconnect_0_to_s01_couplers_TVALID = S01_AXIS_tvalid[0];
  assign m00_couplers_to_axis_interconnect_0_TREADY = M00_AXIS_tready[0];
  assign s00_arb_req_suppress_to_s_arb_req_suppress_concat = S00_ARB_REQ_SUPPRESS;
  assign s01_arb_req_suppress_to_s_arb_req_suppress_concat = S01_ARB_REQ_SUPPRESS;
  m00_couplers_imp_GINQ39 m00_couplers
       (.M_AXIS_ACLK(axis_interconnect_0_ACLK_net),
        .M_AXIS_ARESETN(axis_interconnect_0_ARESETN_net),
        .M_AXIS_tdata(m00_couplers_to_axis_interconnect_0_TDATA),
        .M_AXIS_tready(m00_couplers_to_axis_interconnect_0_TREADY),
        .M_AXIS_tvalid(m00_couplers_to_axis_interconnect_0_TVALID),
        .S_AXIS_ACLK(axis_interconnect_0_ACLK_net),
        .S_AXIS_ARESETN(axis_interconnect_0_ARESETN_net),
        .S_AXIS_tdata(xbar_to_m00_couplers_TDATA),
        .S_AXIS_tready(xbar_to_m00_couplers_TREADY),
        .S_AXIS_tvalid(xbar_to_m00_couplers_TVALID));
  s00_couplers_imp_19EJD6X s00_couplers
       (.M_AXIS_ACLK(axis_interconnect_0_ACLK_net),
        .M_AXIS_ARESETN(axis_interconnect_0_ARESETN_net),
        .M_AXIS_tdata(s00_couplers_to_xbar_TDATA),
        .M_AXIS_tready(s00_couplers_to_xbar_TREADY),
        .M_AXIS_tvalid(s00_couplers_to_xbar_TVALID),
        .S_AXIS_ACLK(axis_interconnect_0_ACLK_net),
        .S_AXIS_ARESETN(axis_interconnect_0_ARESETN_net),
        .S_AXIS_tdata(axis_interconnect_0_to_s00_couplers_TDATA),
        .S_AXIS_tready(axis_interconnect_0_to_s00_couplers_TREADY),
        .S_AXIS_tvalid(axis_interconnect_0_to_s00_couplers_TVALID));
  s01_couplers_imp_W99HW1 s01_couplers
       (.M_AXIS_ACLK(axis_interconnect_0_ACLK_net),
        .M_AXIS_ARESETN(axis_interconnect_0_ARESETN_net),
        .M_AXIS_tdata(s01_couplers_to_xbar_TDATA),
        .M_AXIS_tready(s01_couplers_to_xbar_TREADY),
        .M_AXIS_tvalid(s01_couplers_to_xbar_TVALID),
        .S_AXIS_ACLK(axis_interconnect_0_ACLK_net),
        .S_AXIS_ARESETN(axis_interconnect_0_ARESETN_net),
        .S_AXIS_tdata(axis_interconnect_0_to_s01_couplers_TDATA),
        .S_AXIS_tready(axis_interconnect_0_to_s01_couplers_TREADY),
        .S_AXIS_tvalid(axis_interconnect_0_to_s01_couplers_TVALID));
  symb_fifo_s_arb_req_suppress_concat_0 s_arb_req_suppress_concat
       (.In0(s00_arb_req_suppress_to_s_arb_req_suppress_concat),
        .In1(s01_arb_req_suppress_to_s_arb_req_suppress_concat),
        .dout(s_arb_req_suppress_concat_dout));
  symb_fifo_xbar_0 xbar
       (.aclk(axis_interconnect_0_ACLK_net),
        .aresetn(axis_interconnect_0_ARESETN_net),
        .m_axis_tdata(xbar_to_m00_couplers_TDATA),
        .m_axis_tready(xbar_to_m00_couplers_TREADY),
        .m_axis_tvalid(xbar_to_m00_couplers_TVALID),
        .s_axis_tdata({s01_couplers_to_xbar_TDATA,s00_couplers_to_xbar_TDATA}),
        .s_axis_tready({s01_couplers_to_xbar_TREADY,s00_couplers_to_xbar_TREADY}),
        .s_axis_tvalid({s01_couplers_to_xbar_TVALID,s00_couplers_to_xbar_TVALID}),
        .s_req_suppress(s_arb_req_suppress_concat_dout));
endmodule
