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
        AXI_WIDTH : integer := 64
    );
    Port ( 
        -- INPUT AXI
        rxCplane_axi_tdata : in std_logic_vector(AXI_WIDTH-1 downto 0);
        rxCplane_axi_tvalid : in std_logic;
        rxCplane_axi_tlast : in std_logic;
        rxCplane_axi_tready : out std_logic;
        
        -- INPUT REC TIME AXI
        recT_axi_tdata: in std_logic_vector(31 downto 0);
        recT_axi_tvalid: in std_logic;
        recT_axi_tready: out std_logic;
        
        -- OUTPUT AXI
        txCplane_axi_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
        txCplane_axi_tvalid : out std_logic;
        txCplane_axi_tlast : out std_logic;
        txCplane_axi_tready : in std_logic;
        
        -- CONTROL SIGNALS
        clkCnt : in std_logic_vector(47 downto 0);
        cplane_start : in std_logic;
        
        -- CLK AND RESET
        clk: in std_logic;
        rstn: in std_logic    
    );
end cplane_sync;

architecture Behavioral of cplane_sync is

signal nWordsPkt : integer := 8; -- Needs 6 more words to minimum MTU (46 Bytes)

signal wordCnt : integer := 0;

type maq_est is (IDLE, READTIME, SEND, LAT, CHECK);
signal fsm : maq_est := READTIME;

signal l_tx_valid, l_tx_ready, l_tx_last : std_logic := '0';
signal l_rt_valid, l_rt_ready : std_logic := '0';
signal recTime: std_logic_vector(31 downto 0) := (others => '0');

--signal swapWord : std_logic_vector(AXI_WIDTH-1 downto 0);

begin

rxCplane_axi_tready <= l_tx_ready when fsm = SEND else '0';

txCplane_axi_tdata <= rxCplane_axi_tdata;
txCplane_axi_tvalid <= l_tx_valid;
txCplane_axi_tlast <= l_tx_last;
l_tx_ready <= txCplane_axi_tready;

l_tx_valid <= rxCplane_axi_tvalid when fsm = SEND else '0';
l_tx_last <= rstn when (wordCnt = nWordsPkt-1 and fsm = SEND) else '0';

l_rt_valid <= recT_axi_tvalid;
l_rt_ready <= rstn when (fsm = READTIME) else '0';
recT_axi_tready <= l_rt_ready;

NPKT_32: if AXI_WIDTH = 32 generate
    nWordsPkt <= 16;
    --swapWord <= rxCplane_axi_tdata;
end generate;
    
NPKT_64: if AXI_WIDTH = 64 generate
    nWordsPkt <= 8;
    --swapWord <= rxCplane_axi_tdata(31 downto 0) & rxCplane_axi_tdata(63 downto 32);
end generate;

FSM_P: process(clk)
begin
    if clk'event and clk='1' then
        if rstn = '0' then
            fsm <= READTIME;
            recTime <= (others => '0');
        else
            case fsm is
                when READTIME =>
                    if (l_rt_valid = '1' and l_rt_ready = '1') then
                        recTime <= recT_axi_tdata;
                        fsm <= IDLE;
                    end if;
                when IDLE =>
                    if recTime <= clkCnt(31 downto 0) then
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
                            fsm <= READTIME;
                        end if;
                    else
                        fsm <= SEND;
                    end if;
                when others =>
            end case;
        end if;
    end if;
end process;

end Behavioral;
