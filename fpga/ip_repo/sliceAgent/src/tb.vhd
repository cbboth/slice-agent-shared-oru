----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.03.2024 12:31:05
-- Design Name: 
-- Module Name: tb - Behavioral
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

entity tb is
    generic(
        IN_WIDTH : natural := 32
    );
--  Port ( );
end tb;

architecture Behavioral of tb is

signal clk: std_logic := '1';
signal rst: std_logic := '0';

-- ETHERNET DATA INPUT AXIS
signal SD_AXIS_tdata: std_logic_vector(IN_WIDTH-1 downto 0) := (others => '0');
signal SD_AXIS_tvalid: std_logic := '0';
signal SD_AXIS_tlast: std_logic := '0';
signal SD_AXIS_tready: std_logic := '0';

-- ETHERN OUTPUT CONTROL
signal TxC_AXIS_tdata: std_logic_vector(IN_WIDTH-1 downto 0) := (others => '0');
signal TxC_AXIS_tvalid: std_logic := '0';
signal TxC_AXIS_tlast: std_logic := '0';
signal TxC_AXIS_tready: std_logic := '0';

-- ETHERN OUTPUT
signal TxD_AXIS_tdata: std_logic_vector(IN_WIDTH-1 downto 0) := (others => '0');
signal TxD_AXIS_tvalid: std_logic := '0';
signal TxD_AXIS_tlast: std_logic := '0';
signal TxD_AXIS_tready: std_logic := '0';
signal TxD_AXI_tstrb : std_logic_vector((IN_WIDTH/8)-1 downto 0) := (others => '0');

-- LOW PHY DATA AXI
signal LPHY_AXI_tdata : std_logic_vector(IN_WIDTH-1 downto 0) := (others => '0');
signal LPHY_AXI_tvalid: std_logic := '0';
signal LPHY_AXI_tlast: std_logic := '0';
signal LPHY_AXI_tready: std_logic := '0';

-- Control signals
signal n1Start: std_logic := '0';
signal ejectSymb: std_logic_vector(13 downto 0) := (others => '0');
signal moveN1toN: std_logic_vector(13 downto 0) := (others => '0');
signal symbSel: std_logic_vector(3 downto 0) := (others => '0');

signal ecpriID: std_logic_vector(15 downto 0) := (others => '0');
signal sliceType: std_logic_vector(3 downto 0) := (others => '0');
signal addSlice: std_logic := '0';
signal rmSlice: std_logic := '0';
signal swap: std_logic := '0';
signal symb : std_logic := '0';

signal ctrlDone : std_logic := '0';

-- CONTROL IDS

signal dstMAC: std_logic_vector(47 downto 0) := (others => '0');
signal srcMAC: std_logic_vector(47 downto 0) := (others => '0');
signal frameID : std_logic_vector(7 downto 0) := (others => '0');
signal subFrameID : std_logic_vector(3 downto 0) := (others => '0');
signal slotID : std_logic_vector(5 downto 0) := (others => '0');
signal mu : std_logic_vector(3 downto 0) := x"1";
signal symbolID : std_logic_vector(3 downto 0) := (others => '0');

signal slotStep : unsigned(3 downto 0) := (others => '0');
constant MAX_FRAMEID : std_logic_vector(7 downto 0) := x"FF";
constant MAX_SUBFRAMEID : std_logic_vector(3 downto 0) := x"F";
signal MAX_SLOTID : std_logic_vector(5 downto 0) := (others => '0');

type idsArr is Array(4 downto 0) of std_logic_vector(31 downto 0);
signal ids : idsArr := (others => (others => '0'));

signal eth_swap: std_logic_vector(IN_WIDTH-1 downto 0) := (others => '0');
constant N_PHY_WORD : integer := (65*12*32)/IN_WIDTH;
constant CLK_PERIOD : time := 10ns;

signal SYMBOL_DURATION : time := 0 ns;

begin

    SYMBOL_DURATION <=  71.35 us when mu = x"0" else
                        35.68 us when mu = x"1" else
                        17.84 us when mu = x"2" else
                        8.92 us when mu = x"3" else
                        4.46 us;

    g_SWAP64: for ii in 0 to ((IN_WIDTH/8)-1) generate
        SD_AXIS_tdata(IN_WIDTH-ii*8-1 downto IN_WIDTH-ii*8-8) <= eth_swap(ii*8+7 downto ii*8);
    end generate g_SWAP64;

    dstMAC <= x"DA0203040506";
    srcMAC <= x"CA0203040506";
    clk <= not clk after CLK_PERIOD/2;
       
