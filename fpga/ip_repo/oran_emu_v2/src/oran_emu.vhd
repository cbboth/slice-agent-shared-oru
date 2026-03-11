----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.04.2024 23:39:39
-- Design Name: 
-- Module Name: oran_emu - Behavioral
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

entity oran_emu is
    Generic(
        AXI_CLK_MHZ : integer := 150
    );
    Port (
        -- INPUT CMD
        start_sgn : in std_logic;
    
        -- CONFIGURATION SIGNALS (RECEIVED FROM PYTHON)
        cfg_frameID : in std_logic_vector(7 downto 0);
        cfg_subframeID : in std_logic_vector(3 downto 0);
        cfg_slotID : in std_logic_vector(5 downto 0);
        cfg_mu: in std_logic_vector(3 downto 0);
        cfg_slotStep : in std_logic_vector(3 downto 0);
        cfg_maxSlotId : in std_logic_vector(5 downto 0);
        symbT : in std_logic_vector(23 downto 0);
        slotT : in std_logic_vector(23 downto 0);
        minTime2Proc : in std_logic_vector(23 downto 0);
        
        -- OUTPUT SIGNALS
        frameID : out std_logic_vector(7 downto 0);
        subFrameID : out std_logic_vector(3 downto 0);
        slotID : out std_logic_vector(5 downto 0);
        symbolID : out std_logic_vector(3 downto 0);
        nxt_frameID : out std_logic_vector(7 downto 0);
        nxt_subFrameID : out std_logic_vector(3 downto 0);
        nxt_slotID : out std_logic_vector(5 downto 0);
        mu : out std_logic_vector(3 downto 0);
        
        -- OUTPUT SIGNALS
        lphy_start : out std_logic;
        cplane_start : out std_logic;
        
        -- CLK and RST
        clk : in std_logic;
        rstn: in std_logic
    );
end oran_emu;

architecture Behavioral of oran_emu is

signal cfg_symbT : integer := 0;        -- Symbol duration in n° of clk
signal cfg_slotT : integer := 0;        -- Slot duration in n° of clk (symbT * 14)
signal cfg_nClk2FProc : integer := 0;   -- N° of clk to first c-plane receive

-- LOCAL SIGNALS

signal l_frameID : std_logic_vector(7 downto 0) := (others => '0');
signal l_subframeID : std_logic_vector(3 downto 0) := (others => '0');
signal l_slotID : std_logic_vector(5 downto 0) := (others => '0');
signal l_symbID : std_logic_vector(3 downto 0) := (others => '0');
signal l_mu : std_logic_vector(3 downto 0) := (others => '0');

signal slotStep : unsigned(3 downto 0) := (others => '0');
constant MAX_FRAMEID : std_logic_vector(7 downto 0) := x"FF";
constant MAX_SUBFRAMEID : std_logic_vector(3 downto 0) := x"9";
constant MAX_SYMBID: std_logic_vector(3 downto 0) := x"D";
signal MAX_SLOTID : std_logic_vector(5 downto 0) := (others => '0');


signal symbDur: integer := 0;
signal symb_clk, symb_clk_cpy : std_logic := '0';

signal en_Rx : std_logic := '0';
signal nClk2FirstProc : integer := 0;
signal nClk2Proc : integer := 0;
signal slotDur : integer := 0;

type maq_est is (CFG, RUN_1ST, RUN, ENABLE);
signal fsm : maq_est := CFG;

-- Counters
signal symbCnt : integer := 0;
signal cnt2Proc : integer := 0;

begin

lphy_start <= symb_clk;
cplane_start <= en_Rx;
cfg_symbT <= to_integer(unsigned(symbT));
cfg_slotT <= to_integer(unsigned(slotT));
cfg_nClk2FProc <= to_integer(unsigned(minTime2Proc));

frameID <= l_frameID;
subFrameID <= l_subFrameID;
slotID <= l_slotID;
symbolID <= l_symbID;
mu <= l_mu;
            
