----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:53:05 02/17/2011 
-- Design Name: 
-- Module Name:    WRAPPER - Behavioral 
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

entity WRAPPER is
    Port ( switches : in   STD_LOGIC_VECTOR (7 downto 0);
           buttons  : in   STD_LOGIC_VECTOR (2 downto 0);
           reset    : in   STD_LOGIC;
--           int      : in   STD_LOGIC;
           clk      : in   STD_LOGIC;
           leds     : out  STD_LOGIC_VECTOR (7 downto 0);
           ss_ss    : out  STD_LOGIC_VECTOR (6 downto 0);
           ss_an    : out  STD_LOGIC_VECTOR (3 downto 0);
           ss_dp    : out  STD_LOGIC);
end WRAPPER;

architecture Behavioral of WRAPPER is

component CPU_ARCH is
    Port ( IN_PORT      : in   STD_LOGIC_VECTOR (7 downto 0);
           RESET        : in   STD_LOGIC;
--           INTERRUPT    : in   STD_LOGIC;
           CLK_GLOBAL   : in   STD_LOGIC;
           OUT_PORT     : out  STD_LOGIC_VECTOR (7 downto 0);
           PORT_ID      : out  STD_LOGIC_VECTOR (7 downto 0);
           READ_STROBE  : out  STD_LOGIC;
           WRITE_STROBE : out  STD_LOGIC);
end component;

component SS_DECODER_COMP is
    Port ( BCD : in  STD_LOGIC_VECTOR (3 downto 0);
           SS  : out STD_LOGIC_VECTOR (6 downto 0);
           AN  : out STD_LOGIC_VECTOR (3 downto 0);
           DP  : out STD_LOGIC);
end component;

signal OUT_SIG   : STD_LOGIC_VECTOR (7 downto 0);
signal IN_SIG    : STD_LOGIC_VECTOR (7 downto 0);
signal PORT_SIG  : STD_LOGIC_VECTOR (7 downto 0);
signal SS_IN_SIG : STD_LOGIC_VECTOR (3 downto 0);
signal READ_SIG  : STD_LOGIC;
signal WRITE_SIG : STD_LOGIC;



begin

-- Handle input requests: -------------------------------
process(PORT_SIG)
begin
    if (READ_SIG = '1') then
        if (PORT_SIG = X"20") then
            IN_SIG <= ("00000" & buttons);
        elsif (PORT_SIG = X"21") then
            IN_SIG <= switches;
        end if;
    end if;
end process;

-- Handle output requests: -------------------------------
process(PORT_SIG)
begin
  if (WRITE_SIG = '1') then
      if (PORT_SIG = X"80") then
          LEDS <= OUT_SIG;
      elsif (PORT_SIG = X"81") then
          SS_IN_SIG <= OUT_SIG(3 downto 0);
      end if;
  end if;
end process;


CPU : CPU_ARCH port map ( IN_PORT      => IN_SIG,
                          RESET        => RESET,
--                          INTERRUPT    => INT,
                          CLK_GLOBAL   => CLK,
                          OUT_PORT     => OUT_SIG,
                          PORT_ID      => PORT_SIG,
                          READ_STROBE  => READ_SIG,
                          WRITE_STROBE => WRITE_SIG);
                          
SS_DECODER : SS_DECODER_COMP port map ( BCD => SS_IN_SIG,
                                        SS  => SS_SS,
                                        AN  => SS_AN,
                                        DP  => SS_DP);

end Behavioral;

