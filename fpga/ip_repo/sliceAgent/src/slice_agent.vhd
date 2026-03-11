--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Fri Apr 12 20:17:50 2024
--Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
--Command     : generate_target slice_agent.bd
--Design      : slice_agent
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_01_imp_1KSWB0B is
  port (
    eject : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tlast : out STD_LOGIC;
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tlast : in STD_LOGIC;
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    swap : in STD_LOGIC
  );
end double_buffer_01_imp_1KSWB0B;

architecture STRUCTURE of double_buffer_01_imp_1KSWB0B is
  component slice_agent_axi_double_buff_0_15 is
  port (
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    m_y_tlast : out STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    s_y_tlast : in STD_LOGIC;
    m_A1_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A1_tready : in STD_LOGIC;
    m_A1_tvalid : out STD_LOGIC;
    m_A1_tlast : out STD_LOGIC;
    s_A1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A1_tready : out STD_LOGIC;
    s_A1_tvalid : in STD_LOGIC;
    s_A1_tlast : in STD_LOGIC;
    m_A2_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A2_tready : in STD_LOGIC;
    m_A2_tvalid : out STD_LOGIC;
    m_A2_tlast : out STD_LOGIC;
    s_A2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A2_tready : out STD_LOGIC;
    s_A2_tvalid : in STD_LOGIC;
    s_A2_tlast : in STD_LOGIC;
    swap : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    empty_A1 : in STD_LOGIC;
    empty_A2 : in STD_LOGIC;
    eject : in STD_LOGIC;
    eject_A1 : out STD_LOGIC;
    eject_A2 : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
  end component slice_agent_axi_double_buff_0_15;
  component slice_agent_prb_sort_v1_1_0_2 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_0_2;
  component slice_agent_prb_sort_v1_1_1_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_1_0;
  signal axi_double_buff_0_eject_A1 : STD_LOGIC;
  signal axi_double_buff_0_eject_A2 : STD_LOGIC;
  signal axi_double_buff_0_empty_y : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A1_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A2_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_y_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_y_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_y_TVALID : STD_LOGIC;
  signal eject_1 : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_0_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_0_empty : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_1_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_1_empty : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED : STD_LOGIC;
  signal NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED : STD_LOGIC;
begin
  axi_double_buff_0_m_y_TREADY <= m_y_tready;
  eject_1 <= eject;
  empty_y <= axi_double_buff_0_empty_y;
  m_y_tdata(63 downto 0) <= axi_double_buff_0_m_y_TDATA(63 downto 0);
  m_y_tlast <= axi_double_buff_0_m_y_TLAST;
  m_y_tvalid <= axi_double_buff_0_m_y_TVALID;
  s_aclk_0_0_1 <= s_aclk;
  s_aresetn_0_0_1 <= s_aresetn;
  s_y_1_TDATA(63 downto 0) <= s_y_tdata(63 downto 0);
  s_y_1_TLAST <= s_y_tlast;
  s_y_1_TVALID <= s_y_tvalid;
  s_y_tready <= s_y_1_TREADY;
  swap_0_1 <= swap;
axi_double_buff_0: component slice_agent_axi_double_buff_0_15
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => axi_double_buff_0_eject_A1,
      eject_A2 => axi_double_buff_0_eject_A2,
      empty_A1 => prb_sort_v1_1_1_empty,
      empty_A2 => prb_sort_v1_1_0_empty,
      empty_y => axi_double_buff_0_empty_y,
      m_A1_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      m_A1_tlast => axi_double_buff_0_m_A1_TLAST,
      m_A1_tready => axi_double_buff_0_m_A1_TREADY,
      m_A1_tvalid => axi_double_buff_0_m_A1_TVALID,
      m_A2_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      m_A2_tlast => axi_double_buff_0_m_A2_TLAST,
      m_A2_tready => axi_double_buff_0_m_A2_TREADY,
      m_A2_tvalid => axi_double_buff_0_m_A2_TVALID,
      m_y_tdata(63 downto 0) => axi_double_buff_0_m_y_TDATA(63 downto 0),
      m_y_tlast => axi_double_buff_0_m_y_TLAST,
      m_y_tready => axi_double_buff_0_m_y_TREADY,
      m_y_tvalid => axi_double_buff_0_m_y_TVALID,
      rstn => s_aresetn_0_0_1,
      s_A1_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      s_A1_tlast => prb_sort_v1_1_1_dest_TLAST,
      s_A1_tready => prb_sort_v1_1_1_dest_TREADY,
      s_A1_tvalid => prb_sort_v1_1_1_dest_TVALID,
      s_A2_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      s_A2_tlast => prb_sort_v1_1_0_dest_TLAST,
      s_A2_tready => prb_sort_v1_1_0_dest_TREADY,
      s_A2_tvalid => prb_sort_v1_1_0_dest_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
prb_sort_v1_1_0: component slice_agent_prb_sort_v1_1_0_2
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_0_dest_TLAST,
      dest_tready => prb_sort_v1_1_0_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_0_dest_TVALID,
      eject => axi_double_buff_0_eject_A2,
      empty => prb_sort_v1_1_0_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A2_TLAST,
      src_tready => axi_double_buff_0_m_A2_TREADY,
      src_tvalid => axi_double_buff_0_m_A2_TVALID,
      tlast_err => NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED
    );
prb_sort_v1_1_1: component slice_agent_prb_sort_v1_1_1_0
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_1_dest_TLAST,
      dest_tready => prb_sort_v1_1_1_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_1_dest_TVALID,
      eject => axi_double_buff_0_eject_A1,
      empty => prb_sort_v1_1_1_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A1_TLAST,
      src_tready => axi_double_buff_0_m_A1_TREADY,
      src_tvalid => axi_double_buff_0_m_A1_TVALID,
      tlast_err => NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_02_imp_1FXEDL7 is
  port (
    eject : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tlast : out STD_LOGIC;
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tlast : in STD_LOGIC;
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    swap : in STD_LOGIC
  );
end double_buffer_02_imp_1FXEDL7;

architecture STRUCTURE of double_buffer_02_imp_1FXEDL7 is
  component slice_agent_axi_double_buff_0_16 is
  port (
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    m_y_tlast : out STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    s_y_tlast : in STD_LOGIC;
    m_A1_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A1_tready : in STD_LOGIC;
    m_A1_tvalid : out STD_LOGIC;
    m_A1_tlast : out STD_LOGIC;
    s_A1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A1_tready : out STD_LOGIC;
    s_A1_tvalid : in STD_LOGIC;
    s_A1_tlast : in STD_LOGIC;
    m_A2_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A2_tready : in STD_LOGIC;
    m_A2_tvalid : out STD_LOGIC;
    m_A2_tlast : out STD_LOGIC;
    s_A2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A2_tready : out STD_LOGIC;
    s_A2_tvalid : in STD_LOGIC;
    s_A2_tlast : in STD_LOGIC;
    swap : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    empty_A1 : in STD_LOGIC;
    empty_A2 : in STD_LOGIC;
    eject : in STD_LOGIC;
    eject_A1 : out STD_LOGIC;
    eject_A2 : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
  end component slice_agent_axi_double_buff_0_16;
  component slice_agent_prb_sort_v1_1_0_3 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_0_3;
  component slice_agent_prb_sort_v1_1_1_1 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_1_1;
  signal axi_double_buff_0_eject_A1 : STD_LOGIC;
  signal axi_double_buff_0_eject_A2 : STD_LOGIC;
  signal axi_double_buff_0_empty_y : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A1_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A2_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_y_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_y_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_y_TVALID : STD_LOGIC;
  signal eject_1 : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_0_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_0_empty : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_1_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_1_empty : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED : STD_LOGIC;
  signal NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED : STD_LOGIC;
begin
  axi_double_buff_0_m_y_TREADY <= m_y_tready;
  eject_1 <= eject;
  empty_y <= axi_double_buff_0_empty_y;
  m_y_tdata(63 downto 0) <= axi_double_buff_0_m_y_TDATA(63 downto 0);
  m_y_tlast <= axi_double_buff_0_m_y_TLAST;
  m_y_tvalid <= axi_double_buff_0_m_y_TVALID;
  s_aclk_0_0_1 <= s_aclk;
  s_aresetn_0_0_1 <= s_aresetn;
  s_y_1_TDATA(63 downto 0) <= s_y_tdata(63 downto 0);
  s_y_1_TLAST <= s_y_tlast;
  s_y_1_TVALID <= s_y_tvalid;
  s_y_tready <= s_y_1_TREADY;
  swap_0_1 <= swap;
axi_double_buff_0: component slice_agent_axi_double_buff_0_16
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => axi_double_buff_0_eject_A1,
      eject_A2 => axi_double_buff_0_eject_A2,
      empty_A1 => prb_sort_v1_1_1_empty,
      empty_A2 => prb_sort_v1_1_0_empty,
      empty_y => axi_double_buff_0_empty_y,
      m_A1_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      m_A1_tlast => axi_double_buff_0_m_A1_TLAST,
      m_A1_tready => axi_double_buff_0_m_A1_TREADY,
      m_A1_tvalid => axi_double_buff_0_m_A1_TVALID,
      m_A2_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      m_A2_tlast => axi_double_buff_0_m_A2_TLAST,
      m_A2_tready => axi_double_buff_0_m_A2_TREADY,
      m_A2_tvalid => axi_double_buff_0_m_A2_TVALID,
      m_y_tdata(63 downto 0) => axi_double_buff_0_m_y_TDATA(63 downto 0),
      m_y_tlast => axi_double_buff_0_m_y_TLAST,
      m_y_tready => axi_double_buff_0_m_y_TREADY,
      m_y_tvalid => axi_double_buff_0_m_y_TVALID,
      rstn => s_aresetn_0_0_1,
      s_A1_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      s_A1_tlast => prb_sort_v1_1_1_dest_TLAST,
      s_A1_tready => prb_sort_v1_1_1_dest_TREADY,
      s_A1_tvalid => prb_sort_v1_1_1_dest_TVALID,
      s_A2_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      s_A2_tlast => prb_sort_v1_1_0_dest_TLAST,
      s_A2_tready => prb_sort_v1_1_0_dest_TREADY,
      s_A2_tvalid => prb_sort_v1_1_0_dest_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
prb_sort_v1_1_0: component slice_agent_prb_sort_v1_1_0_3
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_0_dest_TLAST,
      dest_tready => prb_sort_v1_1_0_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_0_dest_TVALID,
      eject => axi_double_buff_0_eject_A2,
      empty => prb_sort_v1_1_0_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A2_TLAST,
      src_tready => axi_double_buff_0_m_A2_TREADY,
      src_tvalid => axi_double_buff_0_m_A2_TVALID,
      tlast_err => NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED
    );
prb_sort_v1_1_1: component slice_agent_prb_sort_v1_1_1_1
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_1_dest_TLAST,
      dest_tready => prb_sort_v1_1_1_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_1_dest_TVALID,
      eject => axi_double_buff_0_eject_A1,
      empty => prb_sort_v1_1_1_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A1_TLAST,
      src_tready => axi_double_buff_0_m_A1_TREADY,
      src_tvalid => axi_double_buff_0_m_A1_TVALID,
      tlast_err => NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_03_imp_90S9WK is
  port (
    eject : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tlast : out STD_LOGIC;
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tlast : in STD_LOGIC;
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    swap : in STD_LOGIC
  );
end double_buffer_03_imp_90S9WK;

architecture STRUCTURE of double_buffer_03_imp_90S9WK is
  component slice_agent_axi_double_buff_0_17 is
  port (
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    m_y_tlast : out STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    s_y_tlast : in STD_LOGIC;
    m_A1_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A1_tready : in STD_LOGIC;
    m_A1_tvalid : out STD_LOGIC;
    m_A1_tlast : out STD_LOGIC;
    s_A1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A1_tready : out STD_LOGIC;
    s_A1_tvalid : in STD_LOGIC;
    s_A1_tlast : in STD_LOGIC;
    m_A2_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A2_tready : in STD_LOGIC;
    m_A2_tvalid : out STD_LOGIC;
    m_A2_tlast : out STD_LOGIC;
    s_A2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A2_tready : out STD_LOGIC;
    s_A2_tvalid : in STD_LOGIC;
    s_A2_tlast : in STD_LOGIC;
    swap : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    empty_A1 : in STD_LOGIC;
    empty_A2 : in STD_LOGIC;
    eject : in STD_LOGIC;
    eject_A1 : out STD_LOGIC;
    eject_A2 : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
  end component slice_agent_axi_double_buff_0_17;
  component slice_agent_prb_sort_v1_1_0_4 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_0_4;
  component slice_agent_prb_sort_v1_1_1_2 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_1_2;
  signal axi_double_buff_0_eject_A1 : STD_LOGIC;
  signal axi_double_buff_0_eject_A2 : STD_LOGIC;
  signal axi_double_buff_0_empty_y : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A1_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A2_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_y_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_y_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_y_TVALID : STD_LOGIC;
  signal eject_1 : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_0_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_0_empty : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_1_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_1_empty : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED : STD_LOGIC;
  signal NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED : STD_LOGIC;
begin
  axi_double_buff_0_m_y_TREADY <= m_y_tready;
  eject_1 <= eject;
  empty_y <= axi_double_buff_0_empty_y;
  m_y_tdata(63 downto 0) <= axi_double_buff_0_m_y_TDATA(63 downto 0);
  m_y_tlast <= axi_double_buff_0_m_y_TLAST;
  m_y_tvalid <= axi_double_buff_0_m_y_TVALID;
  s_aclk_0_0_1 <= s_aclk;
  s_aresetn_0_0_1 <= s_aresetn;
  s_y_1_TDATA(63 downto 0) <= s_y_tdata(63 downto 0);
  s_y_1_TLAST <= s_y_tlast;
  s_y_1_TVALID <= s_y_tvalid;
  s_y_tready <= s_y_1_TREADY;
  swap_0_1 <= swap;
axi_double_buff_0: component slice_agent_axi_double_buff_0_17
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => axi_double_buff_0_eject_A1,
      eject_A2 => axi_double_buff_0_eject_A2,
      empty_A1 => prb_sort_v1_1_1_empty,
      empty_A2 => prb_sort_v1_1_0_empty,
      empty_y => axi_double_buff_0_empty_y,
      m_A1_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      m_A1_tlast => axi_double_buff_0_m_A1_TLAST,
      m_A1_tready => axi_double_buff_0_m_A1_TREADY,
      m_A1_tvalid => axi_double_buff_0_m_A1_TVALID,
      m_A2_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      m_A2_tlast => axi_double_buff_0_m_A2_TLAST,
      m_A2_tready => axi_double_buff_0_m_A2_TREADY,
      m_A2_tvalid => axi_double_buff_0_m_A2_TVALID,
      m_y_tdata(63 downto 0) => axi_double_buff_0_m_y_TDATA(63 downto 0),
      m_y_tlast => axi_double_buff_0_m_y_TLAST,
      m_y_tready => axi_double_buff_0_m_y_TREADY,
      m_y_tvalid => axi_double_buff_0_m_y_TVALID,
      rstn => s_aresetn_0_0_1,
      s_A1_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      s_A1_tlast => prb_sort_v1_1_1_dest_TLAST,
      s_A1_tready => prb_sort_v1_1_1_dest_TREADY,
      s_A1_tvalid => prb_sort_v1_1_1_dest_TVALID,
      s_A2_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      s_A2_tlast => prb_sort_v1_1_0_dest_TLAST,
      s_A2_tready => prb_sort_v1_1_0_dest_TREADY,
      s_A2_tvalid => prb_sort_v1_1_0_dest_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
prb_sort_v1_1_0: component slice_agent_prb_sort_v1_1_0_4
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_0_dest_TLAST,
      dest_tready => prb_sort_v1_1_0_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_0_dest_TVALID,
      eject => axi_double_buff_0_eject_A2,
      empty => prb_sort_v1_1_0_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A2_TLAST,
      src_tready => axi_double_buff_0_m_A2_TREADY,
      src_tvalid => axi_double_buff_0_m_A2_TVALID,
      tlast_err => NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED
    );
prb_sort_v1_1_1: component slice_agent_prb_sort_v1_1_1_2
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_1_dest_TLAST,
      dest_tready => prb_sort_v1_1_1_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_1_dest_TVALID,
      eject => axi_double_buff_0_eject_A1,
      empty => prb_sort_v1_1_1_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A1_TLAST,
      src_tready => axi_double_buff_0_m_A1_TREADY,
      src_tvalid => axi_double_buff_0_m_A1_TVALID,
      tlast_err => NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_04_imp_NC3VZF is
  port (
    eject : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tlast : out STD_LOGIC;
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tlast : in STD_LOGIC;
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    swap : in STD_LOGIC
  );
end double_buffer_04_imp_NC3VZF;

architecture STRUCTURE of double_buffer_04_imp_NC3VZF is
  component slice_agent_axi_double_buff_0_18 is
  port (
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    m_y_tlast : out STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    s_y_tlast : in STD_LOGIC;
    m_A1_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A1_tready : in STD_LOGIC;
    m_A1_tvalid : out STD_LOGIC;
    m_A1_tlast : out STD_LOGIC;
    s_A1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A1_tready : out STD_LOGIC;
    s_A1_tvalid : in STD_LOGIC;
    s_A1_tlast : in STD_LOGIC;
    m_A2_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A2_tready : in STD_LOGIC;
    m_A2_tvalid : out STD_LOGIC;
    m_A2_tlast : out STD_LOGIC;
    s_A2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A2_tready : out STD_LOGIC;
    s_A2_tvalid : in STD_LOGIC;
    s_A2_tlast : in STD_LOGIC;
    swap : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    empty_A1 : in STD_LOGIC;
    empty_A2 : in STD_LOGIC;
    eject : in STD_LOGIC;
    eject_A1 : out STD_LOGIC;
    eject_A2 : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
  end component slice_agent_axi_double_buff_0_18;
  component slice_agent_prb_sort_v1_1_0_5 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_0_5;
  component slice_agent_prb_sort_v1_1_1_3 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_1_3;
  signal axi_double_buff_0_eject_A1 : STD_LOGIC;
  signal axi_double_buff_0_eject_A2 : STD_LOGIC;
  signal axi_double_buff_0_empty_y : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A1_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A2_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_y_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_y_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_y_TVALID : STD_LOGIC;
  signal eject_1 : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_0_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_0_empty : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_1_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_1_empty : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED : STD_LOGIC;
  signal NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED : STD_LOGIC;
begin
  axi_double_buff_0_m_y_TREADY <= m_y_tready;
  eject_1 <= eject;
  empty_y <= axi_double_buff_0_empty_y;
  m_y_tdata(63 downto 0) <= axi_double_buff_0_m_y_TDATA(63 downto 0);
  m_y_tlast <= axi_double_buff_0_m_y_TLAST;
  m_y_tvalid <= axi_double_buff_0_m_y_TVALID;
  s_aclk_0_0_1 <= s_aclk;
  s_aresetn_0_0_1 <= s_aresetn;
  s_y_1_TDATA(63 downto 0) <= s_y_tdata(63 downto 0);
  s_y_1_TLAST <= s_y_tlast;
  s_y_1_TVALID <= s_y_tvalid;
  s_y_tready <= s_y_1_TREADY;
  swap_0_1 <= swap;
axi_double_buff_0: component slice_agent_axi_double_buff_0_18
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => axi_double_buff_0_eject_A1,
      eject_A2 => axi_double_buff_0_eject_A2,
      empty_A1 => prb_sort_v1_1_1_empty,
      empty_A2 => prb_sort_v1_1_0_empty,
      empty_y => axi_double_buff_0_empty_y,
      m_A1_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      m_A1_tlast => axi_double_buff_0_m_A1_TLAST,
      m_A1_tready => axi_double_buff_0_m_A1_TREADY,
      m_A1_tvalid => axi_double_buff_0_m_A1_TVALID,
      m_A2_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      m_A2_tlast => axi_double_buff_0_m_A2_TLAST,
      m_A2_tready => axi_double_buff_0_m_A2_TREADY,
      m_A2_tvalid => axi_double_buff_0_m_A2_TVALID,
      m_y_tdata(63 downto 0) => axi_double_buff_0_m_y_TDATA(63 downto 0),
      m_y_tlast => axi_double_buff_0_m_y_TLAST,
      m_y_tready => axi_double_buff_0_m_y_TREADY,
      m_y_tvalid => axi_double_buff_0_m_y_TVALID,
      rstn => s_aresetn_0_0_1,
      s_A1_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      s_A1_tlast => prb_sort_v1_1_1_dest_TLAST,
      s_A1_tready => prb_sort_v1_1_1_dest_TREADY,
      s_A1_tvalid => prb_sort_v1_1_1_dest_TVALID,
      s_A2_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      s_A2_tlast => prb_sort_v1_1_0_dest_TLAST,
      s_A2_tready => prb_sort_v1_1_0_dest_TREADY,
      s_A2_tvalid => prb_sort_v1_1_0_dest_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
prb_sort_v1_1_0: component slice_agent_prb_sort_v1_1_0_5
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_0_dest_TLAST,
      dest_tready => prb_sort_v1_1_0_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_0_dest_TVALID,
      eject => axi_double_buff_0_eject_A2,
      empty => prb_sort_v1_1_0_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A2_TLAST,
      src_tready => axi_double_buff_0_m_A2_TREADY,
      src_tvalid => axi_double_buff_0_m_A2_TVALID,
      tlast_err => NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED
    );
prb_sort_v1_1_1: component slice_agent_prb_sort_v1_1_1_3
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_1_dest_TLAST,
      dest_tready => prb_sort_v1_1_1_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_1_dest_TVALID,
      eject => axi_double_buff_0_eject_A1,
      empty => prb_sort_v1_1_1_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A1_TLAST,
      src_tready => axi_double_buff_0_m_A1_TREADY,
      src_tvalid => axi_double_buff_0_m_A1_TVALID,
      tlast_err => NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_05_imp_1LN36X0 is
  port (
    eject : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tlast : out STD_LOGIC;
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tlast : in STD_LOGIC;
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    swap : in STD_LOGIC
  );
end double_buffer_05_imp_1LN36X0;

architecture STRUCTURE of double_buffer_05_imp_1LN36X0 is
  component slice_agent_axi_double_buff_0_19 is
  port (
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    m_y_tlast : out STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    s_y_tlast : in STD_LOGIC;
    m_A1_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A1_tready : in STD_LOGIC;
    m_A1_tvalid : out STD_LOGIC;
    m_A1_tlast : out STD_LOGIC;
    s_A1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A1_tready : out STD_LOGIC;
    s_A1_tvalid : in STD_LOGIC;
    s_A1_tlast : in STD_LOGIC;
    m_A2_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A2_tready : in STD_LOGIC;
    m_A2_tvalid : out STD_LOGIC;
    m_A2_tlast : out STD_LOGIC;
    s_A2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A2_tready : out STD_LOGIC;
    s_A2_tvalid : in STD_LOGIC;
    s_A2_tlast : in STD_LOGIC;
    swap : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    empty_A1 : in STD_LOGIC;
    empty_A2 : in STD_LOGIC;
    eject : in STD_LOGIC;
    eject_A1 : out STD_LOGIC;
    eject_A2 : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
  end component slice_agent_axi_double_buff_0_19;
  component slice_agent_prb_sort_v1_1_0_6 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_0_6;
  component slice_agent_prb_sort_v1_1_1_4 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_1_4;
  signal axi_double_buff_0_eject_A1 : STD_LOGIC;
  signal axi_double_buff_0_eject_A2 : STD_LOGIC;
  signal axi_double_buff_0_empty_y : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A1_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A2_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_y_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_y_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_y_TVALID : STD_LOGIC;
  signal eject_1 : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_0_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_0_empty : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_1_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_1_empty : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED : STD_LOGIC;
  signal NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED : STD_LOGIC;
begin
  axi_double_buff_0_m_y_TREADY <= m_y_tready;
  eject_1 <= eject;
  empty_y <= axi_double_buff_0_empty_y;
  m_y_tdata(63 downto 0) <= axi_double_buff_0_m_y_TDATA(63 downto 0);
  m_y_tlast <= axi_double_buff_0_m_y_TLAST;
  m_y_tvalid <= axi_double_buff_0_m_y_TVALID;
  s_aclk_0_0_1 <= s_aclk;
  s_aresetn_0_0_1 <= s_aresetn;
  s_y_1_TDATA(63 downto 0) <= s_y_tdata(63 downto 0);
  s_y_1_TLAST <= s_y_tlast;
  s_y_1_TVALID <= s_y_tvalid;
  s_y_tready <= s_y_1_TREADY;
  swap_0_1 <= swap;
axi_double_buff_0: component slice_agent_axi_double_buff_0_19
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => axi_double_buff_0_eject_A1,
      eject_A2 => axi_double_buff_0_eject_A2,
      empty_A1 => prb_sort_v1_1_1_empty,
      empty_A2 => prb_sort_v1_1_0_empty,
      empty_y => axi_double_buff_0_empty_y,
      m_A1_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      m_A1_tlast => axi_double_buff_0_m_A1_TLAST,
      m_A1_tready => axi_double_buff_0_m_A1_TREADY,
      m_A1_tvalid => axi_double_buff_0_m_A1_TVALID,
      m_A2_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      m_A2_tlast => axi_double_buff_0_m_A2_TLAST,
      m_A2_tready => axi_double_buff_0_m_A2_TREADY,
      m_A2_tvalid => axi_double_buff_0_m_A2_TVALID,
      m_y_tdata(63 downto 0) => axi_double_buff_0_m_y_TDATA(63 downto 0),
      m_y_tlast => axi_double_buff_0_m_y_TLAST,
      m_y_tready => axi_double_buff_0_m_y_TREADY,
      m_y_tvalid => axi_double_buff_0_m_y_TVALID,
      rstn => s_aresetn_0_0_1,
      s_A1_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      s_A1_tlast => prb_sort_v1_1_1_dest_TLAST,
      s_A1_tready => prb_sort_v1_1_1_dest_TREADY,
      s_A1_tvalid => prb_sort_v1_1_1_dest_TVALID,
      s_A2_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      s_A2_tlast => prb_sort_v1_1_0_dest_TLAST,
      s_A2_tready => prb_sort_v1_1_0_dest_TREADY,
      s_A2_tvalid => prb_sort_v1_1_0_dest_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
prb_sort_v1_1_0: component slice_agent_prb_sort_v1_1_0_6
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_0_dest_TLAST,
      dest_tready => prb_sort_v1_1_0_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_0_dest_TVALID,
      eject => axi_double_buff_0_eject_A2,
      empty => prb_sort_v1_1_0_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A2_TLAST,
      src_tready => axi_double_buff_0_m_A2_TREADY,
      src_tvalid => axi_double_buff_0_m_A2_TVALID,
      tlast_err => NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED
    );
