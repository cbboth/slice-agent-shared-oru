----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.03.2024 18:11:29
-- Design Name: 
-- Module Name: axi_demux_2x1 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity axi_demux_2x1 is
  Generic(
    AXI_TDATA_SIZE: integer := 64
  );
  Port (
    S_AXIS_00_tdata : in std_logic_vector(AXI_TDATA_SIZE-1 downto 0);
    S_AXIS_00_tvalid: in std_logic;
    S_AXIS_00_tlast: in std_logic;
    S_AXIS_00_tready: out std_logic;
    
    S_AXIS_01_tdata : in std_logic_vector(AXI_TDATA_SIZE-1 downto 0);
    S_AXIS_01_tvalid: in std_logic;
    S_AXIS_01_tlast: in std_logic;
    S_AXIS_01_tready: out std_logic;
    
    M_AXIS_00_tdata : out std_logic_vector(AXI_TDATA_SIZE-1 downto 0);
    M_AXIS_00_tvalid: out std_logic;
    M_AXIS_00_tlast: out std_logic;
    M_AXIS_00_tready: in std_logic;
    
    status : out std_logic;
    sel: in std_logic;
    clk: in std_logic;
    rst_n: in std_logic
  );
end axi_demux_2x1;

architecture Behavioral of axi_demux_2x1 is

begin

    status <= S_AXIS_00_tvalid;

    M_AXIS_00_tdata <= S_AXIS_00_tdata when sel = '0' else S_AXIS_01_tdata;
    M_AXIS_00_tvalid <= S_AXIS_00_tvalid when sel = '0' else S_AXIS_01_tvalid;
    M_AXIS_00_tlast <= S_AXIS_00_tlast when sel = '0' else S_AXIS_01_tlast;
    
    S_AXIS_01_tready <= M_AXIS_00_tready when sel = '1' else '0';
    S_AXIS_00_tready <= M_AXIS_00_tready when sel = '0' else '0';
    
end Behavioral;
