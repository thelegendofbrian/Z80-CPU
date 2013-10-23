----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:09:12 02/17/2011 
-- Design Name: 
-- Module Name:    OUT_BUFFER_COMP - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity OUT_BUFFER_COMP is
    Port ( input  : in  STD_LOGIC_VECTOR (7 downto 0);
           tri_l  : in  STD_LOGIC;
           output : out STD_LOGIC_VECTOR (7 downto 0));
end OUT_BUFFER_COMP;

architecture Behavioral of OUT_BUFFER_COMP is

begin

    output <= input when tri_l = '1' else
              "ZZZZZZZZ";

end Behavioral;

