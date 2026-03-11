----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2024 18:44:58
-- Design Name: 
-- Module Name: sync_single - Behavioral
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

entity sync_single is
    Port ( clk : in STD_LOGIC;
           sig_in : in STD_LOGIC;
           sig_out : out STD_LOGIC);
end sync_single;

architecture Behavioral of sync_single is

signal l_sgn_in : std_logic_vector(3 downto 0) := (others => '0');

begin

sig_out <= '1' when l_sgn_in = "1110" else '0';
    
    SINGLE: process (clk)
    begin
        if clk'event and clk = '1' then
            l_sgn_in <= l_sgn_in(3 downto 1) & sig_in;
        end if;
    end process;



end Behavioral;