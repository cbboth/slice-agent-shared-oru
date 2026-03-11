--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Tue Mar 26 00:16:50 2024
--Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
--Command     : generate_target symb_buffers.bd
--Design      : symb_buffers
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity symb_buffers is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of symb_buffers : entity is "symb_buffers,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=symb_buffers,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=13,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of symb_buffers : entity is "symb_buffers.hwdef";
end symb_buffers;

architecture STRUCTURE of symb_buffers is
  component symb_buffers_symb_mux_0_0 is
  port (
    Rx_AXIS_0_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    Rx_AXIS_0_tvalid : in STD_LOGIC;
    Rx_AXIS_0_tlast : in STD_LOGIC;
    Rx_AXIS_0_tready : out STD_LOGIC;
    Tx_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Tx_AXIS_00_tvalid : out STD_LOGIC;
    Tx_AXIS_00_tlast : out STD_LOGIC;
    Tx_AXIS_00_tready : in STD_LOGIC;
    Tx_AXIS_01_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Tx_AXIS_01_tvalid : out STD_LOGIC;
    Tx_AXIS_01_tlast : out STD_LOGIC;
    Tx_AXIS_01_tready : in STD_LOGIC;
    Tx_AXIS_02_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Tx_AXIS_02_tvalid : out STD_LOGIC;
    Tx_AXIS_02_tlast : out STD_LOGIC;
    Tx_AXIS_02_tready : in STD_LOGIC;
    Tx_AXIS_03_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Tx_AXIS_03_tvalid : out STD_LOGIC;
    Tx_AXIS_03_tlast : out STD_LOGIC;
    Tx_AXIS_03_tready : in STD_LOGIC;
    Tx_AXIS_04_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Tx_AXIS_04_tvalid : out STD_LOGIC;
    Tx_AXIS_04_tlast : out STD_LOGIC;
    Tx_AXIS_04_tready : in STD_LOGIC;
    Tx_AXIS_05_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Tx_AXIS_05_tvalid : out STD_LOGIC;
    Tx_AXIS_05_tlast : out STD_LOGIC;
    Tx_AXIS_05_tready : in STD_LOGIC;
    Tx_AXIS_06_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Tx_AXIS_06_tvalid : out STD_LOGIC;
    Tx_AXIS_06_tlast : out STD_LOGIC;
    Tx_AXIS_06_tready : in STD_LOGIC;
    Tx_AXIS_07_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Tx_AXIS_07_tvalid : out STD_LOGIC;
    Tx_AXIS_07_tlast : out STD_LOGIC;
    Tx_AXIS_07_tready : in STD_LOGIC;
    Tx_AXIS_08_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Tx_AXIS_08_tvalid : out STD_LOGIC;
    Tx_AXIS_08_tlast : out STD_LOGIC;
    Tx_AXIS_08_tready : in STD_LOGIC;
    Tx_AXIS_09_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Tx_AXIS_09_tvalid : out STD_LOGIC;
    Tx_AXIS_09_tlast : out STD_LOGIC;
    Tx_AXIS_09_tready : in STD_LOGIC;
    Tx_AXIS_10_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Tx_AXIS_10_tvalid : out STD_LOGIC;
    Tx_AXIS_10_tlast : out STD_LOGIC;
    Tx_AXIS_10_tready : in STD_LOGIC;
    Tx_AXIS_11_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Tx_AXIS_11_tvalid : out STD_LOGIC;
    Tx_AXIS_11_tlast : out STD_LOGIC;
    Tx_AXIS_11_tready : in STD_LOGIC;
    Tx_AXIS_12_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Tx_AXIS_12_tvalid : out STD_LOGIC;
    Tx_AXIS_12_tlast : out STD_LOGIC;
    Tx_AXIS_12_tready : in STD_LOGIC;
    Tx_AXIS_13_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    Tx_AXIS_13_tvalid : out STD_LOGIC;
    Tx_AXIS_13_tlast : out STD_LOGIC;
    Tx_AXIS_13_tready : in STD_LOGIC;
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    symbEn : in STD_LOGIC_VECTOR ( 13 downto 0 )
  );
  end component symb_buffers_symb_mux_0_0;
  signal Rx_AXIS_0_0_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal Rx_AXIS_0_0_1_TLAST : STD_LOGIC;
  signal Rx_AXIS_0_0_1_TREADY : STD_LOGIC;
  signal Rx_AXIS_0_0_1_TVALID : STD_LOGIC;
  signal s_aclk_0_1 : STD_LOGIC;
  signal s_aresetn_0_1 : STD_LOGIC;
  signal symbEn_0_1 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal symb_mux_0_Tx_AXIS_00_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_mux_0_Tx_AXIS_00_TLAST : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_00_TREADY : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_00_TVALID : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_01_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_mux_0_Tx_AXIS_01_TLAST : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_01_TREADY : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_01_TVALID : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_02_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_mux_0_Tx_AXIS_02_TLAST : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_02_TREADY : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_02_TVALID : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_03_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_mux_0_Tx_AXIS_03_TLAST : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_03_TREADY : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_03_TVALID : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_04_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_mux_0_Tx_AXIS_04_TLAST : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_04_TREADY : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_04_TVALID : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_05_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_mux_0_Tx_AXIS_05_TLAST : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_05_TREADY : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_05_TVALID : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_06_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_mux_0_Tx_AXIS_06_TLAST : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_06_TREADY : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_06_TVALID : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_07_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_mux_0_Tx_AXIS_07_TLAST : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_07_TREADY : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_07_TVALID : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_08_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_mux_0_Tx_AXIS_08_TLAST : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_08_TREADY : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_08_TVALID : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_09_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_mux_0_Tx_AXIS_09_TLAST : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_09_TREADY : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_09_TVALID : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_10_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_mux_0_Tx_AXIS_10_TLAST : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_10_TREADY : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_10_TVALID : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_11_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_mux_0_Tx_AXIS_11_TLAST : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_11_TREADY : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_11_TVALID : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_12_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_mux_0_Tx_AXIS_12_TLAST : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_12_TREADY : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_12_TVALID : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_13_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal symb_mux_0_Tx_AXIS_13_TLAST : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_13_TREADY : STD_LOGIC;
  signal symb_mux_0_Tx_AXIS_13_TVALID : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of M_AXIS_0_00_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_00 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_0_00_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_00 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_00_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_00 TVALID";
  attribute X_INTERFACE_INFO of M_AXIS_0_01_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_01 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_0_01_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_01 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_01_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_01 TVALID";
  attribute X_INTERFACE_INFO of M_AXIS_0_02_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_02 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_0_02_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_02 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_02_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_02 TVALID";
  attribute X_INTERFACE_INFO of M_AXIS_0_03_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_03 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_0_03_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_03 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_03_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_03 TVALID";
  attribute X_INTERFACE_INFO of M_AXIS_0_04_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_04 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_0_04_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_04 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_04_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_04 TVALID";
  attribute X_INTERFACE_INFO of M_AXIS_0_05_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_05 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_0_05_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_05 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_05_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_05 TVALID";
  attribute X_INTERFACE_INFO of M_AXIS_0_06_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_06 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_0_06_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_06 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_06_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_06 TVALID";
  attribute X_INTERFACE_INFO of M_AXIS_0_07_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_07 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_0_07_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_07 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_07_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_07 TVALID";
  attribute X_INTERFACE_INFO of M_AXIS_0_08_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_08 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_0_08_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_08 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_08_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_08 TVALID";
  attribute X_INTERFACE_INFO of M_AXIS_0_09_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_09 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_0_09_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_09 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_09_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_09 TVALID";
  attribute X_INTERFACE_INFO of M_AXIS_0_10_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_10 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_0_10_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_10 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_10_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_10 TVALID";
  attribute X_INTERFACE_INFO of M_AXIS_0_11_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_11 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_0_11_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_11 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_11_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_11 TVALID";
  attribute X_INTERFACE_INFO of M_AXIS_0_12_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_12 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_0_12_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_12 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_12_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_12 TVALID";
  attribute X_INTERFACE_INFO of M_AXIS_0_13_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_13 TLAST";
  attribute X_INTERFACE_INFO of M_AXIS_0_13_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_13 TREADY";
  attribute X_INTERFACE_INFO of M_AXIS_0_13_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_13 TVALID";
  attribute X_INTERFACE_INFO of Rx_AXIS_0_00_tlast : signal is "xilinx.com:interface:axis:1.0 Rx_AXIS_0_00 TLAST";
  attribute X_INTERFACE_INFO of Rx_AXIS_0_00_tready : signal is "xilinx.com:interface:axis:1.0 Rx_AXIS_0_00 TREADY";
  attribute X_INTERFACE_INFO of Rx_AXIS_0_00_tvalid : signal is "xilinx.com:interface:axis:1.0 Rx_AXIS_0_00 TVALID";
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF M_AXIS_0_00:M_AXIS_0_01:M_AXIS_0_02:M_AXIS_0_03:M_AXIS_0_04:M_AXIS_0_05:M_AXIS_0_06:M_AXIS_0_07:M_AXIS_0_08:M_AXIS_0_09:M_AXIS_0_10:M_AXIS_0_11:M_AXIS_0_12:M_AXIS_0_13:Rx_AXIS_0_00, ASSOCIATED_RESET rstn, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of rstn : signal is "xilinx.com:signal:reset:1.0 RST.RSTN RST";
  attribute X_INTERFACE_PARAMETER of rstn : signal is "XIL_INTERFACENAME RST.RSTN, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of M_AXIS_0_00_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_00 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_00_tdata : signal is "XIL_INTERFACENAME M_AXIS_0_00, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXIS_0_01_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_01 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_01_tdata : signal is "XIL_INTERFACENAME M_AXIS_0_01, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXIS_0_02_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_02 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_02_tdata : signal is "XIL_INTERFACENAME M_AXIS_0_02, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXIS_0_03_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_03 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_03_tdata : signal is "XIL_INTERFACENAME M_AXIS_0_03, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXIS_0_04_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_04 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_04_tdata : signal is "XIL_INTERFACENAME M_AXIS_0_04, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXIS_0_05_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_05 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_05_tdata : signal is "XIL_INTERFACENAME M_AXIS_0_05, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXIS_0_06_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_06 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_06_tdata : signal is "XIL_INTERFACENAME M_AXIS_0_06, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXIS_0_07_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_07 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_07_tdata : signal is "XIL_INTERFACENAME M_AXIS_0_07, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXIS_0_08_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_08 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_08_tdata : signal is "XIL_INTERFACENAME M_AXIS_0_08, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXIS_0_09_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_09 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_09_tdata : signal is "XIL_INTERFACENAME M_AXIS_0_09, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXIS_0_10_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_10 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_10_tdata : signal is "XIL_INTERFACENAME M_AXIS_0_10, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXIS_0_11_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_11 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_11_tdata : signal is "XIL_INTERFACENAME M_AXIS_0_11, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXIS_0_12_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_12 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_12_tdata : signal is "XIL_INTERFACENAME M_AXIS_0_12, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of M_AXIS_0_13_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS_0_13 TDATA";
  attribute X_INTERFACE_PARAMETER of M_AXIS_0_13_tdata : signal is "XIL_INTERFACENAME M_AXIS_0_13, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of Rx_AXIS_0_00_tdata : signal is "xilinx.com:interface:axis:1.0 Rx_AXIS_0_00 TDATA";
  attribute X_INTERFACE_PARAMETER of Rx_AXIS_0_00_tdata : signal is "XIL_INTERFACENAME Rx_AXIS_0_00, CLK_DOMAIN symb_buffers_s_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
