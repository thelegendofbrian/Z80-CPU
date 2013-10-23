----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:22:14 02/10/2011 
-- Design Name: 
-- Module Name:    SCRATCHPAD_COMP - Behavioral 
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

entity SCRATCHPAD_COMP is
    Port ( addr_sp : in    STD_LOGIC_VECTOR (7 downto 0);
           we_sp   : in    STD_LOGIC;
           oe_sp   : in    STD_LOGIC;
           clk     : in    STD_LOGIC;
           data_sp : inout STD_LOGIC_VECTOR (9 downto 0));
end SCRATCHPAD_COMP;

architecture Behavioral of SCRATCHPAD_COMP is

TYPE memory IS ARRAY (0 to 255) of STD_LOGIC_VECTOR(9 downto 0);
SIGNAL myram : memory;

begin

data_sp <= myram(CONV_INTEGER(addr_sp)) when oe_sp = '1' else
           "ZZZZZZZZZZ";

process(clk)
begin
    if (rising_edge(clk) and we_sp = '1') then
        myram(CONV_INTEGER(addr_sp)) <= data_sp;
    end if;
end process;

end Behavioral;