SYMB_PROC: process(clk)
begin
    if clk'event and clk = '1' then
        case fsm is
            when CFG =>
                symb_clk <= '0';
                symbCnt <= 0;
                symbDur <= cfg_symbT;
            when others =>
                if (symbCnt < symbDur-1) then
                    symb_clk <= '0';
                    symbCnt <=  symbCnt + 1;
                else
                    symbCnt <= 0;
                    symb_clk <= '1';
                end if;
        end case;
    end if;
end process;

nxt_slotID <= std_logic_vector(unsigned(l_slotID) + slotStep) when l_slotID < MAX_SLOTID else (others => '0');
nxt_subframeId <=   l_subframeID when l_slotID < MAX_SLOTID else
                    std_logic_vector(unsigned(l_subframeID) + "1") when l_subframeID < MAX_SUBFRAMEID else 
                    (others => '0');
nxt_frameId <=  l_frameID when l_subframeID < MAX_SUBFRAMEID else
                std_logic_vector(unsigned(l_frameID) + "1") when l_frameID < MAX_FRAMEID else 
                (others => '0');
                
symb_clk_cpy <= symb_clk;
IDs_PROC: process(clk)
begin
    if clk'event and clk = '1' then
        case fsm is
            when CFG =>
                l_symbID <= (others => '0');
                l_slotID <= cfg_slotID;
                l_subframeID <= cfg_subframeID;
                l_frameID <= cfg_frameID;
                MAX_SLOTID <= cfg_maxSlotId;
                slotStep <= unsigned(cfg_slotStep);
                l_mu <= cfg_mu;
            when others =>
                if symb_clk_cpy = '1' then
                    if(l_symbID < MAX_SYMBID) then
                        l_symbID <= std_logic_vector(unsigned(l_symbID) + "1");
                    else
                        l_symbID <= (others => '0');
                        if (l_slotID < MAX_SLOTID) then
                            l_slotID <= std_logic_vector(unsigned(l_slotID) + slotStep);
                        else
                            l_slotID <= (others => '0');
                            if(l_subframeID < MAX_SUBFRAMEID) then
                                l_subframeID <= std_logic_vector(unsigned(l_subframeID) + "1");
                            else
                                l_subframeID <= (others => '0');
                                if(l_frameID < MAX_FRAMEID) then
                                    l_frameID <= std_logic_vector(unsigned(l_frameID) + "1");
                                else
                                    l_frameID <= (others => '0');
                                end if;
                            end if;
                        end if;
                    end if;
                end if;
        end case;
    end if;
end process;

-------------------------------------------------------------------------------
-- FSM process
FSM_PROC: process(clk)
begin
if clk'event and clk = '1' then
    if rstn = '0' then
        fsm <= CFG;
    else
        case fsm is
            when CFG =>
                if (start_sgn = '1') then
                    fsm <= RUN_1ST;
                else
                    fsm <= CFG;
                end if;
            when RUN_1ST =>
                if (cnt2Proc > 0) then
                    fsm <= RUN_1ST;
                else
                    fsm <= ENABLE;
                end if;
            when RUN =>
                if (start_sgn = '0') then
                    fsm <= CFG;
                else
                    if (cnt2Proc > 1) then
                        fsm <= RUN;
                    else
                        fsm <= ENABLE;
                    end if;
                end if;
            when ENABLE =>
                fsm <= RUN;
        end case;
    end if;
end if;
end process;

-- C-PLANE ENABLER
en_Rx <= rstn when fsm = ENABLE else '0';

CPLANE_PROC: process(clk)
begin
if clk'event and clk = '1' then
    if rstn = '0' then
        cnt2Proc <= 0;
        nClk2FirstProc <= 0;
        nClk2Proc <= 0;
    else
        case fsm is
            when CFG =>
                nClk2FirstProc <= cfg_nClk2FProc;
                nClk2Proc <= cfg_slotT;
                cnt2Proc <= cfg_nClk2FProc-1;
            when RUN_1ST =>
                cnt2Proc <= cnt2Proc - 1;
            when RUN =>
                cnt2Proc <= cnt2Proc - 1;
            when ENABLE =>
                cnt2Proc <= nClk2Proc-1;
        end case;
    end if;
end if;
end process;


end Behavioral;
