----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.03.2024 22:05:36
-- Design Name: 
-- Module Name: symb_mux - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity symb_mux is
    generic(
        AXI_WIDTH : integer := 64
    );
    Port (
    
    -- AXI STREAM INPUT
    Rx_AXIS_0_tdata : in std_logic_vector(AXI_WIDTH-1 downto 0);
    Rx_AXIS_0_tvalid: in std_logic;
    Rx_AXIS_0_tlast: in std_logic;
    Rx_AXIS_0_tready: out std_logic;
    
    -- AXI STREAM OUTPUT SYMBOL 0
    Tx_AXIS_00_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
    Tx_AXIS_00_tvalid: out std_logic;
    Tx_AXIS_00_tlast: out std_logic;
    Tx_AXIS_00_tready: in std_logic;
    
    -- AXI STREAM OUTPUT SYMBOL 1
    Tx_AXIS_01_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
    Tx_AXIS_01_tvalid: out std_logic;
    Tx_AXIS_01_tlast: out std_logic;
    Tx_AXIS_01_tready: in std_logic;
    
    -- AXI STREAM OUTPUT SYMBOL 2
    Tx_AXIS_02_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
    Tx_AXIS_02_tvalid: out std_logic;
    Tx_AXIS_02_tlast: out std_logic;
    Tx_AXIS_02_tready: in std_logic;
    
    -- AXI STREAM OUTPUT SYMBOL 3
    Tx_AXIS_03_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
    Tx_AXIS_03_tvalid: out std_logic;
    Tx_AXIS_03_tlast: out std_logic;
    Tx_AXIS_03_tready: in std_logic;
    
    -- AXI STREAM OUTPUT SYMBOL 4
    Tx_AXIS_04_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
    Tx_AXIS_04_tvalid: out std_logic;
    Tx_AXIS_04_tlast: out std_logic;
    Tx_AXIS_04_tready: in std_logic;
    
    -- AXI STREAM OUTPUT SYMBOL 5
    Tx_AXIS_05_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
    Tx_AXIS_05_tvalid: out std_logic;
    Tx_AXIS_05_tlast: out std_logic;
    Tx_AXIS_05_tready: in std_logic;
    
    -- AXI STREAM OUTPUT SYMBOL 6
    Tx_AXIS_06_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
    Tx_AXIS_06_tvalid: out std_logic;
    Tx_AXIS_06_tlast: out std_logic;
    Tx_AXIS_06_tready: in std_logic;
    
    -- AXI STREAM OUTPUT SYMBOL 7
    Tx_AXIS_07_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
    Tx_AXIS_07_tvalid: out std_logic;
    Tx_AXIS_07_tlast: out std_logic;
    Tx_AXIS_07_tready: in std_logic;
    
    -- AXI STREAM OUTPUT SYMBOL 8
    Tx_AXIS_08_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
    Tx_AXIS_08_tvalid: out std_logic;
    Tx_AXIS_08_tlast: out std_logic;
    Tx_AXIS_08_tready: in std_logic;
    
    -- AXI STREAM OUTPUT SYMBOL 9
    Tx_AXIS_09_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
    Tx_AXIS_09_tvalid: out std_logic;
    Tx_AXIS_09_tlast: out std_logic;
    Tx_AXIS_09_tready: in std_logic;
    
    -- AXI STREAM OUTPUT SYMBOL 10
    Tx_AXIS_10_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
    Tx_AXIS_10_tvalid: out std_logic;
    Tx_AXIS_10_tlast: out std_logic;
    Tx_AXIS_10_tready: in std_logic;
    
    -- AXI STREAM OUTPUT SYMBOL 11
    Tx_AXIS_11_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
    Tx_AXIS_11_tvalid: out std_logic;
    Tx_AXIS_11_tlast: out std_logic;
    Tx_AXIS_11_tready: in std_logic;
    
    -- AXI STREAM OUTPUT SYMBOL 12
    Tx_AXIS_12_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
    Tx_AXIS_12_tvalid: out std_logic;
    Tx_AXIS_12_tlast: out std_logic;
    Tx_AXIS_12_tready: in std_logic;
    
    -- AXI STREAM OUTPUT SYMBOL 13
    Tx_AXIS_13_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
    Tx_AXIS_13_tvalid: out std_logic;
    Tx_AXIS_13_tlast: out std_logic;
    Tx_AXIS_13_tready: in std_logic;
    
    -- Control signals
    clk: in std_logic;
    rstn: in std_logic;
    symbEn : in std_logic_vector(13 downto 0)
     );