begin
  M_AXIS_0_00_tdata(63 downto 0) <= symb_mux_0_Tx_AXIS_00_TDATA(63 downto 0);
  M_AXIS_0_00_tlast <= symb_mux_0_Tx_AXIS_00_TLAST;
  M_AXIS_0_00_tvalid <= symb_mux_0_Tx_AXIS_00_TVALID;
  M_AXIS_0_01_tdata(63 downto 0) <= symb_mux_0_Tx_AXIS_01_TDATA(63 downto 0);
  M_AXIS_0_01_tlast <= symb_mux_0_Tx_AXIS_01_TLAST;
  M_AXIS_0_01_tvalid <= symb_mux_0_Tx_AXIS_01_TVALID;
  M_AXIS_0_02_tdata(63 downto 0) <= symb_mux_0_Tx_AXIS_02_TDATA(63 downto 0);
  M_AXIS_0_02_tlast <= symb_mux_0_Tx_AXIS_02_TLAST;
  M_AXIS_0_02_tvalid <= symb_mux_0_Tx_AXIS_02_TVALID;
  M_AXIS_0_03_tdata(63 downto 0) <= symb_mux_0_Tx_AXIS_03_TDATA(63 downto 0);
  M_AXIS_0_03_tlast <= symb_mux_0_Tx_AXIS_03_TLAST;
  M_AXIS_0_03_tvalid <= symb_mux_0_Tx_AXIS_03_TVALID;
  M_AXIS_0_04_tdata(63 downto 0) <= symb_mux_0_Tx_AXIS_04_TDATA(63 downto 0);
  M_AXIS_0_04_tlast <= symb_mux_0_Tx_AXIS_04_TLAST;
  M_AXIS_0_04_tvalid <= symb_mux_0_Tx_AXIS_04_TVALID;
  M_AXIS_0_05_tdata(63 downto 0) <= symb_mux_0_Tx_AXIS_05_TDATA(63 downto 0);
  M_AXIS_0_05_tlast <= symb_mux_0_Tx_AXIS_05_TLAST;
  M_AXIS_0_05_tvalid <= symb_mux_0_Tx_AXIS_05_TVALID;
  M_AXIS_0_06_tdata(63 downto 0) <= symb_mux_0_Tx_AXIS_06_TDATA(63 downto 0);
  M_AXIS_0_06_tlast <= symb_mux_0_Tx_AXIS_06_TLAST;
  M_AXIS_0_06_tvalid <= symb_mux_0_Tx_AXIS_06_TVALID;
  M_AXIS_0_07_tdata(63 downto 0) <= symb_mux_0_Tx_AXIS_07_TDATA(63 downto 0);
  M_AXIS_0_07_tlast <= symb_mux_0_Tx_AXIS_07_TLAST;
  M_AXIS_0_07_tvalid <= symb_mux_0_Tx_AXIS_07_TVALID;
  M_AXIS_0_08_tdata(63 downto 0) <= symb_mux_0_Tx_AXIS_08_TDATA(63 downto 0);
  M_AXIS_0_08_tlast <= symb_mux_0_Tx_AXIS_08_TLAST;
  M_AXIS_0_08_tvalid <= symb_mux_0_Tx_AXIS_08_TVALID;
  M_AXIS_0_09_tdata(63 downto 0) <= symb_mux_0_Tx_AXIS_09_TDATA(63 downto 0);
  M_AXIS_0_09_tlast <= symb_mux_0_Tx_AXIS_09_TLAST;
  M_AXIS_0_09_tvalid <= symb_mux_0_Tx_AXIS_09_TVALID;
  M_AXIS_0_10_tdata(63 downto 0) <= symb_mux_0_Tx_AXIS_10_TDATA(63 downto 0);
  M_AXIS_0_10_tlast <= symb_mux_0_Tx_AXIS_10_TLAST;
  M_AXIS_0_10_tvalid <= symb_mux_0_Tx_AXIS_10_TVALID;
  M_AXIS_0_11_tdata(63 downto 0) <= symb_mux_0_Tx_AXIS_11_TDATA(63 downto 0);
  M_AXIS_0_11_tlast <= symb_mux_0_Tx_AXIS_11_TLAST;
  M_AXIS_0_11_tvalid <= symb_mux_0_Tx_AXIS_11_TVALID;
  M_AXIS_0_12_tdata(63 downto 0) <= symb_mux_0_Tx_AXIS_12_TDATA(63 downto 0);
  M_AXIS_0_12_tlast <= symb_mux_0_Tx_AXIS_12_TLAST;
  M_AXIS_0_12_tvalid <= symb_mux_0_Tx_AXIS_12_TVALID;
  M_AXIS_0_13_tdata(63 downto 0) <= symb_mux_0_Tx_AXIS_13_TDATA(63 downto 0);
  M_AXIS_0_13_tlast <= symb_mux_0_Tx_AXIS_13_TLAST;
  M_AXIS_0_13_tvalid <= symb_mux_0_Tx_AXIS_13_TVALID;
  Rx_AXIS_0_00_tready <= Rx_AXIS_0_0_1_TREADY;
  Rx_AXIS_0_0_1_TDATA(63 downto 0) <= Rx_AXIS_0_00_tdata(63 downto 0);
  Rx_AXIS_0_0_1_TLAST <= Rx_AXIS_0_00_tlast;
  Rx_AXIS_0_0_1_TVALID <= Rx_AXIS_0_00_tvalid;
  s_aclk_0_1 <= clk;
  s_aresetn_0_1 <= rstn;
  symbEn_0_1(13 downto 0) <= symbEn_0(13 downto 0);
  symb_mux_0_Tx_AXIS_00_TREADY <= M_AXIS_0_00_tready;
  symb_mux_0_Tx_AXIS_01_TREADY <= M_AXIS_0_01_tready;
  symb_mux_0_Tx_AXIS_02_TREADY <= M_AXIS_0_02_tready;
  symb_mux_0_Tx_AXIS_03_TREADY <= M_AXIS_0_03_tready;
  symb_mux_0_Tx_AXIS_04_TREADY <= M_AXIS_0_04_tready;
  symb_mux_0_Tx_AXIS_05_TREADY <= M_AXIS_0_05_tready;
  symb_mux_0_Tx_AXIS_06_TREADY <= M_AXIS_0_06_tready;
  symb_mux_0_Tx_AXIS_07_TREADY <= M_AXIS_0_07_tready;
  symb_mux_0_Tx_AXIS_08_TREADY <= M_AXIS_0_08_tready;
  symb_mux_0_Tx_AXIS_09_TREADY <= M_AXIS_0_09_tready;
  symb_mux_0_Tx_AXIS_10_TREADY <= M_AXIS_0_10_tready;
  symb_mux_0_Tx_AXIS_11_TREADY <= M_AXIS_0_11_tready;
  symb_mux_0_Tx_AXIS_12_TREADY <= M_AXIS_0_12_tready;
  symb_mux_0_Tx_AXIS_13_TREADY <= M_AXIS_0_13_tready;
