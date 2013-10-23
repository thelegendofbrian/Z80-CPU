--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:56:39 03/14/2011
-- Design Name:   
-- Module Name:   H:/CPE_233/CPE233_Exp_8/CPU_12.4/WRAPPER_TB2.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: WRAPPER
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
--USE ieee.numeric_std.ALL;
 
ENTITY WRAPPER_TB2 IS
END WRAPPER_TB2;
 
ARCHITECTURE behavior OF WRAPPER_TB2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WRAPPER
    PORT(
         INPUT : IN  std_logic_vector(7 downto 0);
         RESET : IN  std_logic;
         CLK : IN  std_logic;
         LEDS : OUT  std_logic_vector(7 downto 0);
         SS_SS : OUT  std_logic_vector(6 downto 0);
         SS_AN : OUT  std_logic_vector(3 downto 0);
         SS_DP : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal INPUT : std_logic_vector(7 downto 0) := (others => '0');
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal LEDS : std_logic_vector(7 downto 0);
   signal SS_SS : std_logic_vector(6 downto 0);
   signal SS_AN : std_logic_vector(3 downto 0);
   signal SS_DP : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WRAPPER PORT MAP (
          INPUT => INPUT,
          RESET => RESET,
          CLK => CLK,
          LEDS => LEDS,
          SS_SS => SS_SS,
          SS_AN => SS_AN,
          SS_DP => SS_DP
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
