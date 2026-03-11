//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Tue Mar  5 00:05:55 2024
//Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
//Command     : generate_target symb_fifo_wrapper.bd
//Design      : symb_fifo_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module symb_fifo_wrapper
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
  output [63:0]M_AXIS_0_tdata;
  input M_AXIS_0_tready;
  output M_AXIS_0_tvalid;
  input [63:0]S_AXIS_0_tdata;
  output [0:0]S_AXIS_0_tready;
  input [0:0]S_AXIS_0_tvalid;
  input [63:0]S_AXIS_1_tdata;
  output [0:0]S_AXIS_1_tready;
  input [0:0]S_AXIS_1_tvalid;
  input s_aclk;
  input s_aresetn;

  wire [63:0]M_AXIS_0_tdata;
  wire M_AXIS_0_tready;
  wire M_AXIS_0_tvalid;
  wire [63:0]S_AXIS_0_tdata;
  wire [0:0]S_AXIS_0_tready;
  wire [0:0]S_AXIS_0_tvalid;
  wire [63:0]S_AXIS_1_tdata;
  wire [0:0]S_AXIS_1_tready;
  wire [0:0]S_AXIS_1_tvalid;
  wire s_aclk;
  wire s_aresetn;

  symb_fifo symb_fifo_i
       (.M_AXIS_0_tdata(M_AXIS_0_tdata),
        .M_AXIS_0_tready(M_AXIS_0_tready),
        .M_AXIS_0_tvalid(M_AXIS_0_tvalid),
        .S_AXIS_0_tdata(S_AXIS_0_tdata),
        .S_AXIS_0_tready(S_AXIS_0_tready),
        .S_AXIS_0_tvalid(S_AXIS_0_tvalid),
        .S_AXIS_1_tdata(S_AXIS_1_tdata),
        .S_AXIS_1_tready(S_AXIS_1_tready),
        .S_AXIS_1_tvalid(S_AXIS_1_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn));
endmodule
