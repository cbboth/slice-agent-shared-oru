--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Tue Mar 26 00:16:50 2024
--Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
--Command     : generate_target symb_buffers_wrapper.bd
--Design      : symb_buffers_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity symb_buffers_wrapper is
  port (
    M_AXIS_0_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_00_tlast : out STD_LOGIC;
    M_AXIS_0_00_tready : in STD_LOGIC;
    M_AXIS_0_00_tvalid : out STD_LOGIC;
    M_AXIS_0_01_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_01_tlast : out STD_LOGIC;
    M_AXIS_0_01_tready : in STD_LOGIC;
    M_AXIS_0_01_tvalid : out STD_LOGIC;
    M_AXIS_0_02_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_02_tlast : out STD_LOGIC;
    M_AXIS_0_02_tready : in STD_LOGIC;
    M_AXIS_0_02_tvalid : out STD_LOGIC;
    M_AXIS_0_03_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_03_tlast : out STD_LOGIC;
    M_AXIS_0_03_tready : in STD_LOGIC;
    M_AXIS_0_03_tvalid : out STD_LOGIC;
    M_AXIS_0_04_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_04_tlast : out STD_LOGIC;
    M_AXIS_0_04_tready : in STD_LOGIC;
    M_AXIS_0_04_tvalid : out STD_LOGIC;
    M_AXIS_0_05_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_05_tlast : out STD_LOGIC;
    M_AXIS_0_05_tready : in STD_LOGIC;
    M_AXIS_0_05_tvalid : out STD_LOGIC;
    M_AXIS_0_06_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_06_tlast : out STD_LOGIC;
    M_AXIS_0_06_tready : in STD_LOGIC;
    M_AXIS_0_06_tvalid : out STD_LOGIC;
    M_AXIS_0_07_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_07_tlast : out STD_LOGIC;
    M_AXIS_0_07_tready : in STD_LOGIC;
    M_AXIS_0_07_tvalid : out STD_LOGIC;
    M_AXIS_0_08_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_08_tlast : out STD_LOGIC;
    M_AXIS_0_08_tready : in STD_LOGIC;
    M_AXIS_0_08_tvalid : out STD_LOGIC;
    M_AXIS_0_09_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_09_tlast : out STD_LOGIC;
    M_AXIS_0_09_tready : in STD_LOGIC;
    M_AXIS_0_09_tvalid : out STD_LOGIC;
    M_AXIS_0_10_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_10_tlast : out STD_LOGIC;
    M_AXIS_0_10_tready : in STD_LOGIC;
    M_AXIS_0_10_tvalid : out STD_LOGIC;
    M_AXIS_0_11_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_11_tlast : out STD_LOGIC;
    M_AXIS_0_11_tready : in STD_LOGIC;
    M_AXIS_0_11_tvalid : out STD_LOGIC;
    M_AXIS_0_12_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_12_tlast : out STD_LOGIC;
    M_AXIS_0_12_tready : in STD_LOGIC;
    M_AXIS_0_12_tvalid : out STD_LOGIC;
    M_AXIS_0_13_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_13_tlast : out STD_LOGIC;
    M_AXIS_0_13_tready : in STD_LOGIC;
    M_AXIS_0_13_tvalid : out STD_LOGIC;
    Rx_AXIS_0_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    Rx_AXIS_0_00_tlast : in STD_LOGIC;
    Rx_AXIS_0_00_tready : out STD_LOGIC;
    Rx_AXIS_0_00_tvalid : in STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    symbEn_0 : in STD_LOGIC_VECTOR ( 13 downto 0 )
  );
end symb_buffers_wrapper;

