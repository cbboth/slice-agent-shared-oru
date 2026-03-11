----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2024 08:34:58
-- Design Name: 
-- Module Name: recProc - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity recProc is
    generic(
        IN_WIDTH : integer := 32;
        OUT_WIDTH : integer := 128;
        DATA_OFFSET: integer := 0
    );
    Port (
        -- DATA AXI INPUT
        RxD_AXIS_0_tdata : in std_logic_vector(IN_WIDTH-1 downto 0);
        RxD_AXIS_0_tvalid: in std_logic;
        RxD_AXIS_0_tlast: in std_logic;
        RxD_AXIS_0_tready: out std_logic;
        
        -- AXI_OUTPUT SLICE TYPE N
        M_AXIS_0_tdata : out std_logic_vector(OUT_WIDTH-1 downto 0);
        M_AXIS_0_tvalid : out std_logic;
        M_AXIS_0_tlast : out std_logic;
        M_AXIS_0_tready : in std_logic;
        
        -- AXI_OUTPUT SLICE TYPE N-1
        M_AXIS_1_tdata : out std_logic_vector(OUT_WIDTH-1 downto 0);
        M_AXIS_1_tvalid : out std_logic;
        M_AXIS_1_tlast : out std_logic;
        M_AXIS_1_tready : in std_logic;
        
        -- slice check
        eCpriIDCheck: out std_logic_vector(15 downto 0);
        sliceType: in std_logic_vector(3 downto 0);
        isSliceTypeValid: in std_logic;

        -- CLK AND RESET
        s_aclk : in std_logic;
        s_arstn : in std_logic;
        
        -- DEBUG
        dbg_rec: out std_logic;
        dbg_rec_ecpri: out std_logic_vector(15 downto 0)
    );
end recProc;

architecture Behavioral of recProc is

    signal clk, rst : std_logic;

    signal cntData : unsigned(3 downto 0) := (others => '0');
    signal doTransfer : std_logic := '0';

    signal l_rxDAxis_tready : std_logic := '0';
    signal l_rxDAxis_tlast : std_logic := '0';
    signal l_rxDAxis_tvalid : std_logic := '0';
    signal l_rxDAxis_tdata : std_logic_vector (IN_WIDTH-1 downto 0);
    
    signal ethData_swap : std_logic_vector (IN_WIDTH-1 downto 0);

    signal l_mAxis_tready : std_logic := '0';
    signal l_mAxis_tlast : std_logic := '0';
    signal l_mAxis_tvalid : std_logic := '0';

    signal vlan : std_logic_vector(11 downto 0) := (others => '0');
    signal eCpriMes: std_logic_vector(7 downto 0) := (others => '0');
    signal dataDir: std_logic := '0';
    signal eCpriId: std_logic_vector(15 downto 0) := (others => '0');
    signal frameId: std_logic_vector(7 downto 0) := (others => '0');
    signal subFrameId: std_logic_vector(3 downto 0) := (others => '0');
    signal slotId: std_logic_vector(5 downto 0) := (others => '0');
    signal startSymb: std_logic_vector(5 downto 0) := (others => '0');
    signal sectionType: std_logic_vector(7 downto 0) := (others => '0');
    signal startPRB: std_logic_vector(9 downto 0) := (others => '0');
    signal numPRB: std_logic_vector(7 downto 0) := (others => '0');
    signal numSymb: std_logic_vector (3 downto 0) := (others => '0');

    signal l_sliceType: std_logic_vector(3 downto 0);
    constant sTypeN: std_logic_vector(3 downto 0) := x"1";    -- Slice that will process in the same slot (n)
    constant sTypeN1: std_logic_vector(3 downto 0) := x"2";   -- Slice that will process in the next slot (n-1)
    
    signal d_out : std_logic_vector(OUT_WIDTH-1 downto 0) := (others => '0');

    type maq_est is (RECDATA, TRANSFER);
    signal fsm : maq_est := RECDATA;

begin

