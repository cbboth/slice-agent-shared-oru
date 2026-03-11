--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Thu Jun  6 19:50:03 2024
--Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
--Command     : generate_target slice_agent.bd
--Design      : slice_agent
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
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
  component slice_agent_axi_double_buff_0_37 is
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
  end component slice_agent_axi_double_buff_0_37;
  component slice_agent_fifo_generator_0_11 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_0_11;
  component slice_agent_fifo_generator_1_9 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_1_9;
  component slice_agent_ZERO_9 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_ZERO_9;
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
  signal fifo_generator_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_0_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_1_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_double_buff_0_eject_A1_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_double_buff_0_eject_A2_UNCONNECTED : STD_LOGIC;
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
ZERO: component slice_agent_ZERO_9
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
axi_double_buff_0: component slice_agent_axi_double_buff_0_37
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => NLW_axi_double_buff_0_eject_A1_UNCONNECTED,
      eject_A2 => NLW_axi_double_buff_0_eject_A2_UNCONNECTED,
      empty_A1 => xlconstant_1_dout(0),
      empty_A2 => xlconstant_1_dout(0),
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
      s_A1_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      s_A1_tlast => fifo_generator_0_M_AXIS_TLAST,
      s_A1_tready => fifo_generator_0_M_AXIS_TREADY,
      s_A1_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_A2_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      s_A2_tlast => fifo_generator_1_M_AXIS_TLAST,
      s_A2_tready => fifo_generator_1_M_AXIS_TREADY,
      s_A2_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
fifo_generator_0: component slice_agent_fifo_generator_0_11
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_0_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A1_TLAST,
      s_axis_tready => axi_double_buff_0_m_A1_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A1_TVALID
    );
fifo_generator_1: component slice_agent_fifo_generator_1_9
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_1_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A2_TLAST,
      s_axis_tready => axi_double_buff_0_m_A2_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A2_TVALID
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
  component slice_agent_axi_double_buff_0_42 is
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
  end component slice_agent_axi_double_buff_0_42;
  component slice_agent_fifo_generator_0_16 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_0_16;
  component slice_agent_fifo_generator_1_14 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_1_14;
  component slice_agent_ZERO_14 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_ZERO_14;
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
  signal fifo_generator_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_0_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_1_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_double_buff_0_eject_A1_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_double_buff_0_eject_A2_UNCONNECTED : STD_LOGIC;
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
ZERO: component slice_agent_ZERO_14
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
axi_double_buff_0: component slice_agent_axi_double_buff_0_42
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => NLW_axi_double_buff_0_eject_A1_UNCONNECTED,
      eject_A2 => NLW_axi_double_buff_0_eject_A2_UNCONNECTED,
      empty_A1 => xlconstant_1_dout(0),
      empty_A2 => xlconstant_1_dout(0),
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
      s_A1_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      s_A1_tlast => fifo_generator_0_M_AXIS_TLAST,
      s_A1_tready => fifo_generator_0_M_AXIS_TREADY,
      s_A1_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_A2_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      s_A2_tlast => fifo_generator_1_M_AXIS_TLAST,
      s_A2_tready => fifo_generator_1_M_AXIS_TREADY,
      s_A2_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
fifo_generator_0: component slice_agent_fifo_generator_0_16
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_0_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A1_TLAST,
      s_axis_tready => axi_double_buff_0_m_A1_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A1_TVALID
    );
fifo_generator_1: component slice_agent_fifo_generator_1_14
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_1_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A2_TLAST,
      s_axis_tready => axi_double_buff_0_m_A2_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A2_TVALID
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
  component slice_agent_axi_double_buff_0_38 is
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
  end component slice_agent_axi_double_buff_0_38;
  component slice_agent_fifo_generator_0_12 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_0_12;
  component slice_agent_fifo_generator_1_10 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_1_10;
  component slice_agent_ZERO_10 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_ZERO_10;
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
  signal fifo_generator_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_0_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_1_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_double_buff_0_eject_A1_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_double_buff_0_eject_A2_UNCONNECTED : STD_LOGIC;
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
ZERO: component slice_agent_ZERO_10
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
axi_double_buff_0: component slice_agent_axi_double_buff_0_38
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => NLW_axi_double_buff_0_eject_A1_UNCONNECTED,
      eject_A2 => NLW_axi_double_buff_0_eject_A2_UNCONNECTED,
      empty_A1 => xlconstant_1_dout(0),
      empty_A2 => xlconstant_1_dout(0),
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
      s_A1_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      s_A1_tlast => fifo_generator_0_M_AXIS_TLAST,
      s_A1_tready => fifo_generator_0_M_AXIS_TREADY,
      s_A1_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_A2_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      s_A2_tlast => fifo_generator_1_M_AXIS_TLAST,
      s_A2_tready => fifo_generator_1_M_AXIS_TREADY,
      s_A2_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
fifo_generator_0: component slice_agent_fifo_generator_0_12
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_0_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A1_TLAST,
      s_axis_tready => axi_double_buff_0_m_A1_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A1_TVALID
    );
fifo_generator_1: component slice_agent_fifo_generator_1_10
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_1_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A2_TLAST,
      s_axis_tready => axi_double_buff_0_m_A2_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A2_TVALID
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
  component slice_agent_axi_double_buff_0_41 is
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
  end component slice_agent_axi_double_buff_0_41;
  component slice_agent_fifo_generator_0_15 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_0_15;
  component slice_agent_fifo_generator_1_13 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_1_13;
  component slice_agent_ZERO_13 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_ZERO_13;
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
  signal fifo_generator_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_0_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_1_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_double_buff_0_eject_A1_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_double_buff_0_eject_A2_UNCONNECTED : STD_LOGIC;
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
ZERO: component slice_agent_ZERO_13
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
axi_double_buff_0: component slice_agent_axi_double_buff_0_41
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => NLW_axi_double_buff_0_eject_A1_UNCONNECTED,
      eject_A2 => NLW_axi_double_buff_0_eject_A2_UNCONNECTED,
      empty_A1 => xlconstant_1_dout(0),
      empty_A2 => xlconstant_1_dout(0),
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
      s_A1_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      s_A1_tlast => fifo_generator_0_M_AXIS_TLAST,
      s_A1_tready => fifo_generator_0_M_AXIS_TREADY,
      s_A1_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_A2_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      s_A2_tlast => fifo_generator_1_M_AXIS_TLAST,
      s_A2_tready => fifo_generator_1_M_AXIS_TREADY,
      s_A2_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
fifo_generator_0: component slice_agent_fifo_generator_0_15
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_0_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A1_TLAST,
      s_axis_tready => axi_double_buff_0_m_A1_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A1_TVALID
    );
fifo_generator_1: component slice_agent_fifo_generator_1_13
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_1_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A2_TLAST,
      s_axis_tready => axi_double_buff_0_m_A2_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A2_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_1_imp_IO8BPS is
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
end double_buffer_1_imp_IO8BPS;

