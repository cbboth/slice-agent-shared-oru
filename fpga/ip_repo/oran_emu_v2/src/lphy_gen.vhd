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
use IEEE.math_real.all;

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
        cfg_iqWidth : in STD_LOGIC_VECTOR ( 5 downto 0 );
        lphy_start_data : in std_logic_vector(15 downto 0);
        lphy_start_valid : in std_logic;
        
        -- CLK AND RESET
        clk: in std_logic;
        rstn: in std_logic    
    );
end lphy_gen;

architecture Behavioral of lphy_gen is

signal nSamples, sCnt : integer := 0;
signal l_axi_ready, l_axi_valid : std_logic := '0';

type maq_est is (IDLE, WAITING, SEND);
signal fsm: maq_est := IDLE;
constant nBytes : integer := integer(ceil(log2(real(AXI_WIDTH))))-1;

begin

nSamples <= to_integer(unsigned(nIQSamples));


DATA_GEN:for i in 0 to nBytes-1 generate
    lphy_axi_tdata(i*8+7 downto i*8) <= std_logic_vector(to_unsigned(sCnt+3-i, 8));
end generate;


l_axi_ready <= lphy_axi_tready;
l_axi_valid <= rstn when fsm = SEND else '0';
lphy_axi_tvalid <= l_axi_valid;
lphy_axi_tlast <= '0';

FSM_P: process(clk)
begin
    if clk'event and clk='1' then
        if rstn = '0' then
            fsm <= IDLE;
        else
            case fsm is
                when IDLE =>
                    if lphy_start_valid = '1' then
                        sCnt <= to_integer(unsigned(lphy_start_data));
                        fsm <= WAITING;
                    else
                        fsm <= IDLE;
                    end if;
                when WAITING =>
                    if l_axi_ready = '1' then
                        fsm <= SEND;
                    else
                        fsm <= WAITING;
                    end if;
                when SEND =>
                    if (l_axi_ready = '1' and l_axi_valid = '1') then
                        sCnt <= sCnt + 4;                            
                    else
                        fsm <= IDLE;
                    end if;
            end case;
        end if;
    end if;
end process;

end Behavioral;
