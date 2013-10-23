----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:05:11 02/17/2011 
-- Design Name: 
-- Module Name:    SS_ENCODER_COMP - Behavioral 
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

entity SS_DECODER_COMP is
    Port ( BCD : in  STD_LOGIC_VECTOR (3 downto 0);
           SS  : out STD_LOGIC_VECTOR (6 downto 0);
           AN  : out STD_LOGIC_VECTOR (3 downto 0);
           DP  : out STD_LOGIC);
end SS_DECODER_COMP;

architecture Behavioral of SS_DECODER_COMP is

begin

    DP <= '1';
    AN <= "0111";
    with BCD select
    SS <=   "0000001" when "0000",
            "1001111" when "0001",
            "0010010" when "0010",
            "0000110" when "0011",
            "1001100" when "0100",
            "0100100" when "0101",
            "0100000" when "0110",
            "0001111" when "0111",
            "0000000" when "1000",
            "0000100" when "1001",
            "1111111" when others;

end Behavioral;