architecture STRUCTURE of double_buffer_1_imp_IO8BPS is
  component slice_agent_axi_double_buff_0_28 is
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
  end component slice_agent_axi_double_buff_0_28;
  component slice_agent_fifo_generator_0_2 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_0_2;
  component slice_agent_fifo_generator_1_0 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_1_0;
  component slice_agent_ZERO_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_ZERO_0;
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
  signal fifo_generator_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_0_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_1_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_double_buff_0_eject_A1_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_double_buff_0_eject_A2_UNCONNECTED : STD_LOGIC;
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
ZERO: component slice_agent_ZERO_0
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
axi_double_buff_0: component slice_agent_axi_double_buff_0_28
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => NLW_axi_double_buff_0_eject_A1_UNCONNECTED,
      eject_A2 => NLW_axi_double_buff_0_eject_A2_UNCONNECTED,
      empty_A1 => xlconstant_1_dout(0),
      empty_A2 => xlconstant_1_dout(0),
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
      s_A1_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      s_A1_tlast => fifo_generator_0_M_AXIS_TLAST,
      s_A1_tready => fifo_generator_0_M_AXIS_TREADY,
      s_A1_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_A2_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      s_A2_tlast => fifo_generator_1_M_AXIS_TLAST,
      s_A2_tready => fifo_generator_1_M_AXIS_TREADY,
      s_A2_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
fifo_generator_0: component slice_agent_fifo_generator_0_2
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_0_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A1_TLAST,
      s_axis_tready => axi_double_buff_0_m_A1_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A1_TVALID
    );
fifo_generator_1: component slice_agent_fifo_generator_1_0
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_1_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A2_TLAST,
      s_axis_tready => axi_double_buff_0_m_A2_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A2_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_2_imp_ENME1S is
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
end double_buffer_2_imp_ENME1S;

architecture STRUCTURE of double_buffer_2_imp_ENME1S is
  component slice_agent_axi_double_buff_0_29 is
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
  end component slice_agent_axi_double_buff_0_29;
  component slice_agent_fifo_generator_0_3 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_0_3;
  component slice_agent_fifo_generator_1_1 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_1_1;
  component slice_agent_ZERO_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_ZERO_1;
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
  signal fifo_generator_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_0_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_1_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_double_buff_0_eject_A1_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_double_buff_0_eject_A2_UNCONNECTED : STD_LOGIC;
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
ZERO: component slice_agent_ZERO_1
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
axi_double_buff_0: component slice_agent_axi_double_buff_0_29
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => NLW_axi_double_buff_0_eject_A1_UNCONNECTED,
      eject_A2 => NLW_axi_double_buff_0_eject_A2_UNCONNECTED,
      empty_A1 => xlconstant_1_dout(0),
      empty_A2 => xlconstant_1_dout(0),
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
      s_A1_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      s_A1_tlast => fifo_generator_0_M_AXIS_TLAST,
      s_A1_tready => fifo_generator_0_M_AXIS_TREADY,
      s_A1_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_A2_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      s_A2_tlast => fifo_generator_1_M_AXIS_TLAST,
      s_A2_tready => fifo_generator_1_M_AXIS_TREADY,
      s_A2_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
fifo_generator_0: component slice_agent_fifo_generator_0_3
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_0_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A1_TLAST,
      s_axis_tready => axi_double_buff_0_m_A1_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A1_TVALID
    );
fifo_generator_1: component slice_agent_fifo_generator_1_1
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_1_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A2_TLAST,
      s_axis_tready => axi_double_buff_0_m_A2_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A2_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_3_imp_1COO7GV is
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
end double_buffer_3_imp_1COO7GV;

architecture STRUCTURE of double_buffer_3_imp_1COO7GV is
  component slice_agent_axi_double_buff_0_30 is
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
  end component slice_agent_axi_double_buff_0_30;
  component slice_agent_fifo_generator_0_4 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_0_4;
  component slice_agent_fifo_generator_1_2 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_1_2;
  component slice_agent_ZERO_2 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_ZERO_2;
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
  signal fifo_generator_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_0_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_1_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_double_buff_0_eject_A1_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_double_buff_0_eject_A2_UNCONNECTED : STD_LOGIC;
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
ZERO: component slice_agent_ZERO_2
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
axi_double_buff_0: component slice_agent_axi_double_buff_0_30
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => NLW_axi_double_buff_0_eject_A1_UNCONNECTED,
      eject_A2 => NLW_axi_double_buff_0_eject_A2_UNCONNECTED,
      empty_A1 => xlconstant_1_dout(0),
      empty_A2 => xlconstant_1_dout(0),
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
      s_A1_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      s_A1_tlast => fifo_generator_0_M_AXIS_TLAST,
      s_A1_tready => fifo_generator_0_M_AXIS_TREADY,
      s_A1_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_A2_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      s_A2_tlast => fifo_generator_1_M_AXIS_TLAST,
      s_A2_tready => fifo_generator_1_M_AXIS_TREADY,
      s_A2_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
fifo_generator_0: component slice_agent_fifo_generator_0_4
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_0_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A1_TLAST,
      s_axis_tready => axi_double_buff_0_m_A1_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A1_TVALID
    );
fifo_generator_1: component slice_agent_fifo_generator_1_2
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_1_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A2_TLAST,
      s_axis_tready => axi_double_buff_0_m_A2_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A2_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_4_imp_1P0W5Z4 is
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
end double_buffer_4_imp_1P0W5Z4;

architecture STRUCTURE of double_buffer_4_imp_1P0W5Z4 is
  component slice_agent_axi_double_buff_0_31 is
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
  end component slice_agent_axi_double_buff_0_31;
  component slice_agent_fifo_generator_0_5 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_0_5;
  component slice_agent_fifo_generator_1_3 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_1_3;
  component slice_agent_ZERO_3 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_ZERO_3;
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
  signal fifo_generator_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_0_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_1_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_double_buff_0_eject_A1_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_double_buff_0_eject_A2_UNCONNECTED : STD_LOGIC;
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
ZERO: component slice_agent_ZERO_3
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
axi_double_buff_0: component slice_agent_axi_double_buff_0_31
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => NLW_axi_double_buff_0_eject_A1_UNCONNECTED,
      eject_A2 => NLW_axi_double_buff_0_eject_A2_UNCONNECTED,
      empty_A1 => xlconstant_1_dout(0),
      empty_A2 => xlconstant_1_dout(0),
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
      s_A1_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      s_A1_tlast => fifo_generator_0_M_AXIS_TLAST,
      s_A1_tready => fifo_generator_0_M_AXIS_TREADY,
      s_A1_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_A2_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      s_A2_tlast => fifo_generator_1_M_AXIS_TLAST,
      s_A2_tready => fifo_generator_1_M_AXIS_TREADY,
      s_A2_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
fifo_generator_0: component slice_agent_fifo_generator_0_5
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_0_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A1_TLAST,
      s_axis_tready => axi_double_buff_0_m_A1_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A1_TVALID
    );
