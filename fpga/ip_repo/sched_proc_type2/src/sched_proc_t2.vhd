----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2024 21:48:27
-- Design Name: 
-- Module Name: sched_proc - Behavioral
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
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sched_proc_t2 is
  port (
    -- AXI OUTPUT
    M_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 ); 
    M_AXIS_0_tready : in STD_LOGIC;
    M_AXIS_0_tvalid : out STD_LOGIC;
    M_AXIS_0_tlast : out STD_LOGIC;
    -- AXI INPUT
    S_AXIS_0_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    S_AXIS_0_tready : out STD_LOGIC;
    S_AXIS_0_tvalid : in STD_LOGIC;
    S_AXIS_0_tlast : in STD_LOGIC;
    -- CLK SIGNALS
    clk : in STD_LOGIC;
    resetn : in STD_LOGIC;
    -- CTRL SIGNALS
    c_frameId : in std_logic_vector (7 downto 0);
    c_subframeID: in std_logic_vector (3 downto 0);
    c_slotID: in std_logic_vector (5 downto 0);
    stats : out std_logic; -- 1 when ready to write
    swap : in std_logic;
    
    s_enSymb_0: out std_logic_vector(13 downto 0);
    
    cfg_maxPRBPkt : in std_logic_vector(15 downto 0);
    
    dbg_proc_begin : out std_logic;
    dbg_proc_end : out std_logic;
    dbg_proc_ecpriId: out std_logic_vector (15 downto 0)
  );
end sched_proc_t2;

architecture Behavioral of sched_proc_t2 is

signal clk0, rst0 : std_logic;
signal enSymb: std_logic_vector(13 downto 0) := (others => '0');

signal fifo_in1_axi_valid : std_logic;
signal fifo_in1_axi_ready : std_logic;

signal fifo_in2_axi_data : std_logic_vector(127 downto 0);
signal fifo_in2_axi_valid : std_logic;
signal fifo_in2_axi_ready : std_logic;

signal fifo_out_axi_data : std_logic_vector(127 downto 0);
signal fifo_out_axi_valid : std_logic;
signal fifo_out_axi_last : std_logic;
signal fifo_out_axi_ready : std_logic;

signal out_axi_valid, out_axi_ready, out_axi_last : std_logic := '0';

signal vlan, vlan_o: std_logic_vector(11 downto 0) := (others => '0');
signal eCpriID, eCpriID_o: std_logic_vector(15 downto 0) := (others => '0');
signal numPRB, numPRB_o: std_logic_vector(7 downto 0) := (others => '0');
signal startPRB, startPRB_o: std_logic_vector(10 downto 0) := (others => '0');
signal numSymb, numSymb_o: std_logic_vector(3 downto 0) := (others => '0');
signal startSymb, startSymb_o: std_logic_vector(5 downto 0) := (others => '0');
signal frameID : std_logic_vector(7 downto 0) := (others => '0');
signal subframeID: std_logic_vector(3 downto 0) := (others => '0');
signal slotID: std_logic_vector(5 downto 0) := (others => '0');

signal procData_o: std_logic_vector(63 downto 0) := (others => '0');

signal activeSymbol: std_logic_vector(13 downto 0) := (others => '0');
signal tempSliceSize: std_logic_vector(15 downto 0) := (others => '0');

signal cnt: integer := 0;
signal restPRBs: integer := 0;
signal startPRB_tmp : integer := 0;

signal isNext : std_logic := '0';
signal last: std_logic := '0';

constant APP_OVH : natural := 8;
signal maxPRBPacket : integer := 0; --(ETH_MTU - TRT_OVH - APP_OVH)/(PRB_SIZE);

type maq_est is (BUFFERING, READ, SET_DATA, CALC_PRB, CALC_SIZE, WRITE, CHECK_REST);
signal fsm : maq_est := BUFFERING;

constant MAX_FRAMEID : std_logic_vector(7 downto 0) := x"FF";
constant MAX_SUBFRAMEID : std_logic_vector(3 downto 0) := x"F";
signal MAX_SLOTID : std_logic_vector(5 downto 0) := (others => '0');

begin

clk0 <= clk;
rst0 <= resetn;
s_enSymb_0 <= enSymb;
maxPRBPacket <= TO_INTEGER(unsigned(cfg_maxPRBPkt));

enSymb <= activeSymbol; --when out_axi_valid = '1' else (others => '0');

vlan(11 downto 0) <= fifo_out_axi_data(11 downto 0);
eCpriID(15 downto 0) <= fifo_out_axi_data(27 downto 12);
numPRB(7 downto 0) <= fifo_out_axi_data(35 downto 28);
startPRB(10 downto 0) <= fifo_out_axi_data(46 downto 36);
numSymb(3 downto 0) <= fifo_out_axi_data(50 downto 47);
startSymb(5 downto 0) <= fifo_out_axi_data(56 downto 51);

