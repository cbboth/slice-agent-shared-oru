--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Tue Jun  4 21:31:02 2024
--Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
--Command     : generate_target doubleFIFO_wrapper.bd
--Design      : doubleFIFO_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity doubleFIFO_wrapper is
  port (
    M_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXIS_0_tready : in STD_LOGIC;
    M_AXIS_0_tvalid : out STD_LOGIC;
    M_AXIS_1_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXIS_1_tready : in STD_LOGIC;
    M_AXIS_1_tvalid : out STD_LOGIC;
    S_AXIS_0_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXIS_0_tready : out STD_LOGIC;
    S_AXIS_0_tvalid : in STD_LOGIC;
    S_AXIS_1_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXIS_1_tready : out STD_LOGIC;
    S_AXIS_1_tvalid : in STD_LOGIC;
    clk : in STD_LOGIC;
    fifo_cnt : out STD_LOGIC_VECTOR ( 11 downto 0 );
    rstn : in STD_LOGIC
  );
end doubleFIFO_wrapper;

architecture STRUCTURE of doubleFIFO_wrapper is
  component doubleFIFO is
  port (
    S_AXIS_0_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXIS_0_tready : out STD_LOGIC;
    S_AXIS_0_tvalid : in STD_LOGIC;
    S_AXIS_1_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXIS_1_tready : out STD_LOGIC;
    S_AXIS_1_tvalid : in STD_LOGIC;
    M_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXIS_0_tready : in STD_LOGIC;
    M_AXIS_0_tvalid : out STD_LOGIC;
    M_AXIS_1_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXIS_1_tready : in STD_LOGIC;
    M_AXIS_1_tvalid : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    fifo_cnt : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component doubleFIFO;
begin
doubleFIFO_i: component doubleFIFO
     port map (
      M_AXIS_0_tdata(127 downto 0) => M_AXIS_0_tdata(127 downto 0),
      M_AXIS_0_tready => M_AXIS_0_tready,
      M_AXIS_0_tvalid => M_AXIS_0_tvalid,
      M_AXIS_1_tdata(127 downto 0) => M_AXIS_1_tdata(127 downto 0),
      M_AXIS_1_tready => M_AXIS_1_tready,
      M_AXIS_1_tvalid => M_AXIS_1_tvalid,
      S_AXIS_0_tdata(127 downto 0) => S_AXIS_0_tdata(127 downto 0),
      S_AXIS_0_tready => S_AXIS_0_tready,
      S_AXIS_0_tvalid => S_AXIS_0_tvalid,
      S_AXIS_1_tdata(127 downto 0) => S_AXIS_1_tdata(127 downto 0),
      S_AXIS_1_tready => S_AXIS_1_tready,
      S_AXIS_1_tvalid => S_AXIS_1_tvalid,
      clk => clk,
      fifo_cnt(11 downto 0) => fifo_cnt(11 downto 0),
      rstn => rstn
    );
end STRUCTURE;
