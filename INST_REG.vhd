----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:42:24 02/10/2011 
-- Design Name: 
-- Module Name:    INST_REG_COMP - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity INST_REG_COMP is
    Port ( d_in       : in  STD_LOGIC_VECTOR (17 downto 0);
           pc_imm     : out STD_LOGIC_VECTOR (9 downto 0);
           op_a       : out STD_LOGIC_VECTOR (4 downto 0);
           op_b       : out STD_LOGIC_VECTOR (1 downto 0);
           addr_out_x : out STD_LOGIC_VECTOR (4 downto 0);
           addr_out_y : out STD_LOGIC_VECTOR (4 downto 0);
           imm        : out STD_LOGIC_VECTOR (7 downto 0));
end INST_REG_COMP;

architecture Behavioral of INST_REG_COMP is

signal INSTR : STD_LOGIC_VECTOR (17 downto 0);

begin

process(d_in)
begin
    
end process;

instr      <= d_in;
op_a       <= INSTR(17 downto 13);
op_b       <= INSTR(1 downto 0);
addr_out_x <= INSTR(12 downto 8);
addr_out_y <= INSTR(7 downto 3);
imm        <= INSTR(7 downto 0);
pc_imm     <= INSTR(12 downto 3);

end Behavioral;

