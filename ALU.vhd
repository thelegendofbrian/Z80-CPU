----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:16:51 01/23/2011 
-- Design Name: 
-- Module Name:    ALU_COMP - Behavioral 
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

entity ALU_COMP is
    Port ( cin        : in  STD_LOGIC;
           alu_select : in  STD_LOGIC_VECTOR (4 downto 0);
           a          : in  STD_LOGIC_VECTOR (7 downto 0);
           b          : in  STD_LOGIC_VECTOR (7 downto 0);
           z_out      : out STD_LOGIC;
           c_out      : out STD_LOGIC;
           sum        : out STD_LOGIC_VECTOR (7 downto 0));
end entity;

architecture Behavioral of ALU_COMP is

component ARITH_COMP
    Port ( cin : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (4 downto 0);
           a   : in  STD_LOGIC_VECTOR (7 downto 0);
           b   : in  STD_LOGIC_VECTOR (7 downto 0);
           sum : out STD_LOGIC_VECTOR (7 downto 0);
           z   : out STD_LOGIC;
           c   : out STD_LOGIC);
end component;

component LOGIC_COMP
    Port ( cin : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (4 downto 0);
           a   : in  STD_LOGIC_VECTOR (7 downto 0);
           b   : in  STD_LOGIC_VECTOR (7 downto 0);
           sum : out STD_LOGIC_VECTOR (7 downto 0);
           z   : out STD_LOGIC;
           c   : out STD_LOGIC);
end component;

component MUX_2TO1_8BIT_COMP
    Port ( in0, in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           sel      : in  STD_LOGIC;
           mux_out  : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component MUX_2TO1_1BIT_COMP
    Port ( in0, in1 : in  STD_LOGIC;
           sel      : in  STD_LOGIC;
           mux_out  : out STD_LOGIC);
end component;

signal SUM_A,SUM_L : STD_LOGIC_VECTOR (7 downto 0);
signal Z_A,Z_L,C_A,C_L : STD_LOGIC;

begin

    MUX_DATA: MUX_2TO1_8BIT_COMP port map ( in0     => SUM_A,
                                            in1     => SUM_L,
                                            sel     => ALU_SELECT(4),
                                            mux_out => SUM);

    MUX_Z: MUX_2TO1_1BIT_COMP port map ( in0     => Z_A,
                                         in1     => Z_L,
                                         sel     => ALU_SELECT(4),
                                         mux_out => Z_OUT);

    MUX_C: MUX_2TO1_1BIT_COMP port map ( in0     => C_A,
                                         in1     => C_L,
                                         sel     => ALU_SELECT(4),
                                         mux_out => C_OUT);

    ARITH: ARITH_COMP port map ( a   => A,
                                 b   => B,
                                 cin => CIN,
                                 sel => ALU_SELECT(4 downto 0),
                                 sum => SUM_A,
                                 z   => Z_A,
                                 c   => C_A);

    LOGIC: LOGIC_COMP port map ( a   => A,
                                 b   => B,
                                 cin => CIN,
                                 sel => ALU_SELECT(4 downto 0),
                                 sum => SUM_L,
                                 z   => Z_L,
                                 c   => C_L);

end Behavioral;