fifo_generator_1: component slice_agent_fifo_generator_1_3
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_1_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A2_TLAST,
      s_axis_tready => axi_double_buff_0_m_A2_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A2_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_5_imp_HU6YI7 is
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
end double_buffer_5_imp_HU6YI7;

architecture STRUCTURE of double_buffer_5_imp_HU6YI7 is
  component slice_agent_axi_double_buff_0_32 is
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
  end component slice_agent_axi_double_buff_0_32;
  component slice_agent_fifo_generator_0_6 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_0_6;
  component slice_agent_fifo_generator_1_4 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_1_4;
  component slice_agent_ZERO_4 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_ZERO_4;
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
  signal fifo_generator_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_0_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_1_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_double_buff_0_eject_A1_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_double_buff_0_eject_A2_UNCONNECTED : STD_LOGIC;
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
ZERO: component slice_agent_ZERO_4
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
axi_double_buff_0: component slice_agent_axi_double_buff_0_32
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => NLW_axi_double_buff_0_eject_A1_UNCONNECTED,
      eject_A2 => NLW_axi_double_buff_0_eject_A2_UNCONNECTED,
      empty_A1 => xlconstant_1_dout(0),
      empty_A2 => xlconstant_1_dout(0),
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
      s_A1_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      s_A1_tlast => fifo_generator_0_M_AXIS_TLAST,
      s_A1_tready => fifo_generator_0_M_AXIS_TREADY,
      s_A1_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_A2_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      s_A2_tlast => fifo_generator_1_M_AXIS_TLAST,
      s_A2_tready => fifo_generator_1_M_AXIS_TREADY,
      s_A2_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
fifo_generator_0: component slice_agent_fifo_generator_0_6
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_0_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A1_TLAST,
      s_axis_tready => axi_double_buff_0_m_A1_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A1_TVALID
    );
fifo_generator_1: component slice_agent_fifo_generator_1_4
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_1_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A2_TLAST,
      s_axis_tready => axi_double_buff_0_m_A2_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A2_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_6_imp_FHO0DB is
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
end double_buffer_6_imp_FHO0DB;

architecture STRUCTURE of double_buffer_6_imp_FHO0DB is
  component slice_agent_axi_double_buff_0_33 is
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
  end component slice_agent_axi_double_buff_0_33;
  component slice_agent_fifo_generator_0_7 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_0_7;
  component slice_agent_fifo_generator_1_5 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_1_5;
  component slice_agent_ZERO_5 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_ZERO_5;
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
  signal fifo_generator_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_0_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_1_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_double_buff_0_eject_A1_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_double_buff_0_eject_A2_UNCONNECTED : STD_LOGIC;
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
ZERO: component slice_agent_ZERO_5
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
axi_double_buff_0: component slice_agent_axi_double_buff_0_33
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => NLW_axi_double_buff_0_eject_A1_UNCONNECTED,
      eject_A2 => NLW_axi_double_buff_0_eject_A2_UNCONNECTED,
      empty_A1 => xlconstant_1_dout(0),
      empty_A2 => xlconstant_1_dout(0),
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
      s_A1_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      s_A1_tlast => fifo_generator_0_M_AXIS_TLAST,
      s_A1_tready => fifo_generator_0_M_AXIS_TREADY,
      s_A1_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_A2_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      s_A2_tlast => fifo_generator_1_M_AXIS_TLAST,
      s_A2_tready => fifo_generator_1_M_AXIS_TREADY,
      s_A2_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
fifo_generator_0: component slice_agent_fifo_generator_0_7
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_0_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A1_TLAST,
      s_axis_tready => axi_double_buff_0_m_A1_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A1_TVALID
    );
fifo_generator_1: component slice_agent_fifo_generator_1_5
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_1_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A2_TLAST,
      s_axis_tready => axi_double_buff_0_m_A2_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A2_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_7_imp_1BUH41C is
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
end double_buffer_7_imp_1BUH41C;

architecture STRUCTURE of double_buffer_7_imp_1BUH41C is
  component slice_agent_axi_double_buff_0_34 is
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
  end component slice_agent_axi_double_buff_0_34;
  component slice_agent_fifo_generator_0_8 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_0_8;
  component slice_agent_fifo_generator_1_6 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_1_6;
  component slice_agent_ZERO_6 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_ZERO_6;
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
  signal fifo_generator_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_0_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_1_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_double_buff_0_eject_A1_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_double_buff_0_eject_A2_UNCONNECTED : STD_LOGIC;
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
ZERO: component slice_agent_ZERO_6
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
axi_double_buff_0: component slice_agent_axi_double_buff_0_34
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => NLW_axi_double_buff_0_eject_A1_UNCONNECTED,
      eject_A2 => NLW_axi_double_buff_0_eject_A2_UNCONNECTED,
      empty_A1 => xlconstant_1_dout(0),
      empty_A2 => xlconstant_1_dout(0),
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
      s_A1_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      s_A1_tlast => fifo_generator_0_M_AXIS_TLAST,
      s_A1_tready => fifo_generator_0_M_AXIS_TREADY,
      s_A1_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_A2_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      s_A2_tlast => fifo_generator_1_M_AXIS_TLAST,
      s_A2_tready => fifo_generator_1_M_AXIS_TREADY,
      s_A2_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
fifo_generator_0: component slice_agent_fifo_generator_0_8
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_0_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A1_TLAST,
      s_axis_tready => axi_double_buff_0_m_A1_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A1_TVALID
    );
fifo_generator_1: component slice_agent_fifo_generator_1_6
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_1_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A2_TLAST,
      s_axis_tready => axi_double_buff_0_m_A2_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A2_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_8_imp_1PUGJB5 is
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
end double_buffer_8_imp_1PUGJB5;

architecture STRUCTURE of double_buffer_8_imp_1PUGJB5 is
  component slice_agent_axi_double_buff_0_35 is
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
  end component slice_agent_axi_double_buff_0_35;
  component slice_agent_fifo_generator_0_9 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_0_9;
  component slice_agent_fifo_generator_1_7 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_1_7;
  component slice_agent_ZERO_7 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_ZERO_7;
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
  signal fifo_generator_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_0_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_1_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_double_buff_0_eject_A1_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_double_buff_0_eject_A2_UNCONNECTED : STD_LOGIC;
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
ZERO: component slice_agent_ZERO_7
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
axi_double_buff_0: component slice_agent_axi_double_buff_0_35
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => NLW_axi_double_buff_0_eject_A1_UNCONNECTED,
      eject_A2 => NLW_axi_double_buff_0_eject_A2_UNCONNECTED,
      empty_A1 => xlconstant_1_dout(0),
      empty_A2 => xlconstant_1_dout(0),
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
      s_A1_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      s_A1_tlast => fifo_generator_0_M_AXIS_TLAST,
      s_A1_tready => fifo_generator_0_M_AXIS_TREADY,
      s_A1_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_A2_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      s_A2_tlast => fifo_generator_1_M_AXIS_TLAST,
      s_A2_tready => fifo_generator_1_M_AXIS_TREADY,
      s_A2_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