prb_sort_v1_1_1: component slice_agent_prb_sort_v1_1_1_4
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_1_dest_TLAST,
      dest_tready => prb_sort_v1_1_1_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_1_dest_TVALID,
      eject => axi_double_buff_0_eject_A1,
      empty => prb_sort_v1_1_1_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A1_TLAST,
      src_tready => axi_double_buff_0_m_A1_TREADY,
      src_tvalid => axi_double_buff_0_m_A1_TVALID,
      tlast_err => NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_06_imp_1F371H0 is
  port (
    eject : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tlast : out STD_LOGIC;
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tlast : in STD_LOGIC;
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    swap : in STD_LOGIC
  );
end double_buffer_06_imp_1F371H0;

architecture STRUCTURE of double_buffer_06_imp_1F371H0 is
  component slice_agent_axi_double_buff_0_20 is
  port (
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    m_y_tlast : out STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    s_y_tlast : in STD_LOGIC;
    m_A1_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A1_tready : in STD_LOGIC;
    m_A1_tvalid : out STD_LOGIC;
    m_A1_tlast : out STD_LOGIC;
    s_A1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A1_tready : out STD_LOGIC;
    s_A1_tvalid : in STD_LOGIC;
    s_A1_tlast : in STD_LOGIC;
    m_A2_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A2_tready : in STD_LOGIC;
    m_A2_tvalid : out STD_LOGIC;
    m_A2_tlast : out STD_LOGIC;
    s_A2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A2_tready : out STD_LOGIC;
    s_A2_tvalid : in STD_LOGIC;
    s_A2_tlast : in STD_LOGIC;
    swap : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    empty_A1 : in STD_LOGIC;
    empty_A2 : in STD_LOGIC;
    eject : in STD_LOGIC;
    eject_A1 : out STD_LOGIC;
    eject_A2 : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
  end component slice_agent_axi_double_buff_0_20;
  component slice_agent_prb_sort_v1_1_0_7 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_0_7;
  component slice_agent_prb_sort_v1_1_1_5 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_1_5;
  signal axi_double_buff_0_eject_A1 : STD_LOGIC;
  signal axi_double_buff_0_eject_A2 : STD_LOGIC;
  signal axi_double_buff_0_empty_y : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A1_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A2_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_y_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_y_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_y_TVALID : STD_LOGIC;
  signal eject_1 : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_0_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_0_empty : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_1_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_1_empty : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED : STD_LOGIC;
  signal NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED : STD_LOGIC;
begin
  axi_double_buff_0_m_y_TREADY <= m_y_tready;
  eject_1 <= eject;
  empty_y <= axi_double_buff_0_empty_y;
  m_y_tdata(63 downto 0) <= axi_double_buff_0_m_y_TDATA(63 downto 0);
  m_y_tlast <= axi_double_buff_0_m_y_TLAST;
  m_y_tvalid <= axi_double_buff_0_m_y_TVALID;
  s_aclk_0_0_1 <= s_aclk;
  s_aresetn_0_0_1 <= s_aresetn;
  s_y_1_TDATA(63 downto 0) <= s_y_tdata(63 downto 0);
  s_y_1_TLAST <= s_y_tlast;
  s_y_1_TVALID <= s_y_tvalid;
  s_y_tready <= s_y_1_TREADY;
  swap_0_1 <= swap;
axi_double_buff_0: component slice_agent_axi_double_buff_0_20
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => axi_double_buff_0_eject_A1,
      eject_A2 => axi_double_buff_0_eject_A2,
      empty_A1 => prb_sort_v1_1_1_empty,
      empty_A2 => prb_sort_v1_1_0_empty,
      empty_y => axi_double_buff_0_empty_y,
      m_A1_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      m_A1_tlast => axi_double_buff_0_m_A1_TLAST,
      m_A1_tready => axi_double_buff_0_m_A1_TREADY,
      m_A1_tvalid => axi_double_buff_0_m_A1_TVALID,
      m_A2_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      m_A2_tlast => axi_double_buff_0_m_A2_TLAST,
      m_A2_tready => axi_double_buff_0_m_A2_TREADY,
      m_A2_tvalid => axi_double_buff_0_m_A2_TVALID,
      m_y_tdata(63 downto 0) => axi_double_buff_0_m_y_TDATA(63 downto 0),
      m_y_tlast => axi_double_buff_0_m_y_TLAST,
      m_y_tready => axi_double_buff_0_m_y_TREADY,
      m_y_tvalid => axi_double_buff_0_m_y_TVALID,
      rstn => s_aresetn_0_0_1,
      s_A1_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      s_A1_tlast => prb_sort_v1_1_1_dest_TLAST,
      s_A1_tready => prb_sort_v1_1_1_dest_TREADY,
      s_A1_tvalid => prb_sort_v1_1_1_dest_TVALID,
      s_A2_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      s_A2_tlast => prb_sort_v1_1_0_dest_TLAST,
      s_A2_tready => prb_sort_v1_1_0_dest_TREADY,
      s_A2_tvalid => prb_sort_v1_1_0_dest_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
prb_sort_v1_1_0: component slice_agent_prb_sort_v1_1_0_7
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_0_dest_TLAST,
      dest_tready => prb_sort_v1_1_0_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_0_dest_TVALID,
      eject => axi_double_buff_0_eject_A2,
      empty => prb_sort_v1_1_0_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A2_TLAST,
      src_tready => axi_double_buff_0_m_A2_TREADY,
      src_tvalid => axi_double_buff_0_m_A2_TVALID,
      tlast_err => NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED
    );
prb_sort_v1_1_1: component slice_agent_prb_sort_v1_1_1_5
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_1_dest_TLAST,
      dest_tready => prb_sort_v1_1_1_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_1_dest_TVALID,
      eject => axi_double_buff_0_eject_A1,
      empty => prb_sort_v1_1_1_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A1_TLAST,
      src_tready => axi_double_buff_0_m_A1_TREADY,
      src_tvalid => axi_double_buff_0_m_A1_TVALID,
      tlast_err => NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_07_imp_9UTTUJ is
  port (
    eject : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tlast : out STD_LOGIC;
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tlast : in STD_LOGIC;
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    swap : in STD_LOGIC
  );
end double_buffer_07_imp_9UTTUJ;

architecture STRUCTURE of double_buffer_07_imp_9UTTUJ is
  component slice_agent_axi_double_buff_0_21 is
  port (
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    m_y_tlast : out STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    s_y_tlast : in STD_LOGIC;
    m_A1_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A1_tready : in STD_LOGIC;
    m_A1_tvalid : out STD_LOGIC;
    m_A1_tlast : out STD_LOGIC;
    s_A1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A1_tready : out STD_LOGIC;
    s_A1_tvalid : in STD_LOGIC;
    s_A1_tlast : in STD_LOGIC;
    m_A2_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A2_tready : in STD_LOGIC;
    m_A2_tvalid : out STD_LOGIC;
    m_A2_tlast : out STD_LOGIC;
    s_A2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A2_tready : out STD_LOGIC;
    s_A2_tvalid : in STD_LOGIC;
    s_A2_tlast : in STD_LOGIC;
    swap : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    empty_A1 : in STD_LOGIC;
    empty_A2 : in STD_LOGIC;
    eject : in STD_LOGIC;
    eject_A1 : out STD_LOGIC;
    eject_A2 : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
  end component slice_agent_axi_double_buff_0_21;
  component slice_agent_prb_sort_v1_1_0_8 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_0_8;
  component slice_agent_prb_sort_v1_1_1_6 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_1_6;
  signal axi_double_buff_0_eject_A1 : STD_LOGIC;
  signal axi_double_buff_0_eject_A2 : STD_LOGIC;
  signal axi_double_buff_0_empty_y : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A1_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A2_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_y_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_y_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_y_TVALID : STD_LOGIC;
  signal eject_1 : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_0_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_0_empty : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_1_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_1_empty : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED : STD_LOGIC;
  signal NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED : STD_LOGIC;
begin
  axi_double_buff_0_m_y_TREADY <= m_y_tready;
  eject_1 <= eject;
  empty_y <= axi_double_buff_0_empty_y;
  m_y_tdata(63 downto 0) <= axi_double_buff_0_m_y_TDATA(63 downto 0);
  m_y_tlast <= axi_double_buff_0_m_y_TLAST;
  m_y_tvalid <= axi_double_buff_0_m_y_TVALID;
  s_aclk_0_0_1 <= s_aclk;
  s_aresetn_0_0_1 <= s_aresetn;
  s_y_1_TDATA(63 downto 0) <= s_y_tdata(63 downto 0);
  s_y_1_TLAST <= s_y_tlast;
  s_y_1_TVALID <= s_y_tvalid;
  s_y_tready <= s_y_1_TREADY;
  swap_0_1 <= swap;
axi_double_buff_0: component slice_agent_axi_double_buff_0_21
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => axi_double_buff_0_eject_A1,
      eject_A2 => axi_double_buff_0_eject_A2,
      empty_A1 => prb_sort_v1_1_1_empty,
      empty_A2 => prb_sort_v1_1_0_empty,
      empty_y => axi_double_buff_0_empty_y,
      m_A1_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      m_A1_tlast => axi_double_buff_0_m_A1_TLAST,
      m_A1_tready => axi_double_buff_0_m_A1_TREADY,
      m_A1_tvalid => axi_double_buff_0_m_A1_TVALID,
      m_A2_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      m_A2_tlast => axi_double_buff_0_m_A2_TLAST,
      m_A2_tready => axi_double_buff_0_m_A2_TREADY,
      m_A2_tvalid => axi_double_buff_0_m_A2_TVALID,
      m_y_tdata(63 downto 0) => axi_double_buff_0_m_y_TDATA(63 downto 0),
      m_y_tlast => axi_double_buff_0_m_y_TLAST,
      m_y_tready => axi_double_buff_0_m_y_TREADY,
      m_y_tvalid => axi_double_buff_0_m_y_TVALID,
      rstn => s_aresetn_0_0_1,
      s_A1_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      s_A1_tlast => prb_sort_v1_1_1_dest_TLAST,
      s_A1_tready => prb_sort_v1_1_1_dest_TREADY,
      s_A1_tvalid => prb_sort_v1_1_1_dest_TVALID,
      s_A2_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      s_A2_tlast => prb_sort_v1_1_0_dest_TLAST,
      s_A2_tready => prb_sort_v1_1_0_dest_TREADY,
      s_A2_tvalid => prb_sort_v1_1_0_dest_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
prb_sort_v1_1_0: component slice_agent_prb_sort_v1_1_0_8
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_0_dest_TLAST,
      dest_tready => prb_sort_v1_1_0_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_0_dest_TVALID,
      eject => axi_double_buff_0_eject_A2,
      empty => prb_sort_v1_1_0_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A2_TLAST,
      src_tready => axi_double_buff_0_m_A2_TREADY,
      src_tvalid => axi_double_buff_0_m_A2_TVALID,
      tlast_err => NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED
    );
prb_sort_v1_1_1: component slice_agent_prb_sort_v1_1_1_6
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_1_dest_TLAST,
      dest_tready => prb_sort_v1_1_1_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_1_dest_TVALID,
      eject => axi_double_buff_0_eject_A1,
      empty => prb_sort_v1_1_1_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A1_TLAST,
      src_tready => axi_double_buff_0_m_A1_TREADY,
      src_tvalid => axi_double_buff_0_m_A1_TVALID,
      tlast_err => NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_08_imp_MHRCIY is
  port (
    eject : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tlast : out STD_LOGIC;
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tlast : in STD_LOGIC;
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    swap : in STD_LOGIC
  );
end double_buffer_08_imp_MHRCIY;

architecture STRUCTURE of double_buffer_08_imp_MHRCIY is
  component slice_agent_axi_double_buff_0_22 is
  port (
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    m_y_tlast : out STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    s_y_tlast : in STD_LOGIC;
    m_A1_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A1_tready : in STD_LOGIC;
    m_A1_tvalid : out STD_LOGIC;
    m_A1_tlast : out STD_LOGIC;
    s_A1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A1_tready : out STD_LOGIC;
    s_A1_tvalid : in STD_LOGIC;
    s_A1_tlast : in STD_LOGIC;
    m_A2_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A2_tready : in STD_LOGIC;
    m_A2_tvalid : out STD_LOGIC;
    m_A2_tlast : out STD_LOGIC;
    s_A2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A2_tready : out STD_LOGIC;
    s_A2_tvalid : in STD_LOGIC;
    s_A2_tlast : in STD_LOGIC;
    swap : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    empty_A1 : in STD_LOGIC;
    empty_A2 : in STD_LOGIC;
    eject : in STD_LOGIC;
    eject_A1 : out STD_LOGIC;
    eject_A2 : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
  end component slice_agent_axi_double_buff_0_22;
  component slice_agent_prb_sort_v1_1_0_9 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_0_9;
  component slice_agent_prb_sort_v1_1_1_7 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_1_7;
  signal axi_double_buff_0_eject_A1 : STD_LOGIC;
  signal axi_double_buff_0_eject_A2 : STD_LOGIC;
  signal axi_double_buff_0_empty_y : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A1_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A2_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_y_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_y_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_y_TVALID : STD_LOGIC;
  signal eject_1 : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_0_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_0_empty : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_1_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_1_empty : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED : STD_LOGIC;
  signal NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED : STD_LOGIC;
begin
  axi_double_buff_0_m_y_TREADY <= m_y_tready;
  eject_1 <= eject;
  empty_y <= axi_double_buff_0_empty_y;
  m_y_tdata(63 downto 0) <= axi_double_buff_0_m_y_TDATA(63 downto 0);
  m_y_tlast <= axi_double_buff_0_m_y_TLAST;
  m_y_tvalid <= axi_double_buff_0_m_y_TVALID;
  s_aclk_0_0_1 <= s_aclk;
  s_aresetn_0_0_1 <= s_aresetn;
  s_y_1_TDATA(63 downto 0) <= s_y_tdata(63 downto 0);
  s_y_1_TLAST <= s_y_tlast;
  s_y_1_TVALID <= s_y_tvalid;
  s_y_tready <= s_y_1_TREADY;
  swap_0_1 <= swap;
axi_double_buff_0: component slice_agent_axi_double_buff_0_22
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => axi_double_buff_0_eject_A1,
      eject_A2 => axi_double_buff_0_eject_A2,
      empty_A1 => prb_sort_v1_1_1_empty,
      empty_A2 => prb_sort_v1_1_0_empty,
      empty_y => axi_double_buff_0_empty_y,
      m_A1_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      m_A1_tlast => axi_double_buff_0_m_A1_TLAST,
      m_A1_tready => axi_double_buff_0_m_A1_TREADY,
      m_A1_tvalid => axi_double_buff_0_m_A1_TVALID,
      m_A2_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      m_A2_tlast => axi_double_buff_0_m_A2_TLAST,
      m_A2_tready => axi_double_buff_0_m_A2_TREADY,
      m_A2_tvalid => axi_double_buff_0_m_A2_TVALID,
      m_y_tdata(63 downto 0) => axi_double_buff_0_m_y_TDATA(63 downto 0),
      m_y_tlast => axi_double_buff_0_m_y_TLAST,
      m_y_tready => axi_double_buff_0_m_y_TREADY,
      m_y_tvalid => axi_double_buff_0_m_y_TVALID,
      rstn => s_aresetn_0_0_1,
      s_A1_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      s_A1_tlast => prb_sort_v1_1_1_dest_TLAST,
      s_A1_tready => prb_sort_v1_1_1_dest_TREADY,
      s_A1_tvalid => prb_sort_v1_1_1_dest_TVALID,
      s_A2_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      s_A2_tlast => prb_sort_v1_1_0_dest_TLAST,
      s_A2_tready => prb_sort_v1_1_0_dest_TREADY,
      s_A2_tvalid => prb_sort_v1_1_0_dest_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
prb_sort_v1_1_0: component slice_agent_prb_sort_v1_1_0_9
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_0_dest_TLAST,
      dest_tready => prb_sort_v1_1_0_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_0_dest_TVALID,
      eject => axi_double_buff_0_eject_A2,
      empty => prb_sort_v1_1_0_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A2_TLAST,
      src_tready => axi_double_buff_0_m_A2_TREADY,
      src_tvalid => axi_double_buff_0_m_A2_TVALID,
      tlast_err => NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED
    );
prb_sort_v1_1_1: component slice_agent_prb_sort_v1_1_1_7
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_1_dest_TLAST,
      dest_tready => prb_sort_v1_1_1_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_1_dest_TVALID,
      eject => axi_double_buff_0_eject_A1,
      empty => prb_sort_v1_1_1_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A1_TLAST,
      src_tready => axi_double_buff_0_m_A1_TREADY,
      src_tvalid => axi_double_buff_0_m_A1_TVALID,
      tlast_err => NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_09_imp_1K8QW5H is
  port (
    eject : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tlast : out STD_LOGIC;
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tlast : in STD_LOGIC;
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    swap : in STD_LOGIC
  );
end double_buffer_09_imp_1K8QW5H;

architecture STRUCTURE of double_buffer_09_imp_1K8QW5H is
  component slice_agent_axi_double_buff_0_23 is
  port (
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    m_y_tlast : out STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    s_y_tlast : in STD_LOGIC;
    m_A1_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A1_tready : in STD_LOGIC;
    m_A1_tvalid : out STD_LOGIC;
    m_A1_tlast : out STD_LOGIC;
    s_A1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A1_tready : out STD_LOGIC;
    s_A1_tvalid : in STD_LOGIC;
    s_A1_tlast : in STD_LOGIC;
    m_A2_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A2_tready : in STD_LOGIC;
    m_A2_tvalid : out STD_LOGIC;
    m_A2_tlast : out STD_LOGIC;
    s_A2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A2_tready : out STD_LOGIC;
    s_A2_tvalid : in STD_LOGIC;
    s_A2_tlast : in STD_LOGIC;
    swap : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    empty_A1 : in STD_LOGIC;
    empty_A2 : in STD_LOGIC;
    eject : in STD_LOGIC;
    eject_A1 : out STD_LOGIC;
    eject_A2 : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
  end component slice_agent_axi_double_buff_0_23;
  component slice_agent_prb_sort_v1_1_0_10 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_0_10;
  component slice_agent_prb_sort_v1_1_1_8 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_1_8;
  signal axi_double_buff_0_eject_A1 : STD_LOGIC;
  signal axi_double_buff_0_eject_A2 : STD_LOGIC;
  signal axi_double_buff_0_empty_y : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A1_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A2_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_y_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_y_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_y_TVALID : STD_LOGIC;
  signal eject_1 : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_0_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_0_empty : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_1_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_1_empty : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED : STD_LOGIC;
  signal NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED : STD_LOGIC;
begin
  axi_double_buff_0_m_y_TREADY <= m_y_tready;
  eject_1 <= eject;
  empty_y <= axi_double_buff_0_empty_y;
  m_y_tdata(63 downto 0) <= axi_double_buff_0_m_y_TDATA(63 downto 0);
  m_y_tlast <= axi_double_buff_0_m_y_TLAST;
  m_y_tvalid <= axi_double_buff_0_m_y_TVALID;
  s_aclk_0_0_1 <= s_aclk;
  s_aresetn_0_0_1 <= s_aresetn;
  s_y_1_TDATA(63 downto 0) <= s_y_tdata(63 downto 0);
  s_y_1_TLAST <= s_y_tlast;
  s_y_1_TVALID <= s_y_tvalid;
  s_y_tready <= s_y_1_TREADY;
  swap_0_1 <= swap;
axi_double_buff_0: component slice_agent_axi_double_buff_0_23
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => axi_double_buff_0_eject_A1,
      eject_A2 => axi_double_buff_0_eject_A2,
      empty_A1 => prb_sort_v1_1_1_empty,
      empty_A2 => prb_sort_v1_1_0_empty,
      empty_y => axi_double_buff_0_empty_y,
      m_A1_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      m_A1_tlast => axi_double_buff_0_m_A1_TLAST,
      m_A1_tready => axi_double_buff_0_m_A1_TREADY,
      m_A1_tvalid => axi_double_buff_0_m_A1_TVALID,
      m_A2_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      m_A2_tlast => axi_double_buff_0_m_A2_TLAST,
      m_A2_tready => axi_double_buff_0_m_A2_TREADY,
      m_A2_tvalid => axi_double_buff_0_m_A2_TVALID,
      m_y_tdata(63 downto 0) => axi_double_buff_0_m_y_TDATA(63 downto 0),
      m_y_tlast => axi_double_buff_0_m_y_TLAST,
      m_y_tready => axi_double_buff_0_m_y_TREADY,
      m_y_tvalid => axi_double_buff_0_m_y_TVALID,
      rstn => s_aresetn_0_0_1,
      s_A1_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      s_A1_tlast => prb_sort_v1_1_1_dest_TLAST,
      s_A1_tready => prb_sort_v1_1_1_dest_TREADY,
      s_A1_tvalid => prb_sort_v1_1_1_dest_TVALID,
      s_A2_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      s_A2_tlast => prb_sort_v1_1_0_dest_TLAST,
      s_A2_tready => prb_sort_v1_1_0_dest_TREADY,
      s_A2_tvalid => prb_sort_v1_1_0_dest_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
prb_sort_v1_1_0: component slice_agent_prb_sort_v1_1_0_10
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_0_dest_TLAST,
      dest_tready => prb_sort_v1_1_0_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_0_dest_TVALID,
      eject => axi_double_buff_0_eject_A2,
      empty => prb_sort_v1_1_0_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A2_TLAST,
      src_tready => axi_double_buff_0_m_A2_TREADY,
      src_tvalid => axi_double_buff_0_m_A2_TVALID,
      tlast_err => NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED
    );
prb_sort_v1_1_1: component slice_agent_prb_sort_v1_1_1_8
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_1_dest_TLAST,
      dest_tready => prb_sort_v1_1_1_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_1_dest_TVALID,
      eject => axi_double_buff_0_eject_A1,
      empty => prb_sort_v1_1_1_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A1_TLAST,
      src_tready => axi_double_buff_0_m_A1_TREADY,
      src_tvalid => axi_double_buff_0_m_A1_TVALID,
      tlast_err => NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_10_imp_12FWITT is
  port (
    eject : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tlast : out STD_LOGIC;
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tlast : in STD_LOGIC;
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    swap : in STD_LOGIC
  );
