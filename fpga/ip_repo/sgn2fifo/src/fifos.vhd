--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Thu Apr 18 21:40:22 2024
--Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
--Command     : generate_target fifos.bd
--Design      : fifos
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifos is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of fifos : entity is "fifos,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=fifos,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=7,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of fifos : entity is "fifos.hwdef";
end fifos;

architecture STRUCTURE of fifos is
  component fifos_fifo_generator_0_0 is
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
  end component fifos_fifo_generator_0_0;
  component fifos_rec_fifo_0 is
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
  end component fifos_rec_fifo_0;
  component fifos_rec_fifo_1 is
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
  end component fifos_rec_fifo_1;
  component fifos_rec_fifo_2 is
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
  end component fifos_rec_fifo_2;
  component fifos_n1_start_0 is
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
  end component fifos_n1_start_0;
  component fifos_n1_end_0 is
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
  end component fifos_n1_end_0;
  component fifos_cap_start_0 is
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
  end component fifos_cap_start_0;
  signal S_AXIS_0_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal S_AXIS_0_1_TREADY : STD_LOGIC;
  signal S_AXIS_0_1_TVALID : STD_LOGIC;
  signal S_AXIS_1_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal S_AXIS_1_1_TREADY : STD_LOGIC;
  signal S_AXIS_1_1_TVALID : STD_LOGIC;
  signal S_AXIS_2_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal S_AXIS_2_1_TREADY : STD_LOGIC;
  signal S_AXIS_2_1_TVALID : STD_LOGIC;
  signal S_AXIS_3_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal S_AXIS_3_1_TREADY : STD_LOGIC;
  signal S_AXIS_3_1_TVALID : STD_LOGIC;
  signal S_AXIS_4_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal S_AXIS_4_1_TREADY : STD_LOGIC;
  signal S_AXIS_4_1_TVALID : STD_LOGIC;
  signal S_AXIS_5_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal S_AXIS_5_1_TREADY : STD_LOGIC;
  signal S_AXIS_5_1_TVALID : STD_LOGIC;
  signal S_AXIS_6_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal S_AXIS_6_1_TREADY : STD_LOGIC;
  signal S_AXIS_6_1_TVALID : STD_LOGIC;
  signal cap_end_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal cap_end_M_AXIS_TREADY : STD_LOGIC;
  signal cap_end_M_AXIS_TVALID : STD_LOGIC;
  signal cap_start_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal cap_start_M_AXIS_TREADY : STD_LOGIC;
  signal cap_start_M_AXIS_TVALID : STD_LOGIC;
  signal n1_end_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal n1_end_M_AXIS_TREADY : STD_LOGIC;
  signal n1_end_M_AXIS_TVALID : STD_LOGIC;
  signal n1_start_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal n1_start_M_AXIS_TREADY : STD_LOGIC;
  signal n1_start_M_AXIS_TVALID : STD_LOGIC;
  signal n_end_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal n_end_M_AXIS_TREADY : STD_LOGIC;
  signal n_end_M_AXIS_TVALID : STD_LOGIC;
  signal n_start_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal n_start_M_AXIS_TREADY : STD_LOGIC;
  signal n_start_M_AXIS_TVALID : STD_LOGIC;
  signal rec_fifo_M_AXIS_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal rec_fifo_M_AXIS_TREADY : STD_LOGIC;
  signal rec_fifo_M_AXIS_TVALID : STD_LOGIC;
  signal s_aclk_0_1 : STD_LOGIC;
  signal s_aresetn_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of cape_maxis_tready : signal is "xilinx.com:interface:axis:1.0 cape_maxis ";
  attribute X_INTERFACE_INFO of cape_maxis_tvalid : signal is "xilinx.com:interface:axis:1.0 cape_maxis ";
  attribute X_INTERFACE_INFO of cape_saxis_tready : signal is "xilinx.com:interface:axis:1.0 cape_saxis ";
  attribute X_INTERFACE_INFO of cape_saxis_tvalid : signal is "xilinx.com:interface:axis:1.0 cape_saxis ";
  attribute X_INTERFACE_INFO of caps_maxis_tready : signal is "xilinx.com:interface:axis:1.0 caps_maxis ";
  attribute X_INTERFACE_INFO of caps_maxis_tvalid : signal is "xilinx.com:interface:axis:1.0 caps_maxis ";
  attribute X_INTERFACE_INFO of caps_saxis_tready : signal is "xilinx.com:interface:axis:1.0 caps_saxis ";
  attribute X_INTERFACE_INFO of caps_saxis_tvalid : signal is "xilinx.com:interface:axis:1.0 caps_saxis ";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF rec_maxis:rec_saxis:ns_maxis:ns_saxis:caps_maxis:caps_saxis:cape_maxis:cape_saxis:n1e_maxis:n1e_saxis:n1s_maxis:n1s_saxis:ne_maxis:ne_saxis, ASSOCIATED_RESET rstn, CLK_DOMAIN fifos_s_aclk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of n1e_maxis_tready : signal is "xilinx.com:interface:axis:1.0 n1e_maxis ";
  attribute X_INTERFACE_INFO of n1e_maxis_tvalid : signal is "xilinx.com:interface:axis:1.0 n1e_maxis ";
  attribute X_INTERFACE_INFO of n1e_saxis_tready : signal is "xilinx.com:interface:axis:1.0 n1e_saxis ";
  attribute X_INTERFACE_INFO of n1e_saxis_tvalid : signal is "xilinx.com:interface:axis:1.0 n1e_saxis ";
  attribute X_INTERFACE_INFO of n1s_maxis_tready : signal is "xilinx.com:interface:axis:1.0 n1s_maxis ";
  attribute X_INTERFACE_INFO of n1s_maxis_tvalid : signal is "xilinx.com:interface:axis:1.0 n1s_maxis ";
  attribute X_INTERFACE_INFO of n1s_saxis_tready : signal is "xilinx.com:interface:axis:1.0 n1s_saxis ";
  attribute X_INTERFACE_INFO of n1s_saxis_tvalid : signal is "xilinx.com:interface:axis:1.0 n1s_saxis ";
  attribute X_INTERFACE_INFO of ne_maxis_tready : signal is "xilinx.com:interface:axis:1.0 ne_maxis ";
  attribute X_INTERFACE_INFO of ne_maxis_tvalid : signal is "xilinx.com:interface:axis:1.0 ne_maxis ";
  attribute X_INTERFACE_INFO of ne_saxis_tready : signal is "xilinx.com:interface:axis:1.0 ne_saxis ";
  attribute X_INTERFACE_INFO of ne_saxis_tvalid : signal is "xilinx.com:interface:axis:1.0 ne_saxis ";
  attribute X_INTERFACE_INFO of ns_maxis_tready : signal is "xilinx.com:interface:axis:1.0 ns_maxis ";
  attribute X_INTERFACE_INFO of ns_maxis_tvalid : signal is "xilinx.com:interface:axis:1.0 ns_maxis ";
  attribute X_INTERFACE_INFO of ns_saxis_tready : signal is "xilinx.com:interface:axis:1.0 ns_saxis ";
  attribute X_INTERFACE_INFO of ns_saxis_tvalid : signal is "xilinx.com:interface:axis:1.0 ns_saxis ";
  attribute X_INTERFACE_INFO of rec_maxis_tready : signal is "xilinx.com:interface:axis:1.0 rec_maxis ";
  attribute X_INTERFACE_INFO of rec_maxis_tvalid : signal is "xilinx.com:interface:axis:1.0 rec_maxis ";
  attribute X_INTERFACE_INFO of rec_saxis_tready : signal is "xilinx.com:interface:axis:1.0 rec_saxis ";
  attribute X_INTERFACE_INFO of rec_saxis_tvalid : signal is "xilinx.com:interface:axis:1.0 rec_saxis ";
  attribute X_INTERFACE_INFO of rstn : signal is "xilinx.com:signal:reset:1.0 RST.RSTN RST";
  attribute X_INTERFACE_PARAMETER of rstn : signal is "XIL_INTERFACENAME RST.RSTN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of cape_maxis_tdata : signal is "xilinx.com:interface:axis:1.0 cape_maxis ";
  attribute X_INTERFACE_PARAMETER of cape_maxis_tdata : signal is "XIL_INTERFACENAME cape_maxis, CLK_DOMAIN fifos_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of cape_saxis_tdata : signal is "xilinx.com:interface:axis:1.0 cape_saxis ";
  attribute X_INTERFACE_PARAMETER of cape_saxis_tdata : signal is "XIL_INTERFACENAME cape_saxis, CLK_DOMAIN fifos_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of caps_maxis_tdata : signal is "xilinx.com:interface:axis:1.0 caps_maxis ";
  attribute X_INTERFACE_PARAMETER of caps_maxis_tdata : signal is "XIL_INTERFACENAME caps_maxis, CLK_DOMAIN fifos_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of caps_saxis_tdata : signal is "xilinx.com:interface:axis:1.0 caps_saxis ";
  attribute X_INTERFACE_PARAMETER of caps_saxis_tdata : signal is "XIL_INTERFACENAME caps_saxis, CLK_DOMAIN fifos_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of n1e_maxis_tdata : signal is "xilinx.com:interface:axis:1.0 n1e_maxis ";
  attribute X_INTERFACE_PARAMETER of n1e_maxis_tdata : signal is "XIL_INTERFACENAME n1e_maxis, CLK_DOMAIN fifos_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of n1e_saxis_tdata : signal is "xilinx.com:interface:axis:1.0 n1e_saxis ";
  attribute X_INTERFACE_PARAMETER of n1e_saxis_tdata : signal is "XIL_INTERFACENAME n1e_saxis, CLK_DOMAIN fifos_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of n1s_maxis_tdata : signal is "xilinx.com:interface:axis:1.0 n1s_maxis ";
  attribute X_INTERFACE_PARAMETER of n1s_maxis_tdata : signal is "XIL_INTERFACENAME n1s_maxis, CLK_DOMAIN fifos_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of n1s_saxis_tdata : signal is "xilinx.com:interface:axis:1.0 n1s_saxis ";
  attribute X_INTERFACE_PARAMETER of n1s_saxis_tdata : signal is "XIL_INTERFACENAME n1s_saxis, CLK_DOMAIN fifos_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of ne_maxis_tdata : signal is "xilinx.com:interface:axis:1.0 ne_maxis ";
  attribute X_INTERFACE_PARAMETER of ne_maxis_tdata : signal is "XIL_INTERFACENAME ne_maxis, CLK_DOMAIN fifos_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of ne_saxis_tdata : signal is "xilinx.com:interface:axis:1.0 ne_saxis ";
  attribute X_INTERFACE_PARAMETER of ne_saxis_tdata : signal is "XIL_INTERFACENAME ne_saxis, CLK_DOMAIN fifos_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of ns_maxis_tdata : signal is "xilinx.com:interface:axis:1.0 ns_maxis ";
  attribute X_INTERFACE_PARAMETER of ns_maxis_tdata : signal is "XIL_INTERFACENAME ns_maxis, CLK_DOMAIN fifos_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of ns_saxis_tdata : signal is "xilinx.com:interface:axis:1.0 ns_saxis ";
  attribute X_INTERFACE_PARAMETER of ns_saxis_tdata : signal is "XIL_INTERFACENAME ns_saxis, CLK_DOMAIN fifos_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of rec_maxis_tdata : signal is "xilinx.com:interface:axis:1.0 rec_maxis ";
  attribute X_INTERFACE_PARAMETER of rec_maxis_tdata : signal is "XIL_INTERFACENAME rec_maxis, CLK_DOMAIN fifos_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of rec_saxis_tdata : signal is "xilinx.com:interface:axis:1.0 rec_saxis ";
  attribute X_INTERFACE_PARAMETER of rec_saxis_tdata : signal is "XIL_INTERFACENAME rec_saxis, CLK_DOMAIN fifos_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