fifo_generator_0: component slice_agent_fifo_generator_0_9
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_0_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A1_TLAST,
      s_axis_tready => axi_double_buff_0_m_A1_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A1_TVALID
    );
fifo_generator_1: component slice_agent_fifo_generator_1_7
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_1_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A2_TLAST,
      s_axis_tready => axi_double_buff_0_m_A2_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A2_TVALID
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity double_buffer_9_imp_J7R9GU is
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
end double_buffer_9_imp_J7R9GU;

architecture STRUCTURE of double_buffer_9_imp_J7R9GU is
  component slice_agent_axi_double_buff_0_36 is
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
  end component slice_agent_axi_double_buff_0_36;
  component slice_agent_fifo_generator_0_10 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_0_10;
  component slice_agent_fifo_generator_1_8 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_1_8;
  component slice_agent_ZERO_8 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_ZERO_8;
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
  signal fifo_generator_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_0_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_1_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_double_buff_0_eject_A1_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_double_buff_0_eject_A2_UNCONNECTED : STD_LOGIC;
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
ZERO: component slice_agent_ZERO_8
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
axi_double_buff_0: component slice_agent_axi_double_buff_0_36
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => NLW_axi_double_buff_0_eject_A1_UNCONNECTED,
      eject_A2 => NLW_axi_double_buff_0_eject_A2_UNCONNECTED,
      empty_A1 => xlconstant_1_dout(0),
      empty_A2 => xlconstant_1_dout(0),
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
      s_A1_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      s_A1_tlast => fifo_generator_0_M_AXIS_TLAST,
      s_A1_tready => fifo_generator_0_M_AXIS_TREADY,
      s_A1_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_A2_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      s_A2_tlast => fifo_generator_1_M_AXIS_TLAST,
      s_A2_tready => fifo_generator_1_M_AXIS_TREADY,
      s_A2_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
fifo_generator_0: component slice_agent_fifo_generator_0_10
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_0_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A1_TLAST,
      s_axis_tready => axi_double_buff_0_m_A1_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A1_TVALID
    );
fifo_generator_1: component slice_agent_fifo_generator_1_8
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_1_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A2_TLAST,
      s_axis_tready => axi_double_buff_0_m_A2_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A2_TVALID
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
  component slice_agent_fifo_generator_0_0 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_0_0;
  component slice_agent_fifo_generator_0_1 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component slice_agent_fifo_generator_0_1;
  component slice_agent_xlconstant_1_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlconstant_1_0;
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
  signal fifo_generator_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_0_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_1_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal s_y_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal s_y_1_TLAST : STD_LOGIC;
  signal s_y_1_TREADY : STD_LOGIC;
  signal s_y_1_TVALID : STD_LOGIC;
  signal swap_0_1 : STD_LOGIC;
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_axi_double_buff_0_eject_A1_UNCONNECTED : STD_LOGIC;
  signal NLW_axi_double_buff_0_eject_A2_UNCONNECTED : STD_LOGIC;
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
ZERO: component slice_agent_xlconstant_1_0
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
axi_double_buff_0: component slice_agent_axi_double_buff_0_0
     port map (
      clk => s_aclk_0_0_1,
      eject => eject_1,
      eject_A1 => NLW_axi_double_buff_0_eject_A1_UNCONNECTED,
      eject_A2 => NLW_axi_double_buff_0_eject_A2_UNCONNECTED,
      empty_A1 => xlconstant_1_dout(0),
      empty_A2 => xlconstant_1_dout(0),
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
      s_A1_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      s_A1_tlast => fifo_generator_0_M_AXIS_TLAST,
      s_A1_tready => fifo_generator_0_M_AXIS_TREADY,
      s_A1_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_A2_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      s_A2_tlast => fifo_generator_1_M_AXIS_TLAST,
      s_A2_tready => fifo_generator_1_M_AXIS_TREADY,
      s_A2_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_y_tdata(63 downto 0) => s_y_1_TDATA(63 downto 0),
      s_y_tlast => s_y_1_TLAST,
      s_y_tready => s_y_1_TREADY,
      s_y_tvalid => s_y_1_TVALID,
      swap => swap_0_1
    );
fifo_generator_0: component slice_agent_fifo_generator_0_0
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_0_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_0_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A1_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A1_TLAST,
      s_axis_tready => axi_double_buff_0_m_A1_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A1_TVALID
    );
