----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2024 00:23:38
-- Design Name: 
-- Module Name: axi_mux_14x1 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity axi_mux_14x1 is
    Port ( 
        -- AXI SYMBOL 0
        S_AXIS_00_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
        S_AXIS_00_tvalid : in std_logic;
        S_AXIS_00_tready: out std_logic;
        S_AXIS_00_tlast: in std_logic;
        empty_0 : in std_logic;
        
        -- AXI SYMBOL 1
        S_AXIS_01_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
        S_AXIS_01_tvalid : in std_logic;
        S_AXIS_01_tready: out std_logic;
        S_AXIS_01_tlast: in std_logic;
        empty_1 : in std_logic;
        
        -- AXI SYMBOL 2
        S_AXIS_02_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
        S_AXIS_02_tvalid : in std_logic;
        S_AXIS_02_tready: out std_logic;
        S_AXIS_02_tlast: in std_logic;
        empty_2 : in std_logic;
        
        -- AXI SYMBOL 3
        S_AXIS_03_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
        S_AXIS_03_tvalid : in std_logic;
        S_AXIS_03_tready: out std_logic;
        S_AXIS_03_tlast: in std_logic;
        empty_3 : in std_logic;
        
        -- AXI SYMBOL 4
        S_AXIS_04_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
        S_AXIS_04_tvalid : in std_logic;
        S_AXIS_04_tready: out std_logic;
        S_AXIS_04_tlast: in std_logic;
        empty_4 : in std_logic;
        
        -- AXI SYMBOL 5
        S_AXIS_05_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
        S_AXIS_05_tvalid : in std_logic;
        S_AXIS_05_tready: out std_logic;
        S_AXIS_05_tlast: in std_logic;
        empty_5 : in std_logic;
        
        -- AXI SYMBOL 6
        S_AXIS_06_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
        S_AXIS_06_tvalid : in std_logic;
        S_AXIS_06_tready: out std_logic;
        S_AXIS_06_tlast: in std_logic;
        empty_6 : in std_logic;
        
        -- AXI SYMBOL 7
        S_AXIS_07_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
        S_AXIS_07_tvalid : in std_logic;
        S_AXIS_07_tready: out std_logic;
        S_AXIS_07_tlast: in std_logic;
        empty_7 : in std_logic;
        
        -- AXI SYMBOL 8
        S_AXIS_08_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
        S_AXIS_08_tvalid : in std_logic;
        S_AXIS_08_tready: out std_logic;
        S_AXIS_08_tlast: in std_logic;
        empty_8 : in std_logic;
        
        -- AXI SYMBOL 9
        S_AXIS_09_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
        S_AXIS_09_tvalid : in std_logic;
        S_AXIS_09_tready: out std_logic;
        S_AXIS_09_tlast: in std_logic;
        empty_9 : in std_logic;
        
        -- AXI SYMBOL 10
        S_AXIS_10_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
        S_AXIS_10_tvalid : in std_logic;
        S_AXIS_10_tready: out std_logic;
        S_AXIS_10_tlast: in std_logic;
        empty_10 : in std_logic;
        
        -- AXI SYMBOL 11
        S_AXIS_11_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
        S_AXIS_11_tvalid : in std_logic;
        S_AXIS_11_tready: out std_logic;
        S_AXIS_11_tlast: in std_logic;
        empty_11 : in std_logic;
                
        -- AXI SYMBOL 12
        S_AXIS_12_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
        S_AXIS_12_tvalid : in std_logic;
        S_AXIS_12_tready: out std_logic;
        S_AXIS_12_tlast: in std_logic;
        empty_12 : in std_logic;
        
        -- AXI SYMBOL 13
        S_AXIS_13_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
        S_AXIS_13_tvalid : in std_logic;
        S_AXIS_13_tready: out std_logic;
        S_AXIS_13_tlast: in std_logic;
        empty_13 : in std_logic;
        
        -- AXI OUTPUT
        M_AXIS_00_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
        M_AXIS_00_tvalid : out std_logic;
        M_AXIS_00_tready: in std_logic;
        M_AXIS_00_tlast: out std_logic;
        empty : out std_logic;
        
        -- Control signals
        sel: in std_logic_vector(3 downto 0);
        clk: in std_logic;
        rst0: in std_logic
    );
end axi_mux_14x1;

architecture Behavioral of axi_mux_14x1 is

begin