begin
  S_AXIS_0_1_TDATA(63 downto 0) <= rec_saxis_tdata(63 downto 0);
  S_AXIS_0_1_TVALID <= rec_saxis_tvalid;
  S_AXIS_1_1_TDATA(63 downto 0) <= ns_saxis_tdata(63 downto 0);
  S_AXIS_1_1_TVALID <= ns_saxis_tvalid;
  S_AXIS_2_1_TDATA(63 downto 0) <= caps_saxis_tdata(63 downto 0);
  S_AXIS_2_1_TVALID <= caps_saxis_tvalid;
  S_AXIS_3_1_TDATA(63 downto 0) <= cape_saxis_tdata(63 downto 0);
  S_AXIS_3_1_TVALID <= cape_saxis_tvalid;
  S_AXIS_4_1_TDATA(63 downto 0) <= n1e_saxis_tdata(63 downto 0);
  S_AXIS_4_1_TVALID <= n1e_saxis_tvalid;
  S_AXIS_5_1_TDATA(63 downto 0) <= n1s_saxis_tdata(63 downto 0);
  S_AXIS_5_1_TVALID <= n1s_saxis_tvalid;
  S_AXIS_6_1_TDATA(63 downto 0) <= ne_saxis_tdata(63 downto 0);
  S_AXIS_6_1_TVALID <= ne_saxis_tvalid;
  cap_end_M_AXIS_TREADY <= cape_maxis_tready;
  cap_start_M_AXIS_TREADY <= caps_maxis_tready;
  cape_maxis_tdata(63 downto 0) <= cap_end_M_AXIS_TDATA(63 downto 0);
  cape_maxis_tvalid <= cap_end_M_AXIS_TVALID;
  cape_saxis_tready <= S_AXIS_3_1_TREADY;
  caps_maxis_tdata(63 downto 0) <= cap_start_M_AXIS_TDATA(63 downto 0);
  caps_maxis_tvalid <= cap_start_M_AXIS_TVALID;
  caps_saxis_tready <= S_AXIS_2_1_TREADY;
  n1_end_M_AXIS_TREADY <= n1e_maxis_tready;
  n1_start_M_AXIS_TREADY <= n1s_maxis_tready;
  n1e_maxis_tdata(63 downto 0) <= n1_end_M_AXIS_TDATA(63 downto 0);
  n1e_maxis_tvalid <= n1_end_M_AXIS_TVALID;
  n1e_saxis_tready <= S_AXIS_4_1_TREADY;
  n1s_maxis_tdata(63 downto 0) <= n1_start_M_AXIS_TDATA(63 downto 0);
  n1s_maxis_tvalid <= n1_start_M_AXIS_TVALID;
  n1s_saxis_tready <= S_AXIS_5_1_TREADY;
  n_end_M_AXIS_TREADY <= ne_maxis_tready;
  n_start_M_AXIS_TREADY <= ns_maxis_tready;
  ne_maxis_tdata(63 downto 0) <= n_end_M_AXIS_TDATA(63 downto 0);
  ne_maxis_tvalid <= n_end_M_AXIS_TVALID;
  ne_saxis_tready <= S_AXIS_6_1_TREADY;
  ns_maxis_tdata(63 downto 0) <= n_start_M_AXIS_TDATA(63 downto 0);
  ns_maxis_tvalid <= n_start_M_AXIS_TVALID;
  ns_saxis_tready <= S_AXIS_1_1_TREADY;
  rec_fifo_M_AXIS_TREADY <= rec_maxis_tready;
  rec_maxis_tdata(63 downto 0) <= rec_fifo_M_AXIS_TDATA(63 downto 0);
  rec_maxis_tvalid <= rec_fifo_M_AXIS_TVALID;
  rec_saxis_tready <= S_AXIS_0_1_TREADY;
  s_aclk_0_1 <= clk;
  s_aresetn_0_1 <= rstn;
