----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2024 20:23:21
-- Design Name: 
-- Module Name: oran_e - Behavioral
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

entity oran_e is
    Generic (
        AXI_WIDTH : integer := 32;
        AXI_CLK_MHZ : integer := 100
    );
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
        
        -- SLICE
        addSlice : out std_logic;
        rmSlice : out std_logic;
        ecpriID : out std_logic_vector(15 downto 0);
        sliceType : out std_logic_vector(3 downto 0);
                
        -- OUTPUT SIGNALS
        frameID : out std_logic_vector(7 downto 0);
        subFrameID : out std_logic_vector(3 downto 0);
        slotID : out std_logic_vector(5 downto 0);
        symbolID : out std_logic_vector(3 downto 0);
        mu : out std_logic_vector(3 downto 0);
    
        -- LOW PHY AXI STREAM
        lphy_axi_tdata: out std_logic_vector(AXI_WIDTH-1 downto 0);
        lphy_axi_tvalid : out std_logic;
        lphy_axi_tready : in std_logic;
        lphy_axi_tlast : out std_logic;
        
        -- CPLANE AXIS
        -- INPUT AXI
        rxCplane_axi_tdata : in std_logic_vector(AXI_WIDTH-1 downto 0);
        rxCplane_axi_tvalid : in std_logic;
        rxCplane_axi_tlast : in std_logic;
        rxCplane_axi_tready : out std_logic;
        
        -- OUTPUT AXI
        txCplane_axi_tdata : out std_logic_vector(AXI_WIDTH-1 downto 0);
        txCplane_axi_tvalid : out std_logic;
        txCplane_axi_tlast : out std_logic;
        txCplane_axi_tready : in std_logic;
        
        -- DBG
        leds : out std_logic_vector(7 downto 0);
        dbg_fsm_uart_rx: out std_logic_vector(3 downto 0);
        dbg_fsm_uart_tx: out std_logic_vector(7 downto 0);
        dbg_axiData: out std_logic_vector(7 downto 0);
    
        -- CLK AND RESET
        clk: in std_logic;
        rstn: in std_logic
     );
end oran_e;

architecture Behavioral of oran_e is

signal lphy_start : std_logic := '0';
signal cplane_start : std_logic := '0';

-- INPUT CMD
signal start_sgn : std_logic;

-- CONFIGURATION SIGNALS (RECEIVED FROM PYTHON)
signal cfg_frameID : std_logic_vector(7 downto 0);
signal cfg_subframeID : std_logic_vector(3 downto 0);
signal cfg_slotID : std_logic_vector(5 downto 0);
signal cfg_mu: std_logic_vector(3 downto 0);
signal cfg_slotStep : std_logic_vector(3 downto 0);
signal cfg_maxSlotId : std_logic_vector(5 downto 0);
signal symbT : std_logic_vector(15 downto 0);
signal slotT : std_logic_vector(15 downto 0);
signal minTime2Proc : std_logic_vector(15 downto 0);
signal nIQSamples: std_logic_vector(23 downto 0);

signal l_rxC_axi_tready, l_rxC_axi_tvalid : std_logic;
signal l_txM_axi_tready, l_txM_axi_tvalid : std_logic;

begin

l_rxC_axi_tvalid <= rxCplane_axi_tvalid;
rxCplane_axi_tready <= l_rxC_axi_tready;

tx_axi_tready <= l_txM_axi_tready;
l_txM_axi_tvalid <= tx_axi_tvalid;

leds(0) <= l_rxC_axi_tready;
leds(1) <= l_rxC_axi_tvalid;
leds(2) <= l_txM_axi_tready;
leds(3) <= l_txM_axi_tvalid;
leds(4) <= start_sgn;
leds(7 downto 5) <= "000";

LPHY: entity work.lphy_gen
generic map(
    AXI_WIDTH => AXI_WIDTH
)
port map(
    lphy_axi_tdata => lphy_axi_tdata,
    lphy_axi_tvalid => lphy_axi_tvalid,
    lphy_axi_tready => lphy_axi_tready,
    lphy_axi_tlast => lphy_axi_tlast,
    
    nIQSamples => nIQSamples,
    start => lphy_start,
    
    clk => clk,
    rstn => rstn
);

