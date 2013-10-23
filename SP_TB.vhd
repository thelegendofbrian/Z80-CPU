--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:28:11 02/15/2011
-- Design Name:   
-- Module Name:   H:/CPE_233/CPE233_Exp_7/CPU_12.4/SP_TB.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SP_COMP
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
 
ENTITY SP_TB IS
END SP_TB;
 
ARCHITECTURE behavior OF SP_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SP_COMP
    PORT(
         clk : IN  std_logic;
         s_res : IN  std_logic;
         load : IN  std_logic;
         s_data : IN  std_logic_vector(7 downto 0);
         inc : IN  std_logic;
         dec : IN  std_logic;
         d_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal s_res : std_logic := '0';
   signal load : std_logic := '0';
   signal s_data : std_logic_vector(7 downto 0) := "10101010";
   signal inc : std_logic := '0';
   signal dec : std_logic := '0';

 	--Outputs
   signal d_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SP_COMP PORT MAP (
          clk => clk,
          s_res => s_res,
          load => load,
          s_data => s_data,
          inc => inc,
          dec => dec,
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
      
      load <= '1';
      
      wait for 10 ns;
      
      load <= '0';
      
      wait for 11 ns;
      
      s_res <= '1';
      
      wait for 3 ns;
      
      s_res <= '0';
      s_data <= "00110011";
      
      wait for 21 ns;
      
      s_res <= '1';
      load <= '1';
      
      wait for 20 ns;
      
      s_res <= '0';
      load <= '0';
      
      wait for 20 ns;
      
      inc <= '1';
      
      wait for 30 ns;
      
      inc <= '0';

      wait for 20 ns;
      
      dec <= '1';
      
      wait for 30 ns;
      
      inc <= '1';
      
      wait for 30 ns;

      dec <= '0';
      inc <= '0';

      wait;
   end process;

END;