architecture STRUCTURE of symb_buffers_wrapper is
  component symb_buffers is
  port (
    M_AXIS_0_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_00_tvalid : out STD_LOGIC;
    M_AXIS_0_00_tready : in STD_LOGIC;
    M_AXIS_0_00_tlast : out STD_LOGIC;
    M_AXIS_0_01_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_01_tvalid : out STD_LOGIC;
    M_AXIS_0_01_tready : in STD_LOGIC;
    M_AXIS_0_01_tlast : out STD_LOGIC;
    M_AXIS_0_02_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_02_tvalid : out STD_LOGIC;
    M_AXIS_0_02_tready : in STD_LOGIC;
    M_AXIS_0_02_tlast : out STD_LOGIC;
    M_AXIS_0_03_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_03_tvalid : out STD_LOGIC;
    M_AXIS_0_03_tready : in STD_LOGIC;
    M_AXIS_0_03_tlast : out STD_LOGIC;
    M_AXIS_0_04_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_04_tvalid : out STD_LOGIC;
    M_AXIS_0_04_tready : in STD_LOGIC;
    M_AXIS_0_04_tlast : out STD_LOGIC;
    M_AXIS_0_05_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_05_tvalid : out STD_LOGIC;
    M_AXIS_0_05_tready : in STD_LOGIC;
    M_AXIS_0_05_tlast : out STD_LOGIC;
    M_AXIS_0_06_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_06_tvalid : out STD_LOGIC;
    M_AXIS_0_06_tready : in STD_LOGIC;
    M_AXIS_0_06_tlast : out STD_LOGIC;
    M_AXIS_0_07_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_07_tvalid : out STD_LOGIC;
    M_AXIS_0_07_tready : in STD_LOGIC;
    M_AXIS_0_07_tlast : out STD_LOGIC;
    M_AXIS_0_08_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_08_tvalid : out STD_LOGIC;
    M_AXIS_0_08_tready : in STD_LOGIC;
    M_AXIS_0_08_tlast : out STD_LOGIC;
    M_AXIS_0_09_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_09_tvalid : out STD_LOGIC;
    M_AXIS_0_09_tready : in STD_LOGIC;
    M_AXIS_0_09_tlast : out STD_LOGIC;
    M_AXIS_0_10_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_10_tvalid : out STD_LOGIC;
    M_AXIS_0_10_tready : in STD_LOGIC;
    M_AXIS_0_10_tlast : out STD_LOGIC;
    M_AXIS_0_11_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_11_tvalid : out STD_LOGIC;
    M_AXIS_0_11_tready : in STD_LOGIC;
    M_AXIS_0_11_tlast : out STD_LOGIC;
    M_AXIS_0_12_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_12_tvalid : out STD_LOGIC;
    M_AXIS_0_12_tready : in STD_LOGIC;
    M_AXIS_0_12_tlast : out STD_LOGIC;
    M_AXIS_0_13_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_13_tvalid : out STD_LOGIC;
    M_AXIS_0_13_tready : in STD_LOGIC;
    M_AXIS_0_13_tlast : out STD_LOGIC;
    Rx_AXIS_0_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    Rx_AXIS_0_00_tlast : in STD_LOGIC;
    Rx_AXIS_0_00_tvalid : in STD_LOGIC;
    Rx_AXIS_0_00_tready : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    symbEn_0 : in STD_LOGIC_VECTOR ( 13 downto 0 )
  );
  end component symb_buffers;