fifo_generator_1: component slice_agent_fifo_generator_0_1
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      m_axis_tlast => fifo_generator_1_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_axis_tdata(63 downto 0) => axi_double_buff_0_m_A2_TDATA(63 downto 0),
      s_axis_tlast => axi_double_buff_0_m_A2_TLAST,
      s_axis_tready => axi_double_buff_0_m_A2_TREADY,
      s_axis_tvalid => axi_double_buff_0_m_A2_TVALID
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
  signal axi_demux_2x1_06_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_06_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_06_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_06_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_demux_2x1_07_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_07_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_07_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_07_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_demux_2x1_08_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_08_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_08_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_08_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_demux_2x1_09_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_09_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_09_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_09_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_demux_2x1_10_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_10_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_10_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_10_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_demux_2x1_11_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_11_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_11_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_11_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_demux_2x1_12_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_12_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_12_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_12_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_demux_2x1_13_M_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal axi_demux_2x1_13_M_AXIS_00_TLAST : STD_LOGIC;
  signal axi_demux_2x1_13_M_AXIS_00_TREADY : STD_LOGIC;
  signal axi_demux_2x1_13_M_AXIS_00_TVALID : STD_LOGIC;
  signal axi_mux_14x1_0_empty : STD_LOGIC;
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
  signal double_buffer_1_empty_y : STD_LOGIC;
  signal double_buffer_1_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_1_m_y_TLAST : STD_LOGIC;
  signal double_buffer_1_m_y_TREADY : STD_LOGIC;
  signal double_buffer_1_m_y_TVALID : STD_LOGIC;
  signal double_buffer_2_empty_y : STD_LOGIC;
  signal double_buffer_2_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_2_m_y_TLAST : STD_LOGIC;
  signal double_buffer_2_m_y_TREADY : STD_LOGIC;
  signal double_buffer_2_m_y_TVALID : STD_LOGIC;
  signal double_buffer_3_empty_y : STD_LOGIC;
  signal double_buffer_3_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_3_m_y_TLAST : STD_LOGIC;
  signal double_buffer_3_m_y_TREADY : STD_LOGIC;
  signal double_buffer_3_m_y_TVALID : STD_LOGIC;
  signal double_buffer_4_empty_y : STD_LOGIC;
  signal double_buffer_4_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_4_m_y_TLAST : STD_LOGIC;
  signal double_buffer_4_m_y_TREADY : STD_LOGIC;
  signal double_buffer_4_m_y_TVALID : STD_LOGIC;
  signal double_buffer_5_empty_y : STD_LOGIC;
  signal double_buffer_5_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_5_m_y_TLAST : STD_LOGIC;
  signal double_buffer_5_m_y_TREADY : STD_LOGIC;
  signal double_buffer_5_m_y_TVALID : STD_LOGIC;
  signal double_buffer_6_empty_y : STD_LOGIC;
  signal double_buffer_6_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_6_m_y_TLAST : STD_LOGIC;
  signal double_buffer_6_m_y_TREADY : STD_LOGIC;
  signal double_buffer_6_m_y_TVALID : STD_LOGIC;
  signal double_buffer_7_empty_y : STD_LOGIC;
  signal double_buffer_7_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_7_m_y_TLAST : STD_LOGIC;
  signal double_buffer_7_m_y_TREADY : STD_LOGIC;
  signal double_buffer_7_m_y_TVALID : STD_LOGIC;
  signal double_buffer_8_empty_y : STD_LOGIC;
  signal double_buffer_8_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_8_m_y_TLAST : STD_LOGIC;
  signal double_buffer_8_m_y_TREADY : STD_LOGIC;
  signal double_buffer_8_m_y_TVALID : STD_LOGIC;
  signal double_buffer_9_empty_y : STD_LOGIC;
  signal double_buffer_9_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_9_m_y_TLAST : STD_LOGIC;
  signal double_buffer_9_m_y_TREADY : STD_LOGIC;
  signal double_buffer_9_m_y_TVALID : STD_LOGIC;
  signal double_buffer_empty_y : STD_LOGIC;
  signal double_buffer_m_y_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal double_buffer_m_y_TLAST : STD_LOGIC;
  signal double_buffer_m_y_TREADY : STD_LOGIC;
  signal double_buffer_m_y_TVALID : STD_LOGIC;
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
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
  signal xlslice_11_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_12_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_13_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_1_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_2_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_3_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_4_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_5_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_6_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_7_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_8_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlslice_9_Dout : STD_LOGIC_VECTOR ( 0 to 0 );
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
      M_AXIS_00_tdata(63 downto 0) => axi_demux_2x1_06_M_AXIS_00_TDATA(63 downto 0),
      M_AXIS_00_tlast => axi_demux_2x1_06_M_AXIS_00_TLAST,
      M_AXIS_00_tready => axi_demux_2x1_06_M_AXIS_00_TREADY,
      M_AXIS_00_tvalid => axi_demux_2x1_06_M_AXIS_00_TVALID,
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
      M_AXIS_00_tdata(63 downto 0) => axi_demux_2x1_07_M_AXIS_00_TDATA(63 downto 0),
      M_AXIS_00_tlast => axi_demux_2x1_07_M_AXIS_00_TLAST,
      M_AXIS_00_tready => axi_demux_2x1_07_M_AXIS_00_TREADY,
      M_AXIS_00_tvalid => axi_demux_2x1_07_M_AXIS_00_TVALID,
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
      M_AXIS_00_tdata(63 downto 0) => axi_demux_2x1_08_M_AXIS_00_TDATA(63 downto 0),
      M_AXIS_00_tlast => axi_demux_2x1_08_M_AXIS_00_TLAST,
      M_AXIS_00_tready => axi_demux_2x1_08_M_AXIS_00_TREADY,
      M_AXIS_00_tvalid => axi_demux_2x1_08_M_AXIS_00_TVALID,
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
      M_AXIS_00_tdata(63 downto 0) => axi_demux_2x1_09_M_AXIS_00_TDATA(63 downto 0),
      M_AXIS_00_tlast => axi_demux_2x1_09_M_AXIS_00_TLAST,
      M_AXIS_00_tready => axi_demux_2x1_09_M_AXIS_00_TREADY,
      M_AXIS_00_tvalid => axi_demux_2x1_09_M_AXIS_00_TVALID,
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
      M_AXIS_00_tdata(63 downto 0) => axi_demux_2x1_10_M_AXIS_00_TDATA(63 downto 0),
      M_AXIS_00_tlast => axi_demux_2x1_10_M_AXIS_00_TLAST,
      M_AXIS_00_tready => axi_demux_2x1_10_M_AXIS_00_TREADY,
      M_AXIS_00_tvalid => axi_demux_2x1_10_M_AXIS_00_TVALID,
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
      M_AXIS_00_tdata(63 downto 0) => axi_demux_2x1_12_M_AXIS_00_TDATA(63 downto 0),
      M_AXIS_00_tlast => axi_demux_2x1_12_M_AXIS_00_TLAST,
      M_AXIS_00_tready => axi_demux_2x1_12_M_AXIS_00_TREADY,
      M_AXIS_00_tvalid => axi_demux_2x1_12_M_AXIS_00_TVALID,
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
      S_AXIS_01_tdata(63 downto 0) => double_buffer_1_m_y_TDATA(63 downto 0),
      S_AXIS_01_tlast => double_buffer_1_m_y_TLAST,
      S_AXIS_01_tready => double_buffer_1_m_y_TREADY,
      S_AXIS_01_tvalid => double_buffer_1_m_y_TVALID,
      S_AXIS_02_tdata(63 downto 0) => double_buffer_2_m_y_TDATA(63 downto 0),
      S_AXIS_02_tlast => double_buffer_2_m_y_TLAST,
      S_AXIS_02_tready => double_buffer_2_m_y_TREADY,
      S_AXIS_02_tvalid => double_buffer_2_m_y_TVALID,
      S_AXIS_03_tdata(63 downto 0) => double_buffer_3_m_y_TDATA(63 downto 0),
      S_AXIS_03_tlast => double_buffer_3_m_y_TLAST,
      S_AXIS_03_tready => double_buffer_3_m_y_TREADY,
      S_AXIS_03_tvalid => double_buffer_3_m_y_TVALID,
      S_AXIS_04_tdata(63 downto 0) => double_buffer_4_m_y_TDATA(63 downto 0),
      S_AXIS_04_tlast => double_buffer_4_m_y_TLAST,
      S_AXIS_04_tready => double_buffer_4_m_y_TREADY,
      S_AXIS_04_tvalid => double_buffer_4_m_y_TVALID,
      S_AXIS_05_tdata(63 downto 0) => double_buffer_5_m_y_TDATA(63 downto 0),
      S_AXIS_05_tlast => double_buffer_5_m_y_TLAST,
      S_AXIS_05_tready => double_buffer_5_m_y_TREADY,
      S_AXIS_05_tvalid => double_buffer_5_m_y_TVALID,
      S_AXIS_06_tdata(63 downto 0) => double_buffer_6_m_y_TDATA(63 downto 0),
      S_AXIS_06_tlast => double_buffer_6_m_y_TLAST,
      S_AXIS_06_tready => double_buffer_6_m_y_TREADY,
      S_AXIS_06_tvalid => double_buffer_6_m_y_TVALID,
      S_AXIS_07_tdata(63 downto 0) => double_buffer_7_m_y_TDATA(63 downto 0),
      S_AXIS_07_tlast => double_buffer_7_m_y_TLAST,
      S_AXIS_07_tready => double_buffer_7_m_y_TREADY,
      S_AXIS_07_tvalid => double_buffer_7_m_y_TVALID,
      S_AXIS_08_tdata(63 downto 0) => double_buffer_8_m_y_TDATA(63 downto 0),
      S_AXIS_08_tlast => double_buffer_8_m_y_TLAST,
      S_AXIS_08_tready => double_buffer_8_m_y_TREADY,
      S_AXIS_08_tvalid => double_buffer_8_m_y_TVALID,
      S_AXIS_09_tdata(63 downto 0) => double_buffer_9_m_y_TDATA(63 downto 0),
      S_AXIS_09_tlast => double_buffer_9_m_y_TLAST,
      S_AXIS_09_tready => double_buffer_9_m_y_TREADY,
      S_AXIS_09_tvalid => double_buffer_9_m_y_TVALID,
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
      empty_1 => double_buffer_1_empty_y,
      empty_10 => double_buffer_10_empty_y,
      empty_11 => double_buffer_11_empty_y,
      empty_12 => double_buffer_12_empty_y,
      empty_13 => double_buffer_13_empty_y,
      empty_2 => double_buffer_2_empty_y,
      empty_3 => double_buffer_3_empty_y,
      empty_4 => double_buffer_4_empty_y,
      empty_5 => double_buffer_5_empty_y,
      empty_6 => double_buffer_6_empty_y,
      empty_7 => double_buffer_7_empty_y,
      empty_8 => double_buffer_8_empty_y,
      empty_9 => double_buffer_9_empty_y,
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
double_buffer_1: entity work.double_buffer_1_imp_IO8BPS
     port map (
      eject => xlslice_1_Dout(0),
      empty_y => double_buffer_1_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_1_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_1_m_y_TLAST,
      m_y_tready => double_buffer_1_m_y_TREADY,
      m_y_tvalid => double_buffer_1_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_01_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_01_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_01_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_01_M_AXIS_00_TVALID,
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
      s_y_tdata(63 downto 0) => axi_demux_2x1_10_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_10_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_10_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_10_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_11: entity work.double_buffer_11_imp_4RMLOE
     port map (
      eject => xlslice_11_Dout(0),
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
      s_y_tdata(63 downto 0) => axi_demux_2x1_12_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_12_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_12_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_12_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_13: entity work.double_buffer_13_imp_1Y7Z3Q9
     port map (
      eject => xlslice_13_Dout(0),
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
double_buffer_2: entity work.double_buffer_2_imp_ENME1S
     port map (
      eject => xlslice_2_Dout(0),
      empty_y => double_buffer_2_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_2_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_2_m_y_TLAST,
      m_y_tready => double_buffer_2_m_y_TREADY,
      m_y_tvalid => double_buffer_2_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_02_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_02_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_02_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_02_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_3: entity work.double_buffer_3_imp_1COO7GV
     port map (
      eject => xlslice_3_Dout(0),
      empty_y => double_buffer_3_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_3_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_3_m_y_TLAST,
      m_y_tready => double_buffer_3_m_y_TREADY,
      m_y_tvalid => double_buffer_3_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_03_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_03_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_03_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_03_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_4: entity work.double_buffer_4_imp_1P0W5Z4
     port map (
      eject => xlslice_4_Dout(0),
      empty_y => double_buffer_4_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_4_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_4_m_y_TLAST,
      m_y_tready => double_buffer_4_m_y_TREADY,
      m_y_tvalid => double_buffer_4_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_04_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_04_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_04_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_04_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_5: entity work.double_buffer_5_imp_HU6YI7
     port map (
      eject => xlslice_5_Dout(0),
      empty_y => double_buffer_5_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_5_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_5_m_y_TLAST,
      m_y_tready => double_buffer_5_m_y_TREADY,
      m_y_tvalid => double_buffer_5_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_05_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_05_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_05_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_05_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_6: entity work.double_buffer_6_imp_FHO0DB
     port map (
      eject => xlslice_6_Dout(0),
      empty_y => double_buffer_6_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_6_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_6_m_y_TLAST,
      m_y_tready => double_buffer_6_m_y_TREADY,
      m_y_tvalid => double_buffer_6_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_06_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_06_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_06_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_06_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_7: entity work.double_buffer_7_imp_1BUH41C
     port map (
      eject => xlslice_7_Dout(0),
      empty_y => double_buffer_7_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_7_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_7_m_y_TLAST,
      m_y_tready => double_buffer_7_m_y_TREADY,
      m_y_tvalid => double_buffer_7_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_07_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_07_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_07_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_07_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_8: entity work.double_buffer_8_imp_1PUGJB5
     port map (
      eject => xlslice_8_Dout(0),
      empty_y => double_buffer_8_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_8_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_8_m_y_TLAST,
      m_y_tready => double_buffer_8_m_y_TREADY,
      m_y_tvalid => double_buffer_8_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_08_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_08_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_08_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_08_M_AXIS_00_TVALID,
      swap => swap_0_1
    );
double_buffer_9: entity work.double_buffer_9_imp_J7R9GU
     port map (
      eject => xlslice_9_Dout(0),
      empty_y => double_buffer_9_empty_y,
      m_y_tdata(63 downto 0) => double_buffer_9_m_y_TDATA(63 downto 0),
      m_y_tlast => double_buffer_9_m_y_TLAST,
      m_y_tready => double_buffer_9_m_y_TREADY,
      m_y_tvalid => double_buffer_9_m_y_TVALID,
      s_aclk => s_aclk_0_0_1,
      s_aresetn => s_aresetn_0_0_1,
      s_y_tdata(63 downto 0) => axi_demux_2x1_09_M_AXIS_00_TDATA(63 downto 0),
      s_y_tlast => axi_demux_2x1_09_M_AXIS_00_TLAST,
      s_y_tready => axi_demux_2x1_09_M_AXIS_00_TREADY,
      s_y_tvalid => axi_demux_2x1_09_M_AXIS_00_TVALID,
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
      Dout(0) => xlslice_11_Dout(0)
    );
xlslice_12: component slice_agent_xlslice_2_9
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_12_Dout(0)
    );
xlslice_13: component slice_agent_xlslice_2_10
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_13_Dout(0)
    );
xlslice_2: component slice_agent_xlslice_1_0
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_2_Dout(0)
    );
xlslice_3: component slice_agent_xlslice_2_0
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_3_Dout(0)
    );
xlslice_4: component slice_agent_xlslice_2_1
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_4_Dout(0)
    );
xlslice_5: component slice_agent_xlslice_2_2
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_5_Dout(0)
    );
xlslice_6: component slice_agent_xlslice_2_3
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_6_Dout(0)
    );
xlslice_7: component slice_agent_xlslice_2_4
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_7_Dout(0)
    );
xlslice_8: component slice_agent_xlslice_2_5
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_8_Dout(0)
    );
