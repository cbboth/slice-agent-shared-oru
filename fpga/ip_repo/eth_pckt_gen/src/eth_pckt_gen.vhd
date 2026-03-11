----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2024 00:44:21
-- Design Name: 
-- Module Name: eth_pckt_gen - Behavioral
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

entity eth_pckt_gen is
  Port ( 
  
    -- AXI TX CONTROL
    m_axis_txc_tdata : out std_logic_vector (31 downto 0);
    m_axis_txc_tvalid : out std_logic;
    m_axis_txc_tready: in std_logic;
    m_axis_txc_tlast: out std_logic;
    
    -- AXI TX DATA
    m_axis_txd_tdata : out std_logic_vector (31 downto 0);
    m_axis_txd_tvalid : out std_logic;
    m_axis_txd_tready: in std_logic;
    m_axis_txd_tlast: out std_logic;
    
    -- AXI RX DATA
    m_axis_rxd_tdata : in std_logic_vector (31 downto 0);
    m_axis_rxd_tvalid : in std_logic;
    m_axis_rxd_tready: out std_logic;
    m_axis_rxd_tlast: in std_logic;
    
    -- AXI RX STATUS
    m_axis_rxs_tdata : in std_logic_vector (31 downto 0);
    m_axis_rxs_tvalid : in std_logic;
    m_axis_rxs_tready: out std_logic;
    m_axis_rxs_tlast: in std_logic;
    
    -- AXI LITE UART
    -- Read addr
    m_axi_araddr : out std_logic_vector(17 downto 0);
    m_axi_arready: in std_logic;
    m_axi_arvalid: out std_logic;
    -- Read Data
    m_axi_rdata: in std_logic_vector(31 downto 0);
    m_axi_rready: out std_logic;
    m_axi_rvalid: in std_logic;
    m_axi_rresp : in std_logic_vector(1 downto 0);
    -- Write addr
    m_axi_awaddr: out std_logic_vector(17 downto 0);
    m_axi_awready : in std_logic;
    m_axi_awvalid : out std_logic;
    -- Write data
    m_axi_wdata: out std_logic_vector(31 downto 0);
    m_axi_wready: in std_logic;
    m_axi_wvalid: out std_logic;
    m_axi_wstrb: out std_logic_vector(3 downto 0);
    m_axi_bready : out std_logic;
    m_axi_bresp: in std_logic_vector(1 downto 0);
    m_axi_bvalid: in std_logic;
    
    -- SIGNALS
    configured : in std_logic;
    send : in std_logic;
    
    led_cfg : out std_logic;
    led_sending: out std_logic;
    led_1s : out std_logic;
    led_TxFull : out std_logic;
    led_TxEmpty : out std_logic;

    -- CLK AND RESET
    clk : in std_logic;
    rstn : in std_logic
  );
end eth_pckt_gen;

architecture Behavioral of eth_pckt_gen is

signal txc_cnt : integer := 0;
signal txd_cnt : integer := 0;
signal led_cnt : unsigned (31 downto 0) := (others => '0');
signal l_ledClk : std_logic := '0';

signal l_txc_ready, l_txc_valid, l_txc_last : std_logic := '0'; 
signal l_txd_ready, l_txd_valid, l_txd_last : std_logic := '0'; 

type tx_maq_est is (IDLE, CONTROL, ETH_HEAD, ETH_PAYLOAD);
signal tx_fsm : tx_maq_est := IDLE;

type rx_maq_est is (IDLE, PAYLOAD, STATUS);
signal rx_fsm : rx_maq_est := IDLE;

type txc_pay is array (26 downto 0) of std_logic_vector (31 downto 0);
signal txC_pckt : txc_pay := (others => (others => '0'));
signal txD_head : txc_pay := (others => (others => '0'));

type uart_maq is (READ_STATUS, READ_ETH, WRITE);
signal uart_fsm : uart_maq := READ_ETH;

signal l_rxd_valid, l_rxd_ready : std_logic := '0';
signal l_wr_avalid, l_wr_aready : std_logic := '0';
signal l_wr_valid, l_wr_ready : std_logic := '0';
signal l_rd_avalid, l_rd_aready : std_logic := '0';
signal l_rd_valid, l_rd_ready : std_logic := '0';

signal isFull, isEmpty : std_logic := '0';
signal inPkt : std_logic_vector (31 downto 0) := (others => '0');
signal inCnt : unsigned (3 downto 0) := "0000";

begin

led_cfg <= configured;

m_axis_txc_tdata <= txC_pckt(txc_cnt);
l_txc_ready <= m_axis_txc_tready when rstn = '1' else '0';
l_txc_valid <= rstn when tx_fsm = CONTROL else '0';
l_txc_last <= rstn when (tx_fsm = CONTROL and txc_cnt = 5) else '0';
m_axis_txc_tvalid <= l_txc_valid;
m_axis_txc_tlast <= l_txc_last;

m_axis_txd_tdata <= txD_head(txd_cnt);
l_txd_ready <= m_axis_txd_tready when rstn = '1' else '0';
l_txd_valid <= rstn when (tx_fsm = ETH_HEAD or tx_fsm = ETH_PAYLOAD) else '0';
l_txd_last <= rstn when ((tx_fsm = ETH_HEAD or tx_fsm = ETH_PAYLOAD) and txd_cnt = 24) else '0';
m_axis_txd_tvalid <= l_txd_valid;
m_axis_txd_tlast <= l_txd_last;

txC_pckt(0) <= x"A0000000";
txC_pckt(1) <= x"00000000";
txC_pckt(2) <= x"00000000";
txC_pckt(3) <= x"00000000";
txC_pckt(4) <= x"00000000";
txC_pckt(5) <= x"00000000";

