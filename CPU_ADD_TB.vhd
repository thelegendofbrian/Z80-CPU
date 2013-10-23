--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:53:34 02/21/2011
-- Design Name:   
-- Module Name:   H:/CPE_233/CPE233_Exp_8/CPU_12.4/CPU_ADD_TB.vhd
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
USE ieee.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CPU_ADD_TB IS
END CPU_ADD_TB;
 
ARCHITECTURE behavior OF CPU_ADD_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CPU_ARCH
    PORT(
         IN_PORT      : IN  std_logic_vector(7 downto 0);
         RESET        : IN  std_logic;
         INTERRUPT    : IN  std_logic;
         CLK_GLOBAL   : IN  std_logic;
         OUT_PORT     : OUT std_logic_vector(7 downto 0);
         PORT_ID      : OUT std_logic_vector(7 downto 0);
         READ_STROBE  : OUT std_logic;
         WRITE_STROBE : OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IN_PORT_TB    : std_logic_vector(7 downto 0) := (others => '0');
   signal RESET_TB      : std_logic := '0';
   signal INTERRUPT_TB  : std_logic := '0';
   signal CLK_GLOBAL_TB : std_logic := '0';

   --Outputs
   signal OUT_PORT_TB     : std_logic_vector(7 downto 0);
   signal PORT_ID_TB      : std_logic_vector(7 downto 0);
   signal READ_STROBE_TB  : std_logic;
   signal WRITE_STROBE_TB : std_logic;
   
   --Expected Values
   signal OUT_PORT_EXP     : std_logic_vector(7 downto 0);
   signal PORT_ID_EXP      : std_logic_vector(7 downto 0);
   signal READ_STROBE_EXP  : std_logic;
   signal WRITE_STROBE_EXP : std_logic;

   -- Clock period definitions
   constant CLK_GLOBAL_period : time := 40 ns;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: CPU_ARCH PORT MAP (
          IN_PORT      => IN_PORT_TB,
          RESET        => RESET_TB,
          INTERRUPT    => INTERRUPT_TB,
          CLK_GLOBAL   => CLK_GLOBAL_TB,
          OUT_PORT     => OUT_PORT_TB,
          PORT_ID      => PORT_ID_TB,
          READ_STROBE  => READ_STROBE_TB,
          WRITE_STROBE => WRITE_STROBE_TB
        );


 

    -- Stimulus process
    stim_proc: process
    begin
        -- hold reset state for 100 ns.
        wait for 100 ns;

        wait for CLK_GLOBAL_period*10;

        -- insert stimulus here

        -- EXPECTED VALUES
        OUT_PORT_EXP <= X"31" AFTER CLK_GLOBAL_period*(20),
                        X"00" AFTER CLK_GLOBAL_period*(21+16),
                        X"01" AFTER CLK_GLOBAL_period*(21+16*2),
                        X"00" AFTER CLK_GLOBAL_period*(21+16*3);

        wait for CLK_GLOBAL_period*1000;
        wait;
    end process;
   
   
    -- Clock process definitions
    CLK_GLOBAL_process :process
    begin
         CLK_GLOBAL_TB <= '0';
         wait for CLK_GLOBAL_period/2;
         CLK_GLOBAL_TB <= '1';
         wait for CLK_GLOBAL_period/2;
    end process;
   
    PROCESS
    BEGIN
        WAIT FOR CLK_GLOBAL_period*20.5;
        IF (NOW>(CLK_GLOBAL_period*16)) THEN
           ASSERT (OUT_PORT_TB=OUT_PORT_EXP)
            REPORT "Mismatch at t=" & TIME'IMAGE(NOW) &
               " OUT_PORT_TB=" & INTEGER'IMAGE(conv_integer(OUT_PORT_TB)) &
                " OUT_PORT_EXP=" & INTEGER'IMAGE(conv_integer(OUT_PORT_EXP))
            SEVERITY FAILURE;
         ELSE
            ASSERT FALSE
             REPORT "No error found (t=" & TIME'IMAGE(NOW) & ")" &
               " OUT_PORT_TB=" & INTEGER'IMAGE(conv_integer(OUT_PORT_TB)) &
                " OUT_PORT_EXP=" & INTEGER'IMAGE(conv_integer(OUT_PORT_EXP))
             SEVERITY NOTE;
         END IF;
    END PROCESS;

END;