xlslice_9: component slice_agent_xlslice_2_6
     port map (
      Din(13 downto 0) => Din_0_1(13 downto 0),
      Dout(0) => xlslice_9_Dout(0)
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of slice_agent : entity is "slice_agent,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=slice_agent,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=105,numReposBlks=90,numNonXlnxBlks=0,numHierBlks=15,maxHierDepth=2,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=3,da_clkrst_cnt=14,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of slice_agent : entity is "slice_agent.hwdef";
end slice_agent;

architecture STRUCTURE of slice_agent is
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
  component slice_agent_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component slice_agent_xlconstant_0_0;
  component slice_agent_sched_procv2_1_0 is
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
    stats : out STD_LOGIC;
    s_start_0 : in STD_LOGIC;
    s_enSymb_0 : out STD_LOGIC_VECTOR ( 13 downto 0 );
    cfg_maxPRBPkt : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dbg_proc_begin : out STD_LOGIC;
    dbg_proc_end : out STD_LOGIC;
    dbg_proc_ecpriId : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component slice_agent_sched_procv2_1_0;
  component slice_agent_sched_proc_t2_0_0 is
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
    stats : out STD_LOGIC;
    swap : in STD_LOGIC;
    s_enSymb_0 : out STD_LOGIC_VECTOR ( 13 downto 0 );
    cfg_maxPRBPkt : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dbg_proc_begin : out STD_LOGIC;
    dbg_proc_end : out STD_LOGIC;
    dbg_proc_ecpriId : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component slice_agent_sched_proc_t2_0_0;
  signal Buffers_M_AXIS_00_0_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal Buffers_M_AXIS_00_0_TLAST : STD_LOGIC;
  signal Buffers_M_AXIS_00_0_TREADY : STD_LOGIC;
  signal Buffers_M_AXIS_00_0_TVALID : STD_LOGIC;
  signal Buffers_empty_0 : STD_LOGIC;
  signal Din_0_1 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal ONE_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal SLICEN1_AXIS_1_TDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal SLICEN1_AXIS_1_TLAST : STD_LOGIC;
  signal SLICEN1_AXIS_1_TREADY : STD_LOGIC;
  signal SLICEN1_AXIS_1_TVALID : STD_LOGIC;
  signal SLICEN_AXIS_1_TDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal SLICEN_AXIS_1_TLAST : STD_LOGIC;
  signal SLICEN_AXIS_1_TREADY : STD_LOGIC;
  signal SLICEN_AXIS_1_TVALID : STD_LOGIC;
  signal cfg_maxPRBPkt_0_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal nxt_frameId_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal nxt_slotID_1 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal nxt_subframeID_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s_aclk_0_0_1 : STD_LOGIC;
  signal s_aresetn_0_0_1 : STD_LOGIC;
  signal sched_proc_t2_0_M_AXIS_0_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal sched_proc_t2_0_M_AXIS_0_TLAST : STD_LOGIC;
  signal sched_proc_t2_0_M_AXIS_0_TREADY : STD_LOGIC;
  signal sched_proc_t2_0_M_AXIS_0_TVALID : STD_LOGIC;
  signal sched_proc_t2_0_dbg_proc_begin : STD_LOGIC;
  signal sched_proc_t2_0_dbg_proc_ecpriId : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sched_proc_t2_0_dbg_proc_end : STD_LOGIC;
  signal sched_proc_t2_0_s_enSymb_0 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal sched_procv2_1_M_AXIS_0_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal sched_procv2_1_M_AXIS_0_TLAST : STD_LOGIC;
  signal sched_procv2_1_M_AXIS_0_TREADY : STD_LOGIC;
  signal sched_procv2_1_M_AXIS_0_TVALID : STD_LOGIC;
  signal sched_procv2_1_dbg_proc_begin : STD_LOGIC;
  signal sched_procv2_1_dbg_proc_ecpriId : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sched_procv2_1_dbg_proc_end : STD_LOGIC;
  signal sched_procv2_1_s_enSymb_0 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal sel_0_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal sel_1 : STD_LOGIC;
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
  signal NLW_sched_proc_t2_0_stats_UNCONNECTED : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of M_AXIS_00_0_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_00_0 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_00_0_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_00_0 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_00_0_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_00_0 TVALID";
  attribute X_INTERFACE_INFO of SLICEN1_AXIS_tlast : signal is "xilinx.com:interface:axis:1.0 SLICEN1_AXIS TLAST";
  attribute X_INTERFACE_INFO of SLICEN1_AXIS_tready : signal is "xilinx.com:interface:axis:1.0 SLICEN1_AXIS TREADY";
  attribute X_INTERFACE_INFO of SLICEN1_AXIS_tvalid : signal is "xilinx.com:interface:axis:1.0 SLICEN1_AXIS TVALID";
  attribute X_INTERFACE_INFO of SLICEN_AXIS_tlast : signal is "xilinx.com:interface:axis:1.0 SLICEN_AXIS TLAST";
  attribute X_INTERFACE_INFO of SLICEN_AXIS_tready : signal is "xilinx.com:interface:axis:1.0 SLICEN_AXIS TREADY";
  attribute X_INTERFACE_INFO of SLICEN_AXIS_tvalid : signal is "xilinx.com:interface:axis:1.0 SLICEN_AXIS TVALID";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF SLICEN_AXIS:SLICEN1_AXIS:M_AXIS_00_0, ASSOCIATED_RESET rstn, CLK_DOMAIN slice_agent_s_aclk_0_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of rstn : signal is "xilinx.com:signal:reset:1.0 RST.RSTN RST";
  attribute X_INTERFACE_PARAMETER of rstn : signal is "XIL_INTERFACENAME RST.RSTN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of M_AXIS_00_0_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_00_0 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_00_0_tdata : signal is "XIL_INTERFACENAME M_AXIS_00_0, CLK_DOMAIN slice_agent_s_aclk_0_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of SLICEN1_AXIS_tdata : signal is "xilinx.com:interface:axis:1.0 SLICEN1_AXIS TDATA";
  attribute X_INTERFACE_PARAMETER of SLICEN1_AXIS_tdata : signal is "XIL_INTERFACENAME SLICEN1_AXIS, CLK_DOMAIN slice_agent_s_aclk_0_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of SLICEN_AXIS_tdata : signal is "xilinx.com:interface:axis:1.0 SLICEN_AXIS TDATA";
  attribute X_INTERFACE_PARAMETER of SLICEN_AXIS_tdata : signal is "XIL_INTERFACENAME SLICEN_AXIS, CLK_DOMAIN slice_agent_s_aclk_0_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
begin
  Buffers_M_AXIS_00_0_TREADY <= M_AXIS_00_0_tready;
  Din_0_1(13 downto 0) <= ejectBufs(13 downto 0);
  M_AXIS_00_0_tdata(63 downto 0) <= Buffers_M_AXIS_00_0_TDATA(63 downto 0);
  M_AXIS_00_0_tlast <= Buffers_M_AXIS_00_0_TLAST;
  M_AXIS_00_0_tvalid <= Buffers_M_AXIS_00_0_TVALID;
  SLICEN1_AXIS_1_TDATA(127 downto 0) <= SLICEN1_AXIS_tdata(127 downto 0);
  SLICEN1_AXIS_1_TLAST <= SLICEN1_AXIS_tlast;
  SLICEN1_AXIS_1_TVALID <= SLICEN1_AXIS_tvalid;
  SLICEN1_AXIS_tready <= SLICEN1_AXIS_1_TREADY;
  SLICEN_AXIS_1_TDATA(127 downto 0) <= SLICEN_AXIS_tdata(127 downto 0);
  SLICEN_AXIS_1_TLAST <= SLICEN_AXIS_tlast;
  SLICEN_AXIS_1_TVALID <= SLICEN_AXIS_tvalid;
  SLICEN_AXIS_tready <= SLICEN_AXIS_1_TREADY;
  cfg_maxPRBPkt_0_1(15 downto 0) <= cfg_maxPRBPkt(15 downto 0);
  dbg_proc_begin_n <= sched_procv2_1_dbg_proc_begin;
  dbg_proc_begin_n1 <= sched_proc_t2_0_dbg_proc_begin;
  dbg_proc_ecpriId_n(15 downto 0) <= sched_procv2_1_dbg_proc_ecpriId(15 downto 0);
  dbg_proc_ecpriId_n1(15 downto 0) <= sched_proc_t2_0_dbg_proc_ecpriId(15 downto 0);
  dbg_proc_end_n <= sched_procv2_1_dbg_proc_end;
  dbg_proc_end_n1 <= sched_proc_t2_0_dbg_proc_end;
  empty_0 <= Buffers_empty_0;
  nxt_frameId_1(7 downto 0) <= nxt_frameId(7 downto 0);
  nxt_slotID_1(5 downto 0) <= nxt_slotID(5 downto 0);
  nxt_subframeID_1(3 downto 0) <= nxt_subframeID(3 downto 0);
  s_aclk_0_0_1 <= clk;
  s_aresetn_0_0_1 <= rstn;
  sel_0_1(3 downto 0) <= sel(3 downto 0);
  swap_0_1 <= swap;
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
      sel(0) => sel_1,
      sel_0(3 downto 0) => sel_0_1(3 downto 0),
      swap => swap_0_1
    );
