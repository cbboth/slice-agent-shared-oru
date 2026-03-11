--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Tue Apr  9 22:10:40 2024
--Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
--Command     : generate_target fifo.bd
--Design      : fifo
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of fifo : entity is "fifo,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=fifo,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of fifo : entity is "fifo.hwdef";
end fifo;

architecture STRUCTURE of fifo is
  component fifo_fifo_generator_0_1 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  end component fifo_fifo_generator_0_1;
  signal S_AXIS_0_2_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal S_AXIS_0_2_TREADY : STD_LOGIC;
  signal S_AXIS_0_2_TVALID : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal fifo_generator_1_M_AXIS_TREADY : STD_LOGIC;
  signal fifo_generator_1_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_1 : STD_LOGIC;
  signal s_aresetn_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of TX_M_AXIS_tready : signal is "xilinx.com:interface:axis:1.0 TX_M_AXIS ";
  attribute X_INTERFACE_INFO of TX_M_AXIS_tvalid : signal is "xilinx.com:interface:axis:1.0 TX_M_AXIS ";
  attribute X_INTERFACE_INFO of TX_S_AXIS_tready : signal is "xilinx.com:interface:axis:1.0 TX_S_AXIS ";
  attribute X_INTERFACE_INFO of TX_S_AXIS_tvalid : signal is "xilinx.com:interface:axis:1.0 TX_S_AXIS ";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF TX_M_AXIS:TX_S_AXIS, ASSOCIATED_RESET rstn, CLK_DOMAIN fifo_s_aclk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of rstn : signal is "xilinx.com:signal:reset:1.0 RST.RSTN RST";
  attribute X_INTERFACE_PARAMETER of rstn : signal is "XIL_INTERFACENAME RST.RSTN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of TX_M_AXIS_tdata : signal is "xilinx.com:interface:axis:1.0 TX_M_AXIS ";
  attribute X_INTERFACE_PARAMETER of TX_M_AXIS_tdata : signal is "XIL_INTERFACENAME TX_M_AXIS, CLK_DOMAIN fifo_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of TX_S_AXIS_tdata : signal is "xilinx.com:interface:axis:1.0 TX_S_AXIS ";
  attribute X_INTERFACE_PARAMETER of TX_S_AXIS_tdata : signal is "XIL_INTERFACENAME TX_S_AXIS, CLK_DOMAIN fifo_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
begin
  S_AXIS_0_2_TDATA(63 downto 0) <= TX_S_AXIS_tdata(63 downto 0);
  S_AXIS_0_2_TVALID <= TX_S_AXIS_tvalid;
  TX_M_AXIS_tdata(63 downto 0) <= fifo_generator_1_M_AXIS_TDATA(63 downto 0);
  TX_M_AXIS_tvalid <= fifo_generator_1_M_AXIS_TVALID;
  TX_S_AXIS_tready <= S_AXIS_0_2_TREADY;
  fifo_generator_1_M_AXIS_TREADY <= TX_M_AXIS_tready;
  s_aclk_0_1 <= clk;
  s_aresetn_0_1 <= rstn;
fifo_generator_1: component fifo_fifo_generator_0_1
     port map (
      m_axis_tdata(63 downto 0) => fifo_generator_1_M_AXIS_TDATA(63 downto 0),
      m_axis_tready => fifo_generator_1_M_AXIS_TREADY,
      m_axis_tvalid => fifo_generator_1_M_AXIS_TVALID,
      s_aclk => s_aclk_0_1,
      s_aresetn => s_aresetn_0_1,
      s_axis_tdata(63 downto 0) => S_AXIS_0_2_TDATA(63 downto 0),
      s_axis_tready => S_AXIS_0_2_TREADY,
      s_axis_tvalid => S_AXIS_0_2_TVALID
    );
end STRUCTURE;
