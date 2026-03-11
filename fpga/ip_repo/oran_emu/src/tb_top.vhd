----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2024 01:23:10
-- Design Name: 
-- Module Name: tb_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is

-- INPUT AXI
signal rxCplane_axi_tdata : std_logic_vector(32-1 downto 0);
signal rxCplane_axi_tvalid : std_logic;
signal rxCplane_axi_tlast : std_logic;
signal rxCplane_axi_tready : std_logic;

-- OUTPUT AXI
signal txCplane_axi_tdata : std_logic_vector(32-1 downto 0);
signal txCplane_axi_tvalid : std_logic;
signal txCplane_axi_tlast : std_logic;
signal txCplane_axi_tready : std_logic;

-- IDS
signal cfg_frameID : std_logic_vector(7 downto 0) := (others => '0');
signal cfg_subFrameID : std_logic_vector(3 downto 0) := (others => '0');
signal cfg_slotID : std_logic_vector(5 downto 0) := (others => '0');
signal cfg_mu : std_logic_vector(3 downto 0) := x"1";
signal cfg_slotStep : std_logic_vector(3 downto 0);
signal cfg_maxSlotId : std_logic_vector(5 downto 0);
signal symbT : std_logic_vector(15 downto 0);
signal slotT : std_logic_vector(15 downto 0);
signal minTime2Proc : std_logic_vector(15 downto 0);
signal nIQSamples: std_logic_vector(31 downto 0);

-- ID OUT
signal frameID : std_logic_vector(7 downto 0) := (others => '0');
signal subframeID : std_logic_vector(3 downto 0) := (others => '0');
signal slotID : std_logic_vector(5 downto 0) := (others => '0');
signal symbolID : std_logic_vector(3 downto 0) := (others => '0');
signal mu : std_logic_vector(3 downto 0) := (others => '0');

-- LPHY
signal lphy_axi_tdata: std_logic_vector(32-1 downto 0);
signal lphy_axi_tvalid : std_logic;
signal lphy_axi_tready : std_logic;
signal lphy_axi_tlast : std_logic;

signal start_sgn : std_logic := '0';

-- TB
-- CONTROL SIGNALS
signal dstMAC: std_logic_vector(47 downto 0) := (others => '0');
signal srcMAC: std_logic_vector(47 downto 0) := (others => '0');

-- CLK AND RESET
signal clk: std_logic := '1';
signal rstn: std_logic := '0';

constant CLK_PERIOD : time := 10 ns;
constant IN_WIDTH : integer := 32;

type idsArr is Array(4 downto 0) of std_logic_vector(31 downto 0);
signal ids : idsArr := (others => (others => '0'));
signal eth_swap: std_logic_vector(IN_WIDTH-1 downto 0) := (others => '0');

begin

dstMAC <= x"DA0203040506";
srcMAC <= x"CA0203040506";
clk <= not clk after CLK_PERIOD/2;

ids(0) <= x"00800001";
ids(1) <= x"10000001";
ids(2) <= x"10800001";
ids(3) <= x"20000001";

g_SWAP64: for ii in 0 to ((IN_WIDTH/8)-1) generate
        rxCplane_axi_tdata(IN_WIDTH-ii*8-1 downto IN_WIDTH-ii*8-8) <= eth_swap(ii*8+7 downto ii*8);
    end generate g_SWAP64;

DUT: entity work.oran_e
port map(
    -- INPUT AXI
    rxCplane_axi_tdata => rxCplane_axi_tdata,
    rxCplane_axi_tvalid => rxCplane_axi_tvalid,
    rxCplane_axi_tlast => rxCplane_axi_tlast,
    rxCplane_axi_tready => rxCplane_axi_tready,
    
    -- OUTPUT AXI
    txCplane_axi_tdata => txCplane_axi_tdata,
    txCplane_axi_tvalid => txCplane_axi_tvalid,
    txCplane_axi_tlast => txCplane_axi_tlast,
    txCplane_axi_tready => txCplane_axi_tready,
    
    -- IDS
    cfg_frameID => cfg_frameID,
    cfg_subframeID => cfg_subframeID,
    cfg_slotID => cfg_slotID,
    cfg_mu => cfg_mu,
    cfg_slotStep => cfg_slotStep,
    cfg_maxSlotId => cfg_maxSlotId,
    symbT => symbT,
    slotT => slotT,
    minTime2Proc => minTime2Proc,
    nIQSamples => nIQSamples,
    
    -- IDS OUT
    frameID => frameID,
    subFrameID => subFrameID,
    slotID => slotID,
    symbolID => symbolID,
    mu => mu,
    
    start_sgn => start_sgn,
    
    lphy_axi_tdata => lphy_axi_tdata,
    lphy_axi_tvalid => lphy_axi_tvalid,
    lphy_axi_tready => lphy_axi_tready,
    lphy_axi_tlast => lphy_axi_tlast,    
    
    -- CLK AND RESET
    clk => clk,
    rstn => rstn
);

RESET_P: process 
begin
    rstn <= '0';
    cfg_slotStep <= x"2";
    cfg_maxSlotId <= "00" & x"2";
    symbT <= std_logic_vector(to_unsigned(3571, symbT'length));
    slotT <= std_logic_vector(to_unsigned(49994, slotT'length));
    minTime2Proc <= std_logic_vector(to_unsigned(44994, minTime2Proc'length));
    nIQSamples <= std_logic_vector(to_unsigned(1500, nIQSamples'length));
    wait for CLK_PERIOD*5;
    rstn <= '1';
    txCplane_axi_tready <= '1';
    lphy_axi_tready <= '1';
    wait;
end process;

AXI_P: process
begin
    eth_swap <= (others => '0');
    rxCplane_axi_tvalid <= '0';
    rxCplane_axi_tlast <= '0';
    
    wait on clk until rstn = '1' and clk='1';
    wait for CLK_PERIOD*10;    
    
    for i in 0 to 4 loop
    
    -- SLICE 1
    if (i < 3) then
        for j in 0 to 20 loop
            rxCplane_axi_tvalid <= '1';
            eth_swap <= x"CA020304";
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            eth_swap <= x"0506DA02";
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            eth_swap <= x"03040506";
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            eth_swap <= x"81000123"; -- vlan = 0x123
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            eth_swap <= x"eefe1002"; -- ecpriMessage = 0x02
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            eth_swap <= x"0000" & x"A0A0";-- std_logic_vector(x"A0A0" + to_unsigned(j*7, 16)); -- ecpriID = 0xA0A0
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            eth_swap <= x"00001000"; -- Data dir = 1 / Frame ID = 0
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            eth_swap <= std_logic_vector(unsigned(ids(i)) + x"30000"); -- subframID / slotID = ids() / Start Symbol = 3
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            eth_swap <= std_logic_vector(x"00000000" + to_unsigned(j, 24)(9 downto 8)); -- startPRB = j
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            eth_swap <= std_logic_vector(to_unsigned(j, 24)(7 downto 0)) & x"010005"; -- startPRB = j / NumPRB = 1 / Num Symb = 5
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            eth_swap <= (others => '0');
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            wait on clk until (clk = '1' and rxCplane_axi_tready = '1');
            rxCplane_axi_tvalid <= '0';
            --wait for CLK_PERIOD*2;
        end loop;
    end if;
    end loop;
    wait;
end process;

STARTP : process
begin
start_sgn <= '0';
wait for CLK_PERIOD*40;
start_sgn <= '1';
wait;
end process;


end Behavioral;
