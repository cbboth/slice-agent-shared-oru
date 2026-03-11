--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Sun Apr 14 02:08:20 2024
--Host        : DESKTOP-3O06QN5 running 64-bit major release  (build 9200)
--Command     : generate_target lenCalc.bd
--Design      : lenCalc
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity lenCalc is
  port (
    clk : in STD_LOGIC;
    dataLen : out STD_LOGIC_VECTOR ( 15 downto 0 );
    iqWidth : in STD_LOGIC_VECTOR ( 5 downto 0 );
    minPRBSize : in STD_LOGIC_VECTOR ( 1 downto 0 );
    nPRB : in STD_LOGIC_VECTOR ( 10 downto 0 );
    startByte : out STD_LOGIC_VECTOR ( 15 downto 0 );
    startPRB : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute core_generation_info : string;
  attribute core_generation_info of lenCalc : entity is "lenCalc,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=lenCalc,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute hw_handoff : string;
  attribute hw_handoff of lenCalc : entity is "lenCalc.hwdef";
end lenCalc;

architecture STRUCTURE of lenCalc is
  component lenCalc_mult_gen_0_0 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 1 downto 0 );
    B : in STD_LOGIC_VECTOR ( 5 downto 0 );
    P : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component lenCalc_mult_gen_0_0;
  component lenCalc_mult_gen_0_1 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B : in STD_LOGIC_VECTOR ( 10 downto 0 );
    P : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component lenCalc_mult_gen_0_1;
  component lenCalc_mult_gen_1_0 is
  port (
    CLK : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B : in STD_LOGIC_VECTOR ( 10 downto 0 );
    P : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component lenCalc_mult_gen_1_0;
  signal A_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal B_0_1 : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal B_0_2 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal B_0_3 : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal CLK_0_1 : STD_LOGIC;
  signal mult_gen_0_P : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal mult_gen_1_P : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal mult_gen_2_P : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN lenCalc_CLK_0, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute x_interface_info of dataLen : signal is "xilinx.com:signal:data:1.0 DATA.DATALEN DATA";
  attribute x_interface_parameter of dataLen : signal is "XIL_INTERFACENAME DATA.DATALEN, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value FALSE}}}} DATA_WIDTH 16}";
  attribute x_interface_info of iqWidth : signal is "xilinx.com:signal:data:1.0 DATA.IQWIDTH DATA";
  attribute x_interface_parameter of iqWidth : signal is "XIL_INTERFACENAME DATA.IQWIDTH, LAYERED_METADATA undef";
  attribute x_interface_info of minPRBSize : signal is "xilinx.com:signal:data:1.0 DATA.MINPRBSIZE DATA";
  attribute x_interface_parameter of minPRBSize : signal is "XIL_INTERFACENAME DATA.MINPRBSIZE, LAYERED_METADATA undef";
  attribute x_interface_info of nPRB : signal is "xilinx.com:signal:data:1.0 DATA.NPRB DATA";
  attribute x_interface_parameter of nPRB : signal is "XIL_INTERFACENAME DATA.NPRB, LAYERED_METADATA undef";
  attribute x_interface_info of startByte : signal is "xilinx.com:signal:data:1.0 DATA.STARTBYTE DATA";
  attribute x_interface_parameter of startByte : signal is "XIL_INTERFACENAME DATA.STARTBYTE, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value FALSE}}}} DATA_WIDTH 16}";
  attribute x_interface_info of startPRB : signal is "xilinx.com:signal:data:1.0 DATA.STARTPRB DATA";
  attribute x_interface_parameter of startPRB : signal is "XIL_INTERFACENAME DATA.STARTPRB, LAYERED_METADATA undef";
begin
  A_0_1(1 downto 0) <= minPRBSize(1 downto 0);
  B_0_1(10 downto 0) <= startPRB(10 downto 0);
  B_0_2(5 downto 0) <= iqWidth(5 downto 0);
  B_0_3(10 downto 0) <= nPRB(10 downto 0);
  CLK_0_1 <= clk;
  dataLen(15 downto 0) <= mult_gen_2_P(15 downto 0);
  startByte(15 downto 0) <= mult_gen_1_P(15 downto 0);
mult_gen_0: component lenCalc_mult_gen_0_0
     port map (
      A(1 downto 0) => A_0_1(1 downto 0),
      B(5 downto 0) => B_0_2(5 downto 0),
      CLK => CLK_0_1,
      P(7 downto 0) => mult_gen_0_P(7 downto 0)
    );
mult_gen_1: component lenCalc_mult_gen_0_1
     port map (
      A(7 downto 0) => mult_gen_0_P(7 downto 0),
      B(10 downto 0) => B_0_1(10 downto 0),
      CLK => CLK_0_1,
      P(15 downto 0) => mult_gen_1_P(15 downto 0)
    );
mult_gen_2: component lenCalc_mult_gen_1_0
     port map (
      A(7 downto 0) => mult_gen_0_P(7 downto 0),
      B(10 downto 0) => B_0_3(10 downto 0),
      CLK => CLK_0_1,
      P(15 downto 0) => mult_gen_2_P(15 downto 0)
    );
end STRUCTURE;