symb_mux_0: component symb_buffers_symb_mux_0_0
     port map (
      Rx_AXIS_0_tdata(63 downto 0) => Rx_AXIS_0_0_1_TDATA(63 downto 0),
      Rx_AXIS_0_tlast => Rx_AXIS_0_0_1_TLAST,
      Rx_AXIS_0_tready => Rx_AXIS_0_0_1_TREADY,
      Rx_AXIS_0_tvalid => Rx_AXIS_0_0_1_TVALID,
      Tx_AXIS_00_tdata(63 downto 0) => symb_mux_0_Tx_AXIS_00_TDATA(63 downto 0),
      Tx_AXIS_00_tlast => symb_mux_0_Tx_AXIS_00_TLAST,
      Tx_AXIS_00_tready => symb_mux_0_Tx_AXIS_00_TREADY,
      Tx_AXIS_00_tvalid => symb_mux_0_Tx_AXIS_00_TVALID,
      Tx_AXIS_01_tdata(63 downto 0) => symb_mux_0_Tx_AXIS_01_TDATA(63 downto 0),
      Tx_AXIS_01_tlast => symb_mux_0_Tx_AXIS_01_TLAST,
      Tx_AXIS_01_tready => symb_mux_0_Tx_AXIS_01_TREADY,
      Tx_AXIS_01_tvalid => symb_mux_0_Tx_AXIS_01_TVALID,
      Tx_AXIS_02_tdata(63 downto 0) => symb_mux_0_Tx_AXIS_02_TDATA(63 downto 0),
      Tx_AXIS_02_tlast => symb_mux_0_Tx_AXIS_02_TLAST,
      Tx_AXIS_02_tready => symb_mux_0_Tx_AXIS_02_TREADY,
      Tx_AXIS_02_tvalid => symb_mux_0_Tx_AXIS_02_TVALID,
      Tx_AXIS_03_tdata(63 downto 0) => symb_mux_0_Tx_AXIS_03_TDATA(63 downto 0),
      Tx_AXIS_03_tlast => symb_mux_0_Tx_AXIS_03_TLAST,
      Tx_AXIS_03_tready => symb_mux_0_Tx_AXIS_03_TREADY,
      Tx_AXIS_03_tvalid => symb_mux_0_Tx_AXIS_03_TVALID,
      Tx_AXIS_04_tdata(63 downto 0) => symb_mux_0_Tx_AXIS_04_TDATA(63 downto 0),
      Tx_AXIS_04_tlast => symb_mux_0_Tx_AXIS_04_TLAST,
      Tx_AXIS_04_tready => symb_mux_0_Tx_AXIS_04_TREADY,
      Tx_AXIS_04_tvalid => symb_mux_0_Tx_AXIS_04_TVALID,
      Tx_AXIS_05_tdata(63 downto 0) => symb_mux_0_Tx_AXIS_05_TDATA(63 downto 0),
      Tx_AXIS_05_tlast => symb_mux_0_Tx_AXIS_05_TLAST,
      Tx_AXIS_05_tready => symb_mux_0_Tx_AXIS_05_TREADY,
      Tx_AXIS_05_tvalid => symb_mux_0_Tx_AXIS_05_TVALID,
      Tx_AXIS_06_tdata(63 downto 0) => symb_mux_0_Tx_AXIS_06_TDATA(63 downto 0),
      Tx_AXIS_06_tlast => symb_mux_0_Tx_AXIS_06_TLAST,
      Tx_AXIS_06_tready => symb_mux_0_Tx_AXIS_06_TREADY,
      Tx_AXIS_06_tvalid => symb_mux_0_Tx_AXIS_06_TVALID,
      Tx_AXIS_07_tdata(63 downto 0) => symb_mux_0_Tx_AXIS_07_TDATA(63 downto 0),
      Tx_AXIS_07_tlast => symb_mux_0_Tx_AXIS_07_TLAST,
      Tx_AXIS_07_tready => symb_mux_0_Tx_AXIS_07_TREADY,
      Tx_AXIS_07_tvalid => symb_mux_0_Tx_AXIS_07_TVALID,
      Tx_AXIS_08_tdata(63 downto 0) => symb_mux_0_Tx_AXIS_08_TDATA(63 downto 0),
      Tx_AXIS_08_tlast => symb_mux_0_Tx_AXIS_08_TLAST,
      Tx_AXIS_08_tready => symb_mux_0_Tx_AXIS_08_TREADY,
      Tx_AXIS_08_tvalid => symb_mux_0_Tx_AXIS_08_TVALID,
      Tx_AXIS_09_tdata(63 downto 0) => symb_mux_0_Tx_AXIS_09_TDATA(63 downto 0),
      Tx_AXIS_09_tlast => symb_mux_0_Tx_AXIS_09_TLAST,
      Tx_AXIS_09_tready => symb_mux_0_Tx_AXIS_09_TREADY,
      Tx_AXIS_09_tvalid => symb_mux_0_Tx_AXIS_09_TVALID,
      Tx_AXIS_10_tdata(63 downto 0) => symb_mux_0_Tx_AXIS_10_TDATA(63 downto 0),
      Tx_AXIS_10_tlast => symb_mux_0_Tx_AXIS_10_TLAST,
      Tx_AXIS_10_tready => symb_mux_0_Tx_AXIS_10_TREADY,
      Tx_AXIS_10_tvalid => symb_mux_0_Tx_AXIS_10_TVALID,
      Tx_AXIS_11_tdata(63 downto 0) => symb_mux_0_Tx_AXIS_11_TDATA(63 downto 0),
      Tx_AXIS_11_tlast => symb_mux_0_Tx_AXIS_11_TLAST,
      Tx_AXIS_11_tready => symb_mux_0_Tx_AXIS_11_TREADY,
      Tx_AXIS_11_tvalid => symb_mux_0_Tx_AXIS_11_TVALID,
      Tx_AXIS_12_tdata(63 downto 0) => symb_mux_0_Tx_AXIS_12_TDATA(63 downto 0),
      Tx_AXIS_12_tlast => symb_mux_0_Tx_AXIS_12_TLAST,
      Tx_AXIS_12_tready => symb_mux_0_Tx_AXIS_12_TREADY,
      Tx_AXIS_12_tvalid => symb_mux_0_Tx_AXIS_12_TVALID,
      Tx_AXIS_13_tdata(63 downto 0) => symb_mux_0_Tx_AXIS_13_TDATA(63 downto 0),
      Tx_AXIS_13_tlast => symb_mux_0_Tx_AXIS_13_TLAST,
      Tx_AXIS_13_tready => symb_mux_0_Tx_AXIS_13_TREADY,
      Tx_AXIS_13_tvalid => symb_mux_0_Tx_AXIS_13_TVALID,
      clk => s_aclk_0_1,
      rstn => s_aresetn_0_1,
      symbEn(13 downto 0) => symbEn_0_1(13 downto 0)
    );
end STRUCTURE;
