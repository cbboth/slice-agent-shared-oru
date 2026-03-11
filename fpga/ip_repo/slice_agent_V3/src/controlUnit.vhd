----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.03.2024 15:12:19
-- Design Name: 
-- Module Name: controlUnit - Behavioral
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

entity controlUnit is
    generic(
        MEM_SIZE : natural := 32
    );
    Port ( 
        -- INPUT SIGNALS
        symbolID : in std_logic_vector(3 downto 0);
        
        -- SLICE MEM
        wr_eCPRI_ID    : in std_logic_vector(15 downto 0);
        addSlice: in std_logic;
        rmSlice: in std_logic;
        
        rd_eCPRI : in std_logic_vector(15 downto 0);
        rd_valid : out std_logic;
        
        -- CONTROL SIGNALS
        swap: out std_logic;
        ejectSymb: out std_logic_vector(13 downto 0);
        symbSel: out std_logic_vector(3 downto 0);
        
        -- CLK and RSTs
        clk : in std_logic;
        rstn : in std_logic
    );
end controlUnit;

architecture Behavioral of controlUnit is

signal l_swap : std_logic := '0';
signal ss: std_logic := '0';

begin
    swap <= l_swap;

    symbSel <= symbolID;
    EJECT_CTRL: for i in 0 to 13 generate
        ejectSymb(i) <= '1' when symbolID = std_logic_vector(to_unsigned(i, symbolID'length)) else '0';
    end generate;

    CTRL_SIG: process (clk)
    begin
        if (clk'event and clk ='1') then
            if rstn = '0' then
                l_swap <= '0';
            else
                if (symbolID = x"0" and ss = '0') then
                    l_swap <= not l_swap;
                    ss <= '1';
                else
                    if symbolID > x"0" then
                        ss <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;


    SLICEMEM: entity work.sliceMem
    generic map(
        MEM_SIZE => MEM_SIZE
    )
    port map(
        eCPRI_ID => wr_eCPRI_ID,
        addSlice => addSlice,
        rmSlice => rmSlice,
        
        check_eCPRI => rd_eCPRI,
        sliceType_valid => rd_valid,
        
        clk_0 => clk,
        rst_0 => rstn
    );
    

end Behavioral;