begin
symb_buffers_i: component symb_buffers
     port map (
      M_AXIS_0_00_tdata(63 downto 0) => M_AXIS_0_00_tdata(63 downto 0),
      M_AXIS_0_00_tlast => M_AXIS_0_00_tlast,
      M_AXIS_0_00_tready => M_AXIS_0_00_tready,
      M_AXIS_0_00_tvalid => M_AXIS_0_00_tvalid,
      M_AXIS_0_01_tdata(63 downto 0) => M_AXIS_0_01_tdata(63 downto 0),
      M_AXIS_0_01_tlast => M_AXIS_0_01_tlast,
      M_AXIS_0_01_tready => M_AXIS_0_01_tready,
      M_AXIS_0_01_tvalid => M_AXIS_0_01_tvalid,
      M_AXIS_0_02_tdata(63 downto 0) => M_AXIS_0_02_tdata(63 downto 0),
      M_AXIS_0_02_tlast => M_AXIS_0_02_tlast,
      M_AXIS_0_02_tready => M_AXIS_0_02_tready,
      M_AXIS_0_02_tvalid => M_AXIS_0_02_tvalid,
      M_AXIS_0_03_tdata(63 downto 0) => M_AXIS_0_03_tdata(63 downto 0),
      M_AXIS_0_03_tlast => M_AXIS_0_03_tlast,
      M_AXIS_0_03_tready => M_AXIS_0_03_tready,
      M_AXIS_0_03_tvalid => M_AXIS_0_03_tvalid,
      M_AXIS_0_04_tdata(63 downto 0) => M_AXIS_0_04_tdata(63 downto 0),
      M_AXIS_0_04_tlast => M_AXIS_0_04_tlast,
      M_AXIS_0_04_tready => M_AXIS_0_04_tready,
      M_AXIS_0_04_tvalid => M_AXIS_0_04_tvalid,
      M_AXIS_0_05_tdata(63 downto 0) => M_AXIS_0_05_tdata(63 downto 0),
      M_AXIS_0_05_tlast => M_AXIS_0_05_tlast,
      M_AXIS_0_05_tready => M_AXIS_0_05_tready,
      M_AXIS_0_05_tvalid => M_AXIS_0_05_tvalid,
      M_AXIS_0_06_tdata(63 downto 0) => M_AXIS_0_06_tdata(63 downto 0),
      M_AXIS_0_06_tlast => M_AXIS_0_06_tlast,
      M_AXIS_0_06_tready => M_AXIS_0_06_tready,
      M_AXIS_0_06_tvalid => M_AXIS_0_06_tvalid,
      M_AXIS_0_07_tdata(63 downto 0) => M_AXIS_0_07_tdata(63 downto 0),
      M_AXIS_0_07_tlast => M_AXIS_0_07_tlast,
      M_AXIS_0_07_tready => M_AXIS_0_07_tready,
      M_AXIS_0_07_tvalid => M_AXIS_0_07_tvalid,
      M_AXIS_0_08_tdata(63 downto 0) => M_AXIS_0_08_tdata(63 downto 0),
      M_AXIS_0_08_tlast => M_AXIS_0_08_tlast,
      M_AXIS_0_08_tready => M_AXIS_0_08_tready,
      M_AXIS_0_08_tvalid => M_AXIS_0_08_tvalid,
      M_AXIS_0_09_tdata(63 downto 0) => M_AXIS_0_09_tdata(63 downto 0),
      M_AXIS_0_09_tlast => M_AXIS_0_09_tlast,
      M_AXIS_0_09_tready => M_AXIS_0_09_tready,
      M_AXIS_0_09_tvalid => M_AXIS_0_09_tvalid,
      M_AXIS_0_10_tdata(63 downto 0) => M_AXIS_0_10_tdata(63 downto 0),
      M_AXIS_0_10_tlast => M_AXIS_0_10_tlast,
      M_AXIS_0_10_tready => M_AXIS_0_10_tready,
      M_AXIS_0_10_tvalid => M_AXIS_0_10_tvalid,
      M_AXIS_0_11_tdata(63 downto 0) => M_AXIS_0_11_tdata(63 downto 0),
      M_AXIS_0_11_tlast => M_AXIS_0_11_tlast,
      M_AXIS_0_11_tready => M_AXIS_0_11_tready,
      M_AXIS_0_11_tvalid => M_AXIS_0_11_tvalid,
      M_AXIS_0_12_tdata(63 downto 0) => M_AXIS_0_12_tdata(63 downto 0),
      M_AXIS_0_12_tlast => M_AXIS_0_12_tlast,
      M_AXIS_0_12_tready => M_AXIS_0_12_tready,
      M_AXIS_0_12_tvalid => M_AXIS_0_12_tvalid,
      M_AXIS_0_13_tdata(63 downto 0) => M_AXIS_0_13_tdata(63 downto 0),
      M_AXIS_0_13_tlast => M_AXIS_0_13_tlast,
      M_AXIS_0_13_tready => M_AXIS_0_13_tready,
      M_AXIS_0_13_tvalid => M_AXIS_0_13_tvalid,
      Rx_AXIS_0_00_tdata(63 downto 0) => Rx_AXIS_0_00_tdata(63 downto 0),
      Rx_AXIS_0_00_tlast => Rx_AXIS_0_00_tlast,
      Rx_AXIS_0_00_tready => Rx_AXIS_0_00_tready,
      Rx_AXIS_0_00_tvalid => Rx_AXIS_0_00_tvalid,
      clk => clk,
      rstn => rstn,
      symbEn_0(13 downto 0) => symbEn_0(13 downto 0)
    );
end STRUCTURE;
