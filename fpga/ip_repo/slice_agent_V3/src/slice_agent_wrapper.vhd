--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Thu Jun  6 19:50:03 2024
--Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
--Command     : generate_target slice_agent_wrapper.bd
--Design      : slice_agent_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity slice_agent_wrapper is
  port (
    M_AXIS_00_0_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_0_tlast : out STD_LOGIC;
    M_AXIS_00_0_tready : in STD_LOGIC;
    M_AXIS_00_0_tvalid : out STD_LOGIC;
    SLICEN1_AXIS_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLICEN1_AXIS_tlast : in STD_LOGIC;
    SLICEN1_AXIS_tready : out STD_LOGIC;
    SLICEN1_AXIS_tvalid : in STD_LOGIC;
    SLICEN_AXIS_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLICEN_AXIS_tlast : in STD_LOGIC;
    SLICEN_AXIS_tready : out STD_LOGIC;
    SLICEN_AXIS_tvalid : in STD_LOGIC;
    cfg_maxPRBPkt : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk : in STD_LOGIC;
    dbg_proc_begin_n : out STD_LOGIC;
    dbg_proc_begin_n1 : out STD_LOGIC;
    dbg_proc_ecpriId_n : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dbg_proc_ecpriId_n1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dbg_proc_end_n : out STD_LOGIC;
    dbg_proc_end_n1 : out STD_LOGIC;
    ejectBufs : in STD_LOGIC_VECTOR ( 13 downto 0 );
    empty_0 : out STD_LOGIC;
    nxt_frameId : in STD_LOGIC_VECTOR ( 7 downto 0 );
    nxt_slotID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    nxt_subframeID : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rstn : in STD_LOGIC;
    sel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    swap : in STD_LOGIC
  );
end slice_agent_wrapper;

architecture STRUCTURE of slice_agent_wrapper is
  component slice_agent is
  port (
    SLICEN_AXIS_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLICEN_AXIS_tlast : in STD_LOGIC;
    SLICEN_AXIS_tvalid : in STD_LOGIC;
    SLICEN_AXIS_tready : out STD_LOGIC;
    SLICEN1_AXIS_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    SLICEN1_AXIS_tlast : in STD_LOGIC;
    SLICEN1_AXIS_tvalid : in STD_LOGIC;
    SLICEN1_AXIS_tready : out STD_LOGIC;
    M_AXIS_00_0_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_0_tlast : out STD_LOGIC;
    M_AXIS_00_0_tvalid : out STD_LOGIC;
    M_AXIS_00_0_tready : in STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    ejectBufs : in STD_LOGIC_VECTOR ( 13 downto 0 );
    sel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    swap : in STD_LOGIC;
    empty_0 : out STD_LOGIC;
    dbg_proc_begin_n : out STD_LOGIC;
    dbg_proc_end_n : out STD_LOGIC;
    dbg_proc_ecpriId_n : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dbg_proc_begin_n1 : out STD_LOGIC;
    dbg_proc_end_n1 : out STD_LOGIC;
    dbg_proc_ecpriId_n1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_maxPRBPkt : in STD_LOGIC_VECTOR ( 15 downto 0 );
    nxt_subframeID : in STD_LOGIC_VECTOR ( 3 downto 0 );
    nxt_frameId : in STD_LOGIC_VECTOR ( 7 downto 0 );
    nxt_slotID : in STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  end component slice_agent;
begin
slice_agent_i: component slice_agent
     port map (
      M_AXIS_00_0_tdata(63 downto 0) => M_AXIS_00_0_tdata(63 downto 0),
      M_AXIS_00_0_tlast => M_AXIS_00_0_tlast,
      M_AXIS_00_0_tready => M_AXIS_00_0_tready,
      M_AXIS_00_0_tvalid => M_AXIS_00_0_tvalid,
      SLICEN1_AXIS_tdata(127 downto 0) => SLICEN1_AXIS_tdata(127 downto 0),
      SLICEN1_AXIS_tlast => SLICEN1_AXIS_tlast,
      SLICEN1_AXIS_tready => SLICEN1_AXIS_tready,
      SLICEN1_AXIS_tvalid => SLICEN1_AXIS_tvalid,
      SLICEN_AXIS_tdata(127 downto 0) => SLICEN_AXIS_tdata(127 downto 0),
      SLICEN_AXIS_tlast => SLICEN_AXIS_tlast,
      SLICEN_AXIS_tready => SLICEN_AXIS_tready,
      SLICEN_AXIS_tvalid => SLICEN_AXIS_tvalid,
      cfg_maxPRBPkt(15 downto 0) => cfg_maxPRBPkt(15 downto 0),
      clk => clk,
      dbg_proc_begin_n => dbg_proc_begin_n,
      dbg_proc_begin_n1 => dbg_proc_begin_n1,
      dbg_proc_ecpriId_n(15 downto 0) => dbg_proc_ecpriId_n(15 downto 0),
      dbg_proc_ecpriId_n1(15 downto 0) => dbg_proc_ecpriId_n1(15 downto 0),
      dbg_proc_end_n => dbg_proc_end_n,
      dbg_proc_end_n1 => dbg_proc_end_n1,
      ejectBufs(13 downto 0) => ejectBufs(13 downto 0),
      empty_0 => empty_0,
      nxt_frameId(7 downto 0) => nxt_frameId(7 downto 0),
      nxt_slotID(5 downto 0) => nxt_slotID(5 downto 0),
      nxt_subframeID(3 downto 0) => nxt_subframeID(3 downto 0),
      rstn => rstn,
      sel(3 downto 0) => sel(3 downto 0),
      swap => swap
    );
end STRUCTURE;
