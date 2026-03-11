----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2024 12:42:01
-- Design Name: 
-- Module Name: sig2fifo - Behavioral
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

entity sig2fifo is
    Generic (
        AXI_WIDTH : integer := 64
    );
    Port ( 
    -- COUNTER
    counter : in std_logic_vector(47 downto 0);
    
    -- REC SIGNALS
    rec_done : in std_logic;
    rec_ecpri : in std_logic_vector(15 downto 0);
    
    -- PROC N SIGNALS
    proc_n_ecpri : in std_logic_vector(15 downto 0);
    proc_n_start : in std_logic;
    proc_n_done : in std_logic;
    
    -- PROC N1 SIGNALS
    proc_n1_ecpri : in std_logic_vector(15 downto 0);
    proc_n1_start : in std_logic;
    proc_n1_done : in std_logic;
    
    -- ENCAP SIGNALS
    encap_ecpri : in std_logic_vector(15 downto 0);
    encap_start : in std_logic;
    encap_done : in std_logic;
    
    -- AXI OUTPUT
    fifo_axi_tdata: out std_logic_vector(AXI_WIDTH-1 downto 0);
    fifo_axi_tvalid : out std_logic;
    fifo_axi_tready : in std_logic;
    
    -- CLK and RESET
    clk : in std_logic;
    rstn : in std_logic
    );
end sig2fifo;

architecture Behavioral of sig2fifo is

constant REC_STEP : std_logic_vector(3 downto 0) := x"1";
constant PROCN_START_STEP : std_logic_vector(3 downto 0) := x"2";
constant PROCN_END_STEP : std_logic_vector(3 downto 0) := x"3";
constant PROCN1_START_STEP : std_logic_vector(3 downto 0) := x"4";
constant PROCN1_END_STEP : std_logic_vector(3 downto 0) := x"5";
constant ENCAP_START_STEP : std_logic_vector(3 downto 0) := x"6";
constant ENCAP_END_STEP : std_logic_vector(3 downto 0) := x"7";

signal cape_maxis_tdata : STD_LOGIC_VECTOR ( 63 downto 0 );
signal cape_maxis_tready : STD_LOGIC;
signal cape_maxis_tvalid : STD_LOGIC;
signal cape_saxis_tdata : STD_LOGIC_VECTOR ( 63 downto 0 );
signal cape_saxis_tready : STD_LOGIC;
signal cape_saxis_tvalid : STD_LOGIC;
signal caps_maxis_tdata : STD_LOGIC_VECTOR ( 63 downto 0 );
signal caps_maxis_tready : STD_LOGIC;
signal caps_maxis_tvalid : STD_LOGIC;
signal caps_saxis_tdata : STD_LOGIC_VECTOR ( 63 downto 0 );
signal caps_saxis_tready : STD_LOGIC;
signal caps_saxis_tvalid : STD_LOGIC;
signal n1e_maxis_tdata : STD_LOGIC_VECTOR ( 63 downto 0 );
signal n1e_maxis_tready : STD_LOGIC;
signal n1e_maxis_tvalid : STD_LOGIC;
signal n1e_saxis_tdata : STD_LOGIC_VECTOR ( 63 downto 0 );
signal n1e_saxis_tready : STD_LOGIC;
signal n1e_saxis_tvalid : STD_LOGIC;
signal n1s_maxis_tdata : STD_LOGIC_VECTOR ( 63 downto 0 );
signal n1s_maxis_tready : STD_LOGIC;
signal n1s_maxis_tvalid : STD_LOGIC;
signal n1s_saxis_tdata : STD_LOGIC_VECTOR ( 63 downto 0 );
signal n1s_saxis_tready : STD_LOGIC;
signal n1s_saxis_tvalid : STD_LOGIC;
signal ns_maxis_tdata : STD_LOGIC_VECTOR ( 63 downto 0 );
signal ns_maxis_tready : STD_LOGIC;
signal ns_maxis_tvalid : STD_LOGIC;
signal ne_maxis_tdata : STD_LOGIC_VECTOR ( 63 downto 0 );
signal ne_maxis_tready : STD_LOGIC;
signal ne_maxis_tvalid : STD_LOGIC;
signal ne_saxis_tdata : STD_LOGIC_VECTOR ( 63 downto 0 );
signal ne_saxis_tready : STD_LOGIC;
signal ne_saxis_tvalid : STD_LOGIC;
signal ns_saxis_tdata : STD_LOGIC_VECTOR ( 63 downto 0 );
signal ns_saxis_tready : STD_LOGIC;
signal ns_saxis_tvalid : STD_LOGIC;
signal rec_maxis_tdata : STD_LOGIC_VECTOR ( 63 downto 0 );
signal rec_maxis_tready : STD_LOGIC;
signal rec_maxis_tvalid : STD_LOGIC;
signal rec_saxis_tdata : STD_LOGIC_VECTOR ( 63 downto 0 );
signal rec_saxis_tready : STD_LOGIC;
signal rec_saxis_tvalid : STD_LOGIC;

constant NUM_FIFO : integer := 7;
signal sel : integer range 0 to NUM_FIFO-1 := 0;

begin

