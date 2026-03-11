----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2024 21:15:15
-- Design Name: 
-- Module Name: sliceA - Behavioral
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

entity sliceA is
  Generic(
    MED_WIDTH: integer := 128;
    SCHED_WIDTH: integer := 64;
    REC_AXI_WIDTH : integer := 32;
    CAP_AXI_WIDTH : integer := 32;
    MEM_SIZE: natural := 32
  );
  Port ( 
    clk: in std_logic;
    rst: in std_logic;
    
    -- ETHERNET DATA INPUT AXIS
    SD_AXIS_tdata: in std_logic_vector(REC_AXI_WIDTH-1 downto 0);
    SD_AXIS_tvalid: in std_logic;
    SD_AXIS_tlast: in std_logic;
    SD_AXIS_tready: out std_logic;
    
    -- ETHERNET DATA OUT AXIS
    TxD_AXIS_tdata: out std_logic_vector(CAP_AXI_WIDTH-1 downto 0);
    TxD_AXIS_tvalid: out std_logic;
    TxD_AXIS_tlast: out std_logic;
    TxD_AXIS_tready: in std_logic;
    TxD_AXI_tstrb : out std_logic_vector((CAP_AXI_WIDTH/8)-1 downto 0);
    
    -- ETHERNET CONTROL OUT AXIS
    TxC_AXIS_tdata: out std_logic_vector(CAP_AXI_WIDTH-1 downto 0);
    TxC_AXIS_tvalid: out std_logic;
    TxC_AXIS_tlast: out std_logic;
    TxC_AXIS_tready: in std_logic := '0';
    
    -- LOW PHY AXI DATA
    LPHY_AXI_tdata : in std_logic_vector(CAP_AXI_WIDTH-1 downto 0);
    LPHY_AXI_tvalid: in std_logic;
    LPHY_AXI_tlast: in std_logic;
    LPHY_AXI_tready: out std_logic;
    LPHY_CFG_START : out std_logic_vector(15 downto 0);
    LPHY_START_valid : out std_logic;
    
    -- IDs control signals
    frameID : in std_logic_vector(7 downto 0);
    subFrameID : in std_logic_vector(3 downto 0);
    slotID : in std_logic_vector(5 downto 0);
    nxt_frameID : in std_logic_vector(7 downto 0);
    nxt_subFrameID : in std_logic_vector(3 downto 0);
    nxt_slotID : in std_logic_vector(5 downto 0);
    symbolID : in std_logic_vector(3 downto 0);
    
    -- CFG
    cfg_iqWidth : in STD_LOGIC_VECTOR ( 5 downto 0 );
    cfg_maxPRBPkt : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dstMAC: in std_logic_vector(47 downto 0);
    srcMAC: in std_logic_vector(47 downto 0);
    bypass_eth : in std_logic_vector(3 downto 0);
    
    -- Slice Write/Check signals
    ecpriID: in std_logic_vector(15 downto 0);
    addSlice: in std_logic := '0';
    rmSlice: in std_logic := '0';
    
    -- DEBUG
    dbg_proc_begin_n : out std_logic;
    dbg_proc_begin_n1 : out std_logic;
    dbg_proc_end_n : out std_logic;
    dbg_proc_end_n1 : out std_logic;
    dbg_proc_ecpri_n : out std_logic_vector(15 downto 0);
    dbg_proc_ecpri_n1: out std_logic_vector(15 downto 0);
    
    dbg_rec : out std_logic;
    dbg_rec_ecpri : out std_logic_vector(15 downto 0);
    
    dbg_cap_fsm : out std_logic_vector(7 downto 0);
    dbg_cap_axi: out std_logic_vector(7 downto 0);
    dbg_cap_bgn : out std_logic;
    dbg_cap_end : out std_logic;
    dbg_cap_ecpri : out std_logic_vector(15 downto 0)
    
  );
end sliceA;

