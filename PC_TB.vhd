--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:23:09 02/15/2011
-- Design Name:   
-- Module Name:   H:/CPE_233/CPE233_Exp_7/CPU_12.4/PC_TB.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC_COMP
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
 
ENTITY PC_TB IS
END PC_TB;
 
ARCHITECTURE behavior OF PC_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC_COMP
    PORT(
         clk : IN  std_logic;
         p_reset : IN  std_logic;
         pc_in : IN  std_logic_vector(9 downto 0);
         pc_load : IN  std_logic;
         pc_inc : IN  std_logic;
         pc_oe : IN  std_logic;
         pc_out : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal p_reset : std_logic := '0';
   signal pc_in : std_logic_vector(9 downto 0) := "1111111111";
   signal pc_load : std_logic := '0';
   signal pc_inc : std_logic := '0';
   signal pc_oe : std_logic := '0';

 	--Outputs
   signal pc_out : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC_COMP PORT MAP (
          clk => clk,
          p_reset => p_reset,
          pc_in => pc_in,
          pc_load => pc_load,
          pc_inc => pc_inc,
          pc_oe => pc_oe,
          pc_out => pc_out
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
      
      pc_oe <= '1';      
      pc_load <= '1';
      
      wait for 10 ns;
      
      pc_load <= '0';
      
      wait for 11 ns;
      
      p_reset <= '1';
      
      wait for 3 ns;
      
      p_reset <= '0';
      pc_in <= "1100110011";
      
      wait for 21 ns;
      
      p_reset <= '1';
      pc_load <= '1';
      
      wait for 20 ns;
      
      p_reset <= '0';
      pc_load <= '0';
      
      wait for 20 ns;
      
      pc_inc <= '1';
      
      wait for 30 ns;
      
      pc_oe <= '0';
   
      wait for 30 ns;

      pc_oe <= '1';
   
      wait for 30 ns;

      pc_inc <= '0';

      wait for 40 ns;

      wait;
   end process;

END;
