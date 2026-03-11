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
    Port ( 
        -- INPUT SIGNALS
        framID : in std_logic_vector(7 downto 0);
        subframeID : in std_logic_vector(3 downto 0);
        slotID: in std_logic_vector(5 downto 0);
        symbolID : in std_logic_vector(3 downto 0);
        mu: in std_logic_vector (3 downto 0);
        
        -- SLICE MEM
        wr_eCPRI_ID    : in std_logic_vector(15 downto 0);
        wr_sliceType : in std_logic_vector(3 downto 0);
        addSlice: in std_logic;
        rmSlice: in std_logic;
        
        rd_eCPRI : in std_logic_vector(15 downto 0);
        rd_sliceType : out std_logic_vector(3 downto 0);
        rd_valid : out std_logic;
        
        -- CONTROL SIGNALS
        n1Start: out std_logic;
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
                n1Start <= '0';
            else
                if (symbolID = x"0" and ss = '0') then
                    l_swap <= not l_swap;
                    ss <= '1';
                    n1Start <= '1';
                else
                    n1Start <= '0';
                    if symbolID > x"0" then
                        ss <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;


    SLICEMEM: entity work.sliceMem
    port map(
        eCPRI_ID => wr_eCPRI_ID,
        sliceType_w => wr_sliceType,
        addSlice => addSlice,
        rmSlice => rmSlice,
        
        check_eCPRI => rd_eCPRI,
        sliceType_r => rd_sliceType,
        sliceType_valid => rd_valid,
        
        clk_0 => clk,
        rst_0 => rstn
    );
    

end Behavioral;
