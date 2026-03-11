----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2024 13:39:56
-- Design Name: 
-- Module Name: tb_top - Behavioral
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

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is

constant AXI_WIDTH : integer := 64;

-- COUNTER
signal counter : unsigned(47 downto 0);

-- REC SIGNALS
signal rec_done : std_logic := '0';
signal rec_ecpri : std_logic_vector(15 downto 0) := x"A0A0";

-- PROC N SIGNALS
signal proc_n_ecpri : std_logic_vector(15 downto 0) := x"B0A0";
signal proc_n_start : std_logic := '0';
signal proc_n_done : std_logic := '0';

-- PROC N1 SIGNALS
signal proc_n1_ecpri : std_logic_vector(15 downto 0) := x"A0A0";
signal proc_n1_start : std_logic := '0';
signal proc_n1_done : std_logic := '0';

-- ENCAP SIGNALS
signal encap_ecpri : std_logic_vector(15 downto 0) := x"A0C0";
signal encap_start : std_logic := '0';
signal encap_done : std_logic := '0';

-- AXI OUTPUT
signal fifo_axi_tdata: std_logic_vector(AXI_WIDTH-1 downto 0);
signal fifo_axi_tvalid : std_logic := '0';
signal fifo_axi_tready : std_logic := '0';

-- CLK and RESET
signal clk : std_logic := '1';
signal rstn : std_logic := '0';

constant CLK_PERIOD : time := 10ns;

begin

clk <= not clk after CLK_PERIOD/2;

DUT: entity work.sig2fifo
port map(
-- COUNTER
counter => std_logic_vector(counter), 

-- REC SIGNALS
rec_done => rec_done, 
rec_ecpri => rec_ecpri, 

-- PROC N SIGNALS
proc_n_ecpri => proc_n_ecpri, 
proc_n_start => proc_n_start, 
proc_n_done => proc_n_done, 

-- PROC N1 SIGNALS
proc_n1_ecpri => proc_n1_ecpri, 
proc_n1_start => proc_n1_start, 
proc_n1_done => proc_n1_done, 

-- ENCAP SIGNALS
encap_ecpri => encap_ecpri, 
encap_start => encap_start, 
encap_done => encap_done, 

-- AXI OUTPUT
fifo_axi_tdata => fifo_axi_tdata,
fifo_axi_tvalid => fifo_axi_tvalid, 
fifo_axi_tready => fifo_axi_tready, 

-- CLK and RESET
clk => clk, 
rstn => rstn
);

CNTP: process
begin
    wait on clk until clk = '1';
    if(counter < x"0FFFFFFFFFFF") then
        counter <= counter + "1";
    else
        counter <= (others => '0');
    end if;
end process;

RSTP: process
begin
    rstn <= '0';
    wait for 10* CLK_PERIOD;
    rstn <= '1';
    wait for 10* CLK_PERIOD;
    fifo_axi_tready <= '1';
    wait;
end process;

SGNP: process
begin
    wait on clk until clk='1' and rstn = '1';
    wait for 10* CLK_PERIOD;
    rec_done <= '1';
    wait for CLK_PERIOD;
    rec_done <= '0';
    wait for 4* CLK_PERIOD;
    proc_n1_start <= '1';
    wait for CLK_PERIOD;
    proc_n1_start <= '0';
    wait for 10*CLK_PERIOD;
    proc_n1_done <= '1';
    proc_n_start <= '1';
    wait for 10*CLK_PERIOD;
    proc_n1_done <= '0';
    proc_n_start <= '0';
    proc_n_done <= '1';
    encap_start <= '1';
    wait for CLK_PERIOD;
    encap_done <= '1';
    proc_n_done <= '0';
    encap_start <= '0';
    wait for CLK_PERIOD;
    encap_done <= '0';
    wait;
end process;


end Behavioral;
