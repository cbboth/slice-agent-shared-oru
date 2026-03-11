----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2024 19:59:32
-- Design Name: 
-- Module Name: lphy_gen - Behavioral
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

entity lphy_gen is
    Generic (
        AXI_WIDTH : integer := 32
    );
    Port ( 
        -- LOW PHY AXI STREAM
        lphy_axi_tdata: out std_logic_vector(AXI_WIDTH-1 downto 0);
        lphy_axi_tvalid : out std_logic;
        lphy_axi_tready : in std_logic;
        lphy_axi_tlast : out std_logic;
        
        -- CONTROL
        nIQSamples: in std_logic_vector(23 downto 0);
        start : in std_logic;
        
        -- CLK AND RESET
        clk: in std_logic;
        rstn: in std_logic    
    );
end lphy_gen;

architecture Behavioral of lphy_gen is

signal nSamples, sCnt : integer := 0;
signal l_axi_ready, l_axi_valid : std_logic := '0';

type maq_est is (IDLE, SEND);
signal fsm: maq_est := IDLE;

begin

nSamples <= to_integer(unsigned(nIQSamples));

lphy_axi_tdata <= std_logic_vector(to_unsigned(sCnt, lphy_axi_tdata'length));
l_axi_ready <= lphy_axi_tready;
l_axi_valid <= rstn when fsm = SEND else '0';
lphy_axi_tvalid <= l_axi_valid;
lphy_axi_tlast <= rstn when (fsm = SEND and sCnt = (nSamples-1)) else '0';

FSM_P: process(clk)
begin
    if clk'event and clk='1' then
        if rstn = '0' then
            fsm <= IDLE;
        else
            case fsm is
                when IDLE =>
                    if start = '1' then
                        sCnt <= 0;
                        fsm <= SEND;
                    else
                        fsm <= IDLE;
                    end if;
                when SEND =>
                    if (l_axi_ready = '1' and l_axi_valid = '1') then
                        if (sCnt < nSamples-1) then
                            sCnt <= sCnt + 1;
                        else
                            fsm <= IDLE;
                        end if;                            
                    else
                        fsm <= SEND;
                    end if;
            end case;
        end if;
    end if;
end process;

end Behavioral;