end double_buffer_10_imp_12FWITT;

architecture STRUCTURE of double_buffer_10_imp_12FWITT is
  component slice_agent_axi_double_buff_0_24 is
  port (
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    m_y_tlast : out STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    s_y_tlast : in STD_LOGIC;
    m_A1_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A1_tready : in STD_LOGIC;
    m_A1_tvalid : out STD_LOGIC;
    m_A1_tlast : out STD_LOGIC;
    s_A1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A1_tready : out STD_LOGIC;
    s_A1_tvalid : in STD_LOGIC;
    s_A1_tlast : in STD_LOGIC;
    m_A2_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A2_tready : in STD_LOGIC;
    m_A2_tvalid : out STD_LOGIC;
    m_A2_tlast : out STD_LOGIC;
    s_A2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A2_tready : out STD_LOGIC;
    s_A2_tvalid : in STD_LOGIC;
    s_A2_tlast : in STD_LOGIC;
    swap : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    empty_A1 : in STD_LOGIC;
    empty_A2 : in STD_LOGIC;
    eject : in STD_LOGIC;
    eject_A1 : out STD_LOGIC;
    eject_A2 : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
  end component slice_agent_axi_double_buff_0_24;
  component slice_agent_prb_sort_v1_1_0_11 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_0_11;
  component slice_agent_prb_sort_v1_1_1_9 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_1_9;
  signal axi_double_buff_0_eject_A1 : STD_LOGIC;
  signal axi_double_buff_0_eject_A2 : STD_LOGIC;
  signal axi_double_buff_0_empty_y : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A1_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A2_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_y_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_y_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_y_TVALID : STD_LOGIC;
  signal eject_1 : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_0_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_0_empty : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_1_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_1_empty : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED : STD_LOGIC;
  signal NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED : STD_LOGIC;
begin
  axi_double_buff_0_m_y_TREADY <= m_y_tready;
  eject_1 <= eject;
  empty_y <= axi_double_buff_0_empty_y;
  m_y_tdata(63 downto 0) <= axi_double_buff_0_m_y_TDATA(63 downto 0);
  m_y_tlast <= axi_double_buff_0_m_y_TLAST;
  m_y_tvalid <= axi_double_buff_0_m_y_TVALID;
  s_aclk_0_0_1 <= s_aclk;
  s_aresetn_0_0_1 <= s_aresetn;
  s_y_1_TDATA(63 downto 0) <= s_y_tdata(63 downto 0);
  s_y_1_TLAST <= s_y_tlast;
  s_y_1_TVALID <= s_y_tvalid;
  s_y_tready <= s_y_1_TREADY;
  swap_0_1 <= swap;
axi_double_buff_0: component slice_agent_axi_double_buff_0_24
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => axi_double_buff_0_eject_A1,
      eject_A2 => axi_double_buff_0_eject_A2,
      empty_A1 => prb_sort_v1_1_1_empty,
      empty_A2 => prb_sort_v1_1_0_empty,
      empty_y => axi_double_buff_0_empty_y,
      m_A1_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      m_A1_tlast => axi_double_buff_0_m_A1_TLAST,
      m_A1_tready => axi_double_buff_0_m_A1_TREADY,
      m_A1_tvalid => axi_double_buff_0_m_A1_TVALID,
      m_A2_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      m_A2_tlast => axi_double_buff_0_m_A2_TLAST,
      m_A2_tready => axi_double_buff_0_m_A2_TREADY,
      m_A2_tvalid => axi_double_buff_0_m_A2_TVALID,
      m_y_tdata(63 downto 0) => axi_double_buff_0_m_y_TDATA(63 downto 0),
      m_y_tlast => axi_double_buff_0_m_y_TLAST,
      m_y_tready => axi_double_buff_0_m_y_TREADY,
      m_y_tvalid => axi_double_buff_0_m_y_TVALID,
      rstn => s_aresetn_0_0_1,
      s_A1_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      s_A1_tlast => prb_sort_v1_1_1_dest_TLAST,
      s_A1_tready => prb_sort_v1_1_1_dest_TREADY,
      s_A1_tvalid => prb_sort_v1_1_1_dest_TVALID,
      s_A2_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      s_A2_tlast => prb_sort_v1_1_0_dest_TLAST,
      s_A2_tready => prb_sort_v1_1_0_dest_TREADY,
      s_A2_tvalid => prb_sort_v1_1_0_dest_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
prb_sort_v1_1_0: component slice_agent_prb_sort_v1_1_0_11
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_0_dest_TLAST,
      dest_tready => prb_sort_v1_1_0_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_0_dest_TVALID,
      eject => axi_double_buff_0_eject_A2,
      empty => prb_sort_v1_1_0_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A2_TLAST,
      src_tready => axi_double_buff_0_m_A2_TREADY,
      src_tvalid => axi_double_buff_0_m_A2_TVALID,
      tlast_err => NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED
    );
prb_sort_v1_1_1: component slice_agent_prb_sort_v1_1_1_9
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_1_dest_TLAST,
      dest_tready => prb_sort_v1_1_1_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_1_dest_TVALID,
      eject => axi_double_buff_0_eject_A1,
      empty => prb_sort_v1_1_1_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A1_TLAST,
      src_tready => axi_double_buff_0_m_A1_TREADY,
      src_tvalid => axi_double_buff_0_m_A1_TVALID,
      tlast_err => NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_11_imp_4RMLOE is
  port (
    eject : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tlast : out STD_LOGIC;
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tlast : in STD_LOGIC;
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    swap : in STD_LOGIC
  );
end double_buffer_11_imp_4RMLOE;

architecture STRUCTURE of double_buffer_11_imp_4RMLOE is
  component slice_agent_axi_double_buff_0_25 is
  port (
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    m_y_tlast : out STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    s_y_tlast : in STD_LOGIC;
    m_A1_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A1_tready : in STD_LOGIC;
    m_A1_tvalid : out STD_LOGIC;
    m_A1_tlast : out STD_LOGIC;
    s_A1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A1_tready : out STD_LOGIC;
    s_A1_tvalid : in STD_LOGIC;
    s_A1_tlast : in STD_LOGIC;
    m_A2_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A2_tready : in STD_LOGIC;
    m_A2_tvalid : out STD_LOGIC;
    m_A2_tlast : out STD_LOGIC;
    s_A2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A2_tready : out STD_LOGIC;
    s_A2_tvalid : in STD_LOGIC;
    s_A2_tlast : in STD_LOGIC;
    swap : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    empty_A1 : in STD_LOGIC;
    empty_A2 : in STD_LOGIC;
    eject : in STD_LOGIC;
    eject_A1 : out STD_LOGIC;
    eject_A2 : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
  end component slice_agent_axi_double_buff_0_25;
  component slice_agent_prb_sort_v1_1_0_12 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_0_12;
  component slice_agent_prb_sort_v1_1_1_10 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_1_10;
  signal axi_double_buff_0_eject_A1 : STD_LOGIC;
  signal axi_double_buff_0_eject_A2 : STD_LOGIC;
  signal axi_double_buff_0_empty_y : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A1_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A2_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_y_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_y_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_y_TVALID : STD_LOGIC;
  signal eject_1 : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_0_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_0_empty : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_1_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_1_empty : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED : STD_LOGIC;
  signal NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED : STD_LOGIC;
begin
  axi_double_buff_0_m_y_TREADY <= m_y_tready;
  eject_1 <= eject;
  empty_y <= axi_double_buff_0_empty_y;
  m_y_tdata(63 downto 0) <= axi_double_buff_0_m_y_TDATA(63 downto 0);
  m_y_tlast <= axi_double_buff_0_m_y_TLAST;
  m_y_tvalid <= axi_double_buff_0_m_y_TVALID;
  s_aclk_0_0_1 <= s_aclk;
  s_aresetn_0_0_1 <= s_aresetn;
  s_y_1_TDATA(63 downto 0) <= s_y_tdata(63 downto 0);
  s_y_1_TLAST <= s_y_tlast;
  s_y_1_TVALID <= s_y_tvalid;
  s_y_tready <= s_y_1_TREADY;
  swap_0_1 <= swap;
axi_double_buff_0: component slice_agent_axi_double_buff_0_25
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => axi_double_buff_0_eject_A1,
      eject_A2 => axi_double_buff_0_eject_A2,
      empty_A1 => prb_sort_v1_1_1_empty,
      empty_A2 => prb_sort_v1_1_0_empty,
      empty_y => axi_double_buff_0_empty_y,
      m_A1_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      m_A1_tlast => axi_double_buff_0_m_A1_TLAST,
      m_A1_tready => axi_double_buff_0_m_A1_TREADY,
      m_A1_tvalid => axi_double_buff_0_m_A1_TVALID,
      m_A2_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      m_A2_tlast => axi_double_buff_0_m_A2_TLAST,
      m_A2_tready => axi_double_buff_0_m_A2_TREADY,
      m_A2_tvalid => axi_double_buff_0_m_A2_TVALID,
      m_y_tdata(63 downto 0) => axi_double_buff_0_m_y_TDATA(63 downto 0),
      m_y_tlast => axi_double_buff_0_m_y_TLAST,
      m_y_tready => axi_double_buff_0_m_y_TREADY,
      m_y_tvalid => axi_double_buff_0_m_y_TVALID,
      rstn => s_aresetn_0_0_1,
      s_A1_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      s_A1_tlast => prb_sort_v1_1_1_dest_TLAST,
      s_A1_tready => prb_sort_v1_1_1_dest_TREADY,
      s_A1_tvalid => prb_sort_v1_1_1_dest_TVALID,
      s_A2_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      s_A2_tlast => prb_sort_v1_1_0_dest_TLAST,
      s_A2_tready => prb_sort_v1_1_0_dest_TREADY,
      s_A2_tvalid => prb_sort_v1_1_0_dest_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
prb_sort_v1_1_0: component slice_agent_prb_sort_v1_1_0_12
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_0_dest_TLAST,
      dest_tready => prb_sort_v1_1_0_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_0_dest_TVALID,
      eject => axi_double_buff_0_eject_A2,
      empty => prb_sort_v1_1_0_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A2_TLAST,
      src_tready => axi_double_buff_0_m_A2_TREADY,
      src_tvalid => axi_double_buff_0_m_A2_TVALID,
      tlast_err => NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED
    );
prb_sort_v1_1_1: component slice_agent_prb_sort_v1_1_1_10
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_1_dest_TLAST,
      dest_tready => prb_sort_v1_1_1_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_1_dest_TVALID,
      eject => axi_double_buff_0_eject_A1,
      empty => prb_sort_v1_1_1_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A1_TLAST,
      src_tready => axi_double_buff_0_m_A1_TREADY,
      src_tvalid => axi_double_buff_0_m_A1_TVALID,
      tlast_err => NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_12_imp_SHQF9Q is
  port (
    eject : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tlast : out STD_LOGIC;
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tlast : in STD_LOGIC;
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    swap : in STD_LOGIC
  );
end double_buffer_12_imp_SHQF9Q;

architecture STRUCTURE of double_buffer_12_imp_SHQF9Q is
  component slice_agent_axi_double_buff_0_26 is
  port (
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    m_y_tlast : out STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    s_y_tlast : in STD_LOGIC;
    m_A1_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A1_tready : in STD_LOGIC;
    m_A1_tvalid : out STD_LOGIC;
    m_A1_tlast : out STD_LOGIC;
    s_A1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A1_tready : out STD_LOGIC;
    s_A1_tvalid : in STD_LOGIC;
    s_A1_tlast : in STD_LOGIC;
    m_A2_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A2_tready : in STD_LOGIC;
    m_A2_tvalid : out STD_LOGIC;
    m_A2_tlast : out STD_LOGIC;
    s_A2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A2_tready : out STD_LOGIC;
    s_A2_tvalid : in STD_LOGIC;
    s_A2_tlast : in STD_LOGIC;
    swap : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    empty_A1 : in STD_LOGIC;
    empty_A2 : in STD_LOGIC;
    eject : in STD_LOGIC;
    eject_A1 : out STD_LOGIC;
    eject_A2 : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
  end component slice_agent_axi_double_buff_0_26;
  component slice_agent_prb_sort_v1_1_0_13 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_0_13;
  component slice_agent_prb_sort_v1_1_1_11 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_1_11;
  signal axi_double_buff_0_eject_A1 : STD_LOGIC;
  signal axi_double_buff_0_eject_A2 : STD_LOGIC;
  signal axi_double_buff_0_empty_y : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A1_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A2_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_y_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_y_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_y_TVALID : STD_LOGIC;
  signal eject_1 : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_0_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_0_empty : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_1_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_1_empty : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED : STD_LOGIC;
  signal NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED : STD_LOGIC;
begin
  axi_double_buff_0_m_y_TREADY <= m_y_tready;
  eject_1 <= eject;
  empty_y <= axi_double_buff_0_empty_y;
  m_y_tdata(63 downto 0) <= axi_double_buff_0_m_y_TDATA(63 downto 0);
  m_y_tlast <= axi_double_buff_0_m_y_TLAST;
  m_y_tvalid <= axi_double_buff_0_m_y_TVALID;
  s_aclk_0_0_1 <= s_aclk;
  s_aresetn_0_0_1 <= s_aresetn;
  s_y_1_TDATA(63 downto 0) <= s_y_tdata(63 downto 0);
  s_y_1_TLAST <= s_y_tlast;
  s_y_1_TVALID <= s_y_tvalid;
  s_y_tready <= s_y_1_TREADY;
  swap_0_1 <= swap;
axi_double_buff_0: component slice_agent_axi_double_buff_0_26
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => axi_double_buff_0_eject_A1,
      eject_A2 => axi_double_buff_0_eject_A2,
      empty_A1 => prb_sort_v1_1_1_empty,
      empty_A2 => prb_sort_v1_1_0_empty,
      empty_y => axi_double_buff_0_empty_y,
      m_A1_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      m_A1_tlast => axi_double_buff_0_m_A1_TLAST,
      m_A1_tready => axi_double_buff_0_m_A1_TREADY,
      m_A1_tvalid => axi_double_buff_0_m_A1_TVALID,
      m_A2_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      m_A2_tlast => axi_double_buff_0_m_A2_TLAST,
      m_A2_tready => axi_double_buff_0_m_A2_TREADY,
      m_A2_tvalid => axi_double_buff_0_m_A2_TVALID,
      m_y_tdata(63 downto 0) => axi_double_buff_0_m_y_TDATA(63 downto 0),
      m_y_tlast => axi_double_buff_0_m_y_TLAST,
      m_y_tready => axi_double_buff_0_m_y_TREADY,
      m_y_tvalid => axi_double_buff_0_m_y_TVALID,
      rstn => s_aresetn_0_0_1,
      s_A1_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      s_A1_tlast => prb_sort_v1_1_1_dest_TLAST,
      s_A1_tready => prb_sort_v1_1_1_dest_TREADY,
      s_A1_tvalid => prb_sort_v1_1_1_dest_TVALID,
      s_A2_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      s_A2_tlast => prb_sort_v1_1_0_dest_TLAST,
      s_A2_tready => prb_sort_v1_1_0_dest_TREADY,
      s_A2_tvalid => prb_sort_v1_1_0_dest_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
prb_sort_v1_1_0: component slice_agent_prb_sort_v1_1_0_13
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_0_dest_TLAST,
      dest_tready => prb_sort_v1_1_0_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_0_dest_TVALID,
      eject => axi_double_buff_0_eject_A2,
      empty => prb_sort_v1_1_0_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A2_TLAST,
      src_tready => axi_double_buff_0_m_A2_TREADY,
      src_tvalid => axi_double_buff_0_m_A2_TVALID,
      tlast_err => NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED
    );
prb_sort_v1_1_1: component slice_agent_prb_sort_v1_1_1_11
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_1_dest_TLAST,
      dest_tready => prb_sort_v1_1_1_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_1_dest_TVALID,
      eject => axi_double_buff_0_eject_A1,
      empty => prb_sort_v1_1_1_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A1_TLAST,
      src_tready => axi_double_buff_0_m_A1_TREADY,
      src_tvalid => axi_double_buff_0_m_A1_TVALID,
      tlast_err => NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_13_imp_1Y7Z3Q9 is
  port (
    eject : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tlast : out STD_LOGIC;
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tlast : in STD_LOGIC;
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    swap : in STD_LOGIC
  );
end double_buffer_13_imp_1Y7Z3Q9;

architecture STRUCTURE of double_buffer_13_imp_1Y7Z3Q9 is
  component slice_agent_axi_double_buff_0_27 is
  port (
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    m_y_tlast : out STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    s_y_tlast : in STD_LOGIC;
    m_A1_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A1_tready : in STD_LOGIC;
    m_A1_tvalid : out STD_LOGIC;
    m_A1_tlast : out STD_LOGIC;
    s_A1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A1_tready : out STD_LOGIC;
    s_A1_tvalid : in STD_LOGIC;
    s_A1_tlast : in STD_LOGIC;
    m_A2_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A2_tready : in STD_LOGIC;
    m_A2_tvalid : out STD_LOGIC;
    m_A2_tlast : out STD_LOGIC;
    s_A2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A2_tready : out STD_LOGIC;
    s_A2_tvalid : in STD_LOGIC;
    s_A2_tlast : in STD_LOGIC;
    swap : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    empty_A1 : in STD_LOGIC;
    empty_A2 : in STD_LOGIC;
    eject : in STD_LOGIC;
    eject_A1 : out STD_LOGIC;
    eject_A2 : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
  end component slice_agent_axi_double_buff_0_27;
  component slice_agent_prb_sort_v1_1_0_14 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_0_14;
  component slice_agent_prb_sort_v1_1_1_12 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_1_12;
  signal axi_double_buff_0_eject_A1 : STD_LOGIC;
  signal axi_double_buff_0_eject_A2 : STD_LOGIC;
  signal axi_double_buff_0_empty_y : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A1_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A2_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_y_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_y_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_y_TVALID : STD_LOGIC;
  signal eject_1 : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_0_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_0_empty : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_1_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_1_empty : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED : STD_LOGIC;
  signal NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED : STD_LOGIC;
begin
  axi_double_buff_0_m_y_TREADY <= m_y_tready;
  eject_1 <= eject;
  empty_y <= axi_double_buff_0_empty_y;
  m_y_tdata(63 downto 0) <= axi_double_buff_0_m_y_TDATA(63 downto 0);
  m_y_tlast <= axi_double_buff_0_m_y_TLAST;
  m_y_tvalid <= axi_double_buff_0_m_y_TVALID;
  s_aclk_0_0_1 <= s_aclk;
  s_aresetn_0_0_1 <= s_aresetn;
  s_y_1_TDATA(63 downto 0) <= s_y_tdata(63 downto 0);
  s_y_1_TLAST <= s_y_tlast;
  s_y_1_TVALID <= s_y_tvalid;
  s_y_tready <= s_y_1_TREADY;
  swap_0_1 <= swap;
axi_double_buff_0: component slice_agent_axi_double_buff_0_27
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => axi_double_buff_0_eject_A1,
      eject_A2 => axi_double_buff_0_eject_A2,
      empty_A1 => prb_sort_v1_1_1_empty,
      empty_A2 => prb_sort_v1_1_0_empty,
      empty_y => axi_double_buff_0_empty_y,
      m_A1_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      m_A1_tlast => axi_double_buff_0_m_A1_TLAST,
      m_A1_tready => axi_double_buff_0_m_A1_TREADY,
      m_A1_tvalid => axi_double_buff_0_m_A1_TVALID,
      m_A2_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      m_A2_tlast => axi_double_buff_0_m_A2_TLAST,
      m_A2_tready => axi_double_buff_0_m_A2_TREADY,
      m_A2_tvalid => axi_double_buff_0_m_A2_TVALID,
      m_y_tdata(63 downto 0) => axi_double_buff_0_m_y_TDATA(63 downto 0),
      m_y_tlast => axi_double_buff_0_m_y_TLAST,
      m_y_tready => axi_double_buff_0_m_y_TREADY,
      m_y_tvalid => axi_double_buff_0_m_y_TVALID,
      rstn => s_aresetn_0_0_1,
      s_A1_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      s_A1_tlast => prb_sort_v1_1_1_dest_TLAST,
      s_A1_tready => prb_sort_v1_1_1_dest_TREADY,
      s_A1_tvalid => prb_sort_v1_1_1_dest_TVALID,
      s_A2_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      s_A2_tlast => prb_sort_v1_1_0_dest_TLAST,
      s_A2_tready => prb_sort_v1_1_0_dest_TREADY,
      s_A2_tvalid => prb_sort_v1_1_0_dest_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
prb_sort_v1_1_0: component slice_agent_prb_sort_v1_1_0_14
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_0_dest_TLAST,
      dest_tready => prb_sort_v1_1_0_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_0_dest_TVALID,
      eject => axi_double_buff_0_eject_A2,
      empty => prb_sort_v1_1_0_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A2_TLAST,
      src_tready => axi_double_buff_0_m_A2_TREADY,
      src_tvalid => axi_double_buff_0_m_A2_TVALID,
      tlast_err => NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED
    );
prb_sort_v1_1_1: component slice_agent_prb_sort_v1_1_1_12
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_1_dest_TLAST,
      dest_tready => prb_sort_v1_1_1_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_1_dest_TVALID,
      eject => axi_double_buff_0_eject_A1,
      empty => prb_sort_v1_1_1_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A1_TLAST,
      src_tready => axi_double_buff_0_m_A1_TREADY,
      src_tvalid => axi_double_buff_0_m_A1_TVALID,
      tlast_err => NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_imp_11EU637 is
  port (
    eject : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tlast : out STD_LOGIC;
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tlast : in STD_LOGIC;
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    swap : in STD_LOGIC
  );
end double_buffer_imp_11EU637;

architecture STRUCTURE of double_buffer_imp_11EU637 is
  component slice_agent_axi_double_buff_0_0 is
  port (
    m_y_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_y_tready : in STD_LOGIC;
    m_y_tvalid : out STD_LOGIC;
    m_y_tlast : out STD_LOGIC;
    s_y_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_y_tready : out STD_LOGIC;
    s_y_tvalid : in STD_LOGIC;
    s_y_tlast : in STD_LOGIC;
    m_A1_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A1_tready : in STD_LOGIC;
    m_A1_tvalid : out STD_LOGIC;
    m_A1_tlast : out STD_LOGIC;
    s_A1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A1_tready : out STD_LOGIC;
    s_A1_tvalid : in STD_LOGIC;
    s_A1_tlast : in STD_LOGIC;
    m_A2_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_A2_tready : in STD_LOGIC;
    m_A2_tvalid : out STD_LOGIC;
    m_A2_tlast : out STD_LOGIC;
    s_A2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_A2_tready : out STD_LOGIC;
    s_A2_tvalid : in STD_LOGIC;
    s_A2_tlast : in STD_LOGIC;
    swap : in STD_LOGIC;
    empty_y : out STD_LOGIC;
    empty_A1 : in STD_LOGIC;
    empty_A2 : in STD_LOGIC;
    eject : in STD_LOGIC;
    eject_A1 : out STD_LOGIC;
    eject_A2 : out STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC
  );
  end component slice_agent_axi_double_buff_0_0;
  component slice_agent_prb_sort_v1_1_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_0_0;
  component slice_agent_prb_sort_v1_1_0_1 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    src_tvalid : in STD_LOGIC;
    src_tready : out STD_LOGIC;
    src_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    src_tlast : in STD_LOGIC;
    dest_tvalid : out STD_LOGIC;
    dest_tready : in STD_LOGIC;
    dest_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    dest_tlast : out STD_LOGIC;
    eject : in STD_LOGIC;
    empty : out STD_LOGIC;
    tlast_err : out STD_LOGIC
  );
  end component slice_agent_prb_sort_v1_1_0_1;
  signal axi_double_buff_0_eject_A1 : STD_LOGIC;
  signal axi_double_buff_0_eject_A2 : STD_LOGIC;
  signal axi_double_buff_0_empty_y : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A1_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A1_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_A2_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_A2_TVALID : STD_LOGIC;
  signal axi_double_buff_0_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_double_buff_0_m_y_TLAST : STD_LOGIC;
  signal axi_double_buff_0_m_y_TREADY : STD_LOGIC;
  signal axi_double_buff_0_m_y_TVALID : STD_LOGIC;
  signal eject_1 : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_0_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_0_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_0_empty : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal prb_sort_v1_1_1_dest_TLAST : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TREADY : STD_LOGIC;
  signal prb_sort_v1_1_1_dest_TVALID : STD_LOGIC;
  signal prb_sort_v1_1_1_empty : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED : STD_LOGIC;
  signal NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED : STD_LOGIC;
