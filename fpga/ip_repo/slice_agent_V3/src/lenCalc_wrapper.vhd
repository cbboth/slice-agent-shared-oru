--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Sun Apr 14 02:08:20 2024
--Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
--Command     : generate_target lenCalc_wrapper.bd
--Design      : lenCalc_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity lenCalc_wrapper is
  port (
    clk : in STD_LOGIC;
    dataLen : out STD_LOGIC_VECTOR ( 15 downto 0 );
    iqWidth : in STD_LOGIC_VECTOR ( 5 downto 0 );
    minPRBSize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    nPRB : in STD_LOGIC_VECTOR ( 10 downto 0 );
    startByte : out STD_LOGIC_VECTOR ( 15 downto 0 );
    startPRB : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
end lenCalc_wrapper;

architecture STRUCTURE of lenCalc_wrapper is
  component lenCalc is
  port (
    clk : in STD_LOGIC;
    startPRB : in STD_LOGIC_VECTOR ( 10 downto 0 );
    startByte : out STD_LOGIC_VECTOR ( 15 downto 0 );
    minPRBSize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    iqWidth : in STD_LOGIC_VECTOR ( 5 downto 0 );
    nPRB : in STD_LOGIC_VECTOR ( 10 downto 0 );
    dataLen : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component lenCalc;
begin
lenCalc_i: component lenCalc
     port map (
      clk => clk,
      dataLen(15 downto 0) => dataLen(15 downto 0),
      iqWidth(5 downto 0) => iqWidth(5 downto 0),
      minPRBSize(1 downto 0) => minPRBSize(1 downto 0),
      nPRB(10 downto 0) => nPRB(10 downto 0),
      startByte(15 downto 0) => startByte(15 downto 0),
      startPRB(10 downto 0) => startPRB(10 downto 0)
    );
end STRUCTURE;
