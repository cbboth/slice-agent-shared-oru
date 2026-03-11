----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.06.2024 02:08:56
-- Design Name: 
-- Module Name: axiWidthConv - Behavioral
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

entity axiWidthConv is
    generic(
        IN_WIDTH: integer := 32;
        OUT_WIDTH: integer := 64
    );
    Port (
        S_AXI_tdata : in std_logic_vector(IN_WIDTH-1 downto 0);
        S_AXI_tvalid : in std_logic;
        S_AXI_tready : out std_logic;
        
        M_AXI_tdata : out std_logic_vector(OUT_WIDTH-1 downto 0);
        M_AXI_tvalid : out std_logic;
        M_AXI_tready : in std_logic;
        
        clk : in std_logic;
        rstn : in std_logic
     );
end axiWidthConv;

architecture Behavioral of axiWidthConv is

signal lm_data : std_logic_vector(OUT_WIDTH-1 downto 0) := (others => '0');
signal ls_data_last : std_logic_vector(IN_WIDTH-1 downto 0) := (others => '0');
signal ls_valid, ls_ready : std_logic := '0';
signal ms_valid, ms_ready : std_logic := '0';
signal cnt : integer := 0;

type maq_est is (LOW, HIGH, SEND);
signal fsm : maq_est := LOW;

begin

ls_ready <= '1' when fsm = LOW or fsm = HIGH else '0';
ms_valid <= '1' when fsm = SEND else '0';

ls_valid <= S_AXI_tvalid;
S_AXI_tready <= ls_ready;

ms_ready <= M_AXI_tready;
M_AXI_tvalid <= ms_valid;
M_AXI_tdata <= lm_data;

FSMP: process(clk)
begin
    if clk'event and clk = '1' then
        if rstn = '0' then
            fsm <= LOW;
        else
            case fsm is
                when LOW =>
                    if (ls_valid = '1' and ls_ready = '1') then
                        lm_data(31 downto 0) <= S_AXI_tdata;
                        fsm <= HIGH;
                    end if;
                when HIGH =>
                    if (ls_valid = '1' and ls_ready = '1') then
                        lm_data(63 downto 32) <= S_AXI_tdata;
                        fsm <= SEND;
                    end if;
                when SEND =>
                    if(ms_valid = '1' and ms_ready = '1') then
                        fsm <= LOW;
                    end if;
            end case;
        end if;
    end if;
end process;


end Behavioral;
