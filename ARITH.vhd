----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:34:24 01/23/2011 
-- Design Name: 
-- Module Name:    ARITH_COMP - Behavioral 
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

entity ARITH_COMP is
    Port ( cin : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (4 downto 0);
           a   : in  STD_LOGIC_VECTOR (7 downto 0);
           b   : in  STD_LOGIC_VECTOR (7 downto 0);
           sum : out STD_LOGIC_VECTOR (7 downto 0);
           z   : out STD_LOGIC;
           c   : out STD_LOGIC);
end ARITH_COMP;

architecture Behavioral of ARITH_COMP is
begin

my_proc: process (SEL,A,B,CIN)
  variable tmp_sum  : std_logic_vector(8 downto 0);
  variable tmp_sumc : std_logic_vector(8 downto 0);
begin

tmp_sum  := ('0' & A) + ('0' & B);
tmp_sumc := ('0' & A) + ('0' & B) + CIN;


    case (sel) is
        -- ADD
        when "00000" =>
            SUM <= tmp_sum(7 downto 0);
            C <= tmp_sum(8);
            if A + B = "00000000" then
                Z <= '1';
            else
                Z <= '0';
            end if;
        -- ADDC
        when "00001" => 
            SUM <= tmp_sumc(7 downto 0);
            C <= tmp_sumc(8);
            if A + B + CIN = "00000000" then
                Z <= '1';
            else
                Z <= '0';
            end if;
        -- SUB
        when "00010" =>
            SUM <= A + (B XOR "11111111") + 1;
            if A + (B XOR "11111111") + 1 = "00000000" then
                Z <= '1';
            else
                Z <= '0';
            end if;
            if (A < B) then
                C <= '1';
            else
                C <= '0';                                  -- To avoid latching   FIXED
            end if;
        -- SUBC
        when "00011" =>
            SUM <= A + ((B + CIN) XOR "11111111") + 1;
            if A + ((B + CIN) XOR "11111111") + 1 = "00000000" then
                Z <= '1';
            else
                Z <= '0';
            end if;
            if (A < (B + CIN)) then
                C <= '1';
            else
                C <= '0';                                  -- To avoid latching    FIXED
            end if;
        -- CMP (acts like sub, but only changes C and Z)
        when "00100" =>
            if A + (B XOR "11111111") + 1 = "00000000" then
                Z <= '1';
            else
                Z <= '0';
            end if;
            if (A < B) then
                C <= '1';
            else
                C <= '0';                                  -- To avoid latching    FIXED
            end if;
            SUM <= "00000000";                             -- To avoid latching WRONG@@@@@@@@But it's fixed by the CU
        -- Invalid input
        when others =>
            SUM <= "00000000";
            C <= '0';
            Z <= '0';
    end case;
end process my_proc;

end Behavioral;
