----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2024 21:30:09
-- Design Name: 
-- Module Name: uart_rec - Behavioral
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

entity uart_rec is  
    Port ( 
    
        -- UART RX AXI
        Rx_AXI_tdata : in std_logic_vector(7 downto 0);
        Rx_AXI_tvalid : in std_logic;
        Rx_AXI_tready : out std_logic;
        
        -- DATA OUTPUT
        start_emu : out std_logic;
        send_metrics : out std_logic;
        
        frameID : out std_logic_vector(7 downto 0);
        subframeID : out std_logic_vector(3 downto 0);
        slotID: out std_logic_vector(5 downto 0);
        mu: out std_logic_vector (3 downto 0);
        slotStep : out std_logic_vector(3 downto 0);
        maxSlotId: out std_logic_vector(5 downto 0);
        symbT: out std_logic_vector(23 downto 0);
        slotT: out std_logic_vector(23 downto 0);
        minTime2Proc: out std_logic_vector(23 downto 0);
        nIQSamples: out std_logic_vector(23 downto 0);
        cfg_iqWidth : out STD_LOGIC_VECTOR ( 5 downto 0 );
        cfg_maxPRBPkt : out STD_LOGIC_VECTOR ( 15 downto 0 );
        
        recT_axi_tdata: out std_logic_vector(31 downto 0);
        recT_axi_tvalid: out std_logic;
        recT_axi_tready: in std_logic;
        
        -- SLICE
        addSlice : out std_logic;
        rmSlice : out std_logic;
        ecpriID : out std_logic_vector(15 downto 0);
        sliceType : out std_logic_vector(3 downto 0);
        
        -- DBG
        dbg_state : out std_logic_vector(3 downto 0);
        
        -- CLK and RESET
        clk: in std_logic;
        rstn: in std_logic
    );
end uart_rec;

architecture Behavioral of uart_rec is

signal l_rx_ready, l_rx_valid : std_logic := '0';
signal rx_cmd : std_logic_vector(7 downto 0) := (others => '0');
signal rx_data : std_logic_vector(23 downto 0) := (others => '0');
signal recTime : std_logic_vector(31 downto 0) := (others => '0');
signal l_snd_met : std_logic := '0';

type maq_est is (START, CMD, DATA_LOW, DATA_HIGH, DATA_HIGH2, SAVE);
signal fsm : maq_est := START;

-- CONSTANTS
constant CMD_START : std_logic_vector(7 downto 0) := x"35";
constant CMD_SETFRAMEID: std_logic_vector(7 downto 0) := x"A0";
constant CMD_SETSUBFRAMEID: std_logic_vector(7 downto 0) := x"A1";
constant CMD_SETSLOTID: std_logic_vector(7 downto 0) := x"A2";
constant CMD_SETMU: std_logic_vector(7 downto 0) := x"A3";
constant CMD_SETSLOTSTEP: std_logic_vector(7 downto 0) := x"A4";
constant CMD_SETMAXSLOTID: std_logic_vector(7 downto 0) := x"A5";
constant CMD_SETSYMBPERIOD: std_logic_vector(7 downto 0) := x"A6";
constant CMD_SETSLOTPERIOD: std_logic_vector(7 downto 0) := x"A7";
constant CMD_SETMINPROCTIME: std_logic_vector(7 downto 0) := x"A8";
constant CMD_SETIQNUM: std_logic_vector(7 downto 0) := x"A9";
constant CMD_SETIQWIDTH: std_logic_vector(7 downto 0) := x"AA";
constant CMD_SETMAXPRBPKT: std_logic_vector(7 downto 0) := x"AB";
constant CMD_STARTEMU: std_logic_vector(7 downto 0) := x"B0";
constant CMD_STOPEMU: std_logic_vector(7 downto 0) := x"B1";
constant CMD_SENDMETRICS : std_logic_vector(7 downto 0) := x"B2";
constant CMD_ADDSLICE : std_logic_vector(7 downto 0) := x"B3";
constant CMD_RMSLICE : std_logic_vector(7 downto 0) := x"B4";
constant CMD_ADDRECTIME : std_logic_vector(7 downto 0) := x"B5";

begin

dbg_state <= "0001" when fsm = START else
             "0010" when fsm = CMD else
             "0100" when fsm = DATA_LOW else
             "1000" when fsm = DATA_HIGH else
             "1111";

l_rx_ready <= rstn when (fsm /= SAVE) else '0';
Rx_AXI_tready <= l_rx_ready;
l_rx_valid <= Rx_AXI_tvalid;
send_metrics <= l_snd_met;

recT_axi_tdata <= recTime;

