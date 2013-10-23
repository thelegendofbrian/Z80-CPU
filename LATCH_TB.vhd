--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:22:46 02/14/2011
-- Design Name:   
-- Module Name:   G:/CPE_233/CPE233_Exp_7/CPU/LATCH_TB.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LATCH_1BIT_COMP
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
 
ENTITY LATCH_TB IS
END LATCH_TB;
 
ARCHITECTURE behavior OF LATCH_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LATCH_1BIT_COMP
    PORT(
         clk : IN  std_logic;
         d_in : IN  std_logic;
         set : IN  std_logic;
         reset : IN  std_logic;
         we : IN  std_logic;
         d_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal d_in : std_logic := '1';
   signal set : std_logic := '0';
   signal reset : std_logic := '0';
   signal we : std_logic := '0';

 	--Outputs
   signal d_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LATCH_1BIT_COMP PORT MAP (
          clk => clk,
          d_in => d_in,
          set => set,
          reset => reset,
          we => we,
          d_out => d_out
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

      wait for 10 ns;
      
      we <= '1';
      
      wait for 10 ns;
      
      we <= '0';
      
      wait for 11 ns;
      
      reset <= '1';
      
      wait for 3 ns;
      
      reset <= '0';
      
      wait for 22 ns;
      
      set <= '1';
      
      wait for 2 ns;
      
      set <= '0';
      
      wait for 30 ns;
      
      reset <= '1';
      we <= '1';
      
      wait for 30 ns;

      wait;
   end process;

END;
