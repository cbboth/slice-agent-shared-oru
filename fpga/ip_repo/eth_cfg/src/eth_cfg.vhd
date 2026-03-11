----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2024 18:30:27
-- Design Name: 
-- Module Name: eth_cfg - Behavioral
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

entity eth_cfg is
  Generic (
    AXI_DATA_WIDTH : integer := 32;
    AXI_ADDR_WIDTH : integer := 18
  );
  Port (
    -- AXI4-LITE SIGNALS
    -- Read addr
    m_axi_araddr : out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    m_axi_arready: in std_logic;
    m_axi_arvalid: out std_logic;
    -- Read Data
    m_axi_rdata: in std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    m_axi_rready: out std_logic;
    m_axi_rvalid: in std_logic;
    m_axi_rresp : in std_logic_vector(1 downto 0);
    -- Write addr
    m_axi_awaddr: out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    m_axi_awready : in std_logic;
    m_axi_awvalid : out std_logic;
    -- Write data
    m_axi_wdata: out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    m_axi_wready: in std_logic;
    m_axi_wvalid: out std_logic;
    m_axi_wstrb: out std_logic_vector(3 downto 0);
    m_axi_bready : out std_logic;
    m_axi_bresp: in std_logic_vector(1 downto 0);
    m_axi_bvalid: in std_logic;
    
    -- Control signals
    start_cfg : in std_logic;           -- signal to initiate the ethernet configuration (module + phy)
    mac_addr : in std_logic_vector (47 downto 0);     -- MAC Address of this device
    configured : out std_logic;
    
    -- CLKs and RESET
    clk: in std_logic;
    rstn: in std_logic
   );
end eth_cfg;

architecture Behavioral of eth_cfg is

signal start_cfg_ss : std_logic := '0';
signal init_delay : integer := 0;
signal init_delay_done : std_logic := '0';

signal axi_rd_en, axi_wr_en : std_logic := '0';
signal axi_rd_prep, axi_wr_prep : std_logic := '0';
signal axi_wr_ctrl, axi_rd_ctrl : std_logic_vector (63 downto 0) := (others => '0');

signal mdio_rd_en, mdio_wr_en : std_logic := '0';   -- NOT USED YET

type axiCMD_maq_est is (AXICFGIDLE, SETMDIOFREQ, SETEXTPHYPHYTYPE, RESETRECEIVER, RESETTRANSMITTER, DISABLEFLOWCONTROL, ENABLETXVLAN, CONFIG1FRAMEFILTER1, CONFIG1FRAMEFILTER2, RESETEXTPHYSETSPEED, ASSERTSOFTRESET, LASTSTATE);
signal axi_cmd_fsm, axi_cmd_fsm_nxt : axiCMD_maq_est := AXICFGIDLE;

type axiTR_maq_est is (AXILIDLE, AXILWRITE, AXILREAD1, AXILREAD2);
signal axi_tr_fsm : axiTR_maq_est := AXILIDLE;

type mdio_maq_est is (MDIOIDLE, MDIOGETSTATUS, MDIOPOLLSTATUS, MDIOWRITEDATA, MDIOWRITECTRL, MDIOWAITWRITECMPLTE, MDIOWRITEDONE, MDIOREADCTRL, MDIOWAITREADCMPLTE, MDIOPOLLREADSTATUS, MDIOFETCHRDDATA, MDIOREADDATA);
signal mdio_fsm : mdio_maq_est := MDIOIDLE; -- NOT USED YET

-- CONSTANTS
constant ADDR_MDIOFREQ          : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0) := "00" & x"0500";
constant ADDR_RXCTRL            : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0) := "00" & x"0404";
constant ADDR_TXCTRL            : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0) := "00" & x"0408"; 
constant ADDR_FLOWCTRL          : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0) := "00" & x"0708";
constant ADDR_SPEEDCONFIG       : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0) := "00" & x"0410";
constant ADDR_CONFIGFRMFLTR1    : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0) := "00" & x"0710";
constant ADDR_CONFIGFRMFLTR2    : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0) := "00" & x"0714";

begin

SIGN_PROC: process (clk)
begin
    if rstn = '0' then
        init_delay <= 3000000;  -- Delay around 30 ms considering 100 MHz clk
        init_delay_done <= '0';
    else
        if init_delay > 0 then init_delay <= init_delay - 1; else init_delay_done <= '1'; end if;
    end if;
end process;

-- AXI STATE UPDATE
AXI_CMD_FSM_UDT: process (clk)
begin
    if clk'event and clk = '1' then
        if rstn = '0' then
            axi_cmd_fsm <= AXICFGIDLE;
        else
            axi_cmd_fsm <= axi_cmd_fsm_nxt;
        end if;
    end if;