procData_o(11 downto 0) <= vlan_o;
procData_o(27 downto 12) <= eCpriID_o;
procData_o(35 downto 28) <= numPRB_o(7 downto 0);
procData_o(46 downto 36) <= startPRB_o(10 downto 0);

int2gray_for: for i in 0 to 13 generate
    activeSymbol(i) <= '1' when ((i >= unsigned(startSymb_o)) and ((i - unsigned(startSymb_o) + 1) <= unsigned(numSymb_o))) else
                       '0';
end generate;

--S_AXIS_0_tready <= fifo_in1_axi_ready when fifo_in2_axi_ready = '1' else '1';
S_AXIS_0_tready <= '1';

IN_FIFOS: entity work.dbFIFO
port map(
    S_AXIS_0_tdata => S_AXIS_0_tdata,
    S_AXIS_0_tvalid => S_AXIS_0_tvalid,
    S_AXIS_0_tready => fifo_in1_axi_ready,
    
    S_AXIS_1_tdata => fifo_in2_axi_data,
    S_AXIS_1_tvalid => fifo_in2_axi_valid,
    S_AXIS_1_tready => fifo_in2_axi_ready,
    
    M_AXIS_tdata => fifo_out_axi_data,
    M_AXIS_tvalid => fifo_out_axi_valid,
    M_AXIS_tready => fifo_out_axi_ready,
    
    swap => swap,

    clk => clk,
    rstn => resetn
);

-- output port mapping
M_AXIS_0_tdata <= procData_o;
M_AXIS_0_tvalid <= out_axi_valid;
M_AXIS_0_tlast <= out_axi_last;

-- FIFO output logic
fifo_out_axi_ready <= rst0 when fsm = READ and isNext = '1' else 
                      fifo_in2_axi_ready when fsm = READ else '0';
                      --rst0 when fsm = READ else '0';
fifo_in2_axi_data <= fifo_out_axi_data;
fifo_in2_axi_valid <= fifo_out_axi_valid when fsm = READ and isNext = '0' else '0';

-- output logic
out_axi_valid <= rst0 when fsm = WRITE else '0';
--out_axi_ready <= M_AXIS_0_tready;
out_axi_ready <= '1';
out_axi_last <= rst0 when (fsm = WRITE and last = '1' and restPRBs = 0) else '0';

stats <= '0' when fsm = WRITE else '1';

dbg_proc_ecpriID <= eCpriID when fsm = READ else eCpriID_o;
dbg_proc_begin <= rst0 when (fifo_out_axi_valid = '1' and fifo_out_axi_ready = '1' and isNext = '1') else '0';
dbg_proc_end <= rst0 when (M_AXIS_0_tready = '1' and out_axi_valid = '1' and restPRBs = 0) else '0';

frameID <= fifo_out_axi_data(64 downto 57);
subframeID <= fifo_out_axi_data(68 downto 65);
slotID <= fifo_out_axi_data(74 downto 69);

isNext <= '1' when (c_slotid = slotId and c_subframeID = subFrameID and c_frameID = FrameID and fifo_out_axi_valid = '1') else '0';

FSM_P: process(clk0)
begin
    if clk0'event and clk0='1' then
        if(rst0 = '0') then
            fsm <= READ;
        else
            case fsm is
                when READ =>
                    if(fifo_out_axi_valid = '1' and fifo_out_axi_ready = '1' and isNext = '1') then
                        vlan_o <= vlan;
                        eCpriID_o <= eCpriID;
                        numPRB_o <= numPRB;
                        restPRBs <= to_integer(unsigned(numPRB));
                        startPRB_tmp <= to_integer(unsigned(startPRB));
                        numSymb_o <= numSymb;
                        startSymb_o <= startSymb;
                        cnt <= 0;
                        fsm <= CALC_PRB;
                    else
                        fsm <= READ;
                    end if;
                when CALC_PRB =>
                    startPRB_o <= std_logic_vector(to_unsigned(startPRB_tmp, startPRB_o'length));
                    cnt <= 0;
                    if (restPRBs > maxPRBPacket) then
                        numPRB_o <= std_logic_vector(to_unsigned(maxPRBPacket, numPRB_o'length));
                        restPRBs <= restPRBs - maxPRBPacket;
                    else
                        numPRB_o <= std_logic_vector(to_unsigned(restPRBs, numPRB_o'length));
                        restPRBs <= 0;
                    end if;
                    fsm <= WRITE;
                when WRITE =>
                    if(out_axi_ready = '1' and out_axi_valid = '1') then
                        if (restPRBs = 0) then
                            fsm <= READ;
                        else
                            startPRB_tmp <= startPRB_tmp + maxPRBPacket;
                            fsm <= CALC_PRB;
                        end if;
                    else
                        fsm <= WRITE;
                    end if;                    
                when others =>
                    fsm <= READ;
            end case;
        end if;
    end if;
end process;
     
end Behavioral;