txD_head(0) <= x"040302CA";
txD_head(1) <= x"02DA0605";
txD_head(2) <= x"06050403";
txD_head(3) <= x"cdab5600";
txD_head(4) <= x"17161514";
txD_head(5) <= x"1b1a1918";
txD_head(6) <= x"1f1e1d1c";
txD_head(7) <= x"23222120";
txD_head(8) <= x"27262524";
txD_head(9) <= x"2b2a2928";
txD_head(10) <= x"2f2e2d2c";
txD_head(11) <= x"33323130";
txD_head(12) <= x"37363534";
txD_head(13) <= x"3b3a3938";
txD_head(14) <= x"3f3e3d3c";
txD_head(15) <= x"43424140";
txD_head(16) <= x"47464544";
txD_head(17) <= x"4b4a4948";
txD_head(18) <= x"4f4e4d4c";
txD_head(19) <= x"53525150";
txD_head(20) <= x"57565554";
txD_head(21) <= x"5b5a5958";
txD_head(22) <= x"5f5e5d5c";
txD_head(23) <= x"63626160";
txD_head(24) <= x"67666564";

TX_FSM_PROC: process (clk)
begin
    if clk'event and clk = '1' then
        if rstn = '0' then
            tx_fsm <= IDLE;
            led_sending <= '1';
        else
            case tx_fsm is
                when IDLE =>
                    txc_cnt <= 0;
                    txd_cnt <= 0;
                    if (configured = '1' and send ='1') then
                        led_sending <= '0';
                        tx_fsm <= CONTROL;
                    else
                        led_sending <= '1';
                        tx_fsm <= IDLE;
                    end if;
                when CONTROL =>
                    if (l_txc_ready = '1' and l_txc_valid = '1') then
                        if l_txc_last = '1' then
                            tx_fsm <= ETH_HEAD;
                        else
                            txc_cnt <= txc_cnt + 1;
                        end if;
                    end if;                 
                when ETH_HEAD =>
                    if (l_txd_ready = '1' and l_txd_valid = '1') then
                        if l_txd_last = '1' then
                            tx_fsm <= IDLE;
                        else
                            txd_cnt <= txd_cnt + 1;
                        end if;
                    end if;
                when ETH_PAYLOAD =>
                     txd_cnt <= txd_cnt + 1;
                     if (l_txd_ready = '1' and l_txd_valid = '1' and l_txd_last = '1') then
                        tx_fsm <= IDLE;
                    end if;                                       
            end case;
        end if;
    end if;
end process;

led_1s <= l_ledClk;
CLK_PROC: process (clk)
begin
    if clk'event and clk='1' then
        if rstn = '0' then
            led_cnt <= (others => '0');
            l_ledClk <= '0';
        else
            if (led_cnt < x"02FAF080") then
                led_cnt <= led_cnt + "1";
            else
                led_cnt <= (others => '0');
                l_ledClk <= not l_ledClk;
            end if;
        end if;
    end if;
end process;

led_TxFull <= isFull;
led_TxEmpty <= isEmpty;

m_axis_rxs_tready <= '1';

-- AXI READ
m_axi_araddr <= "00" & x"0008";
l_rd_avalid <= rstn when uart_fsm = READ_STATUS else '0';
l_rd_aready <= m_axi_arready;
l_rd_valid <= m_axi_rvalid;
l_rd_ready <= rstn when uart_fsm = READ_STATUS else '0';

m_axi_arvalid <= l_rd_avalid;
m_axi_rready <= l_rd_ready;

-- AXI WRITE
l_wr_avalid <= rstn when (uart_fsm = WRITE and isFull = '0') else '0';
l_wr_aready <= m_axi_awready;
l_wr_valid <= rstn when (uart_fsm = WRITE and isFull = '0') else '0';
l_wr_ready <= m_axi_wready;

m_axi_wdata <= x"000000" & inPkt(7 downto 0);
m_axi_awaddr <= "00" & x"0004";
m_axi_awvalid <= l_wr_avalid;
m_axi_wvalid <= l_wr_valid;
m_axi_wstrb <= x"F";
m_axi_bready <= '1';

-- AXI RXD INPUT
l_rxd_valid <= m_axis_rxd_tvalid;
l_rxd_ready <= rstn when (uart_fsm = READ_ETH) else '0';
m_axis_rxd_tready <= l_rxd_ready;

RX2UART_PROC: process (clk)
begin
    if clk'event and clk = '1' then
        if rstn = '0' then
            uart_fsm <= READ_ETH;
        else
            case uart_fsm is
                when READ_STATUS =>
                    if (l_rd_valid = '1' and l_rd_ready = '1') then
                        isFull <= m_axi_rdata(3);
                        isEmpty <= m_axi_rdata(2);
                        uart_fsm <= WRITE;
                    else
                        uart_fsm <= READ_STATUS;
                    end if;
                when READ_ETH =>
                    if (l_rxd_valid = '1' and l_rxd_ready = '1') then
                        inPkt <= m_axis_rxd_tdata;
                        inCnt <= (others => '0');
                        uart_fsm <= READ_STATUS;
                    else
                        uart_fsm <= READ_ETH;
                    end if;
                when WRITE =>
                    if (l_wr_valid = '1' and l_wr_ready = '1') then
                        if (inCnt < x"3") then
                            inPkt <= x"00" & inPkt(31 downto 8);
                            inCnt <= inCnt + "1";
                            uart_fsm <= READ_STATUS;
                        else
                            uart_fsm <= READ_ETH;
                        end if;
                    else
                        uart_fsm <= READ_STATUS;
                    end if;
            end case;
        end if;
    end if;
end process;

end Behavioral;
