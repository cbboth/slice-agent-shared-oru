----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.03.2024 18:29:34
-- Design Name: 
-- Module Name: bitwise_or - Behavioral
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

entity bitwise_or is
  generic(
    IN_WIDTH : natural := 8
  );
  Port ( 
    sgIn : in std_logic_vector (IN_WIDTH-1 downto 0);
    sgOut : out std_logic
  );
end bitwise_or;

architecture Behavioral of bitwise_or is

constant comp: std_logic_vector (IN_WIDTH-1 downto 0) := (others => '0');

begin

    sgOut <= '0' when sgIn = comp else '1';

end Behavioral;
