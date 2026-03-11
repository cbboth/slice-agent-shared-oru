----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2024 11:25:59
-- Design Name: 
-- Module Name: encapsulation - Behavioral
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

entity encapsulation is
  Generic (
    IN_WIDTH : integer := 64;
    LPHY_WIDTH: integer := 32;
    OUT_WIDTH : integer := 32
  );
  Port ( 
    -- SCHED DATA AXI
    SchD_AXI_tdata : in std_logic_vector(IN_WIDTH-1 downto 0);
    SchD_AXI_tvalid: in std_logic;
    SchD_AXI_tlast: in std_logic;
    SchD_AXI_tready: out std_logic;
    SchD_isEmpty: in std_logic;
    
    -- LOW PHY DATA AXI
    LPHY_AXI_tdata : in std_logic_vector(LPHY_WIDTH-1 downto 0);
    LPHY_AXI_tvalid: in std_logic;
    LPHY_AXI_tlast: in std_logic;
    LPHY_AXI_tready: out std_logic;
    
    LPHY_START_BYTE : out std_logic_vector(15 downto 0);
    LPHY_START_valid : out std_logic;
    
    -- OUT CONTROL AXI
    TxC_AXI_tdata : out std_logic_vector(OUT_WIDTH-1 downto 0);
    TxC_AXI_tvalid: out std_logic;
    TxC_AXI_tlast: out std_logic;
    TxC_AXI_tready: in std_logic;
    
    -- OUT DATA AXI
    TxD_AXI_tdata : out std_logic_vector(OUT_WIDTH-1 downto 0);
    TxD_AXI_tvalid: out std_logic;
    TxD_AXI_tlast: out std_logic;
    TxD_AXI_tready: in std_logic;
    TxD_AXI_tstrb: out std_logic_vector((OUT_WIDTH/8)-1 downto 0);
    
    -- Control signals
    dstMAC: in std_logic_vector(47 downto 0);
    srcMAC: in std_logic_vector(47 downto 0);
    frameId: in std_logic_vector(7 downto 0);
    subFrameId: in std_logic_vector(3 downto 0);
    slotId: in std_logic_vector(5 downto 0);
    symbolId: in std_logic_vector(3 downto 0);
    
    -- Configuration
    cfg_iqWidth : in std_logic_vector(5 downto 0);
    
    -- DEBUG
    dbg_cap_bgn : out std_logic;
    dbg_cap_end : out std_logic;
    dbg_cap_ecpri: out std_logic_vector(15 downto 0);
    dbg_cap_fsm : out std_logic_vector(7 downto 0);
    dbg_cap_axis: out std_logic_vector(7 downto 0);
    
    -- CLK AND RESET
    clk : in std_logic;
    rst : in std_logic
  
  );
end encapsulation;

architecture Behavioral of encapsulation is

-- Ethernet header
signal ethHeader: std_logic_vector(143 downto 0) := (others => '0');
--signal dstMAC: std_logic_vector(47 downto 0) := (others => '0');
--signal srcMAC: std_logic_vector(47 downto 0) := (others => '0');
--signal vlanTPID: std_logic_vector(15 downto 0) := x"8100";                  -- FIXED 0x8100
signal vlanTPID: std_logic_vector(15 downto 0) := x"8100";                  -- FIXED 0x8100
signal vlanPCP: std_logic_Vector(2 downto 0) := (others => '0');            -- FIXED 0x00
signal vlanDEI: std_logic := '0';                                           -- FIXED 0x00
signal vlanID: std_logic_vector(11 downto 0) := (others => '0');
signal ethType : std_logic_vector(15 downto 0) := x"AEFE";                  -- ETH type for ecrpi