cap_end: component fifos_cap_start_0
     port map (
      m_axis_tdata(63 downto 0) => cap_end_M_AXIS_TDATA(63 downto 0),
      m_axis_tready => cap_end_M_AXIS_TREADY,
      m_axis_tvalid => cap_end_M_AXIS_TVALID,
      s_aclk => s_aclk_0_1,
      s_aresetn => s_aresetn_0_1,
      s_axis_tdata(63 downto 0) => S_AXIS_3_1_TDATA(63 downto 0),
      s_axis_tready => S_AXIS_3_1_TREADY,
      s_axis_tvalid => S_AXIS_3_1_TVALID
    );
cap_start: component fifos_n1_end_0
     port map (
      m_axis_tdata(63 downto 0) => cap_start_M_AXIS_TDATA(63 downto 0),
      m_axis_tready => cap_start_M_AXIS_TREADY,
      m_axis_tvalid => cap_start_M_AXIS_TVALID,
      s_aclk => s_aclk_0_1,
      s_aresetn => s_aresetn_0_1,
      s_axis_tdata(63 downto 0) => S_AXIS_2_1_TDATA(63 downto 0),
      s_axis_tready => S_AXIS_2_1_TREADY,
      s_axis_tvalid => S_AXIS_2_1_TVALID
    );
