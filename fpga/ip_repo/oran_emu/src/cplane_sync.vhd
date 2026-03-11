----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2024 21:02:29
-- Design Name: 
-- Module Name: cplane_sync - Behavioral
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

entity cplane_sync is
    generic (
        AXI_WIDTH : integer := 32
    );
    Port ( 
        -- INPUT AXI
        rxCplane_axi_tdata : in std_logic_vector(AXI_WIDTH-1 downto 0);
        rxCplane_axi_tvalid : in std_logic;
        rxCplane_axi_tlast : in std_logic;
        rxCplane_axi_tready : out std_logic;
        
        -- OUTPUT AXI
        txCplane_axi_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
        txCplane_axi_tvalid : out std_logic;
        txCplane_axi_tlast : out std_logic;
        txCplane_axi_tready : in std_logic;
        
        -- CONTROL SIGNALS
        cplane_start : in std_logic;
        
        -- CLK AND RESET
        clk: in std_logic;
        rstn: in std_logic    
    );
end cplane_sync;

architecture Behavioral of cplane_sync is

constant nWordsPkt : integer := 16; -- Needs 6 more words to minimum MTU (46 Bytes)
constant FIFO_DEPTH : integer := 16;

signal wordCnt : integer := 0;

type arr is array(FIFO_DEPTH-1 downto 0) of std_logic_vector(AXI_WIDTH-1 downto 0);
signal fifo : arr := (others => (others => '0'));

type maq_est is (IDLE, BUFF, SEND, LAT, CHECK);
signal fsm : maq_est := BUFF;

signal l_rx_valid, l_rx_ready : std_logic := '0';
signal l_tx_valid, l_tx_ready, l_tx_last : std_logic := '0';

signal fifoCnt : integer := 0;
signal fifoHead, fifoTail : integer range 0 to FIFO_DEPTH-1 := 0;

signal ids_1, ids_2, ids_3: std_logic_vector(17 downto 0) := (others => '0');

begin

-- FRAME ID -> FIFO(6)(31 downto 24) [8 bits]
-- SUBFRAME ID -> FIFO(7)(7 downto 4) [4 bits]
-- SLOT ID -> FIFO(7)(3 downto 0) & FIFO(7)(9 downto 8) [6 bits]
ids_1 <= fifo(6)(31 downto 24) & fifo(7)(7 downto 0) & fifo(7)(15 downto 14);
ids_3 <= fifo(5)(31 downto 24) & fifo(6)(7 downto 0) & fifo(6)(15 downto 14);

l_rx_ready <= rstn when fifoCnt < FIFO_DEPTH else '0';
l_tx_valid <= rstn when fifoCnt > 0 and fsm = SEND else '0';
l_tx_last <= rstn when (wordCnt = nWordsPkt-1 and fsm = SEND) else '0';
txCplane_axi_tdata <= fifo(fifoHead) when fsm = SEND else (others => '0');

l_rx_valid <= rxCplane_axi_tvalid;
l_tx_ready <= txCplane_axi_tready;

rxCplane_axi_tready <= l_rx_ready;
txCplane_axi_tvalid <= l_tx_valid;
txCplane_axi_tlast <= l_tx_last;


FSM_P: process(clk)
begin
    if clk'event and clk='1' then
        if rstn = '0' then
            fifoCnt <= 0;
        else
            case fsm is
                when BUFF =>
                    if l_rx_valid = '1' and l_rx_ready = '1' then
                        if (fifoCnt < FIFO_DEPTH-1) then
                            fsm <= BUFF;
                        else
                            fsm <= IDLE;
                        end if;
                    else
                        fsm <= BUFF;
                    end if;
                when IDLE =>
                    if cplane_start = '1' then
                        ids_2 <= ids_1;
                        wordCnt <= 0;
                        fsm <= SEND;
                    else
                        fsm <= IDLE;
                    end if;
                when SEND =>
                    if l_tx_valid = '1' and l_tx_ready = '1' then
                        if (wordCnt < nWordsPkt-1) then
                            wordCnt <= wordCnt + 1;
                            fsm <= SEND;
                        else
                            if(fifoCnt = 0) then
                                fsm <= BUFF;
                            elsif (ids_1 = ids_2) then
                                wordCnt <= 0;
                                fsm <= SEND;
                            else
                                fsm <= IDLE;
                            end if;
                        end if;
                    else
                        fsm <= SEND;
                    end if;
                when CHECK =>
                    if(fifoCnt = 0) then
                        fsm <= BUFF;
                    else
                        if (ids_1 = ids_2) then
                            wordCnt <= 0;
                            fsm <= SEND;
                        else
                            fsm <= IDLE;
                        end if;
                    end if;
                when others =>
            end case;
            
            -- WRITE ON FIFO
            if l_rx_valid = '1' and l_rx_ready = '1' then
                fifo(fifoTail) <= rxCplane_axi_tdata;
                fifoTail <= (fifoTail + 1) mod FIFO_DEPTH;
            end if;
            
            -- READ FIFO
            if l_tx_valid = '1' and l_tx_ready = '1' then
                fifoHead <= (fifoHead + 1) mod FIFO_DEPTH;
            end if;
            
            -- FIFO COUNT UPDATE
            if (l_rx_valid = '1' and l_rx_ready = '1' and l_tx_valid = '1' and l_tx_ready = '1') then
                fifoCnt <= fifoCnt;
            elsif l_rx_valid = '1' and l_rx_ready = '1' then
                fifoCnt <= fifoCnt + 1;
            elsif l_tx_valid = '1' and l_tx_ready = '1' then
                fifoCnt <= fifoCnt - 1;
            end if;
        end if;
    end if;
end process;


end Behavioral;