begin
  axi_double_buff_0_m_y_TREADY <= m_y_tready;
  eject_1 <= eject;
  empty_y <= axi_double_buff_0_empty_y;
  m_y_tdata(63 downto 0) <= axi_double_buff_0_m_y_TDATA(63 downto 0);
  m_y_tlast <= axi_double_buff_0_m_y_TLAST;
  m_y_tvalid <= axi_double_buff_0_m_y_TVALID;
  s_aclk_0_0_1 <= s_aclk;
  s_aresetn_0_0_1 <= s_aresetn;
  s_y_1_TDATA(63 downto 0) <= s_y_tdata(63 downto 0);
  s_y_1_TLAST <= s_y_tlast;
  s_y_1_TVALID <= s_y_tvalid;
  s_y_tready <= s_y_1_TREADY;
  swap_0_1 <= swap;
axi_double_buff_0: component slice_agent_axi_double_buff_0_0
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => axi_double_buff_0_eject_A1,
      eject_A2 => axi_double_buff_0_eject_A2,
      empty_A1 => prb_sort_v1_1_1_empty,
      empty_A2 => prb_sort_v1_1_0_empty,
      empty_y => axi_double_buff_0_empty_y,
      m_A1_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      m_A1_tlast => axi_double_buff_0_m_A1_TLAST,
      m_A1_tready => axi_double_buff_0_m_A1_TREADY,
      m_A1_tvalid => axi_double_buff_0_m_A1_TVALID,
      m_A2_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      m_A2_tlast => axi_double_buff_0_m_A2_TLAST,
      m_A2_tready => axi_double_buff_0_m_A2_TREADY,
      m_A2_tvalid => axi_double_buff_0_m_A2_TVALID,
      m_y_tdata(63 downto 0) => axi_double_buff_0_m_y_TDATA(63 downto 0),
      m_y_tlast => axi_double_buff_0_m_y_TLAST,
      m_y_tready => axi_double_buff_0_m_y_TREADY,
      m_y_tvalid => axi_double_buff_0_m_y_TVALID,
      rstn => s_aresetn_0_0_1,
      s_A1_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      s_A1_tlast => prb_sort_v1_1_1_dest_TLAST,
      s_A1_tready => prb_sort_v1_1_1_dest_TREADY,
      s_A1_tvalid => prb_sort_v1_1_1_dest_TVALID,
      s_A2_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      s_A2_tlast => prb_sort_v1_1_0_dest_TLAST,
      s_A2_tready => prb_sort_v1_1_0_dest_TREADY,
      s_A2_tvalid => prb_sort_v1_1_0_dest_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
prb_sort_v1_1_0: component slice_agent_prb_sort_v1_1_0_0
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_0_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_0_dest_TLAST,
      dest_tready => prb_sort_v1_1_0_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_0_dest_TVALID,
      eject => axi_double_buff_0_eject_A2,
      empty => prb_sort_v1_1_0_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A2_TLAST,
      src_tready => axi_double_buff_0_m_A2_TREADY,
      src_tvalid => axi_double_buff_0_m_A2_TVALID,
      tlast_err => NLW_prb_sort_v1_1_0_tlast_err_UNCONNECTED
    );
