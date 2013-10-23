----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:14:03 01/18/2011 
-- Design Name: 
-- Module Name:    MUX_5TO1_8BIT_COMP - Behavioral 
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

entity MUX_5TO1_8BIT_COMP is
    Port ( in0, in1, in2, in3, in4 : in  STD_LOGIC_VECTOR (7 downto 0);
           sel                     : in  STD_LOGIC_VECTOR (2 downto 0);
           mux_out                 : out STD_LOGIC_VECTOR (7 downto 0));
end entity;

architecture Behavioral of MUX_5TO1_8BIT_COMP is

begin
    with (sel) select
        mux_out <= in0 when "000",
                   in1 when "001",
                   in2 when "010",
                   in3 when "011",
                   in4 when others;

end Behavioral;
