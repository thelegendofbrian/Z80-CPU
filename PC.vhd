----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:45:41 02/10/2011 
-- Design Name: 
-- Module Name:    PC_COMP - Behavioral 
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

entity PC_COMP is
    Port ( clk     : in  STD_LOGIC;
           p_reset : in  STD_LOGIC;
           pc_in   : in  STD_LOGIC_VECTOR (9 downto 0);
           pc_load : in  STD_LOGIC;
           pc_inc  : in  STD_LOGIC;
           pc_oe   : in  STD_LOGIC;
           pc_val  : out STD_LOGIC_VECTOR (9 downto 0);
           pc_out  : out STD_LOGIC_VECTOR (9 downto 0));
end PC_COMP;

architecture Behavioral of PC_COMP is

signal PC_MEM : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
signal TEMP   : STD_LOGIC_VECTOR (9 downto 0);

begin

process(clk, p_reset,PC_MEM)
begin

    TEMP <= PC_MEM;
    if rising_edge(clk) then
       if pc_load = '1' then
           PC_MEM <= pc_in;
       elsif (pc_inc = '1') then
           PC_MEM <= TEMP + 1;
       end if;
    end if;
    if (p_reset = '1') then
        PC_MEM <= "0000000000";
    end if;

end process;

pc_val <= PC_MEM;
pc_out <= PC_MEM when pc_oe = '1' else
          "ZZZZZZZZZZ";

end Behavioral;