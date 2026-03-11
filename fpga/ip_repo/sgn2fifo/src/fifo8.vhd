----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2024 12:51:34
-- Design Name: 
-- Module Name: fifo8 - Behavioral
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

entity fifo8 is
    generic(
        DATA_WIDTH : integer := 32;
        FIFO_DEPTH : integer := 8
    );
    Port (
        din : in std_logic_vector(DATA_WIDTH-1 downto 0);
        in_en: in std_logic;
        
        out_axi_tdata: out std_logic_vector(DATA_WIDTH-1 downto 0);
        out_axi_tvalid : out std_logic;
        out_axi_tready : in std_logic;
        
        clk : in std_logic;
        rstn : in std_logic
    );
end fifo8;

architecture Behavioral of fifo8 is

signal l_tx_valid, l_tx_ready : std_logic := '0';

type arr is array(FIFO_DEPTH-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
signal fifo : arr := (others => (others => '0'));
signal fifoCnt : integer := 0;
signal fifoHead, fifoTail : integer range 0 to FIFO_DEPTH-1 := 0;

begin

out_axi_tdata <= fifo(fifoHead);
l_tx_valid <= rstn when fifoCnt > 0 else '0';

out_axi_tvalid <= l_tx_valid;
l_tx_ready <= out_axi_tready;

PROC: process(clk)
begin
    if clk'event and clk = '1' then
        if rstn = '0' then
        
        else
                      
            -- READ AND WRITE
            if in_en = '1' and l_tx_valid = '1' and l_tx_ready = '1' then
                fifo(fifoTail) <= din;
                fifoTail <= (fifoTail + 1) mod FIFO_DEPTH;
                fifoHead <= (fifoHead + 1) mod FIFO_DEPTH;
                fifoCnt <= fifoCnt;
            -- READ
            elsif in_en = '1' and fifoCnt < FIFO_DEPTH then
                fifo(fifoTail) <= din;
                fifoTail <= (fifoTail + 1) mod FIFO_DEPTH;
                fifoCnt <= fifoCnt + 1;
            -- WRITE
            elsif l_tx_valid = '1' and l_tx_ready = '1' then
                fifoHead <= (fifoHead + 1) mod FIFO_DEPTH;
                fifoCnt <= fifoCnt - 1;
            else
                fifoCnt <= fifoCnt;
            end if;
        end if;
    end if;
end process;

end Behavioral;