end process;

-- AXI FSM COMBINATIONAL PROCESS
AXI_CMD_PROC: process (axi_cmd_fsm, start_cfg_ss, axi_wr_en, mdio_wr_en)
begin
    axi_wr_prep <= '0';     mdio_wr_en <= '0';
    axi_rd_prep <= '0';
    axi_cmd_fsm_nxt <= axi_cmd_fsm;
    configured <= '0';
    case axi_cmd_fsm is
        when AXICFGIDLE =>
            if(start_cfg_ss = '1' or init_delay_done = '1') then
                axi_cmd_fsm_nxt <= SETMDIOFREQ;
            end if;
        when SETMDIOFREQ =>
            if axi_wr_en = '1' then     -- Wait if some ongoing write process
                axi_cmd_fsm_nxt <= SETMDIOFREQ;
            else
                axi_wr_prep <= '1';
                axi_cmd_fsm_nxt <= RESETRECEIVER;
            end if;                                
        when RESETRECEIVER =>
            if (axi_wr_en = '1' or mdio_wr_en = '1') then     -- Wait if some ongoing write process
                axi_cmd_fsm_nxt <= RESETRECEIVER;
            else
                axi_wr_prep <= '1';
                axi_cmd_fsm_nxt <= RESETTRANSMITTER;
            end if;
        when RESETTRANSMITTER =>
            if axi_wr_en = '1' then     -- Wait if some ongoing write process
                axi_cmd_fsm_nxt <= RESETTRANSMITTER;
            else
                axi_wr_prep <= '1';
                axi_cmd_fsm_nxt <= DISABLEFLOWCONTROL;
            end if;                         
        when DISABLEFLOWCONTROL =>
            if axi_wr_en = '1' then     -- Wait if some ongoing write process
                axi_cmd_fsm_nxt <= DISABLEFLOWCONTROL;
            else
                axi_wr_prep <= '1';
                axi_cmd_fsm_nxt <= CONFIG1FRAMEFILTER1;
            end if;         
        when CONFIG1FRAMEFILTER1 =>
            if axi_wr_en = '1' then     -- Wait if some ongoing write process
                axi_cmd_fsm_nxt <= CONFIG1FRAMEFILTER1;
            else
                axi_wr_prep <= '1';
                axi_cmd_fsm_nxt <= CONFIG1FRAMEFILTER2;
            end if;
        when CONFIG1FRAMEFILTER2 =>
            if axi_wr_en = '1' then     -- Wait if some ongoing write process
                axi_cmd_fsm_nxt <= CONFIG1FRAMEFILTER2;
            else
                axi_wr_prep <= '1';
                axi_cmd_fsm_nxt <= ENABLETXVLAN;
            end if;
        when ENABLETXVLAN =>
            if axi_wr_en = '1' then     -- Wait if some ongoing write process
                axi_cmd_fsm_nxt <= ENABLETXVLAN;
            else
                axi_wr_prep <= '1';
                axi_cmd_fsm_nxt <= LASTSTATE;
            end if;
        when LASTSTATE =>
            if(start_cfg_ss = '1') then
                axi_cmd_fsm_nxt <= SETMDIOFREQ;
            else
                configured <= '1';
                axi_cmd_fsm_nxt <= LASTSTATE;
            end if;
        when others =>
            axi_cmd_fsm_nxt <= AXICFGIDLE;
    end case;
end process;

m_axi_wstrb <= x"F";    -- ALL 4 bytes from last axi transfer are valid
m_axi_rready <= '1';
m_axi_bready <= '1';

m_axi_awvalid   <= rstn when axi_tr_fsm = AXILWRITE else '0';
m_axi_wvalid    <= rstn when axi_tr_fsm = AXILWRITE else '0';
m_axi_arvalid   <= rstn when axi_tr_fsm = AXILREAD1 else '0';

m_axi_awaddr    <= axi_wr_ctrl(49 downto 32);
m_axi_wdata     <= axi_wr_ctrl(31 downto 0);
m_axi_araddr    <= axi_rd_ctrl(49 downto 32);

