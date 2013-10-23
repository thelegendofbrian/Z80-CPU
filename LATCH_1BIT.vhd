----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:14:48 02/10/2011 
-- Design Name: 
-- Module Name:    LATCH_1BIT_COMP - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LATCH_1BIT_COMP is
    Port ( clk   : in  STD_LOGIC;
           d_in  : in  STD_LOGIC;
           set   : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           we    : in  STD_LOGIC;
           d_out : out  STD_LOGIC);
end LATCH_1BIT_COMP;

architecture Behavioral of LATCH_1BIT_COMP is

signal MEM  : STD_LOGIC := '0';

begin

    process(clk, reset, set)
    begin
        if (reset = '1') then
            MEM <= '0';
        elsif (set = '1') then
            MEM <= '1';
        elsif (rising_edge(clk) and we = '1') then
            MEM <= d_in;
        end if;
    end process;
    
    d_out <= MEM;

end Behavioral;