-- Transport header
signal tptHeader: std_logic_vector(63 downto 0) := (others => '0');
signal ecpriVersion: std_logic_vector(3 downto 0) := "0001";                -- FIXED 0x01 (version 1.0)
signal ecrpiRes: std_logic_vector(2 downto 0) := "000";                     -- FIXED 0x00 (Reserved)
signal ecpriConcat: std_logic := '0';                                       -- FIXED 0x00 (no concatenation)
signal ecpriMessage: std_logic_vector(7 downto 0) := (others => '0');       -- FIXED 0x00 (IQ data message)
signal ecrpiPayload: std_logic_vector(15 downto 0) := (others => '0');      -- eCPRI payload size
signal ecpriPcid: std_logic_vector(15 downto 0) := (others => '0');         -- eCPRI ID (IQ data transfer message series identifier)
signal ecpriSeqId: std_logic_vector(15 downto 0) := (others => '0');        -- FIXED 0x00 (Message identifier)

-- Application Header
signal appHeader: std_logic_vector(31 downto 0) := (others => '0');
signal dataDir: std_logic := '0';                                           -- FIXED 0x00 (Uplink)
signal payloadVer: std_logic_vector(2 downto 0) := "001";                   -- FIXED 0x01 (version 1.0)
signal filterIndex: std_logic_vector(3 downto 0) := (others => '0');        -- FIXED 0x00 (standard channel filter)
--signal frameId: std_logic_vector(7 downto 0) := (others => '0');            -- Frame ID (each 10 ms)
--signal subFrameId: std_logic_vector(3 downto 0) := (others => '0');         -- Subframe ID (each 1 ms)
--signal slotId: std_logic_vector(5 downto 0) := (others => '0');             -- Slot ID (0 to N-1). Depends on numerology
--signal symbolId: std_logic_vector(5 downto 0) := (others => '0');           -- Symbol ID (0 to 13)

-- Service Type Header
signal sTypeHeader: std_logic_vector(31 downto 0) := (others => '0');
signal sectionId: std_logic_vector(11 downto 0) := (others => '0');         -- FIXED 0x00 (no section used)
signal rb: std_logic := '0';                                                -- FIXED 0x00 (all prbs)
signal symInc: std_logic := '0';                                            -- FIXED 0x00 (no symbol Inc used)
signal startPrbu: std_logic_vector(9 downto 0) := (others => '0');          -- Start PRB
signal numPrbu: std_logic_vector(7 downto 0) := (others => '0');            -- Number of PRBs

-- Scheduling data
signal schedData, schedData_a : std_logic_vector(63 downto 0) := (others => '0');
signal vlan: std_logic_vector(11 downto 0) := (others => '0');
signal eCpriID: std_logic_vector(15 downto 0) := (others => '0');
signal numPRB: std_logic_vector(7 downto 0) := (others => '0');
signal startPRB: std_logic_vector(10 downto 0) := (others => '0');
signal packetLen: std_logic_vector(15 downto 0) := (others => '0');

type Arr is Array(9 downto 0) of std_logic_vector(OUT_WIDTH-1 downto 0);
signal hdrPkts : Arr := (others => (others => '0'));
signal hdrCnt, hdrNum : integer := 0;

type txc_pay is array (6 downto 0) of std_logic_vector (31 downto 0);
signal txC_pckt : txc_pay := (others => (others => '0'));

type maq_est is (IDLE, LOAD, SEND_CONTROL, SEND_TPT1, SEND_PAYLOAD, LAST_WORD);
signal fsm : maq_est := IDLE;

signal l_txD_tdataSwap : std_logic_vector(OUT_WIDTH-1 downto 0) := (others => '0');
signal l_sch_axi_tready, l_sch_axi_tvalid: std_logic;
signal l_txD_axi_tready, l_txD_axi_tvalid, l_txD_axi_tlast: std_logic;
signal l_txC_axi_tready, l_txC_axi_tvalid, l_txC_axi_tlast: std_logic;
signal l_lPhy_axi_tready, l_lPhy_axi_tvalid, l_lPhy_axi_tlast: std_logic;

constant APP_HDR : integer := 8;
signal cCnt: integer := 0;
signal nWperPkt, dnWperPkt, ethDRest : integer := 0;
signal splitOut : std_logic_vector(OUT_WIDTH-1 downto 0) := (others => '0');

signal nPRB : std_logic_vector(10 downto 0) := (others => '0');
signal dataLen : std_logic_vector(15 downto 0) := (others => '0');
signal l_stByte : std_logic_vector(15 downto 0) := (others => '0');

