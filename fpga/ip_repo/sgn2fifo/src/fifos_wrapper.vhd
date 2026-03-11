--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Thu Apr 18 21:40:22 2024
--Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
--Command     : generate_target fifos_wrapper.bd
--Design      : fifos_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifos_wrapper is
  port (
    cape_maxis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    cape_maxis_tready : in STD_LOGIC;
    cape_maxis_tvalid : out STD_LOGIC;
    cape_saxis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    cape_saxis_tready : out STD_LOGIC;
    cape_saxis_tvalid : in STD_LOGIC;
    caps_maxis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    caps_maxis_tready : in STD_LOGIC;
    caps_maxis_tvalid : out STD_LOGIC;
    caps_saxis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    caps_saxis_tready : out STD_LOGIC;
    caps_saxis_tvalid : in STD_LOGIC;
    clk : in STD_LOGIC;
    n1e_maxis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    n1e_maxis_tready : in STD_LOGIC;
    n1e_maxis_tvalid : out STD_LOGIC;
    n1e_saxis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    n1e_saxis_tready : out STD_LOGIC;
    n1e_saxis_tvalid : in STD_LOGIC;
    n1s_maxis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    n1s_maxis_tready : in STD_LOGIC;
    n1s_maxis_tvalid : out STD_LOGIC;
    n1s_saxis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    n1s_saxis_tready : out STD_LOGIC;
    n1s_saxis_tvalid : in STD_LOGIC;
    ne_maxis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    ne_maxis_tready : in STD_LOGIC;
    ne_maxis_tvalid : out STD_LOGIC;
    ne_saxis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    ne_saxis_tready : out STD_LOGIC;
    ne_saxis_tvalid : in STD_LOGIC;
    ns_maxis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    ns_maxis_tready : in STD_LOGIC;
    ns_maxis_tvalid : out STD_LOGIC;
    ns_saxis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    ns_saxis_tready : out STD_LOGIC;
    ns_saxis_tvalid : in STD_LOGIC;
    rec_maxis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rec_maxis_tready : in STD_LOGIC;
    rec_maxis_tvalid : out STD_LOGIC;
    rec_saxis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rec_saxis_tready : out STD_LOGIC;
    rec_saxis_tvalid : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
end fifos_wrapper;

architecture STRUCTURE of fifos_wrapper is
  component fifos is
  port (
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    rec_maxis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rec_maxis_tready : in STD_LOGIC;
    rec_maxis_tvalid : out STD_LOGIC;
    rec_saxis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rec_saxis_tready : out STD_LOGIC;
    rec_saxis_tvalid : in STD_LOGIC;
    ns_maxis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    ns_maxis_tready : in STD_LOGIC;
    ns_maxis_tvalid : out STD_LOGIC;
    ns_saxis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    ns_saxis_tready : out STD_LOGIC;
    ns_saxis_tvalid : in STD_LOGIC;
    caps_maxis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    caps_maxis_tready : in STD_LOGIC;
    caps_maxis_tvalid : out STD_LOGIC;
    caps_saxis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    caps_saxis_tready : out STD_LOGIC;
    caps_saxis_tvalid : in STD_LOGIC;
    cape_maxis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    cape_maxis_tready : in STD_LOGIC;
    cape_maxis_tvalid : out STD_LOGIC;
    cape_saxis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    cape_saxis_tready : out STD_LOGIC;
    cape_saxis_tvalid : in STD_LOGIC;
    n1e_maxis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    n1e_maxis_tready : in STD_LOGIC;
    n1e_maxis_tvalid : out STD_LOGIC;
    n1e_saxis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    n1e_saxis_tready : out STD_LOGIC;
    n1e_saxis_tvalid : in STD_LOGIC;
    n1s_maxis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    n1s_maxis_tready : in STD_LOGIC;
    n1s_maxis_tvalid : out STD_LOGIC;
    n1s_saxis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    n1s_saxis_tready : out STD_LOGIC;
    n1s_saxis_tvalid : in STD_LOGIC;
    ne_maxis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    ne_maxis_tready : in STD_LOGIC;
    ne_maxis_tvalid : out STD_LOGIC;
    ne_saxis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    ne_saxis_tready : out STD_LOGIC;
    ne_saxis_tvalid : in STD_LOGIC
  );
  end component fifos;
begin
fifos_i: component fifos
     port map (
      cape_maxis_tdata(63 downto 0) => cape_maxis_tdata(63 downto 0),
      cape_maxis_tready => cape_maxis_tready,
      cape_maxis_tvalid => cape_maxis_tvalid,
      cape_saxis_tdata(63 downto 0) => cape_saxis_tdata(63 downto 0),
      cape_saxis_tready => cape_saxis_tready,
      cape_saxis_tvalid => cape_saxis_tvalid,
      caps_maxis_tdata(63 downto 0) => caps_maxis_tdata(63 downto 0),
      caps_maxis_tready => caps_maxis_tready,
      caps_maxis_tvalid => caps_maxis_tvalid,
      caps_saxis_tdata(63 downto 0) => caps_saxis_tdata(63 downto 0),
      caps_saxis_tready => caps_saxis_tready,
      caps_saxis_tvalid => caps_saxis_tvalid,
      clk => clk,
      n1e_maxis_tdata(63 downto 0) => n1e_maxis_tdata(63 downto 0),
      n1e_maxis_tready => n1e_maxis_tready,
      n1e_maxis_tvalid => n1e_maxis_tvalid,
      n1e_saxis_tdata(63 downto 0) => n1e_saxis_tdata(63 downto 0),
      n1e_saxis_tready => n1e_saxis_tready,
      n1e_saxis_tvalid => n1e_saxis_tvalid,
      n1s_maxis_tdata(63 downto 0) => n1s_maxis_tdata(63 downto 0),
      n1s_maxis_tready => n1s_maxis_tready,
      n1s_maxis_tvalid => n1s_maxis_tvalid,
      n1s_saxis_tdata(63 downto 0) => n1s_saxis_tdata(63 downto 0),
      n1s_saxis_tready => n1s_saxis_tready,
      n1s_saxis_tvalid => n1s_saxis_tvalid,
      ne_maxis_tdata(63 downto 0) => ne_maxis_tdata(63 downto 0),
      ne_maxis_tready => ne_maxis_tready,
      ne_maxis_tvalid => ne_maxis_tvalid,
      ne_saxis_tdata(63 downto 0) => ne_saxis_tdata(63 downto 0),
      ne_saxis_tready => ne_saxis_tready,
      ne_saxis_tvalid => ne_saxis_tvalid,
      ns_maxis_tdata(63 downto 0) => ns_maxis_tdata(63 downto 0),
      ns_maxis_tready => ns_maxis_tready,
      ns_maxis_tvalid => ns_maxis_tvalid,
      ns_saxis_tdata(63 downto 0) => ns_saxis_tdata(63 downto 0),
      ns_saxis_tready => ns_saxis_tready,
      ns_saxis_tvalid => ns_saxis_tvalid,
      rec_maxis_tdata(63 downto 0) => rec_maxis_tdata(63 downto 0),
      rec_maxis_tready => rec_maxis_tready,
      rec_maxis_tvalid => rec_maxis_tvalid,
      rec_saxis_tdata(63 downto 0) => rec_saxis_tdata(63 downto 0),
      rec_saxis_tready => rec_saxis_tready,
      rec_saxis_tvalid => rec_saxis_tvalid,
      rstn => rstn
    );
end STRUCTURE;
