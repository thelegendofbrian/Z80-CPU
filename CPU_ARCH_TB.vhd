--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:50:22 03/14/2011
-- Design Name:   
-- Module Name:   H:/CPE_233/CPE233_Exp_8/CPU_12.4/CPU_ARCH_TB.vhd
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
--USE ieee.numeric_std.ALL;
 
ENTITY CPU_ARCH_TB IS
END CPU_ARCH_TB;
 
ARCHITECTURE behavior OF CPU_ARCH_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CPU_ARCH
    PORT(
         IN_PORT : IN  std_logic_vector(7 downto 0);
         RESET : IN  std_logic;
         CLK_GLOBAL : IN  std_logic;
         OUT_PORT : OUT  std_logic_vector(7 downto 0);
         PORT_ID : OUT  std_logic_vector(7 downto 0);
         READ_STROBE : OUT  std_logic;
         WRITE_STROBE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IN_PORT : std_logic_vector(7 downto 0) := (others => '0');
   signal RESET : std_logic := '0';
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

      wait;
   end process;

END;