ONE: component slice_agent_xlconstant_0_0
     port map (
      dout(0) => ONE_dout(0)
    );
sched_proc_t2_0: component slice_agent_sched_proc_t2_0_0
     port map (
      M_AXIS_0_tdata(63 downto 0) => sched_proc_t2_0_M_AXIS_0_TDATA(63 downto 0),
      M_AXIS_0_tlast => sched_proc_t2_0_M_AXIS_0_TLAST,
      M_AXIS_0_tready => sched_proc_t2_0_M_AXIS_0_TREADY,
      M_AXIS_0_tvalid => sched_proc_t2_0_M_AXIS_0_TVALID,
      S_AXIS_0_tdata(127 downto 0) => SLICEN1_AXIS_1_TDATA(127 downto 0),
      S_AXIS_0_tlast => SLICEN1_AXIS_1_TLAST,
      S_AXIS_0_tready => SLICEN1_AXIS_1_TREADY,
      S_AXIS_0_tvalid => SLICEN1_AXIS_1_TVALID,
      c_frameId(7 downto 0) => nxt_frameId_1(7 downto 0),
      c_slotID(5 downto 0) => nxt_slotID_1(5 downto 0),
      c_subframeID(3 downto 0) => nxt_subframeID_1(3 downto 0),
      cfg_maxPRBPkt(15 downto 0) => cfg_maxPRBPkt_0_1(15 downto 0),
      clk => s_aclk_0_0_1,
      dbg_proc_begin => sched_proc_t2_0_dbg_proc_begin,
      dbg_proc_ecpriId(15 downto 0) => sched_proc_t2_0_dbg_proc_ecpriId(15 downto 0),
      dbg_proc_end => sched_proc_t2_0_dbg_proc_end,
      resetn => s_aresetn_0_0_1,
      s_enSymb_0(13 downto 0) => sched_proc_t2_0_s_enSymb_0(13 downto 0),
      stats => NLW_sched_proc_t2_0_stats_UNCONNECTED,
      swap => swap_0_1
    );
