--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:52:22 02/15/2011
-- Design Name:   
-- Module Name:   H:/CPE_233/CPE233_Exp_7/CPU_12.4/CPU_TB.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CPU_ARCH
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY CPU_TB IS
END CPU_TB;
 
ARCHITECTURE behavior OF CPU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CPU_ARCH
    PORT(
           INPUT  : in   STD_LOGIC_VECTOR (7 downto 0);
           RESET  : in   STD_LOGIC;
           INT    : in   STD_LOGIC;
           CLK    : in   STD_LOGIC;
           LEDS   : out  STD_LOGIC_VECTOR (7 downto 0);
           SS_SS  : out  STD_LOGIC_VECTOR (6 downto 0);
           SS_AN  : out  STD_LOGIC_VECTOR (3 downto 0);
           SS_DP  : out  STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal IN_PORT : std_logic_vector(7 downto 0) := "10011001";
   signal RESET : std_logic := '0';
   signal INTERRUPT : std_logic := '0';
   signal CLK_GLOBAL : std_logic := '0';

 	--Outputs
   signal OUT_PORT : std_logic_vector(7 downto 0);
   signal PORT_ID : std_logic_vector(7 downto 0);
   signal READ_STROBE : std_logic;
   signal WRITE_STROBE : std_logic;

   -- Clock period definitions
   constant CLK_GLOBAL_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CPU_ARCH PORT MAP (
          IN_PORT => IN_PORT,
          RESET => RESET,
          INTERRUPT => INTERRUPT,
          CLK_GLOBAL => CLK_GLOBAL,
          OUT_PORT => OUT_PORT,
          PORT_ID => PORT_ID,
          READ_STROBE => READ_STROBE,
          WRITE_STROBE => WRITE_STROBE
        );

   -- Clock process definitions
   CLK_GLOBAL_process :process
   begin
		CLK_GLOBAL <= '0';
		wait for CLK_GLOBAL_period/2;
		CLK_GLOBAL <= '1';
		wait for CLK_GLOBAL_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_GLOBAL_period*10;

      -- insert stimulus here 
      
      wait for 15000ns;
      
      IN_PORT <= "11110000";
      
      wait for 15000ns;

      wait;
   end process;

END;
