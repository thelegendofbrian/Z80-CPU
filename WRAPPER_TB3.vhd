--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:41:12 03/15/2011
-- Design Name:   
-- Module Name:   H:/CPE_233/CPE233_Exp_8/CPU_12.4/WRAPPER_TB3.vhd
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
 
ENTITY WRAPPER_TB3 IS
END WRAPPER_TB3;
 
ARCHITECTURE behavior OF WRAPPER_TB3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WRAPPER
    PORT(
         switches : IN  std_logic_vector(7 downto 0);
         buttons : IN  std_logic_vector(2 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic;
         leds : OUT  std_logic_vector(7 downto 0);
         ss_ss : OUT  std_logic_vector(6 downto 0);
         ss_an : OUT  std_logic_vector(3 downto 0);
         ss_dp : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal switches : std_logic_vector(7 downto 0) := X"99";
   signal buttons : std_logic_vector(2 downto 0) := "010";
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal leds : std_logic_vector(7 downto 0);
   signal ss_ss : std_logic_vector(6 downto 0);
   signal ss_an : std_logic_vector(3 downto 0);
   signal ss_dp : std_logic;

   -- Clock period definitions
   constant clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WRAPPER PORT MAP (
          switches => switches,
          buttons => buttons,
          reset => reset,
          clk => clk,
          leds => leds,
          ss_ss => ss_ss,
          ss_an => ss_an,
          ss_dp => ss_dp
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