signal cData : std_logic_vector(OUT_WIDTH-1 downto 0);

begin

nPRB <= "000" & numPrbu;
g_SWAP64: for ii in 0 to ((OUT_WIDTH/8)-1) generate
        TxD_AXI_tdata(OUT_WIDTH-ii*8-1 downto OUT_WIDTH-ii*8-8) <= l_txD_tdataSwap(ii*8+7 downto ii*8);
end generate g_SWAP64;
--TxD_AXI_tdata <= l_txD_tdataSwap;

dbg_cap_fsm <=  "00000001" when fsm = IDLE else
                "00000010" when fsm = SEND_CONTROL else
                "00000100" when fsm = SEND_TPT1 else
                "00001000" when fsm = SEND_PAYLOAD else
                "00010000" when fsm = LAST_WORD else
                "00000000";

dbg_cap_axis(0) <= l_txC_axi_tready;
dbg_cap_axis(1) <= l_txC_axi_tvalid;
dbg_cap_axis(2) <= l_txD_axi_tready;
dbg_cap_axis(3) <= l_txD_axi_tvalid;
dbg_cap_axis(4) <= l_lPhy_axi_tready;
dbg_cap_axis(5) <= l_lPhy_axi_tvalid;
dbg_cap_axis(6) <= l_sch_axi_tready;
dbg_cap_axis(7) <= l_sch_axi_tvalid;

-- Ethernet
ethHeader(143 downto 96) <= dstMAC;
ethHeader(95 downto 48) <= srcMAC;
ethHeader(47 downto 32) <= vlanTPID;
ethHeader(31 downto 29) <= vlanPCP;
ethHeader(28) <= vlanDEI;
ethHeader(27 downto 16) <= vlanID;
ethHeader(15 downto 0) <= ethType;

-- Transport 
tptHeader(63 downto 60) <= ecpriVersion;
tptHeader(59 downto 57) <= ecrpiRes;
tptHeader(56) <= ecpriConcat;
tptHeader(55 downto 48) <= ecpriMessage;
tptHeader(47 downto 32) <= ecrpiPayload;
tptHeader(31 downto 16) <= ecpriPcid;
tptHeader(15 downto 0) <= ecpriSeqId;

-- Application
appHeader(31) <= dataDir;
appHeader(30 downto 28) <= payloadVer;
appHeader(27 downto 24) <= filterIndex;
appHeader(23 downto 16) <= frameId;
appHeader(15 downto 12) <= subFrameId;
appHeader(11 downto 6) <= slotId;
appHeader(5 downto 0) <= "00" & symbolId;

-- Service Type
sTypeHeader(31 downto 20) <= sectionId;
sTypeHeader(19) <= rb;
sTypeHeader(18) <= symInc;
sTypeHeader(17 downto 8) <= startPrbu;
sTypeHeader(7 downto 0) <= numPrbu;

-- Ethernet Header Data
vlanID <= vlan;
--vlanID <= x"111";

-- SCHED Data
vlan <= schedData(11 downto 0);
eCpriID <= schedData(27 downto 12);
numPRB <= schedData(35 downto 28);
startPRB <= schedData(46 downto 36);
packetLen <= std_logic_vector(unsigned(dataLen) + APP_HDR + 4);

-- Other signals
ecrpiPayload <= packetLen;
ecpriPcid <= eCpriID;
startPrbu <= startPRB(9 downto 0);
numPrbu <= numPRB;

l_sch_axi_tready <= rst when fsm = IDLE else '0';
l_sch_axi_tvalid <= SchD_AXI_tvalid when rst='1' else '0';
SchD_AXI_tready <= l_sch_axi_tready;

l_txD_axi_tvalid <= rst when (fsm = SEND_TPT1 or fsm = LAST_WORD) else
                    l_lPhy_axi_tvalid when (fsm = SEND_PAYLOAD) else
                    '0';
                    
l_txD_axi_tready <= TxD_AXI_tready when rst = '1' else '0';
l_txD_axi_tlast <=  rst when fsm = LAST_WORD else '0';

TxD_AXI_tvalid <= l_txD_axi_tvalid;
TxD_AXI_tlast <= l_txD_axi_tlast;
          
