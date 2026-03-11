----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2024 21:26:15
-- Design Name: 
-- Module Name: dbFIFO - Behavioral
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

entity dbFIFO is
    Generic(
        FIFO_SIZE: integer := 1020;
        AXI_WIDTH: integer := 128
    );
    Port ( 
        -- X1 AXI
        S_AXIS_0_tdata: in std_logic_vector(AXI_WIDTH-1 downto 0);
        S_AXIS_0_tvalid: in std_logic;
        S_AXIS_0_tready: out std_logic;
        
        -- X2 AXI
        S_AXIS_1_tdata: in std_logic_vector(AXI_WIDTH-1 downto 0);
        S_AXIS_1_tvalid: in std_logic;
        S_AXIS_1_tready: out std_logic;
        
        -- Y1 AXI
        M_AXIS_tdata: out std_logic_vector(AXI_WIDTH-1 downto 0);
        M_AXIS_tvalid: out std_logic;
        M_AXIS_tready: in std_logic;
        
        swap: in std_logic;
    
        clk: in std_logic;
        rstn: in std_logic
    );
end dbFIFO;

architecture Behavioral of dbFIFO is

signal l_valid : std_logic;

signal x1_tdata, x2_tdata : std_logic_vector(AXI_WIDTH-1 downto 0) := (others => '0');
signal x1_tvalid, x2_tvalid: std_logic := '0';
signal x1_tready, x2_tready: std_logic := '0';
signal full_1, full_2 : std_logic := '0';

signal y1_tdata, y2_tdata : std_logic_vector(AXI_WIDTH-1 downto 0) := (others => '0');
signal y1_tvalid, y2_tvalid: std_logic := '0';
signal y1_tready, y2_tready: std_logic := '0';

signal cnt : std_logic_vector(11 downto 0);
signal cnt_int : integer := 0;

begin

cnt_int <= TO_INTEGER(unsigned(cnt));
l_valid <= S_AXIS_0_tvalid when cnt_int < FIFO_SIZE else '0';

-- Input swap
x1_tdata <= S_AXIS_0_tdata when swap = '0' else S_AXIS_1_tdata;
x2_tdata <= S_AXIS_0_tdata when swap = '1' else S_AXIS_1_tdata;
x1_tvalid <= l_valid when swap = '0' else S_AXIS_1_tvalid;
x2_tvalid <= l_valid when swap = '1' else S_AXIS_1_tvalid;
S_AXIS_0_tready <= x1_tready when swap = '0' else x2_tready;
S_AXIS_1_tready <= x1_tready when swap = '1' else x2_tready;

-- Output swap
M_AXIS_tdata <= y1_tdata when swap = '0' else y2_tdata;
M_AXIS_tvalid <= y1_tvalid when swap = '0' else y2_tvalid;
y1_tready <= M_AXIS_tready when swap = '0' else '0';
y2_tready <= M_AXIS_tready when swap = '1' else '0';

FIFOS: entity work.doubleFIFO_wrapper
port map(
    M_AXIS_0_tdata => y1_tdata,
    M_AXIS_0_tready => y1_tready,
    M_AXIS_0_tvalid => y1_tvalid,
    
    M_AXIS_1_tdata => y2_tdata,
    M_AXIS_1_tready => y2_tready,
    M_AXIS_1_tvalid => y2_tvalid,
     
    S_AXIS_0_tdata => x1_tdata,
    S_AXIS_0_tready => x1_tready,
    S_AXIS_0_tvalid => x1_tvalid,
    
    S_AXIS_1_tdata => x2_tdata,
    S_AXIS_1_tready => x2_tready,
    S_AXIS_1_tvalid => x2_tvalid,
    
    fifo_cnt => cnt,
    
    clk => clk,
    rstn => rstn
);

end Behavioral;