prb_sort_v1_1_1: component slice_agent_prb_sort_v1_1_0_1
     port map (
      clk => s_aclk_0_0_1,
      dest_tdata(63 downto 0) => prb_sort_v1_1_1_dest_TDATA(63 downto 0),
      dest_tlast => prb_sort_v1_1_1_dest_TLAST,
      dest_tready => prb_sort_v1_1_1_dest_TREADY,
      dest_tvalid => prb_sort_v1_1_1_dest_TVALID,
      eject => axi_double_buff_0_eject_A1,
      empty => prb_sort_v1_1_1_empty,
      rst => s_aresetn_0_0_1,
      src_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      src_tlast => axi_double_buff_0_m_A1_TLAST,
      src_tready => axi_double_buff_0_m_A1_TREADY,
      src_tvalid => axi_double_buff_0_m_A1_TVALID,
      tlast_err => NLW_prb_sort_v1_1_1_tlast_err_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Buffers_imp_1PBRZMN is
  port (
    M_AXIS_00_0_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_0_tlast : out STD_LOGIC;
    M_AXIS_00_0_tready : in STD_LOGIC;
    M_AXIS_00_0_tvalid : out STD_LOGIC;
    S_AXIS_0A_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_0A_tlast : in STD_LOGIC;
    S_AXIS_0A_tready : out STD_LOGIC;
    S_AXIS_0A_tvalid : in STD_LOGIC;
    S_AXIS_0B_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_0B_tlast : in STD_LOGIC;
    S_AXIS_0B_tready : out STD_LOGIC;
    S_AXIS_0B_tvalid : in STD_LOGIC;
    S_AXIS_10A_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_10A_tlast : in STD_LOGIC;
    S_AXIS_10A_tready : out STD_LOGIC;
    S_AXIS_10A_tvalid : in STD_LOGIC;
    S_AXIS_10B_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_10B_tlast : in STD_LOGIC;
    S_AXIS_10B_tready : out STD_LOGIC;
    S_AXIS_10B_tvalid : in STD_LOGIC;
    S_AXIS_11A_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_11A_tlast : in STD_LOGIC;
    S_AXIS_11A_tready : out STD_LOGIC;
    S_AXIS_11A_tvalid : in STD_LOGIC;
    S_AXIS_11B_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_11B_tlast : in STD_LOGIC;
    S_AXIS_11B_tready : out STD_LOGIC;
    S_AXIS_11B_tvalid : in STD_LOGIC;
    S_AXIS_12A_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_12A_tlast : in STD_LOGIC;
    S_AXIS_12A_tready : out STD_LOGIC;
    S_AXIS_12A_tvalid : in STD_LOGIC;
    S_AXIS_12B_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_12B_tlast : in STD_LOGIC;
    S_AXIS_12B_tready : out STD_LOGIC;
    S_AXIS_12B_tvalid : in STD_LOGIC;
    S_AXIS_13A_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_13A_tlast : in STD_LOGIC;
    S_AXIS_13A_tready : out STD_LOGIC;
    S_AXIS_13A_tvalid : in STD_LOGIC;
    S_AXIS_13B_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_13B_tlast : in STD_LOGIC;
    S_AXIS_13B_tready : out STD_LOGIC;
    S_AXIS_13B_tvalid : in STD_LOGIC;
    S_AXIS_1A_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_1A_tlast : in STD_LOGIC;
    S_AXIS_1A_tready : out STD_LOGIC;
    S_AXIS_1A_tvalid : in STD_LOGIC;
    S_AXIS_1B_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_1B_tlast : in STD_LOGIC;
    S_AXIS_1B_tready : out STD_LOGIC;
    S_AXIS_1B_tvalid : in STD_LOGIC;
    S_AXIS_2A_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_2A_tlast : in STD_LOGIC;
    S_AXIS_2A_tready : out STD_LOGIC;
    S_AXIS_2A_tvalid : in STD_LOGIC;
    S_AXIS_2B_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_2B_tlast : in STD_LOGIC;
    S_AXIS_2B_tready : out STD_LOGIC;
    S_AXIS_2B_tvalid : in STD_LOGIC;
    S_AXIS_3A_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_3A_tlast : in STD_LOGIC;
    S_AXIS_3A_tready : out STD_LOGIC;
    S_AXIS_3A_tvalid : in STD_LOGIC;
    S_AXIS_3B_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_3B_tlast : in STD_LOGIC;
    S_AXIS_3B_tready : out STD_LOGIC;
    S_AXIS_3B_tvalid : in STD_LOGIC;
    S_AXIS_4A_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_4A_tlast : in STD_LOGIC;
    S_AXIS_4A_tready : out STD_LOGIC;
    S_AXIS_4A_tvalid : in STD_LOGIC;
    S_AXIS_4B_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_4B_tlast : in STD_LOGIC;
    S_AXIS_4B_tready : out STD_LOGIC;
    S_AXIS_4B_tvalid : in STD_LOGIC;
    S_AXIS_5A_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_5A_tlast : in STD_LOGIC;
    S_AXIS_5A_tready : out STD_LOGIC;
    S_AXIS_5A_tvalid : in STD_LOGIC;
    S_AXIS_5B_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_5B_tlast : in STD_LOGIC;
    S_AXIS_5B_tready : out STD_LOGIC;
    S_AXIS_5B_tvalid : in STD_LOGIC;
    S_AXIS_6A_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_6A_tlast : in STD_LOGIC;
    S_AXIS_6A_tready : out STD_LOGIC;
    S_AXIS_6A_tvalid : in STD_LOGIC;
    S_AXIS_6B_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_6B_tlast : in STD_LOGIC;
    S_AXIS_6B_tready : out STD_LOGIC;
    S_AXIS_6B_tvalid : in STD_LOGIC;
    S_AXIS_7A_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_7A_tlast : in STD_LOGIC;
    S_AXIS_7A_tready : out STD_LOGIC;
    S_AXIS_7A_tvalid : in STD_LOGIC;
    S_AXIS_7B_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_7B_tlast : in STD_LOGIC;
    S_AXIS_7B_tready : out STD_LOGIC;
    S_AXIS_7B_tvalid : in STD_LOGIC;
    S_AXIS_8A_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_8A_tlast : in STD_LOGIC;
    S_AXIS_8A_tready : out STD_LOGIC;
    S_AXIS_8A_tvalid : in STD_LOGIC;
    S_AXIS_8B_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_8B_tlast : in STD_LOGIC;
    S_AXIS_8B_tready : out STD_LOGIC;
    S_AXIS_8B_tvalid : in STD_LOGIC;
    S_AXIS_9A_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_9A_tlast : in STD_LOGIC;
    S_AXIS_9A_tready : out STD_LOGIC;
    S_AXIS_9A_tvalid : in STD_LOGIC;
    S_AXIS_9B_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_9B_tlast : in STD_LOGIC;
    S_AXIS_9B_tready : out STD_LOGIC;
    S_AXIS_9B_tvalid : in STD_LOGIC;
    ejectBufs : in STD_LOGIC_VECTOR ( 13 downto 0 );
    empty_0 : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    sel : in STD_LOGIC_VECTOR ( 0 to 0 );
    sel_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    swap : in STD_LOGIC
  );
end Buffers_imp_1PBRZMN;

architecture STRUCTURE of Buffers_imp_1PBRZMN is
  component slice_agent_axi_demux_2x1_0_0 is
  port (
    S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_00_tvalid : in STD_LOGIC;
    S_AXIS_00_tlast : in STD_LOGIC;
    S_AXIS_00_tready : out STD_LOGIC;
    S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_01_tvalid : in STD_LOGIC;
    S_AXIS_01_tlast : in STD_LOGIC;
    S_AXIS_01_tready : out STD_LOGIC;
    M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_tvalid : out STD_LOGIC;
    M_AXIS_00_tlast : out STD_LOGIC;
    M_AXIS_00_tready : in STD_LOGIC;
    status : out STD_LOGIC;
    sel : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  end component slice_agent_axi_demux_2x1_0_0;
  component slice_agent_axi_demux_2x1_0_1 is
  port (
    S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_00_tvalid : in STD_LOGIC;
    S_AXIS_00_tlast : in STD_LOGIC;
    S_AXIS_00_tready : out STD_LOGIC;
    S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_01_tvalid : in STD_LOGIC;
    S_AXIS_01_tlast : in STD_LOGIC;
    S_AXIS_01_tready : out STD_LOGIC;
    M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_tvalid : out STD_LOGIC;
    M_AXIS_00_tlast : out STD_LOGIC;
    M_AXIS_00_tready : in STD_LOGIC;
    status : out STD_LOGIC;
    sel : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  end component slice_agent_axi_demux_2x1_0_1;
  component slice_agent_axi_demux_2x1_0_2 is
  port (
    S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_00_tvalid : in STD_LOGIC;
    S_AXIS_00_tlast : in STD_LOGIC;
    S_AXIS_00_tready : out STD_LOGIC;
    S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_01_tvalid : in STD_LOGIC;
    S_AXIS_01_tlast : in STD_LOGIC;
    S_AXIS_01_tready : out STD_LOGIC;
    M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_tvalid : out STD_LOGIC;
    M_AXIS_00_tlast : out STD_LOGIC;
    M_AXIS_00_tready : in STD_LOGIC;
    status : out STD_LOGIC;
    sel : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  end component slice_agent_axi_demux_2x1_0_2;
  component slice_agent_xlslice_0_1 is
  port (
    Din : in STD_LOGIC_VECTOR ( 13 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlslice_0_1;
  component slice_agent_axi_demux_2x1_1_0 is
  port (
    S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_00_tvalid : in STD_LOGIC;
    S_AXIS_00_tlast : in STD_LOGIC;
    S_AXIS_00_tready : out STD_LOGIC;
    S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_01_tvalid : in STD_LOGIC;
    S_AXIS_01_tlast : in STD_LOGIC;
    S_AXIS_01_tready : out STD_LOGIC;
    M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_tvalid : out STD_LOGIC;
    M_AXIS_00_tlast : out STD_LOGIC;
    M_AXIS_00_tready : in STD_LOGIC;
    status : out STD_LOGIC;
    sel : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  end component slice_agent_axi_demux_2x1_1_0;
  component slice_agent_xlslice_2_7 is
  port (
    Din : in STD_LOGIC_VECTOR ( 13 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlslice_2_7;
  component slice_agent_xlslice_0_3 is
  port (
    Din : in STD_LOGIC_VECTOR ( 13 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlslice_0_3;
  component slice_agent_xlslice_2_8 is
  port (
    Din : in STD_LOGIC_VECTOR ( 13 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlslice_2_8;
  component slice_agent_axi_demux_2x1_0_3 is
  port (
    S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_00_tvalid : in STD_LOGIC;
    S_AXIS_00_tlast : in STD_LOGIC;
    S_AXIS_00_tready : out STD_LOGIC;
    S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_01_tvalid : in STD_LOGIC;
    S_AXIS_01_tlast : in STD_LOGIC;
    S_AXIS_01_tready : out STD_LOGIC;
    M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_tvalid : out STD_LOGIC;
    M_AXIS_00_tlast : out STD_LOGIC;
    M_AXIS_00_tready : in STD_LOGIC;
    status : out STD_LOGIC;
    sel : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  end component slice_agent_axi_demux_2x1_0_3;
  component slice_agent_xlslice_1_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 13 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlslice_1_0;
  component slice_agent_axi_demux_2x1_1_1 is
  port (
    S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_00_tvalid : in STD_LOGIC;
    S_AXIS_00_tlast : in STD_LOGIC;
    S_AXIS_00_tready : out STD_LOGIC;
    S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_01_tvalid : in STD_LOGIC;
    S_AXIS_01_tlast : in STD_LOGIC;
    S_AXIS_01_tready : out STD_LOGIC;
    M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_tvalid : out STD_LOGIC;
    M_AXIS_00_tlast : out STD_LOGIC;
    M_AXIS_00_tready : in STD_LOGIC;
    status : out STD_LOGIC;
    sel : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  end component slice_agent_axi_demux_2x1_1_1;
  component slice_agent_xlslice_2_9 is
  port (
    Din : in STD_LOGIC_VECTOR ( 13 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlslice_2_9;
  component slice_agent_xlslice_2_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 13 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlslice_2_0;
  component slice_agent_axi_demux_2x1_5_0 is
  port (
    S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_00_tvalid : in STD_LOGIC;
    S_AXIS_00_tlast : in STD_LOGIC;
    S_AXIS_00_tready : out STD_LOGIC;
    S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_01_tvalid : in STD_LOGIC;
    S_AXIS_01_tlast : in STD_LOGIC;
    S_AXIS_01_tready : out STD_LOGIC;
    M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_tvalid : out STD_LOGIC;
    M_AXIS_00_tlast : out STD_LOGIC;
    M_AXIS_00_tready : in STD_LOGIC;
    status : out STD_LOGIC;
    sel : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  end component slice_agent_axi_demux_2x1_5_0;
  component slice_agent_xlslice_2_10 is
  port (
    Din : in STD_LOGIC_VECTOR ( 13 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlslice_2_10;
  component slice_agent_axi_demux_2x1_0_4 is
  port (
    S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_00_tvalid : in STD_LOGIC;
    S_AXIS_00_tlast : in STD_LOGIC;
    S_AXIS_00_tready : out STD_LOGIC;
    S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_01_tvalid : in STD_LOGIC;
    S_AXIS_01_tlast : in STD_LOGIC;
    S_AXIS_01_tready : out STD_LOGIC;
    M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_tvalid : out STD_LOGIC;
    M_AXIS_00_tlast : out STD_LOGIC;
    M_AXIS_00_tready : in STD_LOGIC;
    status : out STD_LOGIC;
    sel : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  end component slice_agent_axi_demux_2x1_0_4;
  component slice_agent_xlslice_2_1 is
  port (
    Din : in STD_LOGIC_VECTOR ( 13 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlslice_2_1;
  component slice_agent_axi_demux_2x1_1_2 is
  port (
    S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_00_tvalid : in STD_LOGIC;
    S_AXIS_00_tlast : in STD_LOGIC;
    S_AXIS_00_tready : out STD_LOGIC;
    S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_01_tvalid : in STD_LOGIC;
    S_AXIS_01_tlast : in STD_LOGIC;
    S_AXIS_01_tready : out STD_LOGIC;
    M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_tvalid : out STD_LOGIC;
    M_AXIS_00_tlast : out STD_LOGIC;
    M_AXIS_00_tready : in STD_LOGIC;
    status : out STD_LOGIC;
    sel : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  end component slice_agent_axi_demux_2x1_1_2;
  component slice_agent_axi_demux_2x1_3_0 is
  port (
    S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_00_tvalid : in STD_LOGIC;
    S_AXIS_00_tlast : in STD_LOGIC;
    S_AXIS_00_tready : out STD_LOGIC;
    S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_01_tvalid : in STD_LOGIC;
    S_AXIS_01_tlast : in STD_LOGIC;
    S_AXIS_01_tready : out STD_LOGIC;
    M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_tvalid : out STD_LOGIC;
    M_AXIS_00_tlast : out STD_LOGIC;
    M_AXIS_00_tready : in STD_LOGIC;
    status : out STD_LOGIC;
    sel : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  end component slice_agent_axi_demux_2x1_3_0;
  component slice_agent_xlslice_2_2 is
  port (
    Din : in STD_LOGIC_VECTOR ( 13 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlslice_2_2;
  component slice_agent_axi_demux_2x1_4_0 is
  port (
    S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_00_tvalid : in STD_LOGIC;
    S_AXIS_00_tlast : in STD_LOGIC;
    S_AXIS_00_tready : out STD_LOGIC;
    S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_01_tvalid : in STD_LOGIC;
    S_AXIS_01_tlast : in STD_LOGIC;
    S_AXIS_01_tready : out STD_LOGIC;
    M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_tvalid : out STD_LOGIC;
    M_AXIS_00_tlast : out STD_LOGIC;
    M_AXIS_00_tready : in STD_LOGIC;
    status : out STD_LOGIC;
    sel : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  end component slice_agent_axi_demux_2x1_4_0;
  component slice_agent_axi_demux_2x1_2_0 is
  port (
    S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_00_tvalid : in STD_LOGIC;
    S_AXIS_00_tlast : in STD_LOGIC;
    S_AXIS_00_tready : out STD_LOGIC;
    S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_01_tvalid : in STD_LOGIC;
    S_AXIS_01_tlast : in STD_LOGIC;
    S_AXIS_01_tready : out STD_LOGIC;
    M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_tvalid : out STD_LOGIC;
    M_AXIS_00_tlast : out STD_LOGIC;
    M_AXIS_00_tready : in STD_LOGIC;
    status : out STD_LOGIC;
    sel : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  end component slice_agent_axi_demux_2x1_2_0;
  component slice_agent_xlslice_2_3 is
  port (
    Din : in STD_LOGIC_VECTOR ( 13 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlslice_2_3;
  component slice_agent_axi_demux_2x1_5_1 is
  port (
    S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_00_tvalid : in STD_LOGIC;
    S_AXIS_00_tlast : in STD_LOGIC;
    S_AXIS_00_tready : out STD_LOGIC;
    S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_01_tvalid : in STD_LOGIC;
    S_AXIS_01_tlast : in STD_LOGIC;
    S_AXIS_01_tready : out STD_LOGIC;
    M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_tvalid : out STD_LOGIC;
    M_AXIS_00_tlast : out STD_LOGIC;
    M_AXIS_00_tready : in STD_LOGIC;
    status : out STD_LOGIC;
    sel : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  end component slice_agent_axi_demux_2x1_5_1;
  component slice_agent_xlslice_2_4 is
  port (
    Din : in STD_LOGIC_VECTOR ( 13 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlslice_2_4;
  component slice_agent_axi_demux_2x1_6_0 is
  port (
    S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_00_tvalid : in STD_LOGIC;
    S_AXIS_00_tlast : in STD_LOGIC;
    S_AXIS_00_tready : out STD_LOGIC;
    S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_01_tvalid : in STD_LOGIC;
    S_AXIS_01_tlast : in STD_LOGIC;
    S_AXIS_01_tready : out STD_LOGIC;
    M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_tvalid : out STD_LOGIC;
    M_AXIS_00_tlast : out STD_LOGIC;
    M_AXIS_00_tready : in STD_LOGIC;
    status : out STD_LOGIC;
    sel : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  end component slice_agent_axi_demux_2x1_6_0;
  component slice_agent_xlslice_2_5 is
  port (
    Din : in STD_LOGIC_VECTOR ( 13 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlslice_2_5;
  component slice_agent_xlslice_2_6 is
  port (
    Din : in STD_LOGIC_VECTOR ( 13 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlslice_2_6;
  component slice_agent_axi_mux_14x1_0_0 is
  port (
    S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_00_tvalid : in STD_LOGIC;
    S_AXIS_00_tready : out STD_LOGIC;
    S_AXIS_00_tlast : in STD_LOGIC;
    empty_0 : in STD_LOGIC;
    S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_01_tvalid : in STD_LOGIC;
    S_AXIS_01_tready : out STD_LOGIC;
    S_AXIS_01_tlast : in STD_LOGIC;
    empty_1 : in STD_LOGIC;
    S_AXIS_02_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_02_tvalid : in STD_LOGIC;
    S_AXIS_02_tready : out STD_LOGIC;
    S_AXIS_02_tlast : in STD_LOGIC;
    empty_2 : in STD_LOGIC;
    S_AXIS_03_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_03_tvalid : in STD_LOGIC;
    S_AXIS_03_tready : out STD_LOGIC;
    S_AXIS_03_tlast : in STD_LOGIC;
    empty_3 : in STD_LOGIC;
    S_AXIS_04_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_04_tvalid : in STD_LOGIC;
    S_AXIS_04_tready : out STD_LOGIC;
    S_AXIS_04_tlast : in STD_LOGIC;
    empty_4 : in STD_LOGIC;
    S_AXIS_05_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_05_tvalid : in STD_LOGIC;
    S_AXIS_05_tready : out STD_LOGIC;
    S_AXIS_05_tlast : in STD_LOGIC;
    empty_5 : in STD_LOGIC;
    S_AXIS_06_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_06_tvalid : in STD_LOGIC;
    S_AXIS_06_tready : out STD_LOGIC;
    S_AXIS_06_tlast : in STD_LOGIC;
    empty_6 : in STD_LOGIC;
    S_AXIS_07_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_07_tvalid : in STD_LOGIC;
    S_AXIS_07_tready : out STD_LOGIC;
    S_AXIS_07_tlast : in STD_LOGIC;
    empty_7 : in STD_LOGIC;
    S_AXIS_08_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_08_tvalid : in STD_LOGIC;
    S_AXIS_08_tready : out STD_LOGIC;
    S_AXIS_08_tlast : in STD_LOGIC;
    empty_8 : in STD_LOGIC;
    S_AXIS_09_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_09_tvalid : in STD_LOGIC;
    S_AXIS_09_tready : out STD_LOGIC;
    S_AXIS_09_tlast : in STD_LOGIC;
    empty_9 : in STD_LOGIC;
    S_AXIS_10_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_10_tvalid : in STD_LOGIC;
    S_AXIS_10_tready : out STD_LOGIC;
    S_AXIS_10_tlast : in STD_LOGIC;
    empty_10 : in STD_LOGIC;
    S_AXIS_11_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_11_tvalid : in STD_LOGIC;
    S_AXIS_11_tready : out STD_LOGIC;
    S_AXIS_11_tlast : in STD_LOGIC;
    empty_11 : in STD_LOGIC;
    S_AXIS_12_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_12_tvalid : in STD_LOGIC;
    S_AXIS_12_tready : out STD_LOGIC;
    S_AXIS_12_tlast : in STD_LOGIC;
    empty_12 : in STD_LOGIC;
    S_AXIS_13_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    S_AXIS_13_tvalid : in STD_LOGIC;
    S_AXIS_13_tready : out STD_LOGIC;
    S_AXIS_13_tlast : in STD_LOGIC;
    empty_13 : in STD_LOGIC;
    M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_00_tvalid : out STD_LOGIC;
    M_AXIS_00_tready : in STD_LOGIC;
    M_AXIS_00_tlast : out STD_LOGIC;
    empty : out STD_LOGIC;
    sel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    clk : in STD_LOGIC;
    rst0 : in STD_LOGIC
  );
  end component slice_agent_axi_mux_14x1_0_0;
  signal Conn1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal Conn1_TLAST : STD_LOGIC;
  signal Conn1_TREADY : STD_LOGIC;
  signal Conn1_TVALID : STD_LOGIC;
  signal Din_0_1 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal axi_demux_2x1_00_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_00_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_00_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_00_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_demux_2x1_01_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_01_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_01_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_01_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_demux_2x1_02_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_02_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_02_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_02_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_demux_2x1_03_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_03_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_03_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_03_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_demux_2x1_04_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_04_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_04_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_04_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_demux_2x1_05_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_05_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_05_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_05_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_demux_2x1_11_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_11_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_11_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_11_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_demux_2x1_13_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_13_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_13_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_13_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_mux_14x1_0_empty : STD_LOGIC;
  signal double_buffer_01_empty_y : STD_LOGIC;
  signal double_buffer_01_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_01_m_y_TLAST : STD_LOGIC;
  signal double_buffer_01_m_y_TREADY : STD_LOGIC;
  signal double_buffer_01_m_y_TVALID : STD_LOGIC;
  signal double_buffer_02_empty_y : STD_LOGIC;
  signal double_buffer_02_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_02_m_y_TLAST : STD_LOGIC;
  signal double_buffer_02_m_y_TREADY : STD_LOGIC;
  signal double_buffer_02_m_y_TVALID : STD_LOGIC;
  signal double_buffer_03_empty_y : STD_LOGIC;
  signal double_buffer_03_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_03_m_y_TLAST : STD_LOGIC;
  signal double_buffer_03_m_y_TREADY : STD_LOGIC;
  signal double_buffer_03_m_y_TVALID : STD_LOGIC;
  signal double_buffer_04_empty_y : STD_LOGIC;
  signal double_buffer_04_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_04_m_y_TLAST : STD_LOGIC;
  signal double_buffer_04_m_y_TREADY : STD_LOGIC;
  signal double_buffer_04_m_y_TVALID : STD_LOGIC;
  signal double_buffer_05_empty_y : STD_LOGIC;
  signal double_buffer_05_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_05_m_y_TLAST : STD_LOGIC;
  signal double_buffer_05_m_y_TREADY : STD_LOGIC;
  signal double_buffer_05_m_y_TVALID : STD_LOGIC;
  signal double_buffer_06_empty_y : STD_LOGIC;
  signal double_buffer_06_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_06_m_y_TLAST : STD_LOGIC;
  signal double_buffer_06_m_y_TREADY : STD_LOGIC;
  signal double_buffer_06_m_y_TVALID : STD_LOGIC;
  signal double_buffer_07_empty_y : STD_LOGIC;
  signal double_buffer_07_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_07_m_y_TLAST : STD_LOGIC;
  signal double_buffer_07_m_y_TREADY : STD_LOGIC;
  signal double_buffer_07_m_y_TVALID : STD_LOGIC;
  signal double_buffer_08_empty_y : STD_LOGIC;
  signal double_buffer_08_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_08_m_y_TLAST : STD_LOGIC;
  signal double_buffer_08_m_y_TREADY : STD_LOGIC;
  signal double_buffer_08_m_y_TVALID : STD_LOGIC;
  signal double_buffer_09_empty_y : STD_LOGIC;
  signal double_buffer_09_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_09_m_y_TLAST : STD_LOGIC;
  signal double_buffer_09_m_y_TREADY : STD_LOGIC;
  signal double_buffer_09_m_y_TVALID : STD_LOGIC;
  signal double_buffer_10_empty_y : STD_LOGIC;
  signal double_buffer_10_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_10_m_y_TLAST : STD_LOGIC;
  signal double_buffer_10_m_y_TREADY : STD_LOGIC;
  signal double_buffer_10_m_y_TVALID : STD_LOGIC;
  signal double_buffer_11_empty_y : STD_LOGIC;
  signal double_buffer_11_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_11_m_y_TLAST : STD_LOGIC;
  signal double_buffer_11_m_y_TREADY : STD_LOGIC;
  signal double_buffer_11_m_y_TVALID : STD_LOGIC;
  signal double_buffer_12_empty_y : STD_LOGIC;
  signal double_buffer_12_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_12_m_y_TLAST : STD_LOGIC;
  signal double_buffer_12_m_y_TREADY : STD_LOGIC;
  signal double_buffer_12_m_y_TVALID : STD_LOGIC;
  signal double_buffer_13_empty_y : STD_LOGIC;
  signal double_buffer_13_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_13_m_y_TLAST : STD_LOGIC;
  signal double_buffer_13_m_y_TREADY : STD_LOGIC;
  signal double_buffer_13_m_y_TVALID : STD_LOGIC;
  signal double_buffer_empty_y : STD_LOGIC;
  signal double_buffer_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_m_y_TLAST : STD_LOGIC;
  signal double_buffer_m_y_TREADY : STD_LOGIC;
  signal double_buffer_m_y_TVALID : STD_LOGIC;
  signal eject_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal eject_2 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal eject_3 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal eject_4 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal eject_5 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal eject_6 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal s_y_2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_2_TLAST : STD_LOGIC;
  signal s_y_2_TREADY : STD_LOGIC;
  signal s_y_2_TVALID : STD_LOGIC;
  signal s_y_3_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_3_TLAST : STD_LOGIC;
  signal s_y_3_TREADY : STD_LOGIC;
  signal s_y_3_TVALID : STD_LOGIC;
  signal s_y_4_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_4_TLAST : STD_LOGIC;
  signal s_y_4_TREADY : STD_LOGIC;
  signal s_y_4_TVALID : STD_LOGIC;
  signal s_y_5_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_5_TLAST : STD_LOGIC;
  signal s_y_5_TREADY : STD_LOGIC;
  signal s_y_5_TVALID : STD_LOGIC;
  signal s_y_6_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_6_TLAST : STD_LOGIC;
  signal s_y_6_TREADY : STD_LOGIC;
  signal s_y_6_TVALID : STD_LOGIC;
  signal sel_0_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal swap_0_1 : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_00_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_00_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_00_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_01_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_01_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_01_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_01_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_02_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_02_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_02_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_02_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_03_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_03_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_03_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_03_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_04_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_04_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_04_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_04_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_05_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_05_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_05_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_05_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_06_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_06_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_06_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_06_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_07_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_07_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_07_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_07_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_08_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_08_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_08_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_08_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_09_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_09_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_09_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_09_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_10_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_10_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_10_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_10_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_11_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_11_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_11_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_11_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_12_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_12_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_12_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_12_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_13_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_13_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_13_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_13_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_00_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_00_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_00_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_01_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_01_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_01_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_01_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_02_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_02_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_02_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_02_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_03_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_03_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_03_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_03_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_04_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_04_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_04_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_04_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_05_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_05_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_05_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_05_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_06_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_06_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_06_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_06_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_07_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_07_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_07_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_07_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_08_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_08_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_08_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_08_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_09_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_09_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_09_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_09_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_10_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_10_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_10_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_10_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_11_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_11_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_11_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_11_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_12_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_12_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_12_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_12_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_13_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_13_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_13_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_13_TVALID : STD_LOGIC;
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_0_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_10_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_12_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_1_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_2_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_4_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_6_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_8_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_demux_2x1_00_status_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_demux_2x1_01_status_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_demux_2x1_02_status_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_demux_2x1_03_status_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_demux_2x1_04_status_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_demux_2x1_05_status_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_demux_2x1_06_status_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_demux_2x1_07_status_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_demux_2x1_08_status_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_demux_2x1_09_status_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_demux_2x1_10_status_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_demux_2x1_11_status_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_demux_2x1_12_status_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_demux_2x1_13_status_UNCONNECTED : STD_LOGIC;
begin
  Conn1_TREADY <= M_AXIS_00_0_tready;
  Din_0_1(13 downto 0) <= ejectBufs(13 downto 0);
  M_AXIS_00_0_tdata(63 downto 0) <= Conn1_TDATA(63 downto 0);
  M_AXIS_00_0_tlast <= Conn1_TLAST;
  M_AXIS_00_0_tvalid <= Conn1_TVALID;
  S_AXIS_0A_tready <= symb_buffers_wrapper_0_M_AXIS_0_00_TREADY;
  S_AXIS_0B_tready <= symb_buffers_wrapper_1_M_AXIS_0_00_TREADY;
  S_AXIS_10A_tready <= symb_buffers_wrapper_0_M_AXIS_0_10_TREADY;
  S_AXIS_10B_tready <= symb_buffers_wrapper_1_M_AXIS_0_10_TREADY;
  S_AXIS_11A_tready <= symb_buffers_wrapper_0_M_AXIS_0_11_TREADY;
  S_AXIS_11B_tready <= symb_buffers_wrapper_1_M_AXIS_0_11_TREADY;
  S_AXIS_12A_tready <= symb_buffers_wrapper_0_M_AXIS_0_12_TREADY;
  S_AXIS_12B_tready <= symb_buffers_wrapper_1_M_AXIS_0_12_TREADY;
  S_AXIS_13A_tready <= symb_buffers_wrapper_0_M_AXIS_0_13_TREADY;
  S_AXIS_13B_tready <= symb_buffers_wrapper_1_M_AXIS_0_13_TREADY;
  S_AXIS_1A_tready <= symb_buffers_wrapper_0_M_AXIS_0_01_TREADY;
  S_AXIS_1B_tready <= symb_buffers_wrapper_1_M_AXIS_0_01_TREADY;
  S_AXIS_2A_tready <= symb_buffers_wrapper_0_M_AXIS_0_02_TREADY;
  S_AXIS_2B_tready <= symb_buffers_wrapper_1_M_AXIS_0_02_TREADY;
  S_AXIS_3A_tready <= symb_buffers_wrapper_0_M_AXIS_0_03_TREADY;
  S_AXIS_3B_tready <= symb_buffers_wrapper_1_M_AXIS_0_03_TREADY;
  S_AXIS_4A_tready <= symb_buffers_wrapper_0_M_AXIS_0_04_TREADY;
  S_AXIS_4B_tready <= symb_buffers_wrapper_1_M_AXIS_0_04_TREADY;
  S_AXIS_5A_tready <= symb_buffers_wrapper_0_M_AXIS_0_05_TREADY;
  S_AXIS_5B_tready <= symb_buffers_wrapper_1_M_AXIS_0_05_TREADY;
  S_AXIS_6A_tready <= symb_buffers_wrapper_0_M_AXIS_0_06_TREADY;
  S_AXIS_6B_tready <= symb_buffers_wrapper_1_M_AXIS_0_06_TREADY;
  S_AXIS_7A_tready <= symb_buffers_wrapper_0_M_AXIS_0_07_TREADY;
  S_AXIS_7B_tready <= symb_buffers_wrapper_1_M_AXIS_0_07_TREADY;
  S_AXIS_8A_tready <= symb_buffers_wrapper_0_M_AXIS_0_08_TREADY;
  S_AXIS_8B_tready <= symb_buffers_wrapper_1_M_AXIS_0_08_TREADY;
  S_AXIS_9A_tready <= symb_buffers_wrapper_0_M_AXIS_0_09_TREADY;
  S_AXIS_9B_tready <= symb_buffers_wrapper_1_M_AXIS_0_09_TREADY;
  empty_0 <= axi_mux_14x1_0_empty;
  s_aclk_0_0_1 <= s_aclk;
  s_aresetn_0_0_1 <= s_aresetn;
  sel_0_1(3 downto 0) <= sel_0(3 downto 0);
  swap_0_1 <= swap;
  symb_buffers_wrapper_0_M_AXIS_0_00_TDATA(63 downto 0) <= S_AXIS_0A_tdata(63 downto 0);
  symb_buffers_wrapper_0_M_AXIS_0_00_TLAST <= S_AXIS_0A_tlast;
  symb_buffers_wrapper_0_M_AXIS_0_00_TVALID <= S_AXIS_0A_tvalid;
  symb_buffers_wrapper_0_M_AXIS_0_01_TDATA(63 downto 0) <= S_AXIS_1A_tdata(63 downto 0);
  symb_buffers_wrapper_0_M_AXIS_0_01_TLAST <= S_AXIS_1A_tlast;
  symb_buffers_wrapper_0_M_AXIS_0_01_TVALID <= S_AXIS_1A_tvalid;
  symb_buffers_wrapper_0_M_AXIS_0_02_TDATA(63 downto 0) <= S_AXIS_2A_tdata(63 downto 0);
  symb_buffers_wrapper_0_M_AXIS_0_02_TLAST <= S_AXIS_2A_tlast;
  symb_buffers_wrapper_0_M_AXIS_0_02_TVALID <= S_AXIS_2A_tvalid;
  symb_buffers_wrapper_0_M_AXIS_0_03_TDATA(63 downto 0) <= S_AXIS_3A_tdata(63 downto 0);
  symb_buffers_wrapper_0_M_AXIS_0_03_TLAST <= S_AXIS_3A_tlast;
  symb_buffers_wrapper_0_M_AXIS_0_03_TVALID <= S_AXIS_3A_tvalid;
  symb_buffers_wrapper_0_M_AXIS_0_04_TDATA(63 downto 0) <= S_AXIS_4A_tdata(63 downto 0);
  symb_buffers_wrapper_0_M_AXIS_0_04_TLAST <= S_AXIS_4A_tlast;
  symb_buffers_wrapper_0_M_AXIS_0_04_TVALID <= S_AXIS_4A_tvalid;
  symb_buffers_wrapper_0_M_AXIS_0_05_TDATA(63 downto 0) <= S_AXIS_5A_tdata(63 downto 0);
  symb_buffers_wrapper_0_M_AXIS_0_05_TLAST <= S_AXIS_5A_tlast;
  symb_buffers_wrapper_0_M_AXIS_0_05_TVALID <= S_AXIS_5A_tvalid;
  symb_buffers_wrapper_0_M_AXIS_0_06_TDATA(63 downto 0) <= S_AXIS_6A_tdata(63 downto 0);
  symb_buffers_wrapper_0_M_AXIS_0_06_TLAST <= S_AXIS_6A_tlast;
  symb_buffers_wrapper_0_M_AXIS_0_06_TVALID <= S_AXIS_6A_tvalid;
  symb_buffers_wrapper_0_M_AXIS_0_07_TDATA(63 downto 0) <= S_AXIS_7A_tdata(63 downto 0);
  symb_buffers_wrapper_0_M_AXIS_0_07_TLAST <= S_AXIS_7A_tlast;
  symb_buffers_wrapper_0_M_AXIS_0_07_TVALID <= S_AXIS_7A_tvalid;
  symb_buffers_wrapper_0_M_AXIS_0_08_TDATA(63 downto 0) <= S_AXIS_8A_tdata(63 downto 0);
  symb_buffers_wrapper_0_M_AXIS_0_08_TLAST <= S_AXIS_8A_tlast;
  symb_buffers_wrapper_0_M_AXIS_0_08_TVALID <= S_AXIS_8A_tvalid;
  symb_buffers_wrapper_0_M_AXIS_0_09_TDATA(63 downto 0) <= S_AXIS_9A_tdata(63 downto 0);
  symb_buffers_wrapper_0_M_AXIS_0_09_TLAST <= S_AXIS_9A_tlast;
  symb_buffers_wrapper_0_M_AXIS_0_09_TVALID <= S_AXIS_9A_tvalid;
  symb_buffers_wrapper_0_M_AXIS_0_10_TDATA(63 downto 0) <= S_AXIS_10A_tdata(63 downto 0);
  symb_buffers_wrapper_0_M_AXIS_0_10_TLAST <= S_AXIS_10A_tlast;
  symb_buffers_wrapper_0_M_AXIS_0_10_TVALID <= S_AXIS_10A_tvalid;
  symb_buffers_wrapper_0_M_AXIS_0_11_TDATA(63 downto 0) <= S_AXIS_11A_tdata(63 downto 0);
  symb_buffers_wrapper_0_M_AXIS_0_11_TLAST <= S_AXIS_11A_tlast;
  symb_buffers_wrapper_0_M_AXIS_0_11_TVALID <= S_AXIS_11A_tvalid;
  symb_buffers_wrapper_0_M_AXIS_0_12_TDATA(63 downto 0) <= S_AXIS_12A_tdata(63 downto 0);
  symb_buffers_wrapper_0_M_AXIS_0_12_TLAST <= S_AXIS_12A_tlast;
  symb_buffers_wrapper_0_M_AXIS_0_12_TVALID <= S_AXIS_12A_tvalid;
  symb_buffers_wrapper_0_M_AXIS_0_13_TDATA(63 downto 0) <= S_AXIS_13A_tdata(63 downto 0);
  symb_buffers_wrapper_0_M_AXIS_0_13_TLAST <= S_AXIS_13A_tlast;
  symb_buffers_wrapper_0_M_AXIS_0_13_TVALID <= S_AXIS_13A_tvalid;
  symb_buffers_wrapper_1_M_AXIS_0_00_TDATA(63 downto 0) <= S_AXIS_0B_tdata(63 downto 0);
  symb_buffers_wrapper_1_M_AXIS_0_00_TLAST <= S_AXIS_0B_tlast;
  symb_buffers_wrapper_1_M_AXIS_0_00_TVALID <= S_AXIS_0B_tvalid;
  symb_buffers_wrapper_1_M_AXIS_0_01_TDATA(63 downto 0) <= S_AXIS_1B_tdata(63 downto 0);
  symb_buffers_wrapper_1_M_AXIS_0_01_TLAST <= S_AXIS_1B_tlast;
  symb_buffers_wrapper_1_M_AXIS_0_01_TVALID <= S_AXIS_1B_tvalid;
  symb_buffers_wrapper_1_M_AXIS_0_02_TDATA(63 downto 0) <= S_AXIS_2B_tdata(63 downto 0);
  symb_buffers_wrapper_1_M_AXIS_0_02_TLAST <= S_AXIS_2B_tlast;
  symb_buffers_wrapper_1_M_AXIS_0_02_TVALID <= S_AXIS_2B_tvalid;
  symb_buffers_wrapper_1_M_AXIS_0_03_TDATA(63 downto 0) <= S_AXIS_3B_tdata(63 downto 0);
  symb_buffers_wrapper_1_M_AXIS_0_03_TLAST <= S_AXIS_3B_tlast;
  symb_buffers_wrapper_1_M_AXIS_0_03_TVALID <= S_AXIS_3B_tvalid;
  symb_buffers_wrapper_1_M_AXIS_0_04_TDATA(63 downto 0) <= S_AXIS_4B_tdata(63 downto 0);
  symb_buffers_wrapper_1_M_AXIS_0_04_TLAST <= S_AXIS_4B_tlast;
  symb_buffers_wrapper_1_M_AXIS_0_04_TVALID <= S_AXIS_4B_tvalid;
  symb_buffers_wrapper_1_M_AXIS_0_05_TDATA(63 downto 0) <= S_AXIS_5B_tdata(63 downto 0);
  symb_buffers_wrapper_1_M_AXIS_0_05_TLAST <= S_AXIS_5B_tlast;
  symb_buffers_wrapper_1_M_AXIS_0_05_TVALID <= S_AXIS_5B_tvalid;
  symb_buffers_wrapper_1_M_AXIS_0_06_TDATA(63 downto 0) <= S_AXIS_6B_tdata(63 downto 0);
  symb_buffers_wrapper_1_M_AXIS_0_06_TLAST <= S_AXIS_6B_tlast;
  symb_buffers_wrapper_1_M_AXIS_0_06_TVALID <= S_AXIS_6B_tvalid;
  symb_buffers_wrapper_1_M_AXIS_0_07_TDATA(63 downto 0) <= S_AXIS_7B_tdata(63 downto 0);
  symb_buffers_wrapper_1_M_AXIS_0_07_TLAST <= S_AXIS_7B_tlast;
  symb_buffers_wrapper_1_M_AXIS_0_07_TVALID <= S_AXIS_7B_tvalid;
  symb_buffers_wrapper_1_M_AXIS_0_08_TDATA(63 downto 0) <= S_AXIS_8B_tdata(63 downto 0);
  symb_buffers_wrapper_1_M_AXIS_0_08_TLAST <= S_AXIS_8B_tlast;
  symb_buffers_wrapper_1_M_AXIS_0_08_TVALID <= S_AXIS_8B_tvalid;
  symb_buffers_wrapper_1_M_AXIS_0_09_TDATA(63 downto 0) <= S_AXIS_9B_tdata(63 downto 0);
  symb_buffers_wrapper_1_M_AXIS_0_09_TLAST <= S_AXIS_9B_tlast;
  symb_buffers_wrapper_1_M_AXIS_0_09_TVALID <= S_AXIS_9B_tvalid;
  symb_buffers_wrapper_1_M_AXIS_0_10_TDATA(63 downto 0) <= S_AXIS_10B_tdata(63 downto 0);
  symb_buffers_wrapper_1_M_AXIS_0_10_TLAST <= S_AXIS_10B_tlast;
  symb_buffers_wrapper_1_M_AXIS_0_10_TVALID <= S_AXIS_10B_tvalid;
  symb_buffers_wrapper_1_M_AXIS_0_11_TDATA(63 downto 0) <= S_AXIS_11B_tdata(63 downto 0);
  symb_buffers_wrapper_1_M_AXIS_0_11_TLAST <= S_AXIS_11B_tlast;
  symb_buffers_wrapper_1_M_AXIS_0_11_TVALID <= S_AXIS_11B_tvalid;
  symb_buffers_wrapper_1_M_AXIS_0_12_TDATA(63 downto 0) <= S_AXIS_12B_tdata(63 downto 0);
  symb_buffers_wrapper_1_M_AXIS_0_12_TLAST <= S_AXIS_12B_tlast;
  symb_buffers_wrapper_1_M_AXIS_0_12_TVALID <= S_AXIS_12B_tvalid;
  symb_buffers_wrapper_1_M_AXIS_0_13_TDATA(63 downto 0) <= S_AXIS_13B_tdata(63 downto 0);
  symb_buffers_wrapper_1_M_AXIS_0_13_TLAST <= S_AXIS_13B_tlast;
  symb_buffers_wrapper_1_M_AXIS_0_13_TVALID <= S_AXIS_13B_tvalid;
  util_vector_logic_0_Res(0) <= sel(0);
axi_demux_2x1_00: component slice_agent_axi_demux_2x1_0_0
     port map (
      M_AXIS_00_tdata(63 downto 0) => axi_demux_2x1_00_M_AXIS_00_TDATA(63 downto 0),
      M_AXIS_00_tlast => axi_demux_2x1_00_M_AXIS_00_TLAST,
      M_AXIS_00_tready => axi_demux_2x1_00_M_AXIS_00_TREADY,
      M_AXIS_00_tvalid => axi_demux_2x1_00_M_AXIS_00_TVALID,
      S_AXIS_00_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_00_TDATA(63 downto 0),
      S_AXIS_00_tlast => symb_buffers_wrapper_0_M_AXIS_0_00_TLAST,
      S_AXIS_00_tready => symb_buffers_wrapper_0_M_AXIS_0_00_TREADY,
      S_AXIS_00_tvalid => symb_buffers_wrapper_0_M_AXIS_0_00_TVALID,
      S_AXIS_01_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_00_TDATA(63 downto 0),
      S_AXIS_01_tlast => symb_buffers_wrapper_1_M_AXIS_0_00_TLAST,
      S_AXIS_01_tready => symb_buffers_wrapper_1_M_AXIS_0_00_TREADY,
      S_AXIS_01_tvalid => symb_buffers_wrapper_1_M_AXIS_0_00_TVALID,
      clk => s_aclk_0_0_1,
      rst_n => s_aresetn_0_0_1,
      sel => util_vector_logic_0_Res(0),
      status => NLW_axi_demux_2x1_00_status_UNCONNECTED
    );
axi_demux_2x1_01: component slice_agent_axi_demux_2x1_0_1
     port map (
      M_AXIS_00_tdata(63 downto 0) => axi_demux_2x1_01_M_AXIS_00_TDATA(63 downto 0),
      M_AXIS_00_tlast => axi_demux_2x1_01_M_AXIS_00_TLAST,
      M_AXIS_00_tready => axi_demux_2x1_01_M_AXIS_00_TREADY,
      M_AXIS_00_tvalid => axi_demux_2x1_01_M_AXIS_00_TVALID,
      S_AXIS_00_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_01_TDATA(63 downto 0),
      S_AXIS_00_tlast => symb_buffers_wrapper_0_M_AXIS_0_01_TLAST,
      S_AXIS_00_tready => symb_buffers_wrapper_0_M_AXIS_0_01_TREADY,
      S_AXIS_00_tvalid => symb_buffers_wrapper_0_M_AXIS_0_01_TVALID,
      S_AXIS_01_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_01_TDATA(63 downto 0),
      S_AXIS_01_tlast => symb_buffers_wrapper_1_M_AXIS_0_01_TLAST,
      S_AXIS_01_tready => symb_buffers_wrapper_1_M_AXIS_0_01_TREADY,
      S_AXIS_01_tvalid => symb_buffers_wrapper_1_M_AXIS_0_01_TVALID,
      clk => s_aclk_0_0_1,
      rst_n => s_aresetn_0_0_1,
      sel => util_vector_logic_0_Res(0),
      status => NLW_axi_demux_2x1_01_status_UNCONNECTED
    );
axi_demux_2x1_02: component slice_agent_axi_demux_2x1_0_2
     port map (
      M_AXIS_00_tdata(63 downto 0) => axi_demux_2x1_02_M_AXIS_00_TDATA(63 downto 0),
      M_AXIS_00_tlast => axi_demux_2x1_02_M_AXIS_00_TLAST,
      M_AXIS_00_tready => axi_demux_2x1_02_M_AXIS_00_TREADY,
      M_AXIS_00_tvalid => axi_demux_2x1_02_M_AXIS_00_TVALID,
      S_AXIS_00_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_02_TDATA(63 downto 0),
      S_AXIS_00_tlast => symb_buffers_wrapper_0_M_AXIS_0_02_TLAST,
      S_AXIS_00_tready => symb_buffers_wrapper_0_M_AXIS_0_02_TREADY,
      S_AXIS_00_tvalid => symb_buffers_wrapper_0_M_AXIS_0_02_TVALID,
      S_AXIS_01_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_02_TDATA(63 downto 0),
      S_AXIS_01_tlast => symb_buffers_wrapper_1_M_AXIS_0_02_TLAST,
      S_AXIS_01_tready => symb_buffers_wrapper_1_M_AXIS_0_02_TREADY,
      S_AXIS_01_tvalid => symb_buffers_wrapper_1_M_AXIS_0_02_TVALID,
      clk => s_aclk_0_0_1,
      rst_n => s_aresetn_0_0_1,
      sel => util_vector_logic_0_Res(0),
      status => NLW_axi_demux_2x1_02_status_UNCONNECTED
    );
axi_demux_2x1_03: component slice_agent_axi_demux_2x1_1_0
     port map (
      M_AXIS_00_tdata(63 downto 0) => axi_demux_2x1_03_M_AXIS_00_TDATA(63 downto 0),
      M_AXIS_00_tlast => axi_demux_2x1_03_M_AXIS_00_TLAST,
      M_AXIS_00_tready => axi_demux_2x1_03_M_AXIS_00_TREADY,
      M_AXIS_00_tvalid => axi_demux_2x1_03_M_AXIS_00_TVALID,
      S_AXIS_00_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_03_TDATA(63 downto 0),
      S_AXIS_00_tlast => symb_buffers_wrapper_0_M_AXIS_0_03_TLAST,
      S_AXIS_00_tready => symb_buffers_wrapper_0_M_AXIS_0_03_TREADY,
      S_AXIS_00_tvalid => symb_buffers_wrapper_0_M_AXIS_0_03_TVALID,
      S_AXIS_01_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_03_TDATA(63 downto 0),
      S_AXIS_01_tlast => symb_buffers_wrapper_1_M_AXIS_0_03_TLAST,
      S_AXIS_01_tready => symb_buffers_wrapper_1_M_AXIS_0_03_TREADY,
      S_AXIS_01_tvalid => symb_buffers_wrapper_1_M_AXIS_0_03_TVALID,
      clk => s_aclk_0_0_1,
      rst_n => s_aresetn_0_0_1,
      sel => util_vector_logic_0_Res(0),
      status => NLW_axi_demux_2x1_03_status_UNCONNECTED
    );
axi_demux_2x1_04: component slice_agent_axi_demux_2x1_0_3
     port map (
      M_AXIS_00_tdata(63 downto 0) => axi_demux_2x1_04_M_AXIS_00_TDATA(63 downto 0),
      M_AXIS_00_tlast => axi_demux_2x1_04_M_AXIS_00_TLAST,
      M_AXIS_00_tready => axi_demux_2x1_04_M_AXIS_00_TREADY,
      M_AXIS_00_tvalid => axi_demux_2x1_04_M_AXIS_00_TVALID,
      S_AXIS_00_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_04_TDATA(63 downto 0),
      S_AXIS_00_tlast => symb_buffers_wrapper_0_M_AXIS_0_04_TLAST,
      S_AXIS_00_tready => symb_buffers_wrapper_0_M_AXIS_0_04_TREADY,
      S_AXIS_00_tvalid => symb_buffers_wrapper_0_M_AXIS_0_04_TVALID,
      S_AXIS_01_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_04_TDATA(63 downto 0),
      S_AXIS_01_tlast => symb_buffers_wrapper_1_M_AXIS_0_04_TLAST,
      S_AXIS_01_tready => symb_buffers_wrapper_1_M_AXIS_0_04_TREADY,
      S_AXIS_01_tvalid => symb_buffers_wrapper_1_M_AXIS_0_04_TVALID,
      clk => s_aclk_0_0_1,
      rst_n => s_aresetn_0_0_1,
      sel => util_vector_logic_0_Res(0),
      status => NLW_axi_demux_2x1_04_status_UNCONNECTED
    );
axi_demux_2x1_05: component slice_agent_axi_demux_2x1_1_1
     port map (
      M_AXIS_00_tdata(63 downto 0) => axi_demux_2x1_05_M_AXIS_00_TDATA(63 downto 0),
      M_AXIS_00_tlast => axi_demux_2x1_05_M_AXIS_00_TLAST,
      M_AXIS_00_tready => axi_demux_2x1_05_M_AXIS_00_TREADY,
      M_AXIS_00_tvalid => axi_demux_2x1_05_M_AXIS_00_TVALID,
      S_AXIS_00_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_05_TDATA(63 downto 0),
      S_AXIS_00_tlast => symb_buffers_wrapper_0_M_AXIS_0_05_TLAST,
      S_AXIS_00_tready => symb_buffers_wrapper_0_M_AXIS_0_05_TREADY,
      S_AXIS_00_tvalid => symb_buffers_wrapper_0_M_AXIS_0_05_TVALID,
      S_AXIS_01_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_05_TDATA(63 downto 0),
      S_AXIS_01_tlast => symb_buffers_wrapper_1_M_AXIS_0_05_TLAST,
      S_AXIS_01_tready => symb_buffers_wrapper_1_M_AXIS_0_05_TREADY,
      S_AXIS_01_tvalid => symb_buffers_wrapper_1_M_AXIS_0_05_TVALID,
      clk => s_aclk_0_0_1,
      rst_n => s_aresetn_0_0_1,
      sel => util_vector_logic_0_Res(0),
      status => NLW_axi_demux_2x1_05_status_UNCONNECTED
    );
axi_demux_2x1_06: component slice_agent_axi_demux_2x1_5_0
     port map (
      M_AXIS_00_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      M_AXIS_00_tlast => s_y_1_TLAST,
      M_AXIS_00_tready => s_y_1_TREADY,
      M_AXIS_00_tvalid => s_y_1_TVALID,
      S_AXIS_00_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_06_TDATA(63 downto 0),
      S_AXIS_00_tlast => symb_buffers_wrapper_0_M_AXIS_0_06_TLAST,
      S_AXIS_00_tready => symb_buffers_wrapper_0_M_AXIS_0_06_TREADY,
      S_AXIS_00_tvalid => symb_buffers_wrapper_0_M_AXIS_0_06_TVALID,
      S_AXIS_01_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_06_TDATA(63 downto 0),
      S_AXIS_01_tlast => symb_buffers_wrapper_1_M_AXIS_0_06_TLAST,
      S_AXIS_01_tready => symb_buffers_wrapper_1_M_AXIS_0_06_TREADY,
      S_AXIS_01_tvalid => symb_buffers_wrapper_1_M_AXIS_0_06_TVALID,
      clk => s_aclk_0_0_1,
      rst_n => s_aresetn_0_0_1,
      sel => util_vector_logic_0_Res(0),
      status => NLW_axi_demux_2x1_06_status_UNCONNECTED
    );
axi_demux_2x1_07: component slice_agent_axi_demux_2x1_0_4
     port map (
      M_AXIS_00_tdata(63 downto 0) => s_y_2_TDATA(63 downto 0),
      M_AXIS_00_tlast => s_y_2_TLAST,
      M_AXIS_00_tready => s_y_2_TREADY,
      M_AXIS_00_tvalid => s_y_2_TVALID,
      S_AXIS_00_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_07_TDATA(63 downto 0),
      S_AXIS_00_tlast => symb_buffers_wrapper_0_M_AXIS_0_07_TLAST,
      S_AXIS_00_tready => symb_buffers_wrapper_0_M_AXIS_0_07_TREADY,
      S_AXIS_00_tvalid => symb_buffers_wrapper_0_M_AXIS_0_07_TVALID,
      S_AXIS_01_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_07_TDATA(63 downto 0),
      S_AXIS_01_tlast => symb_buffers_wrapper_1_M_AXIS_0_07_TLAST,
      S_AXIS_01_tready => symb_buffers_wrapper_1_M_AXIS_0_07_TREADY,
      S_AXIS_01_tvalid => symb_buffers_wrapper_1_M_AXIS_0_07_TVALID,
      clk => s_aclk_0_0_1,
      rst_n => s_aresetn_0_0_1,
      sel => util_vector_logic_0_Res(0),
      status => NLW_axi_demux_2x1_07_status_UNCONNECTED
    );
axi_demux_2x1_08: component slice_agent_axi_demux_2x1_1_2
     port map (
      M_AXIS_00_tdata(63 downto 0) => s_y_3_TDATA(63 downto 0),
      M_AXIS_00_tlast => s_y_3_TLAST,
      M_AXIS_00_tready => s_y_3_TREADY,
      M_AXIS_00_tvalid => s_y_3_TVALID,
      S_AXIS_00_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_08_TDATA(63 downto 0),
      S_AXIS_00_tlast => symb_buffers_wrapper_0_M_AXIS_0_08_TLAST,
      S_AXIS_00_tready => symb_buffers_wrapper_0_M_AXIS_0_08_TREADY,
      S_AXIS_00_tvalid => symb_buffers_wrapper_0_M_AXIS_0_08_TVALID,
      S_AXIS_01_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_08_TDATA(63 downto 0),
      S_AXIS_01_tlast => symb_buffers_wrapper_1_M_AXIS_0_08_TLAST,
      S_AXIS_01_tready => symb_buffers_wrapper_1_M_AXIS_0_08_TREADY,
      S_AXIS_01_tvalid => symb_buffers_wrapper_1_M_AXIS_0_08_TVALID,
      clk => s_aclk_0_0_1,
      rst_n => s_aresetn_0_0_1,
      sel => util_vector_logic_0_Res(0),
      status => NLW_axi_demux_2x1_08_status_UNCONNECTED
    );
axi_demux_2x1_09: component slice_agent_axi_demux_2x1_2_0
     port map (
      M_AXIS_00_tdata(63 downto 0) => s_y_4_TDATA(63 downto 0),
      M_AXIS_00_tlast => s_y_4_TLAST,
      M_AXIS_00_tready => s_y_4_TREADY,
      M_AXIS_00_tvalid => s_y_4_TVALID,
      S_AXIS_00_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_09_TDATA(63 downto 0),
      S_AXIS_00_tlast => symb_buffers_wrapper_0_M_AXIS_0_09_TLAST,
      S_AXIS_00_tready => symb_buffers_wrapper_0_M_AXIS_0_09_TREADY,
      S_AXIS_00_tvalid => symb_buffers_wrapper_0_M_AXIS_0_09_TVALID,
      S_AXIS_01_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_09_TDATA(63 downto 0),
      S_AXIS_01_tlast => symb_buffers_wrapper_1_M_AXIS_0_09_TLAST,
      S_AXIS_01_tready => symb_buffers_wrapper_1_M_AXIS_0_09_TREADY,
      S_AXIS_01_tvalid => symb_buffers_wrapper_1_M_AXIS_0_09_TVALID,
      clk => s_aclk_0_0_1,
      rst_n => s_aresetn_0_0_1,
      sel => util_vector_logic_0_Res(0),
      status => NLW_axi_demux_2x1_09_status_UNCONNECTED
    );
axi_demux_2x1_10: component slice_agent_axi_demux_2x1_3_0
     port map (
      M_AXIS_00_tdata(63 downto 0) => s_y_5_TDATA(63 downto 0),
      M_AXIS_00_tlast => s_y_5_TLAST,
      M_AXIS_00_tready => s_y_5_TREADY,
      M_AXIS_00_tvalid => s_y_5_TVALID,
      S_AXIS_00_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_10_TDATA(63 downto 0),
      S_AXIS_00_tlast => symb_buffers_wrapper_0_M_AXIS_0_10_TLAST,
      S_AXIS_00_tready => symb_buffers_wrapper_0_M_AXIS_0_10_TREADY,
      S_AXIS_00_tvalid => symb_buffers_wrapper_0_M_AXIS_0_10_TVALID,
      S_AXIS_01_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_10_TDATA(63 downto 0),
      S_AXIS_01_tlast => symb_buffers_wrapper_1_M_AXIS_0_10_TLAST,
      S_AXIS_01_tready => symb_buffers_wrapper_1_M_AXIS_0_10_TREADY,
      S_AXIS_01_tvalid => symb_buffers_wrapper_1_M_AXIS_0_10_TVALID,
      clk => s_aclk_0_0_1,
      rst_n => s_aresetn_0_0_1,
      sel => util_vector_logic_0_Res(0),
      status => NLW_axi_demux_2x1_10_status_UNCONNECTED
    );
axi_demux_2x1_11: component slice_agent_axi_demux_2x1_4_0
     port map (
      M_AXIS_00_tdata(63 downto 0) => axi_demux_2x1_11_M_AXIS_00_TDATA(63 downto 0),
      M_AXIS_00_tlast => axi_demux_2x1_11_M_AXIS_00_TLAST,
      M_AXIS_00_tready => axi_demux_2x1_11_M_AXIS_00_TREADY,
      M_AXIS_00_tvalid => axi_demux_2x1_11_M_AXIS_00_TVALID,
      S_AXIS_00_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_11_TDATA(63 downto 0),
      S_AXIS_00_tlast => symb_buffers_wrapper_0_M_AXIS_0_11_TLAST,
      S_AXIS_00_tready => symb_buffers_wrapper_0_M_AXIS_0_11_TREADY,
      S_AXIS_00_tvalid => symb_buffers_wrapper_0_M_AXIS_0_11_TVALID,
      S_AXIS_01_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_11_TDATA(63 downto 0),
      S_AXIS_01_tlast => symb_buffers_wrapper_1_M_AXIS_0_11_TLAST,
      S_AXIS_01_tready => symb_buffers_wrapper_1_M_AXIS_0_11_TREADY,
      S_AXIS_01_tvalid => symb_buffers_wrapper_1_M_AXIS_0_11_TVALID,
      clk => s_aclk_0_0_1,
      rst_n => s_aresetn_0_0_1,
      sel => util_vector_logic_0_Res(0),
      status => NLW_axi_demux_2x1_11_status_UNCONNECTED
    );
axi_demux_2x1_12: component slice_agent_axi_demux_2x1_5_1
     port map (
      M_AXIS_00_tdata(63 downto 0) => s_y_6_TDATA(63 downto 0),
      M_AXIS_00_tlast => s_y_6_TLAST,
      M_AXIS_00_tready => s_y_6_TREADY,
      M_AXIS_00_tvalid => s_y_6_TVALID,
      S_AXIS_00_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_12_TDATA(63 downto 0),
      S_AXIS_00_tlast => symb_buffers_wrapper_0_M_AXIS_0_12_TLAST,
      S_AXIS_00_tready => symb_buffers_wrapper_0_M_AXIS_0_12_TREADY,
      S_AXIS_00_tvalid => symb_buffers_wrapper_0_M_AXIS_0_12_TVALID,
      S_AXIS_01_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_12_TDATA(63 downto 0),
      S_AXIS_01_tlast => symb_buffers_wrapper_1_M_AXIS_0_12_TLAST,
      S_AXIS_01_tready => symb_buffers_wrapper_1_M_AXIS_0_12_TREADY,
      S_AXIS_01_tvalid => symb_buffers_wrapper_1_M_AXIS_0_12_TVALID,
      clk => s_aclk_0_0_1,
      rst_n => s_aresetn_0_0_1,
      sel => util_vector_logic_0_Res(0),
      status => NLW_axi_demux_2x1_12_status_UNCONNECTED
    );
axi_demux_2x1_13: component slice_agent_axi_demux_2x1_6_0
     port map (
      M_AXIS_00_tdata(63 downto 0) => axi_demux_2x1_13_M_AXIS_00_TDATA(63 downto 0),
      M_AXIS_00_tlast => axi_demux_2x1_13_M_AXIS_00_TLAST,
      M_AXIS_00_tready => axi_demux_2x1_13_M_AXIS_00_TREADY,
      M_AXIS_00_tvalid => axi_demux_2x1_13_M_AXIS_00_TVALID,
      S_AXIS_00_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_13_TDATA(63 downto 0),
      S_AXIS_00_tlast => symb_buffers_wrapper_0_M_AXIS_0_13_TLAST,
      S_AXIS_00_tready => symb_buffers_wrapper_0_M_AXIS_0_13_TREADY,
      S_AXIS_00_tvalid => symb_buffers_wrapper_0_M_AXIS_0_13_TVALID,
      S_AXIS_01_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_13_TDATA(63 downto 0),
      S_AXIS_01_tlast => symb_buffers_wrapper_1_M_AXIS_0_13_TLAST,
      S_AXIS_01_tready => symb_buffers_wrapper_1_M_AXIS_0_13_TREADY,
      S_AXIS_01_tvalid => symb_buffers_wrapper_1_M_AXIS_0_13_TVALID,
      clk => s_aclk_0_0_1,
      rst_n => s_aresetn_0_0_1,
      sel => util_vector_logic_0_Res(0),
      status => NLW_axi_demux_2x1_13_status_UNCONNECTED
    );
axi_mux_14x1_0: component slice_agent_axi_mux_14x1_0_0
     port map (
      M_AXIS_00_tdata(63 downto 0) => Conn1_TDATA(63 downto 0),
      M_AXIS_00_tlast => Conn1_TLAST,
      M_AXIS_00_tready => Conn1_TREADY,
      M_AXIS_00_tvalid => Conn1_TVALID,
      S_AXIS_00_tdata(63 downto 0) => double_buffer_m_y_TDATA(63 downto 0),
      S_AXIS_00_tlast => double_buffer_m_y_TLAST,
      S_AXIS_00_tready => double_buffer_m_y_TREADY,
      S_AXIS_00_tvalid => double_buffer_m_y_TVALID,
      S_AXIS_01_tdata(63 downto 0) => double_buffer_01_m_y_TDATA(63 downto 0),
      S_AXIS_01_tlast => double_buffer_01_m_y_TLAST,
      S_AXIS_01_tready => double_buffer_01_m_y_TREADY,
      S_AXIS_01_tvalid => double_buffer_01_m_y_TVALID,
      S_AXIS_02_tdata(63 downto 0) => double_buffer_02_m_y_TDATA(63 downto 0),
      S_AXIS_02_tlast => double_buffer_02_m_y_TLAST,
      S_AXIS_02_tready => double_buffer_02_m_y_TREADY,
      S_AXIS_02_tvalid => double_buffer_02_m_y_TVALID,
      S_AXIS_03_tdata(63 downto 0) => double_buffer_03_m_y_TDATA(63 downto 0),
      S_AXIS_03_tlast => double_buffer_03_m_y_TLAST,
      S_AXIS_03_tready => double_buffer_03_m_y_TREADY,
      S_AXIS_03_tvalid => double_buffer_03_m_y_TVALID,
      S_AXIS_04_tdata(63 downto 0) => double_buffer_04_m_y_TDATA(63 downto 0),
      S_AXIS_04_tlast => double_buffer_04_m_y_TLAST,
      S_AXIS_04_tready => double_buffer_04_m_y_TREADY,
      S_AXIS_04_tvalid => double_buffer_04_m_y_TVALID,
      S_AXIS_05_tdata(63 downto 0) => double_buffer_05_m_y_TDATA(63 downto 0),
      S_AXIS_05_tlast => double_buffer_05_m_y_TLAST,
      S_AXIS_05_tready => double_buffer_05_m_y_TREADY,
      S_AXIS_05_tvalid => double_buffer_05_m_y_TVALID,
      S_AXIS_06_tdata(63 downto 0) => double_buffer_06_m_y_TDATA(63 downto 0),
      S_AXIS_06_tlast => double_buffer_06_m_y_TLAST,
      S_AXIS_06_tready => double_buffer_06_m_y_TREADY,
      S_AXIS_06_tvalid => double_buffer_06_m_y_TVALID,
      S_AXIS_07_tdata(63 downto 0) => double_buffer_07_m_y_TDATA(63 downto 0),
      S_AXIS_07_tlast => double_buffer_07_m_y_TLAST,
      S_AXIS_07_tready => double_buffer_07_m_y_TREADY,
      S_AXIS_07_tvalid => double_buffer_07_m_y_TVALID,
      S_AXIS_08_tdata(63 downto 0) => double_buffer_08_m_y_TDATA(63 downto 0),
      S_AXIS_08_tlast => double_buffer_08_m_y_TLAST,
      S_AXIS_08_tready => double_buffer_08_m_y_TREADY,
      S_AXIS_08_tvalid => double_buffer_08_m_y_TVALID,
      S_AXIS_09_tdata(63 downto 0) => double_buffer_09_m_y_TDATA(63 downto 0),
      S_AXIS_09_tlast => double_buffer_09_m_y_TLAST,
      S_AXIS_09_tready => double_buffer_09_m_y_TREADY,
      S_AXIS_09_tvalid => double_buffer_09_m_y_TVALID,
      S_AXIS_10_tdata(63 downto 0) => double_buffer_10_m_y_TDATA(63 downto 0),
      S_AXIS_10_tlast => double_buffer_10_m_y_TLAST,
      S_AXIS_10_tready => double_buffer_10_m_y_TREADY,
      S_AXIS_10_tvalid => double_buffer_10_m_y_TVALID,
      S_AXIS_11_tdata(63 downto 0) => double_buffer_11_m_y_TDATA(63 downto 0),
      S_AXIS_11_tlast => double_buffer_11_m_y_TLAST,
      S_AXIS_11_tready => double_buffer_11_m_y_TREADY,
      S_AXIS_11_tvalid => double_buffer_11_m_y_TVALID,
      S_AXIS_12_tdata(63 downto 0) => double_buffer_12_m_y_TDATA(63 downto 0),
      S_AXIS_12_tlast => double_buffer_12_m_y_TLAST,
      S_AXIS_12_tready => double_buffer_12_m_y_TREADY,
      S_AXIS_12_tvalid => double_buffer_12_m_y_TVALID,
      S_AXIS_13_tdata(63 downto 0) => double_buffer_13_m_y_TDATA(63 downto 0),
      S_AXIS_13_tlast => double_buffer_13_m_y_TLAST,
      S_AXIS_13_tready => double_buffer_13_m_y_TREADY,
      S_AXIS_13_tvalid => double_buffer_13_m_y_TVALID,
      clk => s_aclk_0_0_1,
      empty => axi_mux_14x1_0_empty,
      empty_0 => double_buffer_empty_y,
      empty_1 => double_buffer_01_empty_y,
      empty_10 => double_buffer_10_empty_y,
      empty_11 => double_buffer_11_empty_y,
      empty_12 => double_buffer_12_empty_y,
      empty_13 => double_buffer_13_empty_y,
      empty_2 => double_buffer_02_empty_y,
      empty_3 => double_buffer_03_empty_y,
      empty_4 => double_buffer_04_empty_y,
      empty_5 => double_buffer_05_empty_y,
      empty_6 => double_buffer_06_empty_y,
      empty_7 => double_buffer_07_empty_y,
      empty_8 => double_buffer_08_empty_y,
      empty_9 => double_buffer_09_empty_y,
      rst0 => s_aresetn_0_0_1,
      sel(3 downto 0) => sel_0_1(3 downto 0)
    );
double_buffer: entity work.double_buffer_imp_11EU637
     port map (
      eject => xlslice_0_Dout(0),
      empty_y => double_buffer_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_m_y_TLAST,
      m_y_tready => double_buffer_m_y_TREADY,
      m_y_tvalid => double_buffer_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_00_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_00_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_00_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_00_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_01: entity work.double_buffer_01_imp_1KSWB0B
     port map (
      eject => xlslice_1_Dout(0),
      empty_y => double_buffer_01_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_01_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_01_m_y_TLAST,
      m_y_tready => double_buffer_01_m_y_TREADY,
      m_y_tvalid => double_buffer_01_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_01_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_01_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_01_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_01_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_02: entity work.double_buffer_02_imp_1FXEDL7
     port map (
      eject => xlslice_2_Dout(0),
      empty_y => double_buffer_02_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_02_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_02_m_y_TLAST,
      m_y_tready => double_buffer_02_m_y_TREADY,
      m_y_tvalid => double_buffer_02_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_02_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_02_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_02_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_02_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_03: entity work.double_buffer_03_imp_90S9WK
     port map (
      eject => eject_1(0),
      empty_y => double_buffer_03_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_03_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_03_m_y_TLAST,
      m_y_tready => double_buffer_03_m_y_TREADY,
      m_y_tvalid => double_buffer_03_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_03_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_03_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_03_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_03_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_04: entity work.double_buffer_04_imp_NC3VZF
     port map (
      eject => xlslice_4_Dout(0),
      empty_y => double_buffer_04_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_04_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_04_m_y_TLAST,
      m_y_tready => double_buffer_04_m_y_TREADY,
      m_y_tvalid => double_buffer_04_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_04_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_04_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_04_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_04_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_05: entity work.double_buffer_05_imp_1LN36X0
     port map (
      eject => eject_2(0),
      empty_y => double_buffer_05_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_05_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_05_m_y_TLAST,
      m_y_tready => double_buffer_05_m_y_TREADY,
      m_y_tvalid => double_buffer_05_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_05_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_05_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_05_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_05_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_06: entity work.double_buffer_06_imp_1F371H0
     port map (
      eject => xlslice_6_Dout(0),
      empty_y => double_buffer_06_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_06_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_06_m_y_TLAST,
      m_y_tready => double_buffer_06_m_y_TREADY,
      m_y_tvalid => double_buffer_06_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
double_buffer_07: entity work.double_buffer_07_imp_9UTTUJ
     port map (
      eject => eject_5(0),
      empty_y => double_buffer_07_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_07_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_07_m_y_TLAST,
      m_y_tready => double_buffer_07_m_y_TREADY,
      m_y_tvalid => double_buffer_07_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => s_y_2_TDATA(63 downto 0),
      s_y_tlast => s_y_2_TLAST,
      s_y_tready => s_y_2_TREADY,
      s_y_tvalid => s_y_2_TVALID,
      swap => swap_0_1
    );
double_buffer_08: entity work.double_buffer_08_imp_MHRCIY
     port map (
      eject => xlslice_8_Dout(0),
      empty_y => double_buffer_08_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_08_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_08_m_y_TLAST,
      m_y_tready => double_buffer_08_m_y_TREADY,
      m_y_tvalid => double_buffer_08_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => s_y_3_TDATA(63 downto 0),
      s_y_tlast => s_y_3_TLAST,
      s_y_tready => s_y_3_TREADY,
      s_y_tvalid => s_y_3_TVALID,
      swap => swap_0_1
    );
double_buffer_09: entity work.double_buffer_09_imp_1K8QW5H
     port map (
      eject => eject_6(0),
      empty_y => double_buffer_09_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_09_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_09_m_y_TLAST,
      m_y_tready => double_buffer_09_m_y_TREADY,
      m_y_tvalid => double_buffer_09_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => s_y_4_TDATA(63 downto 0),
      s_y_tlast => s_y_4_TLAST,
      s_y_tready => s_y_4_TREADY,
      s_y_tvalid => s_y_4_TVALID,
      swap => swap_0_1
    );
double_buffer_10: entity work.double_buffer_10_imp_12FWITT
     port map (
      eject => xlslice_10_Dout(0),
      empty_y => double_buffer_10_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_10_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_10_m_y_TLAST,
      m_y_tready => double_buffer_10_m_y_TREADY,
      m_y_tvalid => double_buffer_10_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => s_y_5_TDATA(63 downto 0),
      s_y_tlast => s_y_5_TLAST,
      s_y_tready => s_y_5_TREADY,
      s_y_tvalid => s_y_5_TVALID,
      swap => swap_0_1
    );
double_buffer_11: entity work.double_buffer_11_imp_4RMLOE
     port map (
      eject => eject_3(0),
      empty_y => double_buffer_11_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_11_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_11_m_y_TLAST,
      m_y_tready => double_buffer_11_m_y_TREADY,
      m_y_tvalid => double_buffer_11_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_11_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_11_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_11_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_11_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_12: entity work.double_buffer_12_imp_SHQF9Q
     port map (
      eject => xlslice_12_Dout(0),
      empty_y => double_buffer_12_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_12_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_12_m_y_TLAST,
      m_y_tready => double_buffer_12_m_y_TREADY,
      m_y_tvalid => double_buffer_12_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => s_y_6_TDATA(63 downto 0),
      s_y_tlast => s_y_6_TLAST,
      s_y_tready => s_y_6_TREADY,
      s_y_tvalid => s_y_6_TVALID,
      swap => swap_0_1
    );
double_buffer_13: entity work.double_buffer_13_imp_1Y7Z3Q9
     port map (
      eject => eject_4(0),
      empty_y => double_buffer_13_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_13_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_13_m_y_TLAST,
      m_y_tready => double_buffer_13_m_y_TREADY,
      m_y_tvalid => double_buffer_13_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_13_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_13_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_13_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_13_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
xlslice_0: component slice_agent_xlslice_0_1
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_0_Dout(0)
    );
xlslice_1: component slice_agent_xlslice_0_3
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_1_Dout(0)
    );
xlslice_10: component slice_agent_xlslice_2_7
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_10_Dout(0)
    );
xlslice_11: component slice_agent_xlslice_2_8
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => eject_3(0)
    );
xlslice_12: component slice_agent_xlslice_2_9
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_12_Dout(0)
    );
xlslice_13: component slice_agent_xlslice_2_10
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => eject_4(0)
    );
xlslice_2: component slice_agent_xlslice_1_0
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_2_Dout(0)
    );
xlslice_3: component slice_agent_xlslice_2_0
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => eject_1(0)
    );
xlslice_4: component slice_agent_xlslice_2_1
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_4_Dout(0)
    );
xlslice_5: component slice_agent_xlslice_2_2
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => eject_2(0)
    );
xlslice_6: component slice_agent_xlslice_2_3
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_6_Dout(0)
    );
xlslice_7: component slice_agent_xlslice_2_4
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => eject_5(0)
    );
xlslice_8: component slice_agent_xlslice_2_5
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_8_Dout(0)
    );
xlslice_9: component slice_agent_xlslice_2_6
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => eject_6(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity slice_agent is
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
  attribute core_generation_info : string;
  attribute core_generation_info of slice_agent : entity is "slice_agent,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=slice_agent,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=92,numReposBlks=77,numNonXlnxBlks=0,numHierBlks=15,maxHierDepth=2,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=3,da_clkrst_cnt=14,synth_mode=Hierarchical}";
  attribute hw_handoff : string;
  attribute hw_handoff of slice_agent : entity is "slice_agent.hwdef";
end slice_agent;

architecture STRUCTURE of slice_agent is
  component slice_agent_sched_proc_0_0 is
  port (
    M_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_tready : in STD_LOGIC;
    M_AXIS_0_tvalid : out STD_LOGIC;
    M_AXIS_0_tlast : out STD_LOGIC;
    S_AXIS_0_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXIS_0_tready : out STD_LOGIC;
    S_AXIS_0_tvalid : in STD_LOGIC;
    S_AXIS_0_tlast : in STD_LOGIC;
    clk : in STD_LOGIC;
    resetn : in STD_LOGIC;
    c_frameId : in STD_LOGIC_VECTOR ( 7 downto 0 );
    c_subframeID : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c_slotID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    mu : in STD_LOGIC_VECTOR ( 3 downto 0 );
    FRSel : in STD_LOGIC;
    SliceType : in STD_LOGIC;
    stats : out STD_LOGIC;
    s_start_0 : in STD_LOGIC;
    s_enSymb_0 : out STD_LOGIC_VECTOR ( 13 downto 0 );
    dbg_proc_begin : out STD_LOGIC;
    dbg_proc_end : out STD_LOGIC;
    dbg_proc_ecpriId : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component slice_agent_sched_proc_0_0;
  component slice_agent_symb_buffers_wrapper_0_0 is
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
  end component slice_agent_symb_buffers_wrapper_0_0;
  component slice_agent_symb_buffers_wrapper_0_1 is
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
  end component slice_agent_symb_buffers_wrapper_0_1;
  component slice_agent_sched_proc_0_1 is
  port (
    M_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AXIS_0_tready : in STD_LOGIC;
    M_AXIS_0_tvalid : out STD_LOGIC;
    M_AXIS_0_tlast : out STD_LOGIC;
    S_AXIS_0_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXIS_0_tready : out STD_LOGIC;
    S_AXIS_0_tvalid : in STD_LOGIC;
    S_AXIS_0_tlast : in STD_LOGIC;
    clk : in STD_LOGIC;
    resetn : in STD_LOGIC;
    c_frameId : in STD_LOGIC_VECTOR ( 7 downto 0 );
    c_subframeID : in STD_LOGIC_VECTOR ( 3 downto 0 );
    c_slotID : in STD_LOGIC_VECTOR ( 5 downto 0 );
    mu : in STD_LOGIC_VECTOR ( 3 downto 0 );
    FRSel : in STD_LOGIC;
    SliceType : in STD_LOGIC;
    stats : out STD_LOGIC;
    s_start_0 : in STD_LOGIC;
    s_enSymb_0 : out STD_LOGIC_VECTOR ( 13 downto 0 );
    dbg_proc_begin : out STD_LOGIC;
    dbg_proc_end : out STD_LOGIC;
    dbg_proc_ecpriId : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component slice_agent_sched_proc_0_1;
  component slice_agent_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlconstant_0_0;
  component slice_agent_xlconstant_0_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlconstant_0_1;
  signal Buffers_M_AXIS_00_0_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal Buffers_M_AXIS_00_0_TLAST : STD_LOGIC;
  signal Buffers_M_AXIS_00_0_TREADY : STD_LOGIC;
  signal Buffers_M_AXIS_00_0_TVALID : STD_LOGIC;
  signal Buffers_empty_0 : STD_LOGIC;
  signal Din_0_1 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal FR1_SEL_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal S_AXIS_0_0_1_TDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal S_AXIS_0_0_1_TLAST : STD_LOGIC;
  signal S_AXIS_0_0_1_TREADY : STD_LOGIC;
  signal S_AXIS_0_0_1_TVALID : STD_LOGIC;
  signal S_AXIS_0_1_1_TDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal S_AXIS_0_1_1_TLAST : STD_LOGIC;
  signal S_AXIS_0_1_1_TREADY : STD_LOGIC;
  signal S_AXIS_0_1_1_TVALID : STD_LOGIC;
  signal c_frameId_0_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal c_slotID_0_1 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal c_subframeID_0_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal mu_0_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_start_0_0_1 : STD_LOGIC;
  signal sched_proc_0_M_AXIS_0_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal sched_proc_0_M_AXIS_0_TLAST : STD_LOGIC;
  signal sched_proc_0_M_AXIS_0_TREADY : STD_LOGIC;
  signal sched_proc_0_M_AXIS_0_TVALID : STD_LOGIC;
  signal sched_proc_0_dbg_proc_begin : STD_LOGIC;
  signal sched_proc_0_dbg_proc_ecpriId : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sched_proc_0_dbg_proc_end : STD_LOGIC;
  signal sched_proc_0_s_enSymb_0 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal sched_proc_0_stats : STD_LOGIC;
  signal sched_proc_1_M_AXIS_0_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal sched_proc_1_M_AXIS_0_TLAST : STD_LOGIC;
  signal sched_proc_1_M_AXIS_0_TREADY : STD_LOGIC;
  signal sched_proc_1_M_AXIS_0_TVALID : STD_LOGIC;
  signal sched_proc_1_dbg_proc_begin : STD_LOGIC;
  signal sched_proc_1_dbg_proc_ecpriId : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sched_proc_1_dbg_proc_end : STD_LOGIC;
  signal sched_proc_1_s_enSymb_0 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal sel_0_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal swap_0_1 : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_00_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_00_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_00_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_01_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_01_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_01_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_01_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_02_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_02_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_02_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_02_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_03_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_03_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_03_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_03_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_04_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_04_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_04_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_04_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_05_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_05_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_05_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_05_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_06_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_06_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_06_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_06_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_07_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_07_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_07_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_07_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_08_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_08_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_08_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_08_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_09_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_09_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_09_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_09_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_10_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_10_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_10_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_10_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_11_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_11_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_11_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_11_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_12_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_12_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_12_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_12_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_13_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_0_M_AXIS_0_13_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_13_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_0_M_AXIS_0_13_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_00_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_00_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_00_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_01_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_01_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_01_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_01_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_02_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_02_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_02_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_02_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_03_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_03_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_03_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_03_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_04_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_04_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_04_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_04_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_05_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_05_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_05_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_05_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_06_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_06_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_06_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_06_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_07_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_07_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_07_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_07_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_08_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_08_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_08_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_08_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_09_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_09_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_09_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_09_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_10_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_10_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_10_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_10_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_11_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_11_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_11_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_11_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_12_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_12_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_12_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_12_TVALID : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_13_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_buffers_wrapper_1_M_AXIS_0_13_TLAST : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_13_TREADY : STD_LOGIC;
  signal symb_buffers_wrapper_1_M_AXIS_0_13_TVALID : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_sched_proc_1_stats_UNCONNECTED : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of M_AXIS_00_0_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_00_0 TLAST";
  attribute x_interface_info of M_AXIS_00_0_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_00_0 TREADY";
  attribute x_interface_info of M_AXIS_00_0_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_00_0 TVALID";
  attribute x_interface_info of S_AXIS_0_0_tlast : signal is "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TLAST";
  attribute x_interface_info of S_AXIS_0_0_tready : signal is "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TREADY";
  attribute x_interface_info of S_AXIS_0_0_tvalid : signal is "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TVALID";
  attribute x_interface_info of S_AXIS_0_1_tlast : signal is "xilinx.com:interface:axis:1.0 S_AXIS_0_1 TLAST";
  attribute x_interface_info of S_AXIS_0_1_tready : signal is "xilinx.com:interface:axis:1.0 S_AXIS_0_1 TREADY";
  attribute x_interface_info of S_AXIS_0_1_tvalid : signal is "xilinx.com:interface:axis:1.0 S_AXIS_0_1 TVALID";
  attribute x_interface_info of s_aclk_0_0 : signal is "xilinx.com:signal:clock:1.0 CLK.S_ACLK_0_0 CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of s_aclk_0_0 : signal is "XIL_INTERFACENAME CLK.S_ACLK_0_0, ASSOCIATED_BUSIF S_AXIS_0_0:S_AXIS_0_1:M_AXIS_00_0, ASSOCIATED_RESET s_aresetn_0_0, CLK_DOMAIN slice_agent_s_aclk_0_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute x_interface_info of s_aresetn_0_0 : signal is "xilinx.com:signal:reset:1.0 RST.S_ARESETN_0_0 RST";
  attribute x_interface_parameter of s_aresetn_0_0 : signal is "XIL_INTERFACENAME RST.S_ARESETN_0_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute x_interface_info of M_AXIS_00_0_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_00_0 TDATA";
  attribute x_interface_parameter of M_AXIS_00_0_tdata : signal is "XIL_INTERFACENAME M_AXIS_00_0, CLK_DOMAIN slice_agent_s_aclk_0_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute x_interface_info of S_AXIS_0_0_tdata : signal is "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TDATA";
  attribute x_interface_parameter of S_AXIS_0_0_tdata : signal is "XIL_INTERFACENAME S_AXIS_0_0, CLK_DOMAIN slice_agent_s_aclk_0_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute x_interface_info of S_AXIS_0_1_tdata : signal is "xilinx.com:interface:axis:1.0 S_AXIS_0_1 TDATA";
  attribute x_interface_parameter of S_AXIS_0_1_tdata : signal is "XIL_INTERFACENAME S_AXIS_0_1, CLK_DOMAIN slice_agent_s_aclk_0_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
begin
  Buffers_M_AXIS_00_0_TREADY <= M_AXIS_00_0_tready;
  Din_0_1(13 downto 0) <= ejectBufs(13 downto 0);
  M_AXIS_00_0_tdata(63 downto 0) <= Buffers_M_AXIS_00_0_TDATA(63 downto 0);
  M_AXIS_00_0_tlast <= Buffers_M_AXIS_00_0_TLAST;
  M_AXIS_00_0_tvalid <= Buffers_M_AXIS_00_0_TVALID;
  S_AXIS_0_0_1_TDATA(127 downto 0) <= S_AXIS_0_0_tdata(127 downto 0);
  S_AXIS_0_0_1_TLAST <= S_AXIS_0_0_tlast;
  S_AXIS_0_0_1_TVALID <= S_AXIS_0_0_tvalid;
  S_AXIS_0_0_tready <= S_AXIS_0_0_1_TREADY;
  S_AXIS_0_1_1_TDATA(127 downto 0) <= S_AXIS_0_1_tdata(127 downto 0);
  S_AXIS_0_1_1_TLAST <= S_AXIS_0_1_tlast;
  S_AXIS_0_1_1_TVALID <= S_AXIS_0_1_tvalid;
  S_AXIS_0_1_tready <= S_AXIS_0_1_1_TREADY;
  c_frameId_0_1(7 downto 0) <= frameId(7 downto 0);
  c_slotID_0_1(5 downto 0) <= slotID(5 downto 0);
  c_subframeID_0_1(3 downto 0) <= subframeID(3 downto 0);
  dbg_proc_begin_n <= sched_proc_0_dbg_proc_begin;
  dbg_proc_begin_n1 <= sched_proc_1_dbg_proc_begin;
  dbg_proc_ecpriId_n(15 downto 0) <= sched_proc_0_dbg_proc_ecpriId(15 downto 0);
  dbg_proc_ecpriId_n1(15 downto 0) <= sched_proc_1_dbg_proc_ecpriId(15 downto 0);
  dbg_proc_end_n <= sched_proc_0_dbg_proc_end;
  dbg_proc_end_n1 <= sched_proc_1_dbg_proc_end;
  empty_0 <= Buffers_empty_0;
  mu_0_1(3 downto 0) <= mu(3 downto 0);
  s_aclk_0_0_1 <= s_aclk_0_0;
  s_aresetn_0_0_1 <= s_aresetn_0_0;
  s_start_0_0_1 <= s_start_0_0;
  sel_0_1(3 downto 0) <= sel_0(3 downto 0);
  swap_0_1 <= swap_0;
Buffers: entity work.Buffers_imp_1PBRZMN
     port map (
      M_AXIS_00_0_tdata(63 downto 0) => Buffers_M_AXIS_00_0_TDATA(63 downto 0),
      M_AXIS_00_0_tlast => Buffers_M_AXIS_00_0_TLAST,
      M_AXIS_00_0_tready => Buffers_M_AXIS_00_0_TREADY,
      M_AXIS_00_0_tvalid => Buffers_M_AXIS_00_0_TVALID,
      S_AXIS_0A_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_00_TDATA(63 downto 0),
      S_AXIS_0A_tlast => symb_buffers_wrapper_0_M_AXIS_0_00_TLAST,
      S_AXIS_0A_tready => symb_buffers_wrapper_0_M_AXIS_0_00_TREADY,
      S_AXIS_0A_tvalid => symb_buffers_wrapper_0_M_AXIS_0_00_TVALID,
      S_AXIS_0B_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_00_TDATA(63 downto 0),
      S_AXIS_0B_tlast => symb_buffers_wrapper_1_M_AXIS_0_00_TLAST,
      S_AXIS_0B_tready => symb_buffers_wrapper_1_M_AXIS_0_00_TREADY,
      S_AXIS_0B_tvalid => symb_buffers_wrapper_1_M_AXIS_0_00_TVALID,
      S_AXIS_10A_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_10_TDATA(63 downto 0),
      S_AXIS_10A_tlast => symb_buffers_wrapper_0_M_AXIS_0_10_TLAST,
      S_AXIS_10A_tready => symb_buffers_wrapper_0_M_AXIS_0_10_TREADY,
      S_AXIS_10A_tvalid => symb_buffers_wrapper_0_M_AXIS_0_10_TVALID,
      S_AXIS_10B_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_10_TDATA(63 downto 0),
      S_AXIS_10B_tlast => symb_buffers_wrapper_1_M_AXIS_0_10_TLAST,
      S_AXIS_10B_tready => symb_buffers_wrapper_1_M_AXIS_0_10_TREADY,
      S_AXIS_10B_tvalid => symb_buffers_wrapper_1_M_AXIS_0_10_TVALID,
      S_AXIS_11A_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_11_TDATA(63 downto 0),
      S_AXIS_11A_tlast => symb_buffers_wrapper_0_M_AXIS_0_11_TLAST,
      S_AXIS_11A_tready => symb_buffers_wrapper_0_M_AXIS_0_11_TREADY,
      S_AXIS_11A_tvalid => symb_buffers_wrapper_0_M_AXIS_0_11_TVALID,
      S_AXIS_11B_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_11_TDATA(63 downto 0),
      S_AXIS_11B_tlast => symb_buffers_wrapper_1_M_AXIS_0_11_TLAST,
      S_AXIS_11B_tready => symb_buffers_wrapper_1_M_AXIS_0_11_TREADY,
      S_AXIS_11B_tvalid => symb_buffers_wrapper_1_M_AXIS_0_11_TVALID,
      S_AXIS_12A_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_12_TDATA(63 downto 0),
      S_AXIS_12A_tlast => symb_buffers_wrapper_0_M_AXIS_0_12_TLAST,
      S_AXIS_12A_tready => symb_buffers_wrapper_0_M_AXIS_0_12_TREADY,
      S_AXIS_12A_tvalid => symb_buffers_wrapper_0_M_AXIS_0_12_TVALID,
      S_AXIS_12B_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_12_TDATA(63 downto 0),
      S_AXIS_12B_tlast => symb_buffers_wrapper_1_M_AXIS_0_12_TLAST,
      S_AXIS_12B_tready => symb_buffers_wrapper_1_M_AXIS_0_12_TREADY,
      S_AXIS_12B_tvalid => symb_buffers_wrapper_1_M_AXIS_0_12_TVALID,
      S_AXIS_13A_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_13_TDATA(63 downto 0),
      S_AXIS_13A_tlast => symb_buffers_wrapper_0_M_AXIS_0_13_TLAST,
      S_AXIS_13A_tready => symb_buffers_wrapper_0_M_AXIS_0_13_TREADY,
      S_AXIS_13A_tvalid => symb_buffers_wrapper_0_M_AXIS_0_13_TVALID,
      S_AXIS_13B_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_13_TDATA(63 downto 0),
      S_AXIS_13B_tlast => symb_buffers_wrapper_1_M_AXIS_0_13_TLAST,
      S_AXIS_13B_tready => symb_buffers_wrapper_1_M_AXIS_0_13_TREADY,
      S_AXIS_13B_tvalid => symb_buffers_wrapper_1_M_AXIS_0_13_TVALID,
      S_AXIS_1A_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_01_TDATA(63 downto 0),
      S_AXIS_1A_tlast => symb_buffers_wrapper_0_M_AXIS_0_01_TLAST,
      S_AXIS_1A_tready => symb_buffers_wrapper_0_M_AXIS_0_01_TREADY,
      S_AXIS_1A_tvalid => symb_buffers_wrapper_0_M_AXIS_0_01_TVALID,
      S_AXIS_1B_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_01_TDATA(63 downto 0),
      S_AXIS_1B_tlast => symb_buffers_wrapper_1_M_AXIS_0_01_TLAST,
      S_AXIS_1B_tready => symb_buffers_wrapper_1_M_AXIS_0_01_TREADY,
      S_AXIS_1B_tvalid => symb_buffers_wrapper_1_M_AXIS_0_01_TVALID,
      S_AXIS_2A_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_02_TDATA(63 downto 0),
      S_AXIS_2A_tlast => symb_buffers_wrapper_0_M_AXIS_0_02_TLAST,
      S_AXIS_2A_tready => symb_buffers_wrapper_0_M_AXIS_0_02_TREADY,
      S_AXIS_2A_tvalid => symb_buffers_wrapper_0_M_AXIS_0_02_TVALID,
      S_AXIS_2B_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_02_TDATA(63 downto 0),
      S_AXIS_2B_tlast => symb_buffers_wrapper_1_M_AXIS_0_02_TLAST,
      S_AXIS_2B_tready => symb_buffers_wrapper_1_M_AXIS_0_02_TREADY,
      S_AXIS_2B_tvalid => symb_buffers_wrapper_1_M_AXIS_0_02_TVALID,
      S_AXIS_3A_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_03_TDATA(63 downto 0),
      S_AXIS_3A_tlast => symb_buffers_wrapper_0_M_AXIS_0_03_TLAST,
      S_AXIS_3A_tready => symb_buffers_wrapper_0_M_AXIS_0_03_TREADY,
      S_AXIS_3A_tvalid => symb_buffers_wrapper_0_M_AXIS_0_03_TVALID,
      S_AXIS_3B_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_03_TDATA(63 downto 0),
      S_AXIS_3B_tlast => symb_buffers_wrapper_1_M_AXIS_0_03_TLAST,
      S_AXIS_3B_tready => symb_buffers_wrapper_1_M_AXIS_0_03_TREADY,
      S_AXIS_3B_tvalid => symb_buffers_wrapper_1_M_AXIS_0_03_TVALID,
      S_AXIS_4A_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_04_TDATA(63 downto 0),
      S_AXIS_4A_tlast => symb_buffers_wrapper_0_M_AXIS_0_04_TLAST,
      S_AXIS_4A_tready => symb_buffers_wrapper_0_M_AXIS_0_04_TREADY,
      S_AXIS_4A_tvalid => symb_buffers_wrapper_0_M_AXIS_0_04_TVALID,
      S_AXIS_4B_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_04_TDATA(63 downto 0),
      S_AXIS_4B_tlast => symb_buffers_wrapper_1_M_AXIS_0_04_TLAST,
      S_AXIS_4B_tready => symb_buffers_wrapper_1_M_AXIS_0_04_TREADY,
      S_AXIS_4B_tvalid => symb_buffers_wrapper_1_M_AXIS_0_04_TVALID,
      S_AXIS_5A_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_05_TDATA(63 downto 0),
      S_AXIS_5A_tlast => symb_buffers_wrapper_0_M_AXIS_0_05_TLAST,
      S_AXIS_5A_tready => symb_buffers_wrapper_0_M_AXIS_0_05_TREADY,
      S_AXIS_5A_tvalid => symb_buffers_wrapper_0_M_AXIS_0_05_TVALID,
      S_AXIS_5B_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_05_TDATA(63 downto 0),
      S_AXIS_5B_tlast => symb_buffers_wrapper_1_M_AXIS_0_05_TLAST,
      S_AXIS_5B_tready => symb_buffers_wrapper_1_M_AXIS_0_05_TREADY,
      S_AXIS_5B_tvalid => symb_buffers_wrapper_1_M_AXIS_0_05_TVALID,
      S_AXIS_6A_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_06_TDATA(63 downto 0),
      S_AXIS_6A_tlast => symb_buffers_wrapper_0_M_AXIS_0_06_TLAST,
      S_AXIS_6A_tready => symb_buffers_wrapper_0_M_AXIS_0_06_TREADY,
      S_AXIS_6A_tvalid => symb_buffers_wrapper_0_M_AXIS_0_06_TVALID,
      S_AXIS_6B_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_06_TDATA(63 downto 0),
      S_AXIS_6B_tlast => symb_buffers_wrapper_1_M_AXIS_0_06_TLAST,
      S_AXIS_6B_tready => symb_buffers_wrapper_1_M_AXIS_0_06_TREADY,
      S_AXIS_6B_tvalid => symb_buffers_wrapper_1_M_AXIS_0_06_TVALID,
      S_AXIS_7A_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_07_TDATA(63 downto 0),
      S_AXIS_7A_tlast => symb_buffers_wrapper_0_M_AXIS_0_07_TLAST,
      S_AXIS_7A_tready => symb_buffers_wrapper_0_M_AXIS_0_07_TREADY,
      S_AXIS_7A_tvalid => symb_buffers_wrapper_0_M_AXIS_0_07_TVALID,
      S_AXIS_7B_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_07_TDATA(63 downto 0),
      S_AXIS_7B_tlast => symb_buffers_wrapper_1_M_AXIS_0_07_TLAST,
      S_AXIS_7B_tready => symb_buffers_wrapper_1_M_AXIS_0_07_TREADY,
      S_AXIS_7B_tvalid => symb_buffers_wrapper_1_M_AXIS_0_07_TVALID,
      S_AXIS_8A_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_08_TDATA(63 downto 0),
      S_AXIS_8A_tlast => symb_buffers_wrapper_0_M_AXIS_0_08_TLAST,
      S_AXIS_8A_tready => symb_buffers_wrapper_0_M_AXIS_0_08_TREADY,
      S_AXIS_8A_tvalid => symb_buffers_wrapper_0_M_AXIS_0_08_TVALID,
      S_AXIS_8B_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_08_TDATA(63 downto 0),
      S_AXIS_8B_tlast => symb_buffers_wrapper_1_M_AXIS_0_08_TLAST,
      S_AXIS_8B_tready => symb_buffers_wrapper_1_M_AXIS_0_08_TREADY,
      S_AXIS_8B_tvalid => symb_buffers_wrapper_1_M_AXIS_0_08_TVALID,
      S_AXIS_9A_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_09_TDATA(63 downto 0),
      S_AXIS_9A_tlast => symb_buffers_wrapper_0_M_AXIS_0_09_TLAST,
      S_AXIS_9A_tready => symb_buffers_wrapper_0_M_AXIS_0_09_TREADY,
      S_AXIS_9A_tvalid => symb_buffers_wrapper_0_M_AXIS_0_09_TVALID,
      S_AXIS_9B_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_09_TDATA(63 downto 0),
      S_AXIS_9B_tlast => symb_buffers_wrapper_1_M_AXIS_0_09_TLAST,
      S_AXIS_9B_tready => symb_buffers_wrapper_1_M_AXIS_0_09_TREADY,
      S_AXIS_9B_tvalid => symb_buffers_wrapper_1_M_AXIS_0_09_TVALID,
      ejectBufs(13 downto 0) => Din_0_1(13 downto 0),
      empty_0 => Buffers_empty_0,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      sel(0) => sched_proc_0_stats,
      sel_0(3 downto 0) => sel_0_1(3 downto 0),
      swap => swap_0_1
    );
FR1_SEL: component slice_agent_xlconstant_0_1
     port map (
      dout(0) => FR1_SEL_dout(0)
    );
sched_proc_0: component slice_agent_sched_proc_0_0
     port map (
      FRSel => FR1_SEL_dout(0),
      M_AXIS_0_tdata(63 downto 0) => sched_proc_0_M_AXIS_0_TDATA(63 downto 0),
      M_AXIS_0_tlast => sched_proc_0_M_AXIS_0_TLAST,
      M_AXIS_0_tready => sched_proc_0_M_AXIS_0_TREADY,
      M_AXIS_0_tvalid => sched_proc_0_M_AXIS_0_TVALID,
      S_AXIS_0_tdata(127 downto 0) => S_AXIS_0_0_1_TDATA(127 downto 0),
      S_AXIS_0_tlast => S_AXIS_0_0_1_TLAST,
      S_AXIS_0_tready => S_AXIS_0_0_1_TREADY,
      S_AXIS_0_tvalid => S_AXIS_0_0_1_TVALID,
      SliceType => FR1_SEL_dout(0),
      c_frameId(7 downto 0) => c_frameId_0_1(7 downto 0),
      c_slotID(5 downto 0) => c_slotID_0_1(5 downto 0),
      c_subframeID(3 downto 0) => c_subframeID_0_1(3 downto 0),
      clk => s_aclk_0_0_1,
      dbg_proc_begin => sched_proc_0_dbg_proc_begin,
      dbg_proc_ecpriId(15 downto 0) => sched_proc_0_dbg_proc_ecpriId(15 downto 0),
      dbg_proc_end => sched_proc_0_dbg_proc_end,
      mu(3 downto 0) => mu_0_1(3 downto 0),
      resetn => s_aresetn_0_0_1,
      s_enSymb_0(13 downto 0) => sched_proc_0_s_enSymb_0(13 downto 0),
      s_start_0 => xlconstant_0_dout(0),
      stats => sched_proc_0_stats
    );
sched_proc_1: component slice_agent_sched_proc_0_1
     port map (
      FRSel => FR1_SEL_dout(0),
      M_AXIS_0_tdata(63 downto 0) => sched_proc_1_M_AXIS_0_TDATA(63 downto 0),
      M_AXIS_0_tlast => sched_proc_1_M_AXIS_0_TLAST,
      M_AXIS_0_tready => sched_proc_1_M_AXIS_0_TREADY,
      M_AXIS_0_tvalid => sched_proc_1_M_AXIS_0_TVALID,
      S_AXIS_0_tdata(127 downto 0) => S_AXIS_0_1_1_TDATA(127 downto 0),
      S_AXIS_0_tlast => S_AXIS_0_1_1_TLAST,
      S_AXIS_0_tready => S_AXIS_0_1_1_TREADY,
      S_AXIS_0_tvalid => S_AXIS_0_1_1_TVALID,
      SliceType => xlconstant_0_dout(0),
      c_frameId(7 downto 0) => c_frameId_0_1(7 downto 0),
      c_slotID(5 downto 0) => c_slotID_0_1(5 downto 0),
      c_subframeID(3 downto 0) => c_subframeID_0_1(3 downto 0),
      clk => s_aclk_0_0_1,
      dbg_proc_begin => sched_proc_1_dbg_proc_begin,
      dbg_proc_ecpriId(15 downto 0) => sched_proc_1_dbg_proc_ecpriId(15 downto 0),
      dbg_proc_end => sched_proc_1_dbg_proc_end,
      mu(3 downto 0) => mu_0_1(3 downto 0),
      resetn => s_aresetn_0_0_1,
      s_enSymb_0(13 downto 0) => sched_proc_1_s_enSymb_0(13 downto 0),
      s_start_0 => s_start_0_0_1,
      stats => NLW_sched_proc_1_stats_UNCONNECTED
    );
symb_buffers_wrapper_0: component slice_agent_symb_buffers_wrapper_0_0
     port map (
      M_AXIS_0_00_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_00_TDATA(63 downto 0),
      M_AXIS_0_00_tlast => symb_buffers_wrapper_0_M_AXIS_0_00_TLAST,
      M_AXIS_0_00_tready => symb_buffers_wrapper_0_M_AXIS_0_00_TREADY,
      M_AXIS_0_00_tvalid => symb_buffers_wrapper_0_M_AXIS_0_00_TVALID,
      M_AXIS_0_01_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_01_TDATA(63 downto 0),
      M_AXIS_0_01_tlast => symb_buffers_wrapper_0_M_AXIS_0_01_TLAST,
      M_AXIS_0_01_tready => symb_buffers_wrapper_0_M_AXIS_0_01_TREADY,
      M_AXIS_0_01_tvalid => symb_buffers_wrapper_0_M_AXIS_0_01_TVALID,
      M_AXIS_0_02_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_02_TDATA(63 downto 0),
      M_AXIS_0_02_tlast => symb_buffers_wrapper_0_M_AXIS_0_02_TLAST,
      M_AXIS_0_02_tready => symb_buffers_wrapper_0_M_AXIS_0_02_TREADY,
      M_AXIS_0_02_tvalid => symb_buffers_wrapper_0_M_AXIS_0_02_TVALID,
      M_AXIS_0_03_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_03_TDATA(63 downto 0),
      M_AXIS_0_03_tlast => symb_buffers_wrapper_0_M_AXIS_0_03_TLAST,
      M_AXIS_0_03_tready => symb_buffers_wrapper_0_M_AXIS_0_03_TREADY,
      M_AXIS_0_03_tvalid => symb_buffers_wrapper_0_M_AXIS_0_03_TVALID,
      M_AXIS_0_04_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_04_TDATA(63 downto 0),
      M_AXIS_0_04_tlast => symb_buffers_wrapper_0_M_AXIS_0_04_TLAST,
      M_AXIS_0_04_tready => symb_buffers_wrapper_0_M_AXIS_0_04_TREADY,
      M_AXIS_0_04_tvalid => symb_buffers_wrapper_0_M_AXIS_0_04_TVALID,
      M_AXIS_0_05_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_05_TDATA(63 downto 0),
      M_AXIS_0_05_tlast => symb_buffers_wrapper_0_M_AXIS_0_05_TLAST,
      M_AXIS_0_05_tready => symb_buffers_wrapper_0_M_AXIS_0_05_TREADY,
      M_AXIS_0_05_tvalid => symb_buffers_wrapper_0_M_AXIS_0_05_TVALID,
      M_AXIS_0_06_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_06_TDATA(63 downto 0),
      M_AXIS_0_06_tlast => symb_buffers_wrapper_0_M_AXIS_0_06_TLAST,
      M_AXIS_0_06_tready => symb_buffers_wrapper_0_M_AXIS_0_06_TREADY,
      M_AXIS_0_06_tvalid => symb_buffers_wrapper_0_M_AXIS_0_06_TVALID,
      M_AXIS_0_07_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_07_TDATA(63 downto 0),
      M_AXIS_0_07_tlast => symb_buffers_wrapper_0_M_AXIS_0_07_TLAST,
      M_AXIS_0_07_tready => symb_buffers_wrapper_0_M_AXIS_0_07_TREADY,
      M_AXIS_0_07_tvalid => symb_buffers_wrapper_0_M_AXIS_0_07_TVALID,
      M_AXIS_0_08_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_08_TDATA(63 downto 0),
      M_AXIS_0_08_tlast => symb_buffers_wrapper_0_M_AXIS_0_08_TLAST,
      M_AXIS_0_08_tready => symb_buffers_wrapper_0_M_AXIS_0_08_TREADY,
      M_AXIS_0_08_tvalid => symb_buffers_wrapper_0_M_AXIS_0_08_TVALID,
      M_AXIS_0_09_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_09_TDATA(63 downto 0),
      M_AXIS_0_09_tlast => symb_buffers_wrapper_0_M_AXIS_0_09_TLAST,
      M_AXIS_0_09_tready => symb_buffers_wrapper_0_M_AXIS_0_09_TREADY,
      M_AXIS_0_09_tvalid => symb_buffers_wrapper_0_M_AXIS_0_09_TVALID,
      M_AXIS_0_10_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_10_TDATA(63 downto 0),
      M_AXIS_0_10_tlast => symb_buffers_wrapper_0_M_AXIS_0_10_TLAST,
      M_AXIS_0_10_tready => symb_buffers_wrapper_0_M_AXIS_0_10_TREADY,
      M_AXIS_0_10_tvalid => symb_buffers_wrapper_0_M_AXIS_0_10_TVALID,
      M_AXIS_0_11_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_11_TDATA(63 downto 0),
      M_AXIS_0_11_tlast => symb_buffers_wrapper_0_M_AXIS_0_11_TLAST,
      M_AXIS_0_11_tready => symb_buffers_wrapper_0_M_AXIS_0_11_TREADY,
      M_AXIS_0_11_tvalid => symb_buffers_wrapper_0_M_AXIS_0_11_TVALID,
      M_AXIS_0_12_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_12_TDATA(63 downto 0),
      M_AXIS_0_12_tlast => symb_buffers_wrapper_0_M_AXIS_0_12_TLAST,
      M_AXIS_0_12_tready => symb_buffers_wrapper_0_M_AXIS_0_12_TREADY,
      M_AXIS_0_12_tvalid => symb_buffers_wrapper_0_M_AXIS_0_12_TVALID,
      M_AXIS_0_13_tdata(63 downto 0) => symb_buffers_wrapper_0_M_AXIS_0_13_TDATA(63 downto 0),
      M_AXIS_0_13_tlast => symb_buffers_wrapper_0_M_AXIS_0_13_TLAST,
      M_AXIS_0_13_tready => symb_buffers_wrapper_0_M_AXIS_0_13_TREADY,
      M_AXIS_0_13_tvalid => symb_buffers_wrapper_0_M_AXIS_0_13_TVALID,
      Rx_AXIS_0_00_tdata(63 downto 0) => sched_proc_0_M_AXIS_0_TDATA(63 downto 0),
      Rx_AXIS_0_00_tlast => sched_proc_0_M_AXIS_0_TLAST,
      Rx_AXIS_0_00_tready => sched_proc_0_M_AXIS_0_TREADY,
      Rx_AXIS_0_00_tvalid => sched_proc_0_M_AXIS_0_TVALID,
      clk => s_aclk_0_0_1,
      rstn => s_aresetn_0_0_1,
      symbEn_0(13 downto 0) => sched_proc_0_s_enSymb_0(13 downto 0)
    );
symb_buffers_wrapper_1: component slice_agent_symb_buffers_wrapper_0_1
     port map (
      M_AXIS_0_00_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_00_TDATA(63 downto 0),
      M_AXIS_0_00_tlast => symb_buffers_wrapper_1_M_AXIS_0_00_TLAST,
      M_AXIS_0_00_tready => symb_buffers_wrapper_1_M_AXIS_0_00_TREADY,
      M_AXIS_0_00_tvalid => symb_buffers_wrapper_1_M_AXIS_0_00_TVALID,
      M_AXIS_0_01_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_01_TDATA(63 downto 0),
      M_AXIS_0_01_tlast => symb_buffers_wrapper_1_M_AXIS_0_01_TLAST,
      M_AXIS_0_01_tready => symb_buffers_wrapper_1_M_AXIS_0_01_TREADY,
      M_AXIS_0_01_tvalid => symb_buffers_wrapper_1_M_AXIS_0_01_TVALID,
      M_AXIS_0_02_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_02_TDATA(63 downto 0),
      M_AXIS_0_02_tlast => symb_buffers_wrapper_1_M_AXIS_0_02_TLAST,
      M_AXIS_0_02_tready => symb_buffers_wrapper_1_M_AXIS_0_02_TREADY,
      M_AXIS_0_02_tvalid => symb_buffers_wrapper_1_M_AXIS_0_02_TVALID,
      M_AXIS_0_03_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_03_TDATA(63 downto 0),
      M_AXIS_0_03_tlast => symb_buffers_wrapper_1_M_AXIS_0_03_TLAST,
      M_AXIS_0_03_tready => symb_buffers_wrapper_1_M_AXIS_0_03_TREADY,
      M_AXIS_0_03_tvalid => symb_buffers_wrapper_1_M_AXIS_0_03_TVALID,
      M_AXIS_0_04_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_04_TDATA(63 downto 0),
      M_AXIS_0_04_tlast => symb_buffers_wrapper_1_M_AXIS_0_04_TLAST,
      M_AXIS_0_04_tready => symb_buffers_wrapper_1_M_AXIS_0_04_TREADY,
      M_AXIS_0_04_tvalid => symb_buffers_wrapper_1_M_AXIS_0_04_TVALID,
      M_AXIS_0_05_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_05_TDATA(63 downto 0),
      M_AXIS_0_05_tlast => symb_buffers_wrapper_1_M_AXIS_0_05_TLAST,
      M_AXIS_0_05_tready => symb_buffers_wrapper_1_M_AXIS_0_05_TREADY,
      M_AXIS_0_05_tvalid => symb_buffers_wrapper_1_M_AXIS_0_05_TVALID,
      M_AXIS_0_06_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_06_TDATA(63 downto 0),
      M_AXIS_0_06_tlast => symb_buffers_wrapper_1_M_AXIS_0_06_TLAST,
      M_AXIS_0_06_tready => symb_buffers_wrapper_1_M_AXIS_0_06_TREADY,
      M_AXIS_0_06_tvalid => symb_buffers_wrapper_1_M_AXIS_0_06_TVALID,
      M_AXIS_0_07_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_07_TDATA(63 downto 0),
      M_AXIS_0_07_tlast => symb_buffers_wrapper_1_M_AXIS_0_07_TLAST,
      M_AXIS_0_07_tready => symb_buffers_wrapper_1_M_AXIS_0_07_TREADY,
      M_AXIS_0_07_tvalid => symb_buffers_wrapper_1_M_AXIS_0_07_TVALID,
      M_AXIS_0_08_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_08_TDATA(63 downto 0),
      M_AXIS_0_08_tlast => symb_buffers_wrapper_1_M_AXIS_0_08_TLAST,
      M_AXIS_0_08_tready => symb_buffers_wrapper_1_M_AXIS_0_08_TREADY,
      M_AXIS_0_08_tvalid => symb_buffers_wrapper_1_M_AXIS_0_08_TVALID,
      M_AXIS_0_09_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_09_TDATA(63 downto 0),
      M_AXIS_0_09_tlast => symb_buffers_wrapper_1_M_AXIS_0_09_TLAST,
      M_AXIS_0_09_tready => symb_buffers_wrapper_1_M_AXIS_0_09_TREADY,
      M_AXIS_0_09_tvalid => symb_buffers_wrapper_1_M_AXIS_0_09_TVALID,
      M_AXIS_0_10_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_10_TDATA(63 downto 0),
      M_AXIS_0_10_tlast => symb_buffers_wrapper_1_M_AXIS_0_10_TLAST,
      M_AXIS_0_10_tready => symb_buffers_wrapper_1_M_AXIS_0_10_TREADY,
      M_AXIS_0_10_tvalid => symb_buffers_wrapper_1_M_AXIS_0_10_TVALID,
      M_AXIS_0_11_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_11_TDATA(63 downto 0),
      M_AXIS_0_11_tlast => symb_buffers_wrapper_1_M_AXIS_0_11_TLAST,
      M_AXIS_0_11_tready => symb_buffers_wrapper_1_M_AXIS_0_11_TREADY,
      M_AXIS_0_11_tvalid => symb_buffers_wrapper_1_M_AXIS_0_11_TVALID,
      M_AXIS_0_12_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_12_TDATA(63 downto 0),
      M_AXIS_0_12_tlast => symb_buffers_wrapper_1_M_AXIS_0_12_TLAST,
      M_AXIS_0_12_tready => symb_buffers_wrapper_1_M_AXIS_0_12_TREADY,
      M_AXIS_0_12_tvalid => symb_buffers_wrapper_1_M_AXIS_0_12_TVALID,
      M_AXIS_0_13_tdata(63 downto 0) => symb_buffers_wrapper_1_M_AXIS_0_13_TDATA(63 downto 0),
      M_AXIS_0_13_tlast => symb_buffers_wrapper_1_M_AXIS_0_13_TLAST,
      M_AXIS_0_13_tready => symb_buffers_wrapper_1_M_AXIS_0_13_TREADY,
      M_AXIS_0_13_tvalid => symb_buffers_wrapper_1_M_AXIS_0_13_TVALID,
      Rx_AXIS_0_00_tdata(63 downto 0) => sched_proc_1_M_AXIS_0_TDATA(63 downto 0),
      Rx_AXIS_0_00_tlast => sched_proc_1_M_AXIS_0_TLAST,
      Rx_AXIS_0_00_tready => sched_proc_1_M_AXIS_0_TREADY,
      Rx_AXIS_0_00_tvalid => sched_proc_1_M_AXIS_0_TVALID,
      clk => s_aclk_0_0_1,
      rstn => s_aresetn_0_0_1,
      symbEn_0(13 downto 0) => sched_proc_1_s_enSymb_0(13 downto 0)
    );
xlconstant_0: component slice_agent_xlconstant_0_0
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
end STRUCTURE;
