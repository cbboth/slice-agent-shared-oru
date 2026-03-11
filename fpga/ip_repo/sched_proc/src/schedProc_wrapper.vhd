--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Wed Mar 27 00:15:53 2024
--Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
--Command     : generate_target schedProc_wrapper.bd
--Design      : schedProc_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity schedProc_wrapper is
  port (
    A_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXIS_0_tlast : out STD_LOGIC;
    M_AXIS_0_tready : in STD_LOGIC;
    M_AXIS_0_tvalid : out STD_LOGIC;
    P_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    reset : in STD_LOGIC;
    s_aclk_0 : in STD_LOGIC;
    s_aresetn_0 : in STD_LOGIC;
    src_0_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    src_0_tlast : in STD_LOGIC;
    src_0_tready : out STD_LOGIC;
    src_0_tvalid : in STD_LOGIC
  );
end schedProc_wrapper;

architecture STRUCTURE of schedProc_wrapper is
  component schedProc is
  port (
    M_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXIS_0_tready : in STD_LOGIC;
    M_AXIS_0_tvalid : out STD_LOGIC;
    M_AXIS_0_tlast : out STD_LOGIC;
    src_0_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    src_0_tvalid : in STD_LOGIC;
    src_0_tready : out STD_LOGIC;
    src_0_tlast : in STD_LOGIC;
    s_aclk_0 : in STD_LOGIC;
    s_aresetn_0 : in STD_LOGIC;
    A_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    P_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    reset : in STD_LOGIC;
    B_0 : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component schedProc;
begin
schedProc_i: component schedProc
     port map (
      A_0(7 downto 0) => A_0(7 downto 0),
      B_0(7 downto 0) => B_0(7 downto 0),
      M_AXIS_0_tdata(127 downto 0) => M_AXIS_0_tdata(127 downto 0),
      M_AXIS_0_tlast => M_AXIS_0_tlast,
      M_AXIS_0_tready => M_AXIS_0_tready,
      M_AXIS_0_tvalid => M_AXIS_0_tvalid,
      P_0(15 downto 0) => P_0(15 downto 0),
      reset => reset,
      s_aclk_0 => s_aclk_0,
      s_aresetn_0 => s_aresetn_0,
      src_0_tdata(127 downto 0) => src_0_tdata(127 downto 0),
      src_0_tlast => src_0_tlast,
      src_0_tready => src_0_tready,
      src_0_tvalid => src_0_tvalid
    );
end STRUCTURE;
