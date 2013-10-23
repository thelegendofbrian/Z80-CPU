----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:34:24 01/23/2011 
-- Design Name: 
-- Module Name:    LOGIC_COMP - Behavioral 
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

entity LOGIC_COMP is
    Port ( CIN : in  STD_LOGIC;
           SEL : in  STD_LOGIC_VECTOR (4 downto 0);
           A   : in  STD_LOGIC_VECTOR (7 downto 0);
           B   : in  STD_LOGIC_VECTOR (7 downto 0);
           SUM : out STD_LOGIC_VECTOR (7 downto 0);
           Z   : out STD_LOGIC;
           C   : out STD_LOGIC);
end LOGIC_COMP;

architecture Behavioral of LOGIC_COMP is

begin

my_proc: process (SEL,A,B,CIN)
begin
    case (sel) is
        -- AND
        when "10000" =>
            SUM <= A AND B;
            if (A AND B) = "00000000" then
                Z <= '1';
            else
                Z <= '0';
            end if;
            C <= cin;                                    -- To avoid latching     FIXED
        -- OR
        when "10001" => 
            SUM <= A OR B;
            if (A OR B) = "00000000" then
                Z <= '1';
            else
                Z <= '0';
            end if;
            C <= cin;                                    -- To avoid latching     FIXED
        -- EXOR
        when "10010" =>
            SUM <= A XOR B;
            if (A XOR B) = "00000000" then
                Z <= '1';
            else
                Z <= '0';
            end if;
            C <= cin;                                    -- To avoid latching     FIXED
        -- TEST
        when "10011" =>
            if (A AND B) = "00000000" then
                Z <= '1';
            else
                Z <= '0';
            end if;
            C <= cin;                                    -- To avoid latching     FIXED
            SUM <= "00000000";                           -- To avoid latching   --WRONG@@@@@@@@@@But it's fixed by the CU
        -- LSL
        when "10100" =>
            C <= A(7);
            SUM <= A(6 downto 0) & CIN;
            if A = "00000000" then
                Z <= '1';
            else
                Z <= '0';
            end if;
        -- LSR
        when "10101" =>
            C <= A(0);
            SUM <= CIN & A(7 downto 1);
            if A = "00000000" then
                Z <= '1';
            else
                Z <= '0';
            end if;
        -- ROL
        when "10110" =>
            C <= A(7);
            SUM <= A(6 downto 0) & A(7);
            if A = "00000000" then
                Z <= '1';
            else
                Z <= '0';
            end if;
        -- ROR
        when "10111" =>
            C <= A(0);
            SUM <= A(0) & A(7 downto 1);
            if A = "00000000" then
                Z <= '1';
            else
                Z <= '0';
            end if;
        -- ASR
        when "11000" =>
            C <= A(0);
            SUM <= A(7) & A(7 downto 1);
            if A = "00000000" then
                Z <= '1';
            else
                Z <= '0';
            end if;
        -- Invalid input
        when others =>
            SUM <= "00000000";
            C <= '0';
            Z <= '0';
    end case;
end process my_proc;


end Behavioral;
