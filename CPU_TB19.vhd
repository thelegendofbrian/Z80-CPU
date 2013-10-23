
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:30:16 02/16/2011
-- Design Name:   CPU_ARCH
-- Module Name:   E:/CPE_233/CPE233_Exp_7/CPU_9.1/CPU_TB19.vhd
-- Project Name:  CPU_9.1
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
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY CPU_TB19_vhd IS
END CPU_TB19_vhd;

ARCHITECTURE behavior OF CPU_TB19_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT CPU_ARCH
	PORT(
		IN_PORT : IN std_logic_vector(7 downto 0);
		RESET : IN std_logic;
		CLK_GLOBAL : IN std_logic;          
		OE_PC_TB : OUT std_logic;
		INC_PC_TB : OUT std_logic;
		P_VAL_TB : OUT std_logic_vector(9 downto 0);
		INST_WE_TB : OUT std_logic;
		ALU_SEL_TB : OUT std_logic_vector(4 downto 0);
		WE_REG_TB : OUT std_logic;
		TRACTOR_TB : OUT std_logic_vector(9 downto 0);
		INST_TB : OUT std_logic_vector(17 downto 0);
		MUX0_SEL_TB : OUT std_logic_vector(1 downto 0);
		MUX1_SEL_TB : OUT std_logic;
		LD_PC_TB : OUT std_logic;
		OP1_TB : OUT std_logic_vector(4 downto 0);
		OP2_TB : OUT std_logic_vector(1 downto 0);
		OE_REG_TB : OUT std_logic;
		RD_TB : OUT std_logic_vector(4 downto 0);
		RS_TB : OUT std_logic_vector(4 downto 0);
		ALU_IN_A_TB : OUT std_logic_vector(7 downto 0);
		ALU_IN_B_TB : OUT std_logic_vector(7 downto 0);
		RF_Y_TB : OUT std_logic_vector(7 downto 0);
		ALU_SUM_TB : OUT std_logic_vector(7 downto 0);
		ALU_C_TB : OUT std_logic;
		ALU_Z_TB : OUT std_logic;
		C_WE_TB : OUT std_logic;
		Z_WE_TB : OUT std_logic;
		IMM_VAL_TB : OUT std_logic_vector(7 downto 0);
		OUT_PORT : OUT std_logic_vector(7 downto 0);
		PORT_ID : OUT std_logic_vector(7 downto 0);
		READ_STROBE : OUT std_logic;
		WRITE_STROBE : OUT std_logic;
		C : OUT std_logic;
		Z : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL RESET :  std_logic := '0';
	SIGNAL CLK_GLOBAL :  std_logic := '0';
	SIGNAL IN_PORT :  std_logic_vector(7 downto 0) := (others=>'0');

	--Outputs
	SIGNAL OE_PC_TB :  std_logic;
	SIGNAL INC_PC_TB :  std_logic;
	SIGNAL P_VAL_TB :  std_logic_vector(9 downto 0);
	SIGNAL INST_WE_TB :  std_logic;
	SIGNAL ALU_SEL_TB :  std_logic_vector(4 downto 0);
	SIGNAL WE_REG_TB :  std_logic;
	SIGNAL TRACTOR_TB :  std_logic_vector(9 downto 0);
	SIGNAL INST_TB :  std_logic_vector(17 downto 0);
	SIGNAL MUX0_SEL_TB :  std_logic_vector(1 downto 0);
	SIGNAL MUX1_SEL_TB :  std_logic;
	SIGNAL LD_PC_TB :  std_logic;
	SIGNAL OP1_TB :  std_logic_vector(4 downto 0);
	SIGNAL OP2_TB :  std_logic_vector(1 downto 0);
	SIGNAL OE_REG_TB :  std_logic;
	SIGNAL RD_TB :  std_logic_vector(4 downto 0);
	SIGNAL RS_TB :  std_logic_vector(4 downto 0);
	SIGNAL ALU_IN_A_TB :  std_logic_vector(7 downto 0);
	SIGNAL ALU_IN_B_TB :  std_logic_vector(7 downto 0);
	SIGNAL RF_Y_TB :  std_logic_vector(7 downto 0);
	SIGNAL ALU_SUM_TB :  std_logic_vector(7 downto 0);
	SIGNAL ALU_C_TB :  std_logic;
	SIGNAL ALU_Z_TB :  std_logic;
	SIGNAL C_WE_TB :  std_logic;
	SIGNAL Z_WE_TB :  std_logic;
	SIGNAL IMM_VAL_TB :  std_logic_vector(7 downto 0);
	SIGNAL OUT_PORT :  std_logic_vector(7 downto 0);
	SIGNAL PORT_ID :  std_logic_vector(7 downto 0);
	SIGNAL READ_STROBE :  std_logic;
	SIGNAL WRITE_STROBE :  std_logic;
	SIGNAL C :  std_logic;
	SIGNAL Z :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: CPU_ARCH PORT MAP(
		IN_PORT => IN_PORT,
		RESET => RESET,
		CLK_GLOBAL => CLK_GLOBAL,
		OE_PC_TB => OE_PC_TB,
		INC_PC_TB => INC_PC_TB,
		P_VAL_TB => P_VAL_TB,
		INST_WE_TB => INST_WE_TB,
		ALU_SEL_TB => ALU_SEL_TB,
		WE_REG_TB => WE_REG_TB,
		TRACTOR_TB => TRACTOR_TB,
		INST_TB => INST_TB,
		MUX0_SEL_TB => MUX0_SEL_TB,
		MUX1_SEL_TB => MUX1_SEL_TB,
		LD_PC_TB => LD_PC_TB,
		OP1_TB => OP1_TB,
		OP2_TB => OP2_TB,
		OE_REG_TB => OE_REG_TB,
		RD_TB => RD_TB,
		RS_TB => RS_TB,
		ALU_IN_A_TB => ALU_IN_A_TB,
		ALU_IN_B_TB => ALU_IN_B_TB,
		RF_Y_TB => RF_Y_TB,
		ALU_SUM_TB => ALU_SUM_TB,
		ALU_C_TB => ALU_C_TB,
		ALU_Z_TB => ALU_Z_TB,
		C_WE_TB => C_WE_TB,
		Z_WE_TB => Z_WE_TB,
		IMM_VAL_TB => IMM_VAL_TB,
		OUT_PORT => OUT_PORT,
		PORT_ID => PORT_ID,
		READ_STROBE => READ_STROBE,
		WRITE_STROBE => WRITE_STROBE,
		C => C,
		Z => Z
	);

	tb : PROCESS
	BEGIN

		-- Wait 100 ns for global reset to finish
		wait for 100 ns;

		-- Place stimulus here

		wait; -- will wait forever
	END PROCESS;

END;