architecture Behavioral of sliceA is

    -- CPLANE RECEPTION TO SCHEDULING PROCESSING
    signal l_sN1_axi_tdata, l_sN_axi_tdata: std_logic_vector(MED_WIDTH-1 downto 0) := (others => '0');
    signal l_sN1_axi_tvalid, l_sN_axi_tvalid: std_logic := '0';
    signal l_sN1_axi_tready, l_sN_axi_tready: std_logic := '0';
    signal l_sN1_axi_tlast, l_sN_axi_tlast: std_logic := '0';
    
    -- PROC OUT AXI
    signal l_ShD_AXIS_tdata: std_logic_vector(SCHED_WIDTH-1 downto 0);
    signal l_ShD_AXIS_tvalid: std_logic;
    signal l_ShD_AXIS_tvalid_2: std_logic;
    signal l_ShD_AXIS_tlast: std_logic;
    signal l_ShD_AXIS_tready_2: std_logic;
    signal l_ShD_AXIS_tready: std_logic;
    
    -- SLICE TYPE WRITE/CHECK SIGNALS
    signal checkID: std_logic_vector(15 downto 0) := (others => '0');
    signal checkValid: std_logic := '0';
    
    -- ETH OUT CPY SIGNALS TO BYPASS
    signal ethC_axi_tready : std_logic := '0';
    signal ethD_axi_tready : std_logic := '0';
    
    -- Control signals
    signal swap: std_logic := '0';
    signal ejectSymb: std_logic_vector(13 downto 0);
    signal symbSel: std_logic_vector(3 downto 0);
    signal empty : std_logic;
    
    
begin

ethC_axi_tready <= TxC_AXIS_tready when bypass_eth = "0000" else '1';                  
ethD_axi_tready <= TxD_AXIS_tready when bypass_eth = "0000" else '1';