rec_saxis_tdata <= REC_STEP & counter(43 downto 0) & rec_ecpri;
ns_saxis_tdata <= PROCN_START_STEP & counter(43 downto 0) & proc_n_ecpri;
ne_saxis_tdata <= PROCN_END_STEP & counter(43 downto 0) & proc_n_ecpri;
n1s_saxis_tdata <= PROCN1_START_STEP & counter(43 downto 0) & proc_n1_ecpri;
n1e_saxis_tdata <= PROCN1_END_STEP & counter(43 downto 0) & proc_n1_ecpri;
caps_saxis_tdata <= ENCAP_START_STEP & counter(43 downto 0) & encap_ecpri;
cape_saxis_tdata <= ENCAP_END_STEP & counter(43 downto 0) & encap_ecpri;

rec_saxis_tvalid <= rec_done;
ns_saxis_tvalid <= proc_n_start;
ne_saxis_tvalid <= proc_n_done;
n1s_saxis_tvalid <= proc_n1_start;
n1e_saxis_tvalid <= proc_n1_done;
caps_saxis_tvalid <= encap_start;
cape_saxis_tvalid <= encap_done;

fifo_axi_tdata <=   rec_maxis_tdata when sel = 0 else
                    ns_maxis_tdata when sel = 1 else
                    ne_maxis_tdata when sel = 2 else
                    n1s_maxis_tdata when sel = 3 else
                    n1e_maxis_tdata when sel = 4 else
                    caps_maxis_tdata when sel = 5 else
                    cape_maxis_tdata when sel = 6 else
                    (others => '0');

fifo_axi_tvalid <=  rec_maxis_tvalid when sel = 0 else
                    ns_maxis_tvalid when sel = 1 else
                    ne_maxis_tvalid when sel = 2 else
                    n1s_maxis_tvalid when sel = 3 else
                    n1e_maxis_tvalid when sel = 4 else
                    caps_maxis_tvalid when sel = 5 else
                    cape_maxis_tvalid when sel = 6 else
                    '0';
                    
rec_maxis_tready <= fifo_axi_tready when sel = 0 else '0';
ns_maxis_tready <= fifo_axi_tready when sel = 1 else '0';
ne_maxis_tready <= fifo_axi_tready when sel = 2 else '0';
n1s_maxis_tready <= fifo_axi_tready when sel = 3 else '0';
n1e_maxis_tready <= fifo_axi_tready when sel = 4 else '0';
caps_maxis_tready <= fifo_axi_tready when sel = 5 else '0';
cape_maxis_tready <= fifo_axi_tready when sel = 6 else '0';

--sel <=  0 when (fProcN_axi_tvalid = '1') else
--        1 when (fProcN1_axi_tvalid = '1') else
--        2 when fEncap_axi_tvalid = '1' else
--        3 when fRec_axi_tvalid = '1' else
--        0;

MUXP: process(clk)
begin
    if clk'event and clk = '1' then
        if rstn = '0' then
            sel <= 0;
        else
            sel <= (sel + 1) mod NUM_FIFO;
        end if;
    end if;
end process;

FIFOS: entity work.fifos_wrapper
port map(
    cape_maxis_tdata => cape_maxis_tdata,
    cape_maxis_tready => cape_maxis_tready,
    cape_maxis_tvalid => cape_maxis_tvalid,
    cape_saxis_tdata => cape_saxis_tdata,
    cape_saxis_tready => cape_saxis_tready,
    cape_saxis_tvalid => cape_saxis_tvalid,
    
    caps_maxis_tdata => caps_maxis_tdata,
    caps_maxis_tready => caps_maxis_tready,
    caps_maxis_tvalid => caps_maxis_tvalid,
    caps_saxis_tdata => caps_saxis_tdata,
    caps_saxis_tready => caps_saxis_tready,
    caps_saxis_tvalid => caps_saxis_tvalid,
        
    n1e_maxis_tdata => n1e_maxis_tdata,
    n1e_maxis_tready => n1e_maxis_tready,
    n1e_maxis_tvalid => n1e_maxis_tvalid,
    n1e_saxis_tdata => n1e_saxis_tdata,
    n1e_saxis_tready => n1e_saxis_tready,
    n1e_saxis_tvalid => n1e_saxis_tvalid,
    
    n1s_maxis_tdata => n1s_maxis_tdata,
    n1s_maxis_tready => n1s_maxis_tready,
    n1s_maxis_tvalid => n1s_maxis_tvalid,
    n1s_saxis_tdata => n1s_saxis_tdata,
    n1s_saxis_tready => n1s_saxis_tready,
    n1s_saxis_tvalid => n1s_saxis_tvalid,
        
    ne_maxis_tdata => ne_maxis_tdata,
    ne_maxis_tready => ne_maxis_tready,
    ne_maxis_tvalid => ne_maxis_tvalid,
    ne_saxis_tdata => ne_saxis_tdata,
    ne_saxis_tready => ne_saxis_tready,
    ne_saxis_tvalid => ne_saxis_tvalid,
    
    ns_maxis_tdata => ns_maxis_tdata,
    ns_maxis_tready => ns_maxis_tready,
    ns_maxis_tvalid => ns_maxis_tvalid,
    ns_saxis_tdata => ns_saxis_tdata,
    ns_saxis_tready => ns_saxis_tready,
    ns_saxis_tvalid => ns_saxis_tvalid,
    
    rec_maxis_tdata => rec_maxis_tdata,
    rec_maxis_tready => rec_maxis_tready,
    rec_maxis_tvalid => rec_maxis_tvalid,
    rec_saxis_tdata => rec_saxis_tdata,
    rec_saxis_tready => rec_saxis_tready,
    rec_saxis_tvalid => rec_saxis_tvalid,
    
    clk => clk,
    rstn => rstn
);

end Behavioral;
