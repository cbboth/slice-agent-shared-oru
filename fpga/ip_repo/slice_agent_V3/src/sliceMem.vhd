----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2024 21:19:25
-- Design Name: 
-- Module Name: sliceMem - Behavioral
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
USE ieee.math_real.log2;

entity sliceMem is
    Generic(
        MEM_SIZE : natural := 32
    );
    Port (
        eCPRI_ID    : in std_logic_vector(15 downto 0);
        addSlice: in std_logic;
        rmSlice: in std_logic;
        
        check_eCPRI : in std_logic_vector(15 downto 0);
        sliceType_valid : out std_logic;
        
        clk_0: in std_logic;
        rst_0: in std_logic
    );
end sliceMem;

architecture Behavioral of sliceMem is

    signal clk, rst : std_logic := '0';
    
    signal eCpriId, eCpriCheck : std_logic_vector(15 downto 0) := (others => '0');
    
    signal addNewSlice : std_logic := '0';
    signal delSlice : std_logic := '0';
    
    type memory is array(MEM_SIZE-1 downto 0) of std_logic_vector(15 downto 0);
    signal mem : memory := (others => (others => '0'));
    signal memCnt : integer := 0;
    
    signal hit, hit2 : std_logic_vector (MEM_SIZE-1 downto 0) := (others => '0');
    signal searchAddr,searchAddr2 : std_logic_vector(integer(log2(real(MEM_SIZE))) downto 0) := (others => '0');
    
    type maqEst is (CHECK, ADD, REMOVE);
    signal fsm : maqEst := CHECK;
begin
    clk <= clk_0;
    rst <= rst_0;

    addNewSlice <= addSlice when memCnt < MEM_SIZE else '0';
    delSlice <= rmSlice when memCnt > 0 else '0';

    eCpriCheck <= check_eCPRI;
    eCpriId <= eCPRI_ID;
    
    sliceType_valid <=  '0' when (memCnt = 0) or (eCpriCheck = std_logic_vector(to_unsigned(0, eCpriCheck'length))) else
                        '1' when (fsm = CHECK) and (hit /= std_logic_vector(to_unsigned(0, hit'length))) 
                        else '0';   
    

    G_1: for i in 0 to MEM_SIZE-1 generate
        hit(i) <= '1' when (mem(i)(15 downto 0) = eCpriCheck) else '0';
    end generate;
    
    G_2: for i in 0 to MEM_SIZE-1 generate
        hit2(i) <= '1' when (mem(i)(15 downto 0) = eCpriId) else '0';
    end generate;
    
    HIT_1: process (hit)
    begin
      for i in 0 to MEM_SIZE-1 loop
        searchAddr <= (others => '0');  -- Default assignment, any later assignment takes priority
        if (hit(i) = '1') then
          searchAddr <= std_logic_vector(to_unsigned(i, searchAddr'length));
          exit;
        end if;
      end loop;
    end process;
    
    HIT_2: process (hit2)
    begin
      for i in 0 to MEM_SIZE-1 loop
        searchAddr2 <= (others => '0');  -- Default assignment, any later assignment takes priority
        if (hit2(i) = '1') then
          searchAddr2 <= std_logic_vector(to_unsigned(i, searchAddr2'length));
          exit;
        end if;
      end loop;
    end process;
    
    process (clk)
    begin
        if clk = '1' and clk'event then
            if rst = '0' then
                memCnt <= 0;
                fsm <= CHECK;
            else
                case fsm is
                    when CHECK =>
                        if (addNewSlice = '1') then
                            fsm <= ADD;
                        elsif (delSlice = '1') then
                            fsm <= REMOVE;
                        end if;
                    when ADD =>
                        mem(memCnt) <= eCpriId;
                        memCnt <= memCnt + 1;
                        fsm <= CHECK;
                    when REMOVE =>
                        fsm <= CHECK;
                        if(hit2 > std_logic_vector(to_unsigned(0, hit2'length))) then
                            DEL_G: for n in 0 to MEM_SIZE-2 loop
                                if( n >= to_integer(unsigned(searchAddr2))) then
                                    mem(n) <= mem(n+1);
                                end if;
                            end loop;
                            mem(MEM_SIZE-1) <= (others => '0');
                            memCnt <= memCnt - 1;
                        end if;
                end case;
            end if;
        end if;
    end process;
end Behavioral;