l_lPhy_axi_tready <= l_txD_axi_tready when (fsm = SEND_PAYLOAD) else '0';

LPHY_START_BYTE <= l_stByte;
LPHY_START_valid <= rst when fsm = SEND_TPT1 else '0';                     
LPHY_AXI_tready   <= l_lPhy_axi_tready;               
l_lPhy_axi_tvalid <= LPHY_AXI_tvalid when rst='1' else '0';
l_lPhy_axi_tlast  <= LPHY_AXI_tlast when rst ='1' else '0';

l_txD_tdataSwap <=  hdrPkts(0) when fsm = SEND_TPT1 else 
                    splitOut(OUT_WIDTH-1 downto OUT_WIDTH-16) & LPHY_AXI_tdata(OUT_WIDTH-1 downto 16) when (fsm = SEND_PAYLOAD or fsm = LAST_WORD) else
                    (others => '0');

schedData <= SchD_AXI_tdata when fsm = IDLE else schedData_a;

-- COntrol AXI
l_txC_axi_tready <= TxC_AXI_tready;
l_txC_axi_tvalid <= rst when fsm = SEND_CONTROL else '0';
l_txC_axi_tlast <= rst when fsm = SEND_CONTROL and cCnt = 5 else '0';
TxC_AXI_tvalid <= l_txC_axi_tvalid;
TxC_AXI_tlast <= l_txC_axi_tlast;

-- DEBUG
dbg_cap_bgn <= rst when (l_sch_axi_tvalid = '1' and l_sch_axi_tready = '1') else '0';
dbg_cap_end <= rst when (l_txD_axi_tvalid = '1' and l_txD_axi_tready = '1' and l_txD_axi_tlast = '1') else '0';
dbg_cap_ecpri <= SchD_AXI_tdata(27 downto 12) when fsm=IDLE else eCpriID;

TSTRB_32: if OUT_WIDTH = 32 generate
TxD_AXI_tstrb <= x"3" when fsm = LAST_WORD else x"F";
nWperPkt <= 4;
cData <= x"A0000000";
end generate;

TSTRB_64: if OUT_WIDTH = 64 generate
TxD_AXI_tstrb <= x"3F" when fsm = LAST_WORD else x"FF";
nWperPkt <= 8;
cData <= x"A000000000000000";
end generate;

dnWperPkt <= to_integer(to_unsigned(nWperPkt, 5) & "0"); -- Multiplication by 2

FSM_P: process(clk)
begin
    if clk'event and clk='1' then
        if rst = '0' then
            TxC_AXI_tdata <= cData;
            fsm <= IDLE;
            cCnt <= 0;
        else
            case fsm is
                when IDLE =>
                    if (l_sch_axi_tvalid = '1' and l_sch_axi_tready = '1') then
                        cCnt <= 0;
                        schedData_a <= SchD_AXI_tdata;
                        TxC_AXI_tdata <= cData;
                        fsm <= SEND_CONTROL;
                    else
                        fsm <= IDLE;
                    end if; 
                when SEND_CONTROL =>
                    if(l_txC_axi_tvalid = '1' and l_txC_axi_tready = '1') then
                        TxC_AXI_tdata <= (others => '0');
                        if(l_txC_axi_tlast = '1') then
                            fsm <= SEND_TPT1;
                        else
                            cCnt <= cCnt + 1;
                            fsm <= SEND_CONTROL;
                        end if;
                    end if;                    
                when SEND_TPT1 =>
                    if(l_txD_axi_tvalid = '1' and l_txD_axi_tready = '1') then
                        if(hdrCnt < hdrNum-2) then
                            fsm <= SEND_TPT1;
                        else
                            splitOut <= hdrPkts(1);
                            fsm <= SEND_PAYLOAD;
                        end if;
                    else
                        fsm <= SEND_TPT1;
                    end if;
                when SEND_PAYLOAD =>
                    if(l_txD_axi_tvalid = '1' and l_txD_axi_tready = '1') then
                        splitOut(OUT_WIDTH-1 downto OUT_WIDTH-16) <= LPHY_AXI_tdata(15 downto 0);
                        if (ethDRest < (to_integer(unsigned(dataLen)) - nWperPkt)) then
                            fsm <= SEND_PAYLOAD;
                        else
                            fsm <= LAST_WORD;
                        end if;
                    end if;
                when LAST_WORD =>
                    if(l_txD_axi_tvalid = '1' and l_txD_axi_tready = '1' and l_txD_axi_tlast = '1') then
                        fsm <= IDLE;
                    end if;          
                when others =>
                    fsm <= IDLE;
            end case;
        end if;
    end if;