n1_end: component fifos_n1_start_0
     port map (
      m_axis_tdata(63 downto 0) => n1_end_M_AXIS_TDATA(63 downto 0),
      m_axis_tready => n1_end_M_AXIS_TREADY,
      m_axis_tvalid => n1_end_M_AXIS_TVALID,
      s_aclk => s_aclk_0_1,
      s_aresetn => s_aresetn_0_1,
      s_axis_tdata(63 downto 0) => S_AXIS_4_1_TDATA(63 downto 0),
      s_axis_tready => S_AXIS_4_1_TREADY,
      s_axis_tvalid => S_AXIS_4_1_TVALID
    );
n1_start: component fifos_rec_fifo_2
     port map (
      m_axis_tdata(63 downto 0) => n1_start_M_AXIS_TDATA(63 downto 0),
      m_axis_tready => n1_start_M_AXIS_TREADY,
      m_axis_tvalid => n1_start_M_AXIS_TVALID,
      s_aclk => s_aclk_0_1,
      s_aresetn => s_aresetn_0_1,
      s_axis_tdata(63 downto 0) => S_AXIS_5_1_TDATA(63 downto 0),
      s_axis_tready => S_AXIS_5_1_TREADY,
      s_axis_tvalid => S_AXIS_5_1_TVALID
    );
