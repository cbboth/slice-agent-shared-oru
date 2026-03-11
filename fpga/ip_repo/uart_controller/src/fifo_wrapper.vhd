--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Tue Apr  9 22:10:40 2024
--Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
--Command     : generate_target fifo_wrapper.bd
--Design      : fifo_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_wrapper is
  port (
    TX_M_AXIS_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    TX_M_AXIS_tready : in STD_LOGIC;
    TX_M_AXIS_tvalid : out STD_LOGIC;
    TX_S_AXIS_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    TX_S_AXIS_tready : out STD_LOGIC;
    TX_S_AXIS_tvalid : in STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
end fifo_wrapper;

architecture STRUCTURE of fifo_wrapper is
  component fifo is
  port (
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    TX_M_AXIS_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    TX_M_AXIS_tready : in STD_LOGIC;
    TX_M_AXIS_tvalid : out STD_LOGIC;
    TX_S_AXIS_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    TX_S_AXIS_tready : out STD_LOGIC;
    TX_S_AXIS_tvalid : in STD_LOGIC
  );
  end component fifo;
begin
fifo_i: component fifo
     port map (
      TX_M_AXIS_tdata(63 downto 0) => TX_M_AXIS_tdata(63 downto 0),
      TX_M_AXIS_tready => TX_M_AXIS_tready,
      TX_M_AXIS_tvalid => TX_M_AXIS_tvalid,
      TX_S_AXIS_tdata(63 downto 0) => TX_S_AXIS_tdata(63 downto 0),
      TX_S_AXIS_tready => TX_S_AXIS_tready,
      TX_S_AXIS_tvalid => TX_S_AXIS_tvalid,
      clk => clk,
      rstn => rstn
    );
end STRUCTURE;