--    ids(0) <= x"10000001";
--    ids(1) <= x"10800001";
--    ids(2) <= x"20000001";
--    ids(3) <= x"20800001";

    ids(0) <= x"00800001";
    ids(1) <= x"10000001";
    ids(2) <= x"10800001";
    ids(3) <= x"20000001";
    
    

    -- ENTITY DECLARATION
    DUT: entity work.sliceA
    generic map(
        AXI_WIDTH => IN_WIDTH
    )
    port map(
        clk => clk,
        rst => rst,
        
        SD_AXIS_tdata => SD_AXIS_tdata,
        SD_AXIS_tvalid => SD_AXIS_tvalid,
        SD_AXIS_tlast => SD_AXIS_tlast,
        SD_AXIS_tready => SD_AXIS_tready,
        
        TxC_AXIS_tdata => TxC_AXIS_tdata,
        TxC_AXIS_tvalid => TxC_AXIS_tvalid,
        TxC_AXIS_tlast => TxC_AXIS_tlast,
        TxC_AXIS_tready => TxC_AXIS_tready,
        
        TxD_AXIS_tdata => TxD_AXIS_tdata,
        TxD_AXIS_tvalid => TxD_AXIS_tvalid,
        TxD_AXIS_tlast => TxD_AXIS_tlast,
        TxD_AXIS_tready => TxD_AXIS_tready,
        TxD_AXI_tstrb => TxD_AXI_tstrb,
        
        LPHY_AXI_tdata => LPHY_AXI_tdata,
        LPHY_AXI_tvalid => LPHY_AXI_tvalid,
        LPHY_AXI_tlast => LPHY_AXI_tlast,
        LPHY_AXI_tready => LPHY_AXI_tready,
        
        frameID => frameID,
        subframeID => subframeID,
        slotID => slotID,
        mu => mu,
        symbolID => symbolID,
        dstMAC => dstMAC,
        srcMAC => srcMAC,
        
        ecpriID => ecpriID,
        sliceType => sliceType,
        addSlice => addSlice,
        rmSlice => rmSlice
    );
    
    RESET_P: process 
    begin
        rst <= '0';
        wait for CLK_PERIOD*5;
        rst <= '1';
        TxD_AXIS_tready <= '1';
        TxC_AXIS_tready <= '1';
        wait;
    end process;
    
    g_AXI32: if IN_WIDTH = 32 generate
    AXI_P: process
    begin
        eth_swap <= (others => '0');
        SD_AXIS_tvalid <= '0';
        SD_AXIS_tlast <= '0';
        wait for CLK_PERIOD*10;
        
        -- Write slice type
        ecpriID <= x"A0A0";
        sliceType <= x"1";
        addSlice <= '1';
        wait for CLK_PERIOD;
        addSlice <= '0';
        wait for CLK_PERIOD*5;
        ecpriID <= x"A0C0";
        sliceType <= x"1";
        addSlice <= '1';
        wait for CLK_PERIOD;
        addSlice <= '0';
        wait for CLK_PERIOD*5;
        ecpriID <= x"A0B0";
        sliceType <= x"2";
        addSlice <= '1';
        wait for CLK_PERIOD;
        addSlice <= '0';
        wait for CLK_PERIOD*5;
        ecpriID <= x"A0C0";
        rmSlice <= '1';
        wait for CLK_PERIOD;
        rmSlice <= '0';
        wait for CLK_PERIOD*5;
        
        for i in 0 to 4 loop
        ctrlDone <= '1';
        
        wait on slotID;
        wait for CLK_PERIOD*10*400;
        
        ctrlDone <= '0';
        
        -- SLICE 1
        if (i < 3) then
            for j in 0 to 20 loop
                wait on clk until (clk = '1' and SD_AXIS_tready = '1');
                --SD_AXIS_tdata <= std_logic_vector(to_unsigned(rand_int(0, MAX_RAND), SD_AXIS_tdata'length));
                SD_AXIS_tvalid <= '1';
                eth_swap <= x"CA020304";
                wait for CLK_PERIOD;
                eth_swap <= x"0506DA02";
                wait for CLK_PERIOD;
                eth_swap <= x"03040506";
                wait for CLK_PERIOD;
                eth_swap <= x"81000123"; -- vlan = 0x123
                wait for CLK_PERIOD;
                eth_swap <= x"eefe1002"; -- ecpriMessage = 0x02
                wait for CLK_PERIOD;
                eth_swap <= x"0000" & x"A0A0";-- std_logic_vector(x"A0A0" + to_unsigned(j*7, 16)); -- ecpriID = 0xA0A0
                wait for CLK_PERIOD;
                eth_swap <= x"00001000"; -- Data dir = 1 / Frame ID = 0
                wait for CLK_PERIOD;
                eth_swap <= std_logic_vector(unsigned(ids(i)) + x"30000"); -- subframID / slotID = ids() / Start Symbol = 3
                wait for CLK_PERIOD;
                eth_swap <= std_logic_vector(x"00000000" + to_unsigned(j, 24)(9 downto 8)); -- startPRB = j
                wait for CLK_PERIOD;
                eth_swap <= std_logic_vector(to_unsigned(j, 24)(7 downto 0)) & x"010005"; -- startPRB = j / NumPRB = 1 / Num Symb = 5
                SD_AXIS_tlast <= '1';
                wait for CLK_PERIOD;
                SD_AXIS_tlast <= '0';
                SD_AXIS_tvalid <= '0';
                --wait for CLK_PERIOD*2;
            end loop;
        end if;
        
        if (i < 4) then
            wait on clk until (clk = '1' and SD_AXIS_tready = '1');
            SD_AXIS_tvalid <= '1';
            eth_swap <= x"CA020304";
            wait for CLK_PERIOD;
            eth_swap <= x"0506DA02";
            wait for CLK_PERIOD;
            eth_swap <= x"03040506";
            wait for CLK_PERIOD;
            eth_swap <= x"81000123"; -- vlan = 0x123
            wait for CLK_PERIOD;
            eth_swap <= x"eefe1002"; -- ecpriMessage = 0x02
            wait for CLK_PERIOD;
            eth_swap <= x"0000A0B0"; -- ecpriID = 0xA0A0
            wait for CLK_PERIOD;
            eth_swap <= x"00001000"; -- Data dir = 0 / Frame ID = 0
            wait for CLK_PERIOD;
            eth_swap <= std_logic_vector(unsigned(ids(i)) + x"10000"); -- subframID / slotID = ids() / Start Symbol = 3
            wait for CLK_PERIOD;
            eth_swap <= std_logic_vector(x"00000000" + to_unsigned(30, 24)(9 downto 8)); -- startPRB = 5
            wait for CLK_PERIOD;
            eth_swap <= std_logic_vector(to_unsigned(30, 24)(7 downto 0)) & x"20000A"; -- startPRB = 30 / NumPRB = 32 / Num Symb = 10
            SD_AXIS_tlast <= '1';
            wait for CLK_PERIOD;
            SD_AXIS_tlast <= '0';
            SD_AXIS_tvalid <= '0';
            wait for CLK_PERIOD*2;
        end if;
        
        
        --        
        
        end loop;
        wait;
    end process;
    end generate g_AXI32;
    
    g_AXI64: if IN_WIDTH = 64 generate
    AXI_P64: process
    begin
        eth_swap <= (others => '0');
        SD_AXIS_tvalid <= '0';
        SD_AXIS_tlast <= '0';
        wait for CLK_PERIOD*10;
        
        -- Write slice type
        ecpriID <= x"A0A0";
        sliceType <= x"1";
        addSlice <= '1';
        wait for CLK_PERIOD;
        addSlice <= '0';
        wait for CLK_PERIOD*5;
        ecpriID <= x"A0C0";
        sliceType <= x"1";
        addSlice <= '1';
        wait for CLK_PERIOD;
        addSlice <= '0';
        wait for CLK_PERIOD*5;
        ecpriID <= x"A0B0";
        sliceType <= x"2";
        addSlice <= '1';
        wait for CLK_PERIOD;
        addSlice <= '0';
        wait for CLK_PERIOD*5;
        ecpriID <= x"A0C0";
        rmSlice <= '1';
        wait for CLK_PERIOD;
        rmSlice <= '0';
        wait for CLK_PERIOD*5;
        
        for i in 0 to 4 loop
        ctrlDone <= '1';
        
        wait on slotID;
        wait for CLK_PERIOD*10*400;
        ctrlDone <= '0';
        
        -- SLICE 1
        if (i < 3) then
            for j in 0 to 20 loop
                wait on clk until (clk = '1' and SD_AXIS_tready = '1');
                --SD_AXIS_tdata <= std_logic_vector(to_unsigned(rand_int(0, MAX_RAND), SD_AXIS_tdata'length));
                SD_AXIS_tvalid <= '1';
                eth_swap <= x"CA020304" & x"0506DA02";
                wait for CLK_PERIOD;
                eth_swap <= x"03040506" & x"81000123"; -- vlan = 0x123
                wait for CLK_PERIOD;
                eth_swap <= x"eefe1002" & x"0000A0A0"; -- ecpriMessage = 0x02 / ecpriID = 0xA0A0
                wait for CLK_PERIOD;
                eth_swap <= x"00001000" & std_logic_vector(unsigned(ids(i)) + x"30000"); -- Data dir = 1 / Frame ID = 0 / subframID / slotID = ids() / Start Symbol = 3
                wait for CLK_PERIOD;
                eth_swap <= x"0000" & std_logic_vector(to_unsigned(j, 24)) & x"010005"; -- startPRB = j / startPRB = j / NumPRB = 1 / Num Symb = 5
                SD_AXIS_tlast <= '1';
                wait for CLK_PERIOD;
                SD_AXIS_tlast <= '0';
                SD_AXIS_tvalid <= '0';
                wait for CLK_PERIOD;
                --wait for CLK_PERIOD*2;
            end loop;
        end if;
        
        if (i < 4) then
            wait on clk until (clk = '1' and SD_AXIS_tready = '1');
            SD_AXIS_tvalid <= '1';
            eth_swap <= x"CA020304" & x"0506DA02";
            wait for CLK_PERIOD;
            eth_swap <= x"03040506" & x"81000123"; -- vlan = 0x123
            wait for CLK_PERIOD;
            eth_swap <= x"eefe1002" & x"0000A0B0"; -- ecpriMessage = 0x02 / ecpriID = 0xA0A0
            wait for CLK_PERIOD;
            eth_swap <= x"00001000" & std_logic_vector(unsigned(ids(i)) + x"10000"); -- Data dir = 0 / Frame ID = 0 subframID / slotID = ids() / Start Symbol = 1
            wait for CLK_PERIOD;
            eth_swap <= x"0000" & std_logic_vector(to_unsigned(30, 24)) & x"20000A"; -- startPRB = 30 / NumPRB = 32 / Num Symb = 10
            SD_AXIS_tlast <= '1';
            wait for CLK_PERIOD;
            SD_AXIS_tlast <= '0';
            SD_AXIS_tvalid <= '0';
            wait for CLK_PERIOD*2;
        end if;        
        end loop;
        wait;
    end process;
    end generate g_AXI64;
    
    CTRL_PROC: process
    begin
        wait for CLK_PERIOD;
        slotID <= MAX_SLOTID;
        subframeID <= MAX_SUBFRAMEID;
        frameID <= MAX_FRAMEID;
        symbolID <= std_logic_vector(to_unsigned(13, symbolID'length));
        
        wait on ctrlDone until ctrlDone = '1'; 
        wait for CLK_PERIOD*1200;
        
        for i in 0 to 4 loop
            
            if (slotID < MAX_SLOTID) then
                slotID <= std_logic_vector(unsigned(slotID) + slotStep);
            else
                slotID <= (others => '0');
                if(subframeID < MAX_SUBFRAMEID) then
                    subframeID <= std_logic_vector(unsigned(subframeID) + "1");
                else
                    subframeID <= (others => '0');
                    if(frameID < MAX_FRAMEID) then
                        frameID <= std_logic_vector(unsigned(frameID) + "1");
                    else
                        frameID <= (others => '0');
                    end if;
                end if;
            end if;         
            
            for i in 0 to 13 loop
                symbolID <= std_logic_vector(to_unsigned(i, symbolID'length));                
                wait for SYMBOL_DURATION;
            end loop;
        end loop;
        
    end process;
    
    
    -- Slot step according to ORAN Specs v12.00
    slotStep <= x"0" when mu = x"0" else
                x"1" when (mu = x"2") else
                x"2" when (mu = x"1") else
                x"0";
    
    MAX_SLOTID <=   "000000" when mu = x"0" else
                    "000010" when (mu = x"1") else
                    "000011" when (mu = x"2") else
                    "000000";

    AXI_LOWPHY: process
    begin
        LPHY_AXI_tdata <= (others => '0');
        LPHY_AXI_tvalid <= '0';
        LPHY_AXI_tlast <= '0';
        wait on symbolID;
        for i in 0 to N_PHY_WORD-1 loop
            LPHY_AXI_tdata <= std_logic_vector(unsigned(LPHY_AXI_tdata) + "1");
            LPHY_AXI_tvalid <= '1';
            if (i = N_PHY_WORD-1) then
                LPHY_AXI_tlast <= '1';
            else
                LPHY_AXI_tlast <= '0';
            end if;
            wait on clk until (LPHY_AXI_tready = '1' and clk = '1');
            --wait for CLK_PERIOD;
        end loop;
    end process;

end Behavioral;