n_end: component fifos_rec_fifo_1
     port map (
      m_axis_tdata(63 downto 0) => n_end_M_AXIS_TDATA(63 downto 0),
      m_axis_tready => n_end_M_AXIS_TREADY,
      m_axis_tvalid => n_end_M_AXIS_TVALID,
      s_aclk => s_aclk_0_1,
      s_aresetn => s_aresetn_0_1,
      s_axis_tdata(63 downto 0) => S_AXIS_6_1_TDATA(63 downto 0),
      s_axis_tready => S_AXIS_6_1_TREADY,
      s_axis_tvalid => S_AXIS_6_1_TVALID
    );
n_start: component fifos_rec_fifo_0
     port map (
      m_axis_tdata(63 downto 0) => n_start_M_AXIS_TDATA(63 downto 0),
      m_axis_tready => n_start_M_AXIS_TREADY,
      m_axis_tvalid => n_start_M_AXIS_TVALID,
      s_aclk => s_aclk_0_1,
      s_aresetn => s_aresetn_0_1,
      s_axis_tdata(63 downto 0) => S_AXIS_1_1_TDATA(63 downto 0),
      s_axis_tready => S_AXIS_1_1_TREADY,
      s_axis_tvalid => S_AXIS_1_1_TVALID
    );
rec_fifo: component fifos_fifo_generator_0_0
     port map (
      m_axis_tdata(63 downto 0) => rec_fifo_M_AXIS_TDATA(63 downto 0),
      m_axis_tready => rec_fifo_M_AXIS_TREADY,
      m_axis_tvalid => rec_fifo_M_AXIS_TVALID,
      s_aclk => s_aclk_0_1,
      s_aresetn => s_aresetn_0_1,
      s_axis_tdata(63 downto 0) => S_AXIS_0_1_TDATA(63 downto 0),
      s_axis_tready => S_AXIS_0_1_TREADY,
      s_axis_tvalid => S_AXIS_0_1_TVALID
    );
end STRUCTURE;
