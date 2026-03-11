--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Fri Apr 12 20:17:50 2024
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
    S_AXIS_0_0_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXIS_0_0_tlast : in STD_LOGIC;
    S_AXIS_0_0_tready : out STD_LOGIC;
    S_AXIS_0_0_tvalid : in STD_LOGIC;
    S_AXIS_0_1_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXIS_0_1_tlast : in STD_LOGIC;
    S_AXIS_0_1_tready : out STD_LOGIC;
    S_AXIS_0_1_tvalid : in STD_LOGIC;
    dbg_proc_begin_n : out STD_LOGIC;
    dbg_proc_begin_n1 : out STD_LOGIC;
    dbg_proc_ecpriId_n : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dbg_proc_ecpriId_n1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dbg_proc_end_n : out STD_LOGIC;
    dbg_proc_end_n1 : out STD_LOGIC;
    ejectBufs : in STD_LOGIC_VECTOR ( 13 downto 0 );
    empty_0 : out STD_LOGIC;
    frameId : in STD_LOGIC_VECTOR ( 7 downto 0 );
    mu : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_aclk_0_0 : in STD_LOGIC;
    s_aresetn_0_0 : in STD_LOGIC;
    s_start_0_0 : in STD_LOGIC;
    sel_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    slotID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    subframeID : in STD_LOGIC_VECTOR ( 3 downto 0 );
    swap_0 : in STD_LOGIC
  );
end slice_agent_wrapper;

architecture STRUCTURE of slice_agent_wrapper is
  component slice_agent is
  port (
    S_AXIS_0_0_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXIS_0_0_tlast : in STD_LOGIC;
    S_AXIS_0_0_tvalid : in STD_LOGIC;
    S_AXIS_0_0_tready : out STD_LOGIC;
    S_AXIS_0_1_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXIS_0_1_tlast : in STD_LOGIC;
    S_AXIS_0_1_tvalid : in STD_LOGIC;
    S_AXIS_0_1_tready : out STD_LOGIC;
    M_AXIS_00_0_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_0_tlast : out STD_LOGIC;
    M_AXIS_00_0_tvalid : out STD_LOGIC;
    M_AXIS_00_0_tready : in STD_LOGIC;
    s_aclk_0_0 : in STD_LOGIC;
    s_aresetn_0_0 : in STD_LOGIC;
    s_start_0_0 : in STD_LOGIC;
    ejectBufs : in STD_LOGIC_VECTOR ( 13 downto 0 );
    sel_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    swap_0 : in STD_LOGIC;
    mu : in STD_LOGIC_VECTOR ( 3 downto 0 );
    slotID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    subframeID : in STD_LOGIC_VECTOR ( 3 downto 0 );
    frameId : in STD_LOGIC_VECTOR ( 7 downto 0 );
    empty_0 : out STD_LOGIC;
    dbg_proc_begin_n : out STD_LOGIC;
    dbg_proc_end_n : out STD_LOGIC;
    dbg_proc_ecpriId_n : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dbg_proc_begin_n1 : out STD_LOGIC;
    dbg_proc_end_n1 : out STD_LOGIC;
    dbg_proc_ecpriId_n1 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component slice_agent;
begin
slice_agent_i: component slice_agent
     port map (
      M_AXIS_00_0_tdata(63 downto 0) => M_AXIS_00_0_tdata(63 downto 0),
      M_AXIS_00_0_tlast => M_AXIS_00_0_tlast,
      M_AXIS_00_0_tready => M_AXIS_00_0_tready,
      M_AXIS_00_0_tvalid => M_AXIS_00_0_tvalid,
      S_AXIS_0_0_tdata(127 downto 0) => S_AXIS_0_0_tdata(127 downto 0),
      S_AXIS_0_0_tlast => S_AXIS_0_0_tlast,
      S_AXIS_0_0_tready => S_AXIS_0_0_tready,
      S_AXIS_0_0_tvalid => S_AXIS_0_0_tvalid,
      S_AXIS_0_1_tdata(127 downto 0) => S_AXIS_0_1_tdata(127 downto 0),
      S_AXIS_0_1_tlast => S_AXIS_0_1_tlast,
      S_AXIS_0_1_tready => S_AXIS_0_1_tready,
      S_AXIS_0_1_tvalid => S_AXIS_0_1_tvalid,
      dbg_proc_begin_n => dbg_proc_begin_n,
      dbg_proc_begin_n1 => dbg_proc_begin_n1,
      dbg_proc_ecpriId_n(15 downto 0) => dbg_proc_ecpriId_n(15 downto 0),
      dbg_proc_ecpriId_n1(15 downto 0) => dbg_proc_ecpriId_n1(15 downto 0),
      dbg_proc_end_n => dbg_proc_end_n,
      dbg_proc_end_n1 => dbg_proc_end_n1,
      ejectBufs(13 downto 0) => ejectBufs(13 downto 0),
      empty_0 => empty_0,
      frameId(7 downto 0) => frameId(7 downto 0),
      mu(3 downto 0) => mu(3 downto 0),
      s_aclk_0_0 => s_aclk_0_0,
      s_aresetn_0_0 => s_aresetn_0_0,
      s_start_0_0 => s_start_0_0,
      sel_0(3 downto 0) => sel_0(3 downto 0),
      slotID(5 downto 0) => slotID(5 downto 0),
      subframeID(3 downto 0) => subframeID(3 downto 0),
      swap_0 => swap_0
    );
end STRUCTURE;