l_ShD_AXIS_tvalid <= l_ShD_AXIS_tvalid_2 when bypass_eth = "0000" else '0';
l_ShD_AXIS_tready_2 <= l_ShD_AXIS_tready when bypass_eth = "0000" else '1'; 
                
    CPLANEREC: entity work.recProc
    generic map(
        IN_WIDTH => REC_AXI_WIDTH
    )
    port map(
        M_AXIS_0_tdata => l_sN_axi_tdata,
        M_AXIS_0_tready => l_sN_axi_tready,
        M_AXIS_0_tvalid => l_sN_axi_tvalid,
        M_AXIS_0_tlast => l_sN_axi_tlast,
        
        M_AXIS_1_tdata => l_sN1_axi_tdata,
        M_AXIS_1_tready => l_sN1_axi_tready,
        M_AXIS_1_tvalid => l_sN1_axi_tvalid,
        M_AXIS_1_tlast => l_sN1_axi_tlast,   
        
        RxD_AXIS_0_tdata => SD_AXIS_tdata,
        RxD_AXIS_0_tready => SD_AXIS_tready,
        RxD_AXIS_0_tvalid => SD_AXIS_tvalid,
        RxD_AXIS_0_tlast => SD_AXIS_tlast,
        
        eCpriIDCheck => checkID,
        isSliceTypeValid => checkValid,
        
        dbg_rec => dbg_rec,
        dbg_rec_ecpri => dbg_rec_ecpri,
        
        s_aclk => clk,
        s_arstn => rst
    );
    
    CONTROL_UNIT:entity work.controlunit
    generic map(
        MEM_SIZE => MEM_SIZE
    )
    port map(
        -- INPUT SIGNALS
        symbolID => symbolID,
        
        -- SLICE MEM
        wr_eCPRI_ID => ecpriID,
        addSlice => addSlice,
        rmSlice => rmSlice,
        
        rd_eCPRI => checkID,
        rd_valid => checkValid,
        
        -- CONTROL SIGNALS
        swap => swap,
        ejectSymb => ejectSymb,
        symbSel => symbSel,
        
        -- CLK and RSTs
        clk => clk,
        rstn => rst
    );
    
    SLICE_PROC: entity work.slice_agent_wrapper
    port map(
        -- SYMBOL 0
        M_AXIS_00_0_tdata => l_ShD_AXIS_tdata,
        M_AXIS_00_0_tvalid => l_ShD_AXIS_tvalid_2,
        M_AXIS_00_0_tready => l_ShD_AXIS_tready_2,
        M_AXIS_00_0_tlast => l_ShD_AXIS_tlast,
        
        SLICEN_AXIS_tdata => l_sN_axi_tdata,
        SLICEN_AXIS_tready => l_sN_axi_tready,
        SLICEN_AXIS_tvalid => l_sN_axi_tvalid,
        SLICEN_AXIS_tlast => l_sN_axi_tlast,
        
        SLICEN1_AXIS_tdata => l_sN1_axi_tdata,
        SLICEN1_AXIS_tready => l_sN1_axi_tready,
        SLICEN1_AXIS_tvalid => l_sN1_axi_tvalid,
        SLICEN1_AXIS_tlast => l_sN1_axi_tlast,
        
        ejectBufs => ejectSymb,
        sel => symbSel,
        swap => swap,
        empty_0 => empty,
        
        nxt_frameID => nxt_frameID,
        nxt_subframeID => nxt_subframeID,
        nxt_slotID => nxt_slotID,

        cfg_maxPRBPkt => cfg_maxPRBPkt,
        
        dbg_proc_begin_n => dbg_proc_begin_n,
        dbg_proc_end_n => dbg_proc_end_n,
        dbg_proc_ecpriId_n => dbg_proc_ecpri_n,
        dbg_proc_begin_n1 => dbg_proc_begin_n1,
        dbg_proc_end_n1 => dbg_proc_end_n1,
        dbg_proc_ecpriId_n1 => dbg_proc_ecpri_n1,
        
        clk => clk,
        rstn => rst
    );
    
    ENCAP: entity work.encapsulation
    generic map(
        LPHY_WIDTH => CAP_AXI_WIDTH,
        OUT_WIDTH => CAP_AXI_WIDTH
    )
    port map(
        SchD_AXI_tdata => l_ShD_AXIS_tdata,
        SchD_AXI_tvalid => l_ShD_AXIS_tvalid,
        SchD_AXI_tlast => l_ShD_AXIS_tlast,
        SchD_AXI_tready => l_ShD_AXIS_tready,
        SchD_isEmpty => empty,
        
        LPHY_AXI_tdata => LPHY_AXI_tdata,
        LPHY_AXI_tvalid => LPHY_AXI_tvalid,
        LPHY_AXI_tlast => LPHY_AXI_tlast,
        LPHY_AXI_tready => LPHY_AXI_tready,
        LPHY_START_BYTE => LPHY_CFG_START,
        LPHY_START_valid => LPHY_START_valid,
        
        TxC_AXI_tdata => TxC_AXIS_tdata,
        TxC_AXI_tvalid => TxC_AXIS_tvalid,
        TxC_AXI_tlast => TxC_AXIS_tlast,
        TxC_AXI_tready => ethC_axi_tready,
                
        TxD_AXI_tdata => TxD_AXIS_tdata,
        TxD_AXI_tvalid => TxD_AXIS_tvalid,
        TxD_AXI_tlast => TxD_AXIS_tlast,
        TxD_AXI_tready => ethD_axi_tready,
        TxD_AXI_tstrb => TxD_AXI_tstrb,
        
        dstMAC => dstMAC,
        srcMAC => srcMAC,
        frameId => frameId,
        subFrameId => subFrameId,
        slotId => slotId,
        symbolId => symbolId,
        
        cfg_iqWidth => cfg_iqWidth, 
        
        dbg_cap_bgn => dbg_cap_bgn,
        dbg_cap_end => dbg_cap_end,
        dbg_cap_ecpri => dbg_cap_ecpri,
        dbg_cap_fsm => dbg_cap_fsm,
        dbg_cap_axis => dbg_cap_axi,
        
        clk => clk,
        rst => rst
    );

end Behavioral;