end symb_mux;

architecture Behavioral of symb_mux is

signal l_mAxis_tready : std_logic_vector(13 downto 0) := (others=>'0');

begin

Tx_AXIS_00_tdata <= Rx_AXIS_0_tdata when symbEn(0) = '1' else (others=>'0');
Tx_AXIS_01_tdata <= Rx_AXIS_0_tdata when symbEn(1) = '1' else (others=>'0');
Tx_AXIS_02_tdata <= Rx_AXIS_0_tdata when symbEn(2) = '1' else (others=>'0');
Tx_AXIS_03_tdata <= Rx_AXIS_0_tdata when symbEn(3) = '1' else (others=>'0');
Tx_AXIS_04_tdata <= Rx_AXIS_0_tdata when symbEn(4) = '1' else (others=>'0');
Tx_AXIS_05_tdata <= Rx_AXIS_0_tdata when symbEn(5) = '1' else (others=>'0');
Tx_AXIS_06_tdata <= Rx_AXIS_0_tdata when symbEn(6) = '1' else (others=>'0');
Tx_AXIS_07_tdata <= Rx_AXIS_0_tdata when symbEn(7) = '1' else (others=>'0');
Tx_AXIS_08_tdata <= Rx_AXIS_0_tdata when symbEn(8) = '1' else (others=>'0');
Tx_AXIS_09_tdata <= Rx_AXIS_0_tdata when symbEn(9) = '1' else (others=>'0');
Tx_AXIS_10_tdata <= Rx_AXIS_0_tdata when symbEn(10) = '1' else (others=>'0');
Tx_AXIS_11_tdata <= Rx_AXIS_0_tdata when symbEn(11) = '1' else (others=>'0');
Tx_AXIS_12_tdata <= Rx_AXIS_0_tdata when symbEn(12) = '1' else (others=>'0');
Tx_AXIS_13_tdata <= Rx_AXIS_0_tdata when symbEn(13) = '1' else (others=>'0');

Tx_AXIS_00_tvalid <= Rx_AXIS_0_tvalid when symbEn(0) = '1' else '0';
Tx_AXIS_01_tvalid <= Rx_AXIS_0_tvalid when symbEn(1) = '1' else '0';
Tx_AXIS_02_tvalid <= Rx_AXIS_0_tvalid when symbEn(2) = '1' else '0';
Tx_AXIS_03_tvalid <= Rx_AXIS_0_tvalid when symbEn(3) = '1' else '0';
Tx_AXIS_04_tvalid <= Rx_AXIS_0_tvalid when symbEn(4) = '1' else '0';
Tx_AXIS_05_tvalid <= Rx_AXIS_0_tvalid when symbEn(5) = '1' else '0';
Tx_AXIS_06_tvalid <= Rx_AXIS_0_tvalid when symbEn(6) = '1' else '0';
Tx_AXIS_07_tvalid <= Rx_AXIS_0_tvalid when symbEn(7) = '1' else '0';
Tx_AXIS_08_tvalid <= Rx_AXIS_0_tvalid when symbEn(8) = '1' else '0';
Tx_AXIS_09_tvalid <= Rx_AXIS_0_tvalid when symbEn(9) = '1' else '0';
Tx_AXIS_10_tvalid <= Rx_AXIS_0_tvalid when symbEn(10) = '1' else '0';
Tx_AXIS_11_tvalid <= Rx_AXIS_0_tvalid when symbEn(11) = '1' else '0';
Tx_AXIS_12_tvalid <= Rx_AXIS_0_tvalid when symbEn(12) = '1' else '0';
Tx_AXIS_13_tvalid <= Rx_AXIS_0_tvalid when symbEn(13) = '1' else '0';