axi_rd_en <= axi_rd_ctrl(51);
axi_wr_en <= axi_wr_ctrl(51);
-- AXI TRANSMIT/RECEIVE FSM PROCESS
AXI_TR_FSM_PROC: process (clk)
begin
    if clk'event and clk='1' then
        if rstn = '0' then
            axi_tr_fsm <= AXILIDLE;
        else
            case axi_tr_fsm is
                when AXILIDLE =>
                    if axi_rd_en = '1' then
                        axi_tr_fsm <= AXILREAD1;
                    elsif axi_wr_en = '1' then
                        axi_tr_fsm <= AXILWRITE;
                    else
                        axi_tr_fsm <= AXILIDLE;
                    end if;
                when AXILWRITE =>
                    if (m_axi_wready = '1') then
                        axi_tr_fsm <= AXILIDLE;
                    else
                        axi_tr_fsm <= AXILWRITE;
                    end if;
                when AXILREAD1 =>
                    if (m_axi_arready = '1') then
                        axi_tr_fsm <= AXILREAD2;
                    else
                        axi_tr_fsm <= AXILREAD1;
                    end if;
                when AXILREAD2 =>
                    if m_axi_rvalid = '1' then
                        axi_tr_fsm <= AXILIDLE;
                    else
                        axi_tr_fsm <= AXILREAD2;
                    end if;
                when others =>
                    axi_tr_fsm <= AXILIDLE;
            end case;
        end if;
    end if;
end process;

-- AXI WRITE DATA POPULATION
AXI_WR_DATA_PROC: process (clk)
begin
    if clk'event and clk = '1' then
        if rstn = '0' then
            axi_wr_ctrl <= (others => '0');
        else
            if (m_axi_wready = '1' and axi_tr_fsm = AXILWRITE) then
                axi_wr_ctrl(51) <= '0';                
            else
                if axi_wr_prep = '1' then
                    axi_wr_ctrl(51) <= '1';
                    if axi_cmd_fsm = SETMDIOFREQ then
                        axi_wr_ctrl(49 downto 32) <= ADDR_MDIOFREQ;
                        axi_wr_ctrl(31 downto 0) <= x"00000068";        -- MDIO ENABLED / CLK_DIV = 0x28 (40)
                    elsif axi_cmd_fsm = RESETRECEIVER then
                        axi_wr_ctrl(49 downto 32) <= ADDR_RXCTRL;
                        axi_wr_ctrl(31 downto 0) <= x"90000000";        -- RX RESET
                    elsif axi_cmd_fsm = RESETTRANSMITTER then
                        axi_wr_ctrl(49 downto 32) <= ADDR_TXCTRL;       
                        axi_wr_ctrl(31 downto 0) <= x"90000000";        -- TX RESET
                    elsif axi_cmd_fsm = DISABLEFLOWCONTROL then
                        axi_wr_ctrl(49 downto 32) <= ADDR_FLOWCTRL;
                        axi_wr_ctrl(31 downto 0) <= x"00000000";        -- PROMISCUOUS MODE DIS / NO AVB / FILTER IDX = 0
                    elsif axi_cmd_fsm = ENABLETXVLAN then
                        axi_wr_ctrl(49 downto 32) <= ADDR_TXCTRL;       
                        axi_wr_ctrl(31 downto 0) <= x"18000000";        -- TX ENABLED / VLAN ENABLED
                    elsif axi_cmd_fsm = CONFIG1FRAMEFILTER1 then
                        axi_wr_ctrl(49 downto 32) <= ADDR_CONFIGFRMFLTR1;
                        axi_wr_ctrl(31 downto 0) <= mac_addr(31 downto 0);
                    elsif axi_cmd_fsm = CONFIG1FRAMEFILTER2 then
                        axi_wr_ctrl(49 downto 32) <= ADDR_CONFIGFRMFLTR2;
                        axi_wr_ctrl(31 downto 0) <= x"0000" & mac_addr(47 downto 32);
                    end if;
                end if;
            end if;
        end if;
    end if;
end process;

-- AXI READ DATA POPULATION (NOT USED YET)

-- MDIO FSM PROCESS
MDIO_FSM_PROC: process (clk)
begin
    if clk'event and clk = '1' then
        if rstn = '0' then
        -- RESET PROCESS
        else
            case mdio_fsm is
                when MDIOIDLE =>
                when MDIOGETSTATUS =>
                when MDIOPOLLSTATUS =>
                when MDIOWRITEDATA =>
                when MDIOWRITECTRL =>
                when MDIOWAITWRITECMPLTE =>
                when MDIOWRITEDONE =>
                when MDIOREADCTRL =>
                when MDIOWAITREADCMPLTE =>
                when MDIOPOLLREADSTATUS =>
                when MDIOFETCHRDDATA =>
                when MDIOREADDATA =>
            end case;
        end if;
    end if;
end process;


-- Singles sync entities
START_SS: entity work.sync_single port map (clk => clk, sig_in => start_cfg, sig_out => start_cfg_ss);

end Behavioral;
