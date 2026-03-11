----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2024 21:49:23
-- Design Name: 
-- Module Name: uart_controler - Behavioral
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

entity uart_controler is
    Port ( 
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
        
        -- DATA OUTPUT
        start_emu : out std_logic;
        
        frameID : out std_logic_vector(7 downto 0);
        subframeID : out std_logic_vector(3 downto 0);
        slotID: out std_logic_vector(5 downto 0);
        mu: out std_logic_vector (3 downto 0);
        slotStep : out std_logic_vector(3 downto 0);
        maxSlotId: out std_logic_vector(5 downto 0);
        symbT: out std_logic_vector(15 downto 0);
        slotT: out std_logic_vector(15 downto 0);
        minTime2Proc: out std_logic_vector(15 downto 0);
        
        -- SLICE
        addSlice : out std_logic;
        rmSlice : out std_logic;
        ecpriID : out std_logic_vector(15 downto 0);
        sliceType : out std_logic_vector(3 downto 0);
        
        -- DEBUG
        dbg_state: out std_logic_vector(3 downto 0);
        dbg_state2: out std_logic_vector(7 downto 0);
        dbg_axiData: out std_logic_vector(7 downto 0);
        dbg_fifo_valid : out std_logic;
        
        -- CLK AND RESET
        clk : in std_logic;
        rstn : in std_logic 
    );
end uart_controler;

architecture Behavioral of uart_controler is

signal RX_S_AXIS_tdata : std_logic_vector(7 downto 0);
signal RX_S_AXIS_tready : std_logic;
signal RX_S_AXIS_tvalid : std_logic;

signal send_metrics : std_logic;

begin

dbg_axiData <= RX_S_AXIS_tdata;
dbg_fifo_valid <= TX_M_AXIS_tvalid;

UART_RC: entity work.uart_rec
port map(
    Rx_AXI_tdata => RX_S_AXIS_tdata,
    Rx_AXI_tvalid => RX_S_AXIS_tvalid,
    Rx_AXI_tready => RX_S_AXIS_tready,
        
    start_emu => start_emu,
    send_metrics => send_metrics,
    
    frameID => frameID,
    subframeID => subframeID,
    slotID => slotID,
    mu => mu,
    slotStep => slotStep,
    maxSlotId => maxSlotId,
    symbT => symbT,
    slotT => slotT,
    minTime2Proc => minTime2Proc,
    
    addSlice => addSlice,
    rmSlice => rmSlice,
    ecpriID => ecpriID,
    sliceType => sliceType,
    
    dbg_state => dbg_state,
        
    clk => clk,
    rstn => rstn
);

UART_TX: entity work.uart_transmit
port map(
    rx_axi_tdata => RX_S_AXIS_tdata,
    rx_axi_tvalid => RX_S_AXIS_tvalid,
    rx_axi_tready => RX_S_AXIS_tready,
    
    tx_axi_tdata => tx_axi_tdata,
    tx_axi_tvalid => tx_axi_tvalid,
    tx_axi_tready => tx_axi_tready,
    tx_axi_tlast => '0',
    
    m_axi_araddr  => m_axi_araddr,
    m_axi_arready => m_axi_arready,
    m_axi_arvalid => m_axi_arvalid,
    m_axi_rdata => m_axi_rdata,
    m_axi_rready => m_axi_rready,
    m_axi_rvalid => m_axi_rvalid,
    m_axi_rresp  => m_axi_rresp,
    m_axi_awaddr => m_axi_awaddr,
    m_axi_awready  => m_axi_awready,
    m_axi_awvalid  => m_axi_awvalid,
    m_axi_wdata => m_axi_wdata,
    m_axi_wready => m_axi_wready,
    m_axi_wvalid => m_axi_wvalid,
    m_axi_wstrb => m_axi_wstrb,
    m_axi_bready  => m_axi_bready,
    m_axi_bresp => m_axi_bresp,
    m_axi_bvalid => m_axi_bvalid,
    
    send_metrics  => send_metrics,
    dbg_fsm_transmit => dbg_state2,
    
    clk  => clk,
    rstn  => rstn
);


end Behavioral;