end process;

HDROUT_32: if OUT_WIDTH = 32 generate
    HDROUT: process(clk)
    begin
        if clk'event and clk = '1' then
            if (rst = '0') then
            else
                case fsm is
                    when SEND_CONTROL =>
                        hdrPkts(0) <= ethHeader(143 downto 112);
                        hdrPkts(1) <= ethHeader(111 downto 80);
                        hdrPkts(2) <= ethHeader(79 downto 48);
                        hdrPkts(3) <= ethHeader(47 downto 16);
                        hdrPkts(4) <= ethHeader(15 downto 0) & tptHeader(63 downto 48);
                        hdrPkts(5) <= tptHeader(47 downto 16);
                        hdrPkts(6) <= tptHeader(15 downto 0) & appHeader(31 downto 16);
                        hdrPkts(7) <= appHeader(15 downto 0) & sTypeHeader(31 downto 16);
                        hdrPkts(8) <= sTypeHeader(15 downto 0) & x"0000";
                        hdrNum <= 9;
                        hdrCnt <= 0;
                    when SEND_TPT1 =>
                        if(l_txD_axi_tvalid = '1' and l_txD_axi_tready = '1') then
                            SHIFT_HDR: for i in 0 to 7 loop
                                hdrPkts(i) <= hdrPkts(i+1);
                            end loop;
                            hdrCnt <= hdrCnt + 1;
                        end if;
                    when others =>                        
                end case;
            end if;
        end if;
    end process;
end generate;

HDROUT_64: if OUT_WIDTH = 64 generate
    HDROUT: process(clk)
    begin
        if clk'event and clk = '1' then
            if (rst = '0') then
            else
                case fsm is
                    when SEND_CONTROL =>
                        hdrPkts(0) <= ethHeader(143 downto 80);
                        hdrPkts(1) <= ethHeader(79 downto 16);
                        hdrPkts(2) <= ethHeader(15 downto 0) & tptHeader(63 downto 16);
                        hdrPkts(3) <= tptHeader(15 downto 0) & appHeader(31 downto 0) & sTypeHeader(31 downto 16);
                        hdrPkts(4) <= sTypeHeader(15 downto 0) & x"000000000000";
                        hdrNum <= 5;
                        hdrCnt <= 0;
                    when SEND_TPT1 =>
                        if(l_txD_axi_tvalid = '1' and l_txD_axi_tready = '1') then
                            SHIFT_HDR: for i in 0 to 3 loop
                                hdrPkts(i) <= hdrPkts(i+1);
                            end loop;
                            hdrCnt <= hdrCnt + 1;
                        end if;
                    when others =>                        
                end case;
            end if;
        end if;
    end process;
end generate;

DATA_OUT: process (clk)
begin
    if clk'event and clk = '1' then
        if rst = '0' then
            ethDRest <= 0;
        else
            case fsm is
                when SEND_TPT1 =>
                    ethDRest <= 0;
                when SEND_PAYLOAD =>
                    if (l_lPhy_axi_tready = '1' and l_lPhy_axi_tvalid = '1') then
                        ethDRest <= ethDRest + nWperPkt;
                    end if;
                when others =>   
            end case;     
        end if;
    end if;
end process;

LEN_CALC: entity work.lenCalc_wrapper
port map(
    nPRB(10 downto 0) => nPRB,
    IQwidth(5 downto 0) => cfg_iqWidth,
    startPRB => startPRB,
    DataLen(15 downto 0) => dataLen,
    minPRBSize => std_logic_vector(to_unsigned(3, 2)),
    startByte => l_stByte,
    
    clk => clk
);

end Behavioral;
