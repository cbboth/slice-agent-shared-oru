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
    
    -- CLK AND RESET
    clk : in std_logic;
    rstn : in std_logic
    
    );
end uart_transmit;

architecture Behavioral of uart_transmit is

signal l_wr_avalid, l_wr_aready : std_logic := '0';
signal l_wr_valid, l_wr_ready : std_logic := '0';
signal l_rd_avalid, l_rd_aready : std_logic := '0';
signal l_rd_valid, l_rd_ready : std_logic := '0';

signal isTxFull : std_logic;
signal outData : std_logic_vector(63 downto 0) := (others => '0');
signal cntShift : integer := 0;

constant tData : std_logic_vector(63 downto 0) := x"0011223344556677";

type uart_maq is (REC, READ_DATA, READ_STATUS, WRITE);
signal fsm : uart_maq := REC;

begin

m_axi_araddr <= std_logic_vector(to_unsigned(8, m_axi_araddr'length)) when fsm = READ_STATUS else (others => '0');
l_rd_avalid <= rstn when fsm = READ_STATUS else '0';
l_rd_ready <= rstn when fsm = READ_STATUS else '0';

m_axi_awaddr <= std_logic_vector(to_unsigned(4, m_axi_awaddr'length));
m_axi_wdata <= x"000000" & outData(7 downto 0);
m_axi_wstrb <= x"F";
m_axi_bready <= '1';
l_wr_avalid <= rstn when fsm = WRITE else '0';
l_wr_valid <= rstn when fsm = WRITE else '0';

m_axi_arvalid <= l_rd_avalid;
m_axi_rready <= l_rd_ready;
l_rd_valid <= m_axi_rvalid;
m_axi_awvalid <= l_wr_avalid;
l_wr_ready <= m_axi_wready;
m_axi_wvalid <= l_wr_valid;


FSM_PROC: process(clk)
begin
if clk'event and clk = '1' then
    if rstn = '0' then
        fsm <= REC;
    else
        case fsm is
            when REC =>
                if send_metrics = '1' then
                    fsm <= READ_DATA;
                else
                    fsm <= REC;
                end if;
            when READ_DATA =>
                outData <= tData;
                cntShift <= 8;
                fsm <= WRITE;
            when WRITE =>
                if(l_wr_valid = '1' and l_wr_ready = '1') then
                    outData <= x"00" & outData(63 downto 8);
                    if(cntShift > 0) then
                        cntShift <= cntShift - 1;
                    end if;
                    fsm <= READ_STATUS;
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


end Behavioral;