sched_procv2_1: component slice_agent_sched_procv2_1_0
     port map (
      M_AXIS_0_tdata(63 downto 0) => sched_procv2_1_M_AXIS_0_TDATA(63 downto 0),
      M_AXIS_0_tlast => sched_procv2_1_M_AXIS_0_TLAST,
      M_AXIS_0_tready => sched_procv2_1_M_AXIS_0_TREADY,
      M_AXIS_0_tvalid => sched_procv2_1_M_AXIS_0_TVALID,
      S_AXIS_0_tdata(127 downto 0) => SLICEN_AXIS_1_TDATA(127 downto 0),
      S_AXIS_0_tlast => SLICEN_AXIS_1_TLAST,
      S_AXIS_0_tready => SLICEN_AXIS_1_TREADY,
      S_AXIS_0_tvalid => SLICEN_AXIS_1_TVALID,
      c_frameId(7 downto 0) => nxt_frameId_1(7 downto 0),
      c_slotID(5 downto 0) => nxt_slotID_1(5 downto 0),
      c_subframeID(3 downto 0) => nxt_subframeID_1(3 downto 0),
      cfg_maxPRBPkt(15 downto 0) => cfg_maxPRBPkt_0_1(15 downto 0),
      clk => s_aclk_0_0_1,
      dbg_proc_begin => sched_procv2_1_dbg_proc_begin,
      dbg_proc_ecpriId(15 downto 0) => sched_procv2_1_dbg_proc_ecpriId(15 downto 0),
      dbg_proc_end => sched_procv2_1_dbg_proc_end,
      resetn => s_aresetn_0_0_1,
      s_enSymb_0(13 downto 0) => sched_procv2_1_s_enSymb_0(13 downto 0),
      s_start_0 => ONE_dout(0),
      stats => sel_1
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
      Rx_AXIS_0_00_tdata(63 downto 0) => sched_procv2_1_M_AXIS_0_TDATA(63 downto 0),
      Rx_AXIS_0_00_tlast => sched_procv2_1_M_AXIS_0_TLAST,
      Rx_AXIS_0_00_tready => sched_procv2_1_M_AXIS_0_TREADY,
      Rx_AXIS_0_00_tvalid => sched_procv2_1_M_AXIS_0_TVALID,
      clk => s_aclk_0_0_1,
      rstn => s_aresetn_0_0_1,
      symbEn_0(13 downto 0) => sched_procv2_1_s_enSymb_0(13 downto 0)
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
      Rx_AXIS_0_00_tdata(63 downto 0) => sched_proc_t2_0_M_AXIS_0_TDATA(63 downto 0),
      Rx_AXIS_0_00_tlast => sched_proc_t2_0_M_AXIS_0_TLAST,
      Rx_AXIS_0_00_tready => sched_proc_t2_0_M_AXIS_0_TREADY,
      Rx_AXIS_0_00_tvalid => sched_proc_t2_0_M_AXIS_0_TVALID,
      clk => s_aclk_0_0_1,
      rstn => s_aresetn_0_0_1,
      symbEn_0(13 downto 0) => sched_proc_t2_0_s_enSymb_0(13 downto 0)
    );
end STRUCTURE;
