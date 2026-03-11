--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Wed Mar 27 00:15:53 2024
--Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
--Command     : generate_target schedProc.bd
--Design      : schedProc
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity schedProc is
  port (
    A_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    M_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    M_AXIS_0_tlast : out STD_LOGIC;
    M_AXIS_0_tready : in STD_LOGIC;
    M_AXIS_0_tvalid : out STD_LOGIC;
    P_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    reset : in STD_LOGIC;
    s_aclk_0 : in STD_LOGIC;
    s_aresetn_0 : in STD_LOGIC;
    src_0_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    src_0_tlast : in STD_LOGIC;
    src_0_tready : out STD_LOGIC;
    src_0_tvalid : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of schedProc : entity is "schedProc,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=schedProc,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of schedProc : entity is "schedProc.hwdef";
end schedProc;

architecture STRUCTURE of schedProc is
  component schedProc_fifo_generator_0_0 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component schedProc_fifo_generator_0_0;
  component schedProc_mult_gen_0_0 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B : in STD_LOGIC_VECTOR ( 7 downto 0 );
    P : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component schedProc_mult_gen_0_0;
  signal A_0_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal B_0_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal fifo_generator_0_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal fifo_generator_0_M_AXIS_TLAST : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_0_M_AXIS_TVALID : STD_LOGIC;
  signal mult_gen_0_P : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal s_aclk_0_1 : STD_LOGIC;
  signal s_aresetn_0_1 : STD_LOGIC;
  signal src_0_1_TDATA : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal src_0_1_TLAST : STD_LOGIC;
  signal src_0_1_TREADY : STD_LOGIC;
  signal src_0_1_TVALID : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of M_AXIS_0_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_0_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0 TVALID";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 RST.RESET RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of s_aclk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.S_ACLK_0 CLK";
  attribute X_INTERFACE_PARAMETER of s_aclk_0 : signal is "XIL_INTERFACENAME CLK.S_ACLK_0, ASSOCIATED_BUSIF M_AXIS_0:src_0, ASSOCIATED_RESET s_aresetn_0, CLK_DOMAIN schedProc_s_aclk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of s_aresetn_0 : signal is "xilinx.com:signal:reset:1.0 RST.S_ARESETN_0 RST";
  attribute X_INTERFACE_PARAMETER of s_aresetn_0 : signal is "XIL_INTERFACENAME RST.S_ARESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of src_0_tlast : signal is "xilinx.com:interface:axis:1.0 src_0 TLAST";
  attribute X_INTERFACE_INFO of src_0_tready : signal is "xilinx.com:interface:axis:1.0 src_0 TREADY";
  attribute X_INTERFACE_INFO of src_0_tvalid : signal is "xilinx.com:interface:axis:1.0 src_0 TVALID";
  attribute X_INTERFACE_INFO of A_0 : signal is "xilinx.com:signal:data:1.0 DATA.A_0 DATA";
  attribute X_INTERFACE_PARAMETER of A_0 : signal is "XIL_INTERFACENAME DATA.A_0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of B_0 : signal is "xilinx.com:signal:data:1.0 DATA.B_0 DATA";
  attribute X_INTERFACE_PARAMETER of B_0 : signal is "XIL_INTERFACENAME DATA.B_0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of M_AXIS_0_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_tdata : signal is "XIL_INTERFACENAME M_AXIS_0, CLK_DOMAIN schedProc_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of P_0 : signal is "xilinx.com:signal:data:1.0 DATA.P_0 DATA";
  attribute X_INTERFACE_PARAMETER of P_0 : signal is "XIL_INTERFACENAME DATA.P_0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value FALSE}}}} DATA_WIDTH 16}";
  attribute X_INTERFACE_INFO of src_0_tdata : signal is "xilinx.com:interface:axis:1.0 src_0 TDATA";
  attribute X_INTERFACE_PARAMETER of src_0_tdata : signal is "XIL_INTERFACENAME src_0, CLK_DOMAIN schedProc_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
begin
  A_0_1(7 downto 0) <= A_0(7 downto 0);
  B_0_1(7 downto 0) <= B_0(7 downto 0);
  M_AXIS_0_tdata(127 downto 0) <= fifo_generator_0_M_AXIS_TDATA(127 downto 0);
  M_AXIS_0_tlast <= fifo_generator_0_M_AXIS_TLAST;
  M_AXIS_0_tvalid <= fifo_generator_0_M_AXIS_TVALID;
  P_0(15 downto 0) <= mult_gen_0_P(15 downto 0);
  fifo_generator_0_M_AXIS_TREADY <= M_AXIS_0_tready;
  s_aclk_0_1 <= s_aclk_0;
  s_aresetn_0_1 <= s_aresetn_0;
  src_0_1_TDATA(127 downto 0) <= src_0_tdata(127 downto 0);
  src_0_1_TLAST <= src_0_tlast;
  src_0_1_TVALID <= src_0_tvalid;
  src_0_tready <= src_0_1_TREADY;
fifo_generator_0: component schedProc_fifo_generator_0_0
     port map (
      m_axis_tdata(127 downto 0) => fifo_generator_0_M_AXIS_TDATA(127 downto 0),
      m_axis_tlast => fifo_generator_0_M_AXIS_TLAST,
      m_axis_tready => fifo_generator_0_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_0_M_AXIS_TVALID,
      s_aclk => s_aclk_0_1,
      s_aresetn => s_aresetn_0_1,
      s_axis_tdata(127 downto 0) => src_0_1_TDATA(127 downto 0),
      s_axis_tlast => src_0_1_TLAST,
      s_axis_tready => src_0_1_TREADY,
      s_axis_tvalid => src_0_1_TVALID
    );
mult_gen_0: component schedProc_mult_gen_0_0
     port map (
      A(7 downto 0) => A_0_1(7 downto 0),
      B(7 downto 0) => B_0_1(7 downto 0),
      CLK => s_aclk_0_1,
      P(15 downto 0) => mult_gen_0_P(15 downto 0)
    );
end STRUCTURE;
