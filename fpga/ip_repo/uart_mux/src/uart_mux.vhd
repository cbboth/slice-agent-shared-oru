----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2024 22:32:26
-- Design Name: 
-- Module Name: uart_mux - Behavioral
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

entity uart_mux is
    Port (
        -- SELECT
        sel : in std_logic_vector(3 downto 0);
    
        -- DATA OUTPUT
        leds: out std_logic_vector(7 downto 0);
    
        -- DATA INPUT
        dbg_state : in std_logic_vector(3 downto 0);
        start_emu : in std_logic;
        frameID : in std_logic_vector(7 downto 0);
        subframeID : in std_logic_vector(3 downto 0);
        slotID: in std_logic_vector(5 downto 0);
        mu: in std_logic_vector (3 downto 0);
        slotStep : in std_logic_vector(3 downto 0);
        maxSlotId: in std_logic_vector(5 downto 0);
        symbT: in std_logic_vector(15 downto 0);
        slotT: in std_logic_vector(15 downto 0);
        minTime2Proc: in std_logic_vector(15 downto 0);
        data_0: in std_logic_vector(7 downto 0);
        data_1: in std_logic_vector(7 downto 0);
        data_2: in std_logic_vector(7 downto 0);
        data_3: in std_logic_vector(7 downto 0);
        data_4: in std_logic_vector(7 downto 0)
    );
end uart_mux;

architecture Behavioral of uart_mux is

begin

leds <= "0000" & dbg_state when sel = "0000" else
        frameID when sel = "0001" else
        "0000" & subframeID when sel = "0010" else
        "00" & slotID when sel = "0011" else
        "0000" & mu when sel = "0100" else
        "0000" & slotStep when sel = "0101" else
        "00" & maxSlotId when sel = "0110" else
        symbT(7 downto 0) when sel = "0111" else
        slotT(7 downto 0) when sel = "1000" else
        minTime2Proc(7 downto 0) when sel = "1001" else
        "0000000" & start_emu when sel = "1010" else
        data_0 when sel = "1011" else
        data_1 when sel = "1100" else
        data_2 when sel = "1101" else
        data_3 when sel = "1110" else
        data_4 when sel = "1111" else
        (others => '0');
        
end Behavioral;
