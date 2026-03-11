----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.12.2023 23:05:19
-- Design Name: 
-- Module Name: tb2 - Behavioral
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
--  Port ( );
end tb;

architecture Behavioral of tb is

    signal clka: std_logic  := '1';
    signal rst: std_logic   := '0';
    signal start: std_logic   := '0';
    
    signal S_AXIS_0_tdata: STD_LOGIC_VECTOR ( 127 downto 0 ) := (others => '0');
    signal S_AXIS_0_tready : STD_LOGIC;
    signal S_AXIS_0_tvalid : STD_LOGIC;
    signal S_AXIS_0_tlast : STD_LOGIC;
    
    signal M_AXIS_0_tdata: STD_LOGIC_VECTOR ( 63 downto 0 ) := (others => '0');
    signal M_AXIS_0_tready : STD_LOGIC;
    signal M_AXIS_0_tvalid : STD_LOGIC;
    signal M_AXIS_0_tlast : STD_LOGIC;
    
    signal enSymbols : std_logic_vector (13 downto 0) := (others => '0');
    
    constant CLK_PERIOD : time := 20ns;
    
    signal vlan: std_logic_vector(11 downto 0) := (others => '0');
    signal eCpriID: std_logic_vector(15 downto 0) := (others => '0');
    signal numPRB: std_logic_vector(7 downto 0) := (others => '0');
    signal startPRB: std_logic_vector(10 downto 0) := (others => '0');
    signal numSymb: std_logic_vector(3 downto 0) := (others => '0');
    signal startSymb: std_logic_vector(5 downto 0) := (others => '0');
    signal procData: std_logic_vector(127 downto 0) := (others => '0');
    signal frameID : std_logic_vector(7 downto 0) := (others => '0');
    signal subframeID: std_logic_vector(3 downto 0) := (others => '0');
    signal slotID: std_logic_vector(5 downto 0) := (others => '0');
    
    signal c_frameId : std_logic_vector (7 downto 0);
    signal c_subframeID: std_logic_vector (3 downto 0);
    signal c_slotID: std_logic_vector (5 downto 0);
    signal mu : std_logic_vector (3 downto 0) := x"1"; -- Numerology (0 to 4)
    signal FRSel: std_logic := '0';   -- 0 -> FR1 / 1 -> FR2
    
begin

    clka <= not clka after CLK_PERIOD/2;
    
    procData(11 downto 0) <= vlan(11 downto 0);
    procData(27 downto 12) <= eCpriID(15 downto 0);
    procData(35 downto 28) <= numPRB(7 downto 0);
    procData(46 downto 36) <= startPRB(10 downto 0);
    procData(50 downto 47) <= numSymb(3 downto 0);
    procData(56 downto 51) <= startSymb(5 downto 0);
    procData(64 downto 57) <= frameID;
    procData(68 downto 65) <= subframeID;
    procData(74 downto 69) <= slotID;
    
    DUT: entity work.sched_proc
    port map(
        M_AXIS_0_tdata => M_AXIS_0_tdata,
        M_AXIS_0_tready => M_AXIS_0_tready,
        M_AXIS_0_tvalid => M_AXIS_0_tvalid,
        M_AXIS_0_tlast => M_AXIS_0_tlast,
        S_AXIS_0_tdata => S_AXIS_0_tdata,
        S_AXIS_0_tready => S_AXIS_0_tready,
        S_AXIS_0_tvalid => S_AXIS_0_tvalid,
        S_AXIS_0_tlast => S_AXIS_0_tlast,
        c_frameId => c_frameId,
        c_subframeID => c_subframeID,
        c_slotID => c_slotID,
        mu => mu,
        FRSel => FRSel,
        clk => clka,
        resetn => rst,
        s_start_0 => start,
        s_enSymb_0 => enSymbols
    );
    
    RESET_P: process
    begin
        rst <= '0';
        wait for CLK_PERIOD*5;
        rst <= '1';
        M_AXIS_0_tready <= '1';
        wait;
    end process;
    
    AXI_P: process
    begin
        S_AXIS_0_tdata <= (others => '0');
        S_AXIS_0_tvalid <= '0';
        S_AXIS_0_tlast <= '0';
        wait for CLK_PERIOD*10;
        
        c_frameId <= x"02";
        c_subframeID <= x"0";
        c_slotID <= "000010";
        
        -- SLICE 1
        vlan <= std_logic_vector(to_unsigned(5, vlan'length));
        eCpriID <= std_logic_vector(to_unsigned(6, eCpriID'length));
        numPRB <= std_logic_vector(to_unsigned(80, numPRB'length));
        startPRB  <= std_logic_vector(to_unsigned(0, startPRB'length));
        numSymb <= std_logic_vector(to_unsigned(5, numSymb'length));
        startSymb <= std_logic_vector(to_unsigned(5, startSymb'length));
        frameID <= x"02";
        subframeID <= x"1";
        slotID <= "000000";
        
        wait for CLK_PERIOD;
        S_AXIS_0_tdata <= procData;
        S_AXIS_0_tvalid <= '1';
        wait for CLK_PERIOD;
        S_AXIS_0_tvalid <= '0';
        wait for CLK_PERIOD*2;
        
        -- SLICE 2
        vlan <= std_logic_vector(to_unsigned(24, vlan'length));
        eCpriID <= std_logic_vector(to_unsigned(105, eCpriID'length));
        numPRB <= std_logic_vector(to_unsigned(36, numPRB'length));
        startPRB  <= std_logic_vector(to_unsigned(21, startPRB'length));
        numSymb <= std_logic_vector(to_unsigned(14, numSymb'length));
        startSymb <= std_logic_vector(to_unsigned(0, startSymb'length));
        frameID <= x"02";
        subframeID <= x"1";
        slotID <= "000000";
        wait for CLK_PERIOD;
        S_AXIS_0_tdata <= procData;
        S_AXIS_0_tvalid <= '1';
        wait for CLK_PERIOD;
        S_AXIS_0_tvalid <= '0';
        wait for CLK_PERIOD*2;
        
        -- SLICE 3
        vlan <= std_logic_vector(to_unsigned(125, vlan'length));
        eCpriID <= std_logic_vector(to_unsigned(99, eCpriID'length));
        numPRB <= std_logic_vector(to_unsigned(5, numPRB'length));
        startPRB  <= std_logic_vector(to_unsigned(10, startPRB'length));
        numSymb <= std_logic_vector(to_unsigned(5, numSymb'length));
        startSymb <= std_logic_vector(to_unsigned(0, startSymb'length));
        frameID <= x"02";
        subframeID <= x"1";
        slotID <= "000000";
        wait for CLK_PERIOD;
        S_AXIS_0_tdata <= procData;
        S_AXIS_0_tvalid <= '1';
        S_AXIS_0_tlast <= '1';
        wait for CLK_PERIOD;
        S_AXIS_0_tvalid <= '0';
        S_AXIS_0_tlast <= '0';
        wait for CLK_PERIOD*2;
        
        wait;
    end process;
    
    START_P: process
    begin
        start <= '0';
        --wait;
        wait for CLK_PERIOD*20;
        start <= '1';
        wait for CLK_PERIOD;
        start <= '0';
        wait;
    end process;


end Behavioral;