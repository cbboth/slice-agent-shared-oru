//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Thu Mar  7 21:22:30 2024
//Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
//Command     : generate_target symb_buffers_wrapper.bd
//Design      : symb_buffers_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module symb_buffers_wrapper
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
  output [63:0]M_AXIS_0_00_tdata;
  input M_AXIS_0_00_tready;
  output M_AXIS_0_00_tvalid;
  output [63:0]M_AXIS_0_01_tdata;
  input M_AXIS_0_01_tready;
  output M_AXIS_0_01_tvalid;
  output [63:0]M_AXIS_0_02_tdata;
  input M_AXIS_0_02_tready;
  output M_AXIS_0_02_tvalid;
  output [63:0]M_AXIS_0_03_tdata;
  input M_AXIS_0_03_tready;
  output M_AXIS_0_03_tvalid;
  output [63:0]M_AXIS_0_04_tdata;
  input M_AXIS_0_04_tready;
  output M_AXIS_0_04_tvalid;
  output [63:0]M_AXIS_0_05_tdata;
  input M_AXIS_0_05_tready;
  output M_AXIS_0_05_tvalid;
  output [63:0]M_AXIS_0_06_tdata;
  input M_AXIS_0_06_tready;
  output M_AXIS_0_06_tvalid;
  output [63:0]M_AXIS_0_07_tdata;
  input M_AXIS_0_07_tready;
  output M_AXIS_0_07_tvalid;
  output [63:0]M_AXIS_0_08_tdata;
  input M_AXIS_0_08_tready;
  output M_AXIS_0_08_tvalid;
  output [63:0]M_AXIS_0_09_tdata;
  input M_AXIS_0_09_tready;
  output M_AXIS_0_09_tvalid;
  output [63:0]M_AXIS_0_10_tdata;
  input M_AXIS_0_10_tready;
  output M_AXIS_0_10_tvalid;
  output [63:0]M_AXIS_0_11_tdata;
  input M_AXIS_0_11_tready;
  output M_AXIS_0_11_tvalid;
  output [63:0]M_AXIS_0_12_tdata;
  input M_AXIS_0_12_tready;
  output M_AXIS_0_12_tvalid;
  output [63:0]M_AXIS_0_13_tdata;
  input M_AXIS_0_13_tready;
  output M_AXIS_0_13_tvalid;
  input [63:0]Rx_AXIS_0_00_tdata;
  input Rx_AXIS_0_00_tlast;
  output Rx_AXIS_0_00_tready;
  input Rx_AXIS_0_00_tvalid;
  input s_aclk_0;
  input s_aresetn_0;
  input [13:0]symbEn_0;

  wire [63:0]M_AXIS_0_00_tdata;
  wire M_AXIS_0_00_tready;
  wire M_AXIS_0_00_tvalid;
  wire [63:0]M_AXIS_0_01_tdata;
  wire M_AXIS_0_01_tready;
  wire M_AXIS_0_01_tvalid;
  wire [63:0]M_AXIS_0_02_tdata;
  wire M_AXIS_0_02_tready;
  wire M_AXIS_0_02_tvalid;
  wire [63:0]M_AXIS_0_03_tdata;
  wire M_AXIS_0_03_tready;
  wire M_AXIS_0_03_tvalid;
  wire [63:0]M_AXIS_0_04_tdata;
  wire M_AXIS_0_04_tready;
  wire M_AXIS_0_04_tvalid;
  wire [63:0]M_AXIS_0_05_tdata;
  wire M_AXIS_0_05_tready;
  wire M_AXIS_0_05_tvalid;
  wire [63:0]M_AXIS_0_06_tdata;
  wire M_AXIS_0_06_tready;
  wire M_AXIS_0_06_tvalid;
  wire [63:0]M_AXIS_0_07_tdata;
  wire M_AXIS_0_07_tready;
  wire M_AXIS_0_07_tvalid;
  wire [63:0]M_AXIS_0_08_tdata;
  wire M_AXIS_0_08_tready;
  wire M_AXIS_0_08_tvalid;
  wire [63:0]M_AXIS_0_09_tdata;
  wire M_AXIS_0_09_tready;
  wire M_AXIS_0_09_tvalid;
  wire [63:0]M_AXIS_0_10_tdata;
  wire M_AXIS_0_10_tready;
  wire M_AXIS_0_10_tvalid;
  wire [63:0]M_AXIS_0_11_tdata;
  wire M_AXIS_0_11_tready;
  wire M_AXIS_0_11_tvalid;
  wire [63:0]M_AXIS_0_12_tdata;
  wire M_AXIS_0_12_tready;
  wire M_AXIS_0_12_tvalid;
  wire [63:0]M_AXIS_0_13_tdata;
  wire M_AXIS_0_13_tready;
  wire M_AXIS_0_13_tvalid;
  wire [63:0]Rx_AXIS_0_00_tdata;
  wire Rx_AXIS_0_00_tlast;
  wire Rx_AXIS_0_00_tready;
  wire Rx_AXIS_0_00_tvalid;
  wire s_aclk_0;
  wire s_aresetn_0;
  wire [13:0]symbEn_0;

  symb_buffers symb_buffers_i
       (.M_AXIS_0_00_tdata(M_AXIS_0_00_tdata),
        .M_AXIS_0_00_tready(M_AXIS_0_00_tready),
        .M_AXIS_0_00_tvalid(M_AXIS_0_00_tvalid),
        .M_AXIS_0_01_tdata(M_AXIS_0_01_tdata),
        .M_AXIS_0_01_tready(M_AXIS_0_01_tready),
        .M_AXIS_0_01_tvalid(M_AXIS_0_01_tvalid),
        .M_AXIS_0_02_tdata(M_AXIS_0_02_tdata),
        .M_AXIS_0_02_tready(M_AXIS_0_02_tready),
        .M_AXIS_0_02_tvalid(M_AXIS_0_02_tvalid),
        .M_AXIS_0_03_tdata(M_AXIS_0_03_tdata),
        .M_AXIS_0_03_tready(M_AXIS_0_03_tready),
        .M_AXIS_0_03_tvalid(M_AXIS_0_03_tvalid),
        .M_AXIS_0_04_tdata(M_AXIS_0_04_tdata),
        .M_AXIS_0_04_tready(M_AXIS_0_04_tready),
        .M_AXIS_0_04_tvalid(M_AXIS_0_04_tvalid),
        .M_AXIS_0_05_tdata(M_AXIS_0_05_tdata),
        .M_AXIS_0_05_tready(M_AXIS_0_05_tready),
        .M_AXIS_0_05_tvalid(M_AXIS_0_05_tvalid),
        .M_AXIS_0_06_tdata(M_AXIS_0_06_tdata),
        .M_AXIS_0_06_tready(M_AXIS_0_06_tready),
        .M_AXIS_0_06_tvalid(M_AXIS_0_06_tvalid),
        .M_AXIS_0_07_tdata(M_AXIS_0_07_tdata),
        .M_AXIS_0_07_tready(M_AXIS_0_07_tready),
        .M_AXIS_0_07_tvalid(M_AXIS_0_07_tvalid),
        .M_AXIS_0_08_tdata(M_AXIS_0_08_tdata),
        .M_AXIS_0_08_tready(M_AXIS_0_08_tready),
        .M_AXIS_0_08_tvalid(M_AXIS_0_08_tvalid),
        .M_AXIS_0_09_tdata(M_AXIS_0_09_tdata),
        .M_AXIS_0_09_tready(M_AXIS_0_09_tready),
        .M_AXIS_0_09_tvalid(M_AXIS_0_09_tvalid),
        .M_AXIS_0_10_tdata(M_AXIS_0_10_tdata),
        .M_AXIS_0_10_tready(M_AXIS_0_10_tready),
        .M_AXIS_0_10_tvalid(M_AXIS_0_10_tvalid),
        .M_AXIS_0_11_tdata(M_AXIS_0_11_tdata),
        .M_AXIS_0_11_tready(M_AXIS_0_11_tready),
        .M_AXIS_0_11_tvalid(M_AXIS_0_11_tvalid),
        .M_AXIS_0_12_tdata(M_AXIS_0_12_tdata),
        .M_AXIS_0_12_tready(M_AXIS_0_12_tready),
        .M_AXIS_0_12_tvalid(M_AXIS_0_12_tvalid),
        .M_AXIS_0_13_tdata(M_AXIS_0_13_tdata),
        .M_AXIS_0_13_tready(M_AXIS_0_13_tready),
        .M_AXIS_0_13_tvalid(M_AXIS_0_13_tvalid),
        .Rx_AXIS_0_00_tdata(Rx_AXIS_0_00_tdata),
        .Rx_AXIS_0_00_tlast(Rx_AXIS_0_00_tlast),
        .Rx_AXIS_0_00_tready(Rx_AXIS_0_00_tready),
        .Rx_AXIS_0_00_tvalid(Rx_AXIS_0_00_tvalid),
        .s_aclk_0(s_aclk_0),
        .s_aresetn_0(s_aresetn_0),
        .symbEn_0(symbEn_0));
endmodule