FSM_PROC: process(clk)
begin
if clk'event and clk = '1' then
    if rstn = '0' then
        fsm <= START;
        rx_cmd <= (others => '0');
        rx_data <= (others => '0');
    else
        case fsm is
            when START =>
                if (l_rx_ready = '1' and l_rx_valid = '1') then
                    if (Rx_AXI_tdata = CMD_START) then
                        fsm <= CMD;
                    else
                        fsm <= START;
                    end if;
                else
                    fsm <= START;
                end if;
            when CMD =>
                if (l_rx_ready = '1' and l_rx_valid = '1') then
                    rx_cmd <= Rx_AXI_tdata;
                    fsm <= DATA_LOW;
                else
                    fsm <= CMD;
                end if;
            when DATA_LOW =>
                if (l_rx_ready = '1' and l_rx_valid = '1') then
                    rx_data(7 downto 0) <= Rx_AXI_tdata;
                    fsm <= DATA_HIGH;
                else
                    fsm <= DATA_LOW;
                end if;
            when DATA_HIGH =>
                if (l_rx_ready = '1' and l_rx_valid = '1') then
                    rx_data(15 downto 8) <= Rx_AXI_tdata;
                    fsm <= DATA_HIGH2;
                else
                    fsm <= DATA_HIGH;
                end if;
            when DATA_HIGH2 =>
                if (l_rx_ready = '1' and l_rx_valid = '1') then
                    rx_data(23 downto 16) <= Rx_AXI_tdata;
                    fsm <= SAVE;
                else
                    fsm <= DATA_HIGH2;
                end if;
            when SAVE =>
                fsm <= START;
        end case;
    end if;
end if;
end process;

DECODE_PROC: process (clk)
begin
    if clk'event and clk = '1' then
        if rstn = '0' then
            frameID <= (others => '0');
            subframeID <= (others => '0');
            slotID <= "111111"; -- Put an ilegal value as default to force the change and trigger teh sched proc next calculation
            mu <= (others => '0');
            slotStep <= (others => '0');
            maxSlotId <= (others => '0');
            symbT <= (others => '0');
            slotT <= (others => '0');
            minTime2Proc <= (others => '0');
            start_emu <= '0';
            l_snd_met <= '0';
            nIQSamples <= (others => '0');
            ecpriID <= (others => '0');
            sliceType <= (others => '0');
            recT_axi_tvalid <= '0';
            recTime <= (others => '0');
        else
            if fsm = SAVE then
                case rx_cmd is
                    when CMD_SETFRAMEID =>
                        frameID <= rx_data(7 downto 0);
                    when CMD_SETSUBFRAMEID =>
                        subframeID <= rx_data(3 downto 0);
                    when CMD_SETSLOTID =>
                        slotID <= rx_data(5 downto 0);
                    when CMD_SETMU =>
                        mu <= rx_data(3 downto 0);
                    when CMD_SETSLOTSTEP =>
                        slotStep <= rx_data(3 downto 0);
                    when CMD_SETMAXSLOTID =>
                        maxSlotId <= rx_data(5 downto 0);
                    when CMD_SETSYMBPERIOD =>
                        symbT <= rx_data;
                    when CMD_SETSLOTPERIOD =>
                        slotT <= rx_data;
                    when CMD_SETMINPROCTIME =>
                        minTime2Proc <= rx_data;
                    when CMD_SETIQNUM =>
                        nIQSamples <= rx_data(23 downto 0);
                    when CMD_SETIQWIDTH =>
                        cfg_iqWidth <= rx_data(5 downto 0);
                    when CMD_SETMAXPRBPKT =>
                        cfg_maxPRBPkt <= rx_data(15 downto 0);
                    when CMD_STARTEMU =>
                        start_emu <= '1';
                        --l_snd_met <= '1';
                    when CMD_STOPEMU =>
                        start_emu <= '0';
                        l_snd_met <= '0';
                    when CMD_SENDMETRICS =>
                        l_snd_met <= '1'; 
                    when CMD_ADDSLICE =>
                        addSlice <= '1';
                        ecpriID <= rx_data(15 downto 0);
                        sliceType <= rx_data(19 downto 16);
                    when CMD_RMSLICE =>
                        rmSlice <= '1';
                        ecpriID <= rx_data(15 downto 0);
                    when CMD_ADDRECTIME =>
                        recTime <= x"00" & rx_data;
                        recT_axi_tvalid <= '1';
                    when others =>
                end case;
            else
                recTime <= (others => '0');
                recT_axi_tvalid <= '0';
                rmSlice <= '0';
                addSlice <= '0';
                l_snd_met <= '0';
            end if;
        end if;
    end if;
end process;


end Behavioral;