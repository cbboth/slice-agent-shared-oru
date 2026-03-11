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

signal l_signal_in : std_logic := '0';
signal l_out : std_logic := '0';

begin

sig_out <= l_out;
    
    SINGLE: process (clk)
    begin
        if clk'event and clk = '1' then
            if l_out = '1' then
                l_out <= '0';
            end if;
            
            if (sig_in = '1' and l_signal_in = '0') then
                l_out <= '1';
                l_signal_in <= '1';
            elsif sig_in = '0' then
                l_signal_in <= '0';
            end if;
        end if;
    end process;



end Behavioral;
