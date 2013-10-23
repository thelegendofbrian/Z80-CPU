----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:50:53 01/14/2011 
-- Design Name: 
-- Module Name:    REGISTER_FILE_COMP - Behavioral 
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

entity REGISTER_FILE_COMP is
    Port ( clk         : in  STD_LOGIC;
           we_reg_file : in  STD_LOGIC;
           oe_reg_file : in  STD_LOGIC;
           addr_in_x   : in  STD_LOGIC_VECTOR (4 downto 0);
           addr_in_y   : in  STD_LOGIC_VECTOR (4 downto 0);
           w_addr      : in  STD_LOGIC_VECTOR (4 downto 0);
           data_in     : in  STD_LOGIC_VECTOR (7 downto 0);
           data_out_x  : out STD_LOGIC_VECTOR (7 downto 0);
           data_out_a  : out STD_LOGIC_VECTOR (7 downto 0);
           data_out_y  : out STD_LOGIC_VECTOR (7 downto 0));
end REGISTER_FILE_COMP;

architecture Behavioral of REGISTER_FILE_COMP is
    type ramtype is array (31 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
    signal MEM : ramtype;
begin

    process(clk, we_reg_file, w_addr, data_in)
    begin

        if (rising_edge(clk)) then
            if (we_reg_file = '1') then
                MEM(CONV_INTEGER(w_addr)) <= data_in;
            end if;
        end if;
    end process;

    data_out_a <= MEM(CONV_INTEGER(addr_in_x));
    data_out_x <= MEM(CONV_INTEGER(addr_in_x)) when oe_reg_file = '1' else
                  "ZZZZZZZZ";
    data_out_y <= MEM(CONV_INTEGER(addr_in_y));

end Behavioral;