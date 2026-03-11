----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2024 22:58:30
-- Design Name: 
-- Module Name: uart_transmit - Behavioral
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

entity uart_transmit is
    Port ( 
    
    -- RX DATA AXI
    rx_axi_tdata: out std_logic_vector(7 downto 0);
    rx_axi_tvalid: out std_logic;
    rx_axi_tready: in std_logic;
    
    -- TX DATA AXI
    tx_axi_tdata: in std_logic_vector(63 downto 0);
    tx_axi_tvalid: in std_logic;
    tx_axi_tready: out std_logic;
    tx_axi_tlast: in std_logic;
    
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
    
    -- CONTROL SIGNALS
    send_metrics : in std_logic;
    dbg_fsm_transmit: out std_logic_vector(7 downto 0);
    
    -- CLK AND RESET
    clk : in std_logic;
    rstn : in std_logic
    
    );
end uart_transmit;

architecture Behavioral of uart_transmit is

signal l_tx_valid, l_tx_ready, l_tx_last : std_logic := '0';
signal l_rx_valid, l_rx_ready : std_logic := '0';

signal l_wr_avalid, l_wr_aready : std_logic := '0';
signal l_wr_valid, l_wr_ready : std_logic := '0';
signal l_wr_bready, l_wr_bvalid : std_logic := '0';
signal l_rd_avalid, l_rd_aready : std_logic := '0';
signal l_rd_valid, l_rd_ready : std_logic := '0';

signal l_sgn_send : std_logic := '0';

signal isTxFull : std_logic;
signal outData : std_logic_vector(63 downto 0) := (others => '0');
signal cntShift : integer := 0;

constant tData : std_logic_vector(63 downto 0) := x"0011223344556677";

type uart_maq is (REC, READ_DATA, READ_STATUS, WRITE);
signal fsm : uart_maq := REC;

begin

dbg_fsm_transmit(3 downto 0) <=  x"1" when fsm = REC else
                     x"2" when fsm = READ_DATA else
                     x"4" when fsm = WRITE else
                     x"8" when fsm = READ_STATUS else
                     x"F";
dbg_fsm_transmit(4) <= l_wr_bready;
dbg_fsm_transmit(5) <= l_wr_avalid;
dbg_fsm_transmit(6) <= l_wr_valid;   
dbg_fsm_transmit(7) <= l_rd_ready;

rx_axi_tdata <= m_axi_rdata(7 downto 0) when fsm = REC else (others => '0');
l_rx_valid <= l_rd_valid when (fsm = REC and m_axi_rresp = "00") else '0';

l_tx_ready <= rstn when fsm = READ_DATA else '0';

m_axi_araddr <= std_logic_vector(to_unsigned(8, m_axi_araddr'length)) when fsm = READ_STATUS else (others => '0');
l_rd_avalid <= rstn when (fsm = READ_STATUS or fsm = REC) else '0';
l_rd_ready <= rstn when fsm = READ_STATUS else  
              l_rx_ready when fsm = REC else 
              '0';

m_axi_awaddr <= std_logic_vector(to_unsigned(4, m_axi_awaddr'length));
m_axi_wdata <= x"000000" & outData(7 downto 0);
m_axi_wstrb <= x"F";
l_wr_bready <= rstn when fsm = WRITE else '0';
l_wr_avalid <= rstn when fsm = WRITE else '0';
l_wr_valid <= rstn when fsm = WRITE else '0';

l_wr_bvalid <= m_axi_bvalid;
m_axi_bready <= l_wr_bready;
m_axi_arvalid <= l_rd_avalid;
m_axi_rready <= l_rd_ready;
l_rd_valid <= m_axi_rvalid;
m_axi_awvalid <= l_wr_avalid;
l_wr_ready <= m_axi_wready;
m_axi_wvalid <= l_wr_valid;
l_rx_ready <= rx_axi_tready;
rx_axi_tvalid <= l_rx_valid;
l_tx_valid <= tx_axi_tvalid;
tx_axi_tready <= l_tx_ready;
l_tx_last <= tx_axi_tlast;


FSM_PROC: process(clk)
begin
if clk'event and clk = '1' then
    if rstn = '0' then
        outData <= tData;
        cntShift <= 7;
        fsm <= REC;
    else
        case fsm is
            when REC =>
                -- MUST AWIT UNTIL READ IS COMLETED
                if (l_rd_valid = '1' and l_rd_ready = '1' and l_sgn_send = '1') then
                    fsm <= READ_DATA;
                else
                    fsm <= REC;
                end if;
            when READ_DATA =>
                if( l_tx_valid = '1' and l_tx_ready = '1') then
                    outData <= tx_axi_tdata;
                    cntShift <= 7;
                    fsm <= WRITE;
                else
                    fsm <= REC;
                end if;        
            when WRITE =>
                if(l_wr_bvalid = '1' and l_wr_bready = '1' and m_axi_bresp = "00") then
                    outData <= x"00" & outData(63 downto 8);
                    if(cntShift > 0) then
                        cntShift <= cntShift - 1;
                        fsm <= WRITE;
                    else
                        fsm <= READ_DATA;
                    end if;
                else
                    fsm <= WRITE;
                end if;
            when READ_STATUS =>
                if(l_rd_valid = '1' and l_rd_ready = '1') then
                    if (m_axi_rdata(3) = '0') then
                        if (cntShift = 0) then
                            fsm <= READ_DATA;
                        else
                            fsm <= WRITE;
                        end if;
                    else
                        fsm <= READ_STATUS;
                    end if;
                else
                    fsm <= READ_STATUS;
                end if;
        end case;
    end if;
end if;
end process;

SYNC_P: process(clk)
begin
if clk'event and clk = '1' then
    if rstn = '0' then
        l_sgn_send <= '0';
    else
        case fsm is
            when REC =>
                if send_metrics = '1' then
                    l_sgn_send <= '1';
                end if;
            when others =>
                l_sgn_send <= '0';
        end case;
    end if;
end if;
end process;

end Behavioral;
