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
    AXI_WIDTH : integer := 32
  );
  Port ( 
    clk: in std_logic;
    rst: in std_logic;
    
    -- ETHERNET DATA INPUT AXIS
    SD_AXIS_tdata: in std_logic_vector(AXI_WIDTH-1 downto 0);
    SD_AXIS_tvalid: in std_logic;
    SD_AXIS_tlast: in std_logic;
    SD_AXIS_tready: out std_logic;
    
    -- ETHERNET DATA OUT AXIS
    TxD_AXIS_tdata: out std_logic_vector(AXI_WIDTH-1 downto 0);
    TxD_AXIS_tvalid: out std_logic;
    TxD_AXIS_tlast: out std_logic;
    TxD_AXIS_tready: in std_logic;
    TxD_AXI_tstrb : out std_logic_vector((AXI_WIDTH/8)-1 downto 0);
    
    -- ETHERNET CONTROL OUT AXIS
    TxC_AXIS_tdata: out std_logic_vector(AXI_WIDTH-1 downto 0);
    TxC_AXIS_tvalid: out std_logic;
    TxC_AXIS_tlast: out std_logic;
    TxC_AXIS_tready: in std_logic;
    
    -- LOW PHY AXI DATA
    LPHY_AXI_tdata : in std_logic_vector(AXI_WIDTH-1 downto 0);
    LPHY_AXI_tvalid: in std_logic;
    LPHY_AXI_tlast: in std_logic;
    LPHY_AXI_tready: out std_logic;
    
    -- IDs control signals
    frameID : in std_logic_vector(7 downto 0);
    subFrameID : in std_logic_vector(3 downto 0);
    slotID : in std_logic_vector(5 downto 0);
    symbolID : in std_logic_vector(3 downto 0);
    mu : in std_logic_vector(3 downto 0);
    dstMAC: in std_logic_vector(47 downto 0);
    srcMAC: in std_logic_vector(47 downto 0);
    
    -- Slice Write/Check signals
    ecpriID: in std_logic_vector(15 downto 0);
    sliceType: in std_logic_vector(3 downto 0);
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
    signal l_ShD_AXIS_tlast: std_logic;
    signal l_ShD_AXIS_tready: std_logic;
    
    -- SLICE TYPE WRITE/CHECK SIGNALS
    signal checkID: std_logic_vector(15 downto 0) := (others => '0');
    signal checkType: std_logic_vector(3 downto 0) := (others => '0');
    signal checkValid: std_logic := '0';
    
    -- Control signals
    signal n1Start: std_logic;
    signal swap: std_logic;
    signal ejectSymb: std_logic_vector(13 downto 0);
    signal symbSel: std_logic_vector(3 downto 0);
    signal empty : std_logic;
    
    
begin

    CPLANEREC: entity work.recProc
    generic map(
        IN_WIDTH => AXI_WIDTH
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
        sliceType => checkType,
        isSliceTypeValid => checkValid,
        
        dbg_rec => dbg_rec,
        dbg_rec_ecpri => dbg_rec_ecpri,
        
        s_aclk => clk,
        s_arstn => rst
    );
    
    CONTROL_UNIT:entity work.controlunit
    --generic map()
    port map(
        -- INPUT SIGNALS
        framID => frameID,
        subframeID => subframeID,
        slotID => slotID,
        symbolID => symbolID,
        mu => mu,
        
        -- SLICE MEM
        wr_eCPRI_ID => ecpriID,
        wr_sliceType => sliceType,
        addSlice => addSlice,
        rmSlice => rmSlice,
        
        rd_eCPRI => checkID,
        rd_sliceType => checkType,
        rd_valid => checkValid,
        
        -- CONTROL SIGNALS
        n1Start => n1Start,
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
        M_AXIS_00_0_tvalid => l_ShD_AXIS_tvalid,
        M_AXIS_00_0_tready => l_ShD_AXIS_tready,
        M_AXIS_00_0_tlast => l_ShD_AXIS_tlast,
        
        S_AXIS_0_0_tdata => l_sN_axi_tdata,
        S_AXIS_0_0_tready => l_sN_axi_tready,
        S_AXIS_0_0_tvalid => l_sN_axi_tvalid,
        S_AXIS_0_0_tlast => l_sN_axi_tlast,
        
        S_AXIS_0_1_tdata => l_sN1_axi_tdata,
        S_AXIS_0_1_tready => l_sN1_axi_tready,
        S_AXIS_0_1_tvalid => l_sN1_axi_tvalid,
        S_AXIS_0_1_tlast => l_sN1_axi_tlast,
        
        ejectBufs => ejectSymb,
        sel_0 => symbSel,
        s_start_0_0 => n1Start,
        swap_0 => swap,
        empty_0 => empty,
        
        frameID => frameID,
        subframeID => subframeID,
        slotID => slotID,
        mu => mu,
        
        dbg_proc_begin_n => dbg_proc_begin_n,
        dbg_proc_end_n => dbg_proc_end_n,
        dbg_proc_ecpriId_n => dbg_proc_ecpri_n,
        dbg_proc_begin_n1 => dbg_proc_begin_n1,
        dbg_proc_end_n1 => dbg_proc_end_n1,
        dbg_proc_ecpriId_n1 => dbg_proc_ecpri_n1,
        
        s_aclk_0_0 => clk,
        s_aresetn_0_0 => rst
    );
    
    ENCAP: entity work.encapsulation
    generic map(
        LPHY_WIDTH => AXI_WIDTH,
        OUT_WIDTH => AXI_WIDTH,
        IQSAMPLE_WIDTH => 32
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
        
        TxC_AXI_tdata => TxC_AXIS_tdata,
        TxC_AXI_tvalid => TxC_AXIS_tvalid,
        TxC_AXI_tlast => TxC_AXIS_tlast,
        TxC_AXI_tready => TxC_AXIS_tready,
                
        TxD_AXI_tdata => TxD_AXIS_tdata,
        TxD_AXI_tvalid => TxD_AXIS_tvalid,
        TxD_AXI_tlast => TxD_AXIS_tlast,
        TxD_AXI_tready => TxD_AXIS_tready,
        TxD_AXI_tstrb => TxD_AXI_tstrb,
        
        dstMAC => dstMAC,
        srcMAC => srcMAC,
        frameId => frameId,
        subFrameId => subFrameId,
        slotId => slotId,
        symbolId => symbolId,
        
        dbg_cap_bgn => dbg_cap_bgn,
        dbg_cap_end => dbg_cap_end,
        dbg_cap_ecpri => dbg_cap_ecpri,
        dbg_cap_fsm => dbg_cap_fsm,
        dbg_cap_axis => dbg_cap_axi,
        
        clk => clk,
        rst => rst
    );

end Behavioral;
