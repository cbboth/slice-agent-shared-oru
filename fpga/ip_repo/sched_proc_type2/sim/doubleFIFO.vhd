--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Tue Jun  4 21:31:02 2024
--Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
--Command     : generate_target doubleFIFO.bd
--Design      : doubleFIFO
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity doubleFIFO is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of doubleFIFO : entity is "doubleFIFO,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=doubleFIFO,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of doubleFIFO : entity is "doubleFIFO.hwdef";
end doubleFIFO;

architecture STRUCTURE of doubleFIFO is
  component doubleFIFO_fifo_generator_0_0 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  end component doubleFIFO_fifo_generator_0_0;
  component doubleFIFO_fifo_0_0 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  end component doubleFIFO_fifo_0_0;
  component doubleFIFO_c_addsub_0_0 is
  port (
    A : in STD_LOGIC_VECTOR ( 10 downto 0 );
    B : in STD_LOGIC_VECTOR ( 10 downto 0 );
    S : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component doubleFIFO_c_addsub_0_0;
  signal S_AXIS_0_1_TDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal S_AXIS_0_1_TREADY : STD_LOGIC;
  signal S_AXIS_0_1_TVALID : STD_LOGIC;
  signal S_AXIS_1_1_TDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal S_AXIS_1_1_TREADY : STD_LOGIC;
  signal S_AXIS_1_1_TVALID : STD_LOGIC;
  signal c_addsub_0_S : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal fifo_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal fifo_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_0_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_0_axis_data_count : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal fifo_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal fifo_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_1_M_AXIS_TVALID : STD_LOGIC;
  signal fifo_1_axis_data_count : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal s_aclk_0_1 : STD_LOGIC;
  signal s_aresetn_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of M_AXIS_0_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0 TVALID";
  attribute X_INTERFACE_INFO of M_AXIS_1_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_1 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_1_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_1 TVALID";
  attribute X_INTERFACE_INFO of S_AXIS_0_tready : signal is "xilinx.com:interface:axis:1.0 S_AXIS_0 TREADY";
  attribute X_INTERFACE_INFO of S_AXIS_0_tvalid : signal is "xilinx.com:interface:axis:1.0 S_AXIS_0 TVALID";
  attribute X_INTERFACE_INFO of S_AXIS_1_tready : signal is "xilinx.com:interface:axis:1.0 S_AXIS_1 TREADY";
  attribute X_INTERFACE_INFO of S_AXIS_1_tvalid : signal is "xilinx.com:interface:axis:1.0 S_AXIS_1 TVALID";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF S_AXIS_0:S_AXIS_1:M_AXIS_0:M_AXIS_1, ASSOCIATED_RESET rstn, CLK_DOMAIN doubleFIFO_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of rstn : signal is "xilinx.com:signal:reset:1.0 RST.RSTN RST";
  attribute X_INTERFACE_PARAMETER of rstn : signal is "XIL_INTERFACENAME RST.RSTN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of M_AXIS_0_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_tdata : signal is "XIL_INTERFACENAME M_AXIS_0, CLK_DOMAIN doubleFIFO_clk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXIS_1_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_1 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_1_tdata : signal is "XIL_INTERFACENAME M_AXIS_1, CLK_DOMAIN doubleFIFO_clk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of S_AXIS_0_tdata : signal is "xilinx.com:interface:axis:1.0 S_AXIS_0 TDATA";
  attribute X_INTERFACE_PARAMETER of S_AXIS_0_tdata : signal is "XIL_INTERFACENAME S_AXIS_0, CLK_DOMAIN doubleFIFO_clk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of S_AXIS_1_tdata : signal is "xilinx.com:interface:axis:1.0 S_AXIS_1 TDATA";
  attribute X_INTERFACE_PARAMETER of S_AXIS_1_tdata : signal is "XIL_INTERFACENAME S_AXIS_1, CLK_DOMAIN doubleFIFO_clk, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of fifo_cnt : signal is "xilinx.com:signal:data:1.0 DATA.FIFO_CNT DATA";
  attribute X_INTERFACE_PARAMETER of fifo_cnt : signal is "XIL_INTERFACENAME DATA.FIFO_CNT, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 12} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value FALSE}}}} DATA_WIDTH 12}";
begin
  M_AXIS_0_tdata(127 downto 0) <= fifo_0_M_AXIS_TDATA(127 downto 0);
  M_AXIS_0_tvalid <= fifo_0_M_AXIS_TVALID;
  M_AXIS_1_tdata(127 downto 0) <= fifo_1_M_AXIS_TDATA(127 downto 0);
  M_AXIS_1_tvalid <= fifo_1_M_AXIS_TVALID;
  S_AXIS_0_1_TDATA(127 downto 0) <= S_AXIS_0_tdata(127 downto 0);
  S_AXIS_0_1_TVALID <= S_AXIS_0_tvalid;
  S_AXIS_0_tready <= S_AXIS_0_1_TREADY;
  S_AXIS_1_1_TDATA(127 downto 0) <= S_AXIS_1_tdata(127 downto 0);
  S_AXIS_1_1_TVALID <= S_AXIS_1_tvalid;
  S_AXIS_1_tready <= S_AXIS_1_1_TREADY;
  fifo_0_M_AXIS_TREADY <= M_AXIS_0_tready;
  fifo_1_M_AXIS_TREADY <= M_AXIS_1_tready;
  fifo_cnt(11 downto 0) <= c_addsub_0_S(11 downto 0);
  s_aclk_0_1 <= clk;
  s_aresetn_0_1 <= rstn;
c_addsub_0: component doubleFIFO_c_addsub_0_0
     port map (
      A(10 downto 0) => fifo_0_axis_data_count(10 downto 0),
      B(10 downto 0) => fifo_1_axis_data_count(10 downto 0),
      S(11 downto 0) => c_addsub_0_S(11 downto 0)
    );
fifo_0: component doubleFIFO_fifo_generator_0_0
     port map (
      axis_data_count(10 downto 0) => fifo_0_axis_data_count(10 downto 0),
      m_axis_tdata(127 downto 0) => fifo_0_M_AXIS_TDATA(127 downto 0),
      m_axis_tready => fifo_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_1,
      s_aresetn => s_aresetn_0_1,
      s_axis_tdata(127 downto 0) => S_AXIS_0_1_TDATA(127 downto 0),
      s_axis_tready => S_AXIS_0_1_TREADY,
      s_axis_tvalid => S_AXIS_0_1_TVALID
    );
fifo_1: component doubleFIFO_fifo_0_0
     port map (
      axis_data_count(10 downto 0) => fifo_1_axis_data_count(10 downto 0),
      m_axis_tdata(127 downto 0) => fifo_1_M_AXIS_TDATA(127 downto 0),
      m_axis_tready => fifo_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_1,
      s_aresetn => s_aresetn_0_1,
      s_axis_tdata(127 downto 0) => S_AXIS_1_1_TDATA(127 downto 0),
      s_axis_tready => S_AXIS_1_1_TREADY,
      s_axis_tvalid => S_AXIS_1_1_TVALID
    );
end STRUCTURE;