--    g_SWAP32: if IN_WIDTH = 32 generate
--    ethData_swap(31 downto 24) <= data_in(0)(7 downto 0);
--    ethData_swap(23 downto 16) <= data_in(0)(15 downto 8);
--    ethData_swap(15 downto 8) <= data_in(0)(23 downto 16);
--    ethData_swap(7 downto 0) <= data_in(0)(31 downto 24);
--    end generate g_SWAP32;
    
    g_SWAP64: for ii in 0 to ((IN_WIDTH/8)-1) generate
        ethData_swap(IN_WIDTH-ii*8-1 downto IN_WIDTH-ii*8-8) <= l_rxDAxis_tdata(ii*8+7 downto ii*8);
    end generate g_SWAP64;

    eCpriIDCheck <= eCpriId;

    clk <= s_aclk;
    rst <= s_arstn;
    l_rxDAxis_tdata <= RxD_AXIS_0_tdata;
    
    -- Local signals assigment
    RxD_AXIS_0_tready <= l_rxDAxis_tready when rst = '1' else '0';
    l_rxDAxis_tlast <= RxD_AXIS_0_tlast when rst = '1' else '0';
    l_rxDAxis_tvalid <= RxD_AXIS_0_tvalid when rst = '1' else '0';

    l_mAxis_tready <= M_AXIS_0_tready when l_sliceType = sTypeN else
                      M_AXIS_1_tready when l_sliceType = sTypeN1 else '0';
    
    M_AXIS_0_tlast <= l_mAxis_tlast when l_sliceType = sTypeN else '0';
    M_AXIS_0_tvalid <= l_mAxis_tvalid when l_sliceType = sTypeN else '0';
    M_AXIS_0_tdata <= d_out;
    
    M_AXIS_1_tlast <= l_mAxis_tlast when l_sliceType = sTypeN1 else '0';
    M_AXIS_1_tvalid <= l_mAxis_tvalid when l_sliceType = sTypeN1 else '0';
    M_AXIS_1_tdata <= d_out;

    d_out(11 downto 0) <= vlan(11 downto 0);
    d_out(27 downto 12) <= eCpriID(15 downto 0);
    d_out(35 downto 28) <= numPRB(7 downto 0);
    d_out(46 downto 36) <= '0' & startPRB(9 downto 0); -- ERROR in following process. The correct length is 10 bits (9 downto 0). TODO: change all to 10 bits
    d_out(50 downto 47) <= numSymb(3 downto 0);
    d_out(56 downto 51) <= startSymb(5 downto 0);
    d_out(64 downto 57) <= frameID;
    d_out(68 downto 65) <= subframeID;
    d_out(74 downto 69) <= slotID;
    
    -- AXI READY logic
    l_rxDAxis_tready <= '1' when fsm = RECDATA else '0';
    l_mAxis_tvalid <= '1' when fsm = TRANSFER else '0';
    l_mAxis_tlast <= '1' when fsm = TRANSFER else '0';
    
    -- LOGICS
    doTransfer <= '1' when ((eCpriMes = x"02") and (dataDir = '0')) else '0';
    
    -- DEBUG
    dbg_rec <= rst when ((l_mAxis_tvalid = '1') and (l_mAxis_tready = '1') and l_mAxis_tlast = '1') else '0';
    dbg_rec_ecpri <= eCpriId;

    FSMP: process (clk)
    begin
        if clk = '1' and clk'event then
            -- FSM Process
            if(rst = '0') then
                cntData <= (others => '0');
                fsm <= RECDATA;
            else
                case fsm is
                    when RECDATA =>
                        if ((l_rxDAxis_tvalid = '1') and (l_rxDAxis_tready = '1') and l_rxDAxis_tlast = '1') then
                            if ((doTransfer = '1') and (isSliceTypeValid = '1')) then
                                l_sliceType <= sliceType;
                                fsm <= TRANSFER;
                            else
                                fsm <= RECDATA;
                            end if;
                        else
                            fsm <= RECDATA;
                        end if;
                    when TRANSFER =>
                         if ((l_mAxis_tvalid = '1') and (l_mAxis_tready = '1') and l_mAxis_tlast = '1') then
                            fsm <= RECDATA;
                            cntData <= (others => '0');
                         else
                            fsm <= TRANSFER;
                         end if;
                    when others =>
                        fsm <= RECDATA;
                end case;
            end if;

            -- Read Input data
            if ((l_rxDAxis_tvalid = '1') and (l_rxDAxis_tready = '1')) then
                cntData <= cntData + x"1";
            end if;
        end if;
    end process;
    
    g_32BIT_BUS: if IN_WIDTH = 32 generate
    CNT_32B_PROC: process (clk)
    begin
        if clk'event and clk='1' then
            if ((l_rxDAxis_tvalid = '1') and (l_rxDAxis_tready = '1')) then
                -- Extract data from input
                -- Read ORAN CUS v12 specs to understand arrDataIn
                -- Pg 56: ecpri transport header bitfield
                -- pg 88: C-plane ST 1 message bitfield
                case cntData is
                    when x"3" =>
                        vlan <= ethData_swap(11 downto 0);
                    when x"4" =>
                        eCpriMes <= ethData_swap(7 downto 0);
                    when x"5" =>
                        eCpriId <= ethData_swap(15 downto 0);
                    when x"6" =>
                        dataDir <= ethData_swap(15);
                        frameId <= ethData_swap(7 downto 0);
                    when x"7" =>
                        subFrameId <= ethData_swap(31 downto 28);
                        slotId <= ethData_swap(27 downto 22);
                        startSymb <= ethData_swap(21 downto 16);
                        sectionType <= ethData_swap(7 downto 0);
                    when x"8" =>
                        startPRB(9 downto 8) <= ethData_swap(1 downto 0);
                    when x"9" =>
                        startPRB(7 downto 0) <= ethData_swap(31 downto 24);
                        numPRB <= ethData_swap(23 downto 16);
                        numSymb <= ethData_swap(3 downto 0);
                    when others =>
                end case;
            end if; 
        end if;
    end process;
    end generate g_32BIT_BUS;
    
    g_64BIT_BUS: if IN_WIDTH = 64 generate
    CNT_64B_PROC: process (clk)
    begin
        if clk'event and clk='1' then
            if ((l_rxDAxis_tvalid = '1') and (l_rxDAxis_tready = '1')) then
                -- Extract data from input
                -- Read ORAN CUS v12 specs to understand arrDataIn
                -- Pg 56: ecpri transport header bitfield
                -- pg 88: C-plane ST 1 message bitfield
                case cntData is
                    when x"1" =>
                        vlan <= ethData_swap(11 downto 0);
                    when x"2" =>
                        eCpriMes <= ethData_swap(39 downto 32);
                        eCpriId <= ethData_swap(15 downto 0);
                    when x"3" =>
                        dataDir <= ethData_swap(47);
                        frameId <= ethData_swap(39 downto 32);
                        subFrameId <= ethData_swap(31 downto 28);
                        slotId <= ethData_swap(27 downto 22);
                        startSymb <= ethData_swap(21 downto 16);
                        sectionType <= ethData_swap(7 downto 0);
                    when x"4" =>
                        startPRB <= ethData_swap(33 downto 24);
                        numPRB <= ethData_swap(23 downto 16);
                        numSymb <= ethData_swap(3 downto 0);    
                    when others =>                
                end case;
            end if; 
        end if;
    end process;
    end generate g_64BIT_BUS;


end Behavioral;
