----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:47:51 02/10/2011 
-- Design Name: 
-- Module Name:    SP_COMP - Behavioral 
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

entity SP_COMP is
    Port ( clk    : in  STD_LOGIC;
           s_res  : in  STD_LOGIC;
           load   : in  STD_LOGIC;
           s_data : in  STD_LOGIC_VECTOR (7 downto 0);
           inc    : in  STD_LOGIC;
           dec    : in  STD_LOGIC;
           d_out  : out STD_LOGIC_VECTOR (7 downto 0));
end SP_COMP;

architecture Behavioral of SP_COMP is

signal MEM  : STD_LOGIC_VECTOR (7 downto 0) := X"00";
signal TEMP : STD_LOGIC_VECTOR (7 downto 0);

begin

process(clk,s_res,MEM)
begin

    TEMP <= MEM;

    if (rising_edge(clk)) then
        if (load = '1') then
            MEM <= s_data;
        elsif (inc = '1') then
            MEM <= TEMP + 1;
        elsif (dec = '1') then
            MEM <= TEMP - 1;
        end if;
    end if;
    if (s_res = '1') then
        MEM <= X"00";
    end if;

end process;

d_out <= MEM;

end Behavioral;