empty <=    empty_0 when sel = "0000" else
            empty_1 when sel = "0001" else
            empty_2 when sel = "0010" else
            empty_3 when sel = "0011" else
            empty_4 when sel = "0100" else
            empty_5 when sel = "0101" else
            empty_6 when sel = "0110" else
            empty_7 when sel = "0111" else
            empty_8 when sel = "1000" else
            empty_9 when sel = "1001" else
            empty_10 when sel = "1010" else
            empty_11 when sel = "1011" else
            empty_12 when sel = "1100" else
            empty_13 when sel = "1101" else '1';

M_AXIS_00_tdata <=  S_AXIS_00_tdata when sel = "0000" else
                    S_AXIS_01_tdata when sel = "0001" else
                    S_AXIS_02_tdata when sel = "0010" else
                    S_AXIS_03_tdata when sel = "0011" else
                    S_AXIS_04_tdata when sel = "0100" else
                    S_AXIS_05_tdata when sel = "0101" else
                    S_AXIS_06_tdata when sel = "0110" else
                    S_AXIS_07_tdata when sel = "0111" else
                    S_AXIS_08_tdata when sel = "1000" else
                    S_AXIS_09_tdata when sel = "1001" else
                    S_AXIS_10_tdata when sel = "1010" else
                    S_AXIS_11_tdata when sel = "1011" else
                    S_AXIS_12_tdata when sel = "1100" else
                    S_AXIS_13_tdata when sel = "1101" else (others => '0');
                    
M_AXIS_00_tlast <=  S_AXIS_00_tlast when sel = "0000" else
                    S_AXIS_01_tlast when sel = "0001" else
                    S_AXIS_02_tlast when sel = "0010" else
                    S_AXIS_03_tlast when sel = "0011" else
                    S_AXIS_04_tlast when sel = "0100" else
                    S_AXIS_05_tlast when sel = "0101" else
                    S_AXIS_06_tlast when sel = "0110" else
                    S_AXIS_07_tlast when sel = "0111" else
                    S_AXIS_08_tlast when sel = "1000" else
                    S_AXIS_09_tlast when sel = "1001" else
                    S_AXIS_10_tlast when sel = "1010" else
                    S_AXIS_11_tlast when sel = "1011" else
                    S_AXIS_12_tlast when sel = "1100" else
                    S_AXIS_13_tlast when sel = "1101" else '0';            
                    
M_AXIS_00_tvalid <=  S_AXIS_00_tvalid when sel = "0000" else
                    S_AXIS_01_tvalid when sel = "0001" else
                    S_AXIS_02_tvalid when sel = "0010" else
                    S_AXIS_03_tvalid when sel = "0011" else
                    S_AXIS_04_tvalid when sel = "0100" else
                    S_AXIS_05_tvalid when sel = "0101" else
                    S_AXIS_06_tvalid when sel = "0110" else
                    S_AXIS_07_tvalid when sel = "0111" else
                    S_AXIS_08_tvalid when sel = "1000" else
                    S_AXIS_09_tvalid when sel = "1001" else
                    S_AXIS_10_tvalid when sel = "1010" else
                    S_AXIS_11_tvalid when sel = "1011" else
                    S_AXIS_12_tvalid when sel = "1100" else
                    S_AXIS_13_tvalid when sel = "1101" else '0';
                    
 S_AXIS_00_tready <= M_AXIS_00_tready when sel = "0000" else '0';    
 S_AXIS_01_tready <= M_AXIS_00_tready when sel = "0001" else '0'; 
 S_AXIS_02_tready <= M_AXIS_00_tready when sel = "0010" else '0'; 
 S_AXIS_03_tready <= M_AXIS_00_tready when sel = "0011" else '0'; 
 S_AXIS_04_tready <= M_AXIS_00_tready when sel = "0100" else '0'; 
 S_AXIS_05_tready <= M_AXIS_00_tready when sel = "0101" else '0'; 
 S_AXIS_06_tready <= M_AXIS_00_tready when sel = "0110" else '0'; 
 S_AXIS_07_tready <= M_AXIS_00_tready when sel = "0111" else '0'; 
 S_AXIS_08_tready <= M_AXIS_00_tready when sel = "1000" else '0'; 
 S_AXIS_09_tready <= M_AXIS_00_tready when sel = "1001" else '0'; 
 S_AXIS_10_tready <= M_AXIS_00_tready when sel = "1010" else '0'; 
 S_AXIS_11_tready <= M_AXIS_00_tready when sel = "1011" else '0'; 
 S_AXIS_12_tready <= M_AXIS_00_tready when sel = "1100" else '0'; 
 S_AXIS_13_tready <= M_AXIS_00_tready when sel = "1101" else '0';                    

end Behavioral;