ORAN: entity work.oran_emu
generic map(
    AXI_CLK_MHZ => AXI_CLK_MHZ
)
port map(
    -- INPUT CMD
    start_sgn => start_sgn,
    
    -- CONFIGURATION SIGNALS (RECEIVED FROM PYTHON)
    cfg_frameID => cfg_frameID,
    cfg_subframeID => cfg_subframeID,
    cfg_slotID => cfg_slotID,
    cfg_mu => cfg_mu,
    cfg_slotStep => cfg_slotStep,
    cfg_maxSlotId => cfg_maxSlotId,
    symbT => symbT,
    slotT => slotT,
    minTime2Proc => minTime2Proc,
    
    -- OUTPUT SIGNALS
    frameID => frameID,
    subFrameID => subFrameID,
    slotID => slotID,
    symbolID => symbolID,
    mu => mu,
    
    -- OUTPUT SIGNALS
    lphy_start => lphy_start,
    cplane_start => cplane_start,
    
    -- CLK and RST
    clk => clk,
    rstn => rstn
);

CPLANE: entity work.cplane_sync
port map(
    -- INPUT AXI
    rxCplane_axi_tdata => rxCplane_axi_tdata,
    rxCplane_axi_tvalid => l_rxC_axi_tvalid,
    rxCplane_axi_tlast => rxCplane_axi_tlast,
    rxCplane_axi_tready => l_rxC_axi_tready,
    
    -- OUTPUT AXI
    txCplane_axi_tdata => txCplane_axi_tdata,
    txCplane_axi_tvalid => txCplane_axi_tvalid,
    txCplane_axi_tlast => txCplane_axi_tlast,
    txCplane_axi_tready => txCplane_axi_tready,
    
    -- CONTROL SIGNALS
    cplane_start => cplane_start,
    
    -- CLK AND RESET
    clk => clk,
    rstn => rstn
);

UART_C: entity work.uart_controler
port map(
    -- TX DATA AXI
    tx_axi_tdata => tx_axi_tdata,
    tx_axi_tvalid => l_txM_axi_tvalid,
    tx_axi_tready => l_txM_axi_tready,
    tx_axi_tlast => tx_axi_tlast,
    
    -- AXI LITE UART
    -- Read addr
    m_axi_araddr => m_axi_araddr, 
    m_axi_arready => m_axi_arready,
    m_axi_arvalid => m_axi_arvalid,
    -- Read Data
    m_axi_rdata => m_axi_rdata,
    m_axi_rready => m_axi_rready,
    m_axi_rvalid => m_axi_rvalid,
    m_axi_rresp => m_axi_rresp, 
    -- Write addr
    m_axi_awaddr => m_axi_awaddr,
    m_axi_awready => m_axi_awready, 
    m_axi_awvalid => m_axi_awvalid, 
    -- Write data
    m_axi_wdata => m_axi_wdata,
    m_axi_wready => m_axi_wready,
    m_axi_wvalid => m_axi_wvalid,
    m_axi_wstrb => m_axi_wstrb,
    m_axi_bready => m_axi_bready, 
    m_axi_bresp => m_axi_bresp,
    m_axi_bvalid => m_axi_bvalid,
    
    -- DATA OUTPUT
    start_emu => start_sgn, 
    
    frameID => cfg_frameID, 
    subframeID => cfg_subframeID, 
    slotID => cfg_slotID,
    mu => cfg_mu,
    slotStep => cfg_slotStep, 
    maxSlotId => cfg_maxSlotId,
    symbT => symbT,
    slotT => slotT,
    minTime2Proc => minTime2Proc,
    nIQSamples => nIQSamples,
    
    -- SLICE
    addSlice => addSlice, 
    rmSlice => rmSlice, 
    ecpriID => ecpriID, 
    sliceType => sliceType, 
    
    -- DEBUG
    dbg_state => dbg_fsm_uart_rx,
    dbg_state2 => dbg_fsm_uart_tx,
    dbg_axiData => dbg_axiData,
    
    -- CLK AND RESET
    clk => clk, 
    rstn => rstn 
);

end Behavioral;