Tx_AXIS_00_tlast <= Rx_AXIS_0_tlast when symbEn(0) = '1' else '0';
Tx_AXIS_01_tlast <= Rx_AXIS_0_tlast when symbEn(1) = '1' else '0';
Tx_AXIS_02_tlast <= Rx_AXIS_0_tlast when symbEn(2) = '1' else '0';
Tx_AXIS_03_tlast <= Rx_AXIS_0_tlast when symbEn(3) = '1' else '0';
Tx_AXIS_04_tlast <= Rx_AXIS_0_tlast when symbEn(4) = '1' else '0';
Tx_AXIS_05_tlast <= Rx_AXIS_0_tlast when symbEn(5) = '1' else '0';
Tx_AXIS_06_tlast <= Rx_AXIS_0_tlast when symbEn(6) = '1' else '0';
Tx_AXIS_07_tlast <= Rx_AXIS_0_tlast when symbEn(7) = '1' else '0';
Tx_AXIS_08_tlast <= Rx_AXIS_0_tlast when symbEn(8) = '1' else '0';
Tx_AXIS_09_tlast <= Rx_AXIS_0_tlast when symbEn(9) = '1' else '0';
Tx_AXIS_10_tlast <= Rx_AXIS_0_tlast when symbEn(10) = '1' else '0';
Tx_AXIS_11_tlast <= Rx_AXIS_0_tlast when symbEn(11) = '1' else '0';
Tx_AXIS_12_tlast <= Rx_AXIS_0_tlast when symbEn(12) = '1' else '0';
Tx_AXIS_13_tlast <= Rx_AXIS_0_tlast when symbEn(13) = '1' else '0';

l_mAxis_tready(0) <= Tx_AXIS_00_tready when symbEn(0) = '1' else '1';
l_mAxis_tready(1) <= Tx_AXIS_01_tready when symbEn(1) = '1' else '1';
l_mAxis_tready(2) <= Tx_AXIS_02_tready when symbEn(2) = '1' else '1';
l_mAxis_tready(3) <= Tx_AXIS_03_tready when symbEn(3) = '1' else '1';
l_mAxis_tready(4) <= Tx_AXIS_04_tready when symbEn(4) = '1' else '1';
l_mAxis_tready(5) <= Tx_AXIS_05_tready when symbEn(5) = '1' else '1';
l_mAxis_tready(6) <= Tx_AXIS_06_tready when symbEn(6) = '1' else '1';
l_mAxis_tready(7) <= Tx_AXIS_07_tready when symbEn(7) = '1' else '1';
l_mAxis_tready(8) <= Tx_AXIS_08_tready when symbEn(8) = '1' else '1';
l_mAxis_tready(9) <= Tx_AXIS_09_tready when symbEn(9) = '1' else '1';
l_mAxis_tready(10) <= Tx_AXIS_10_tready when symbEn(10) = '1' else '1';
l_mAxis_tready(11) <= Tx_AXIS_11_tready when symbEn(11) = '1' else '1';
l_mAxis_tready(12) <= Tx_AXIS_12_tready when symbEn(12) = '1' else '1';
l_mAxis_tready(13) <= Tx_AXIS_13_tready when symbEn(13) = '1' else '1';

Rx_AXIS_0_tready <= '0' when symbEn = "00000000000000" else
                    '1' when l_mAxis_tready = "11111111111111" else 
                    '0';


end Behavioral;
