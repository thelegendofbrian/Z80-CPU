----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:12:46 02/09/2011 
-- Design Name: 
-- Module Name:    CPU_ARCH - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CPU_ARCH is
    Port ( IN_PORT      : in   STD_LOGIC_VECTOR (7 downto 0);
           RESET        : in   STD_LOGIC;
--           INTERRUPT    : in   STD_LOGIC;
           CLK_GLOBAL   : in   STD_LOGIC;
           OUT_PORT     : out  STD_LOGIC_VECTOR (7 downto 0);
           PORT_ID      : out  STD_LOGIC_VECTOR (7 downto 0);
           READ_STROBE  : out  STD_LOGIC;
           WRITE_STROBE : out  STD_LOGIC);
end CPU_ARCH;

architecture Behavioral of CPU_ARCH is

--------------------------------------
------------ COMPONENTS --------------
--------------------------------------

component ALU_COMP is
    Port ( cin        : in  STD_LOGIC;
           alu_select : in  STD_LOGIC_VECTOR (4 downto 0);
           a          : in  STD_LOGIC_VECTOR (7 downto 0);
           b          : in  STD_LOGIC_VECTOR (7 downto 0);
           z_out      : out STD_LOGIC;
           c_out      : out STD_LOGIC;
           sum        : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component CONTROL_UNIT_COMP is
    Port ( clk       : in  STD_LOGIC;
--         inter     : in  STD_LOGIC; -- Skip for now
           scrat_we  : out STD_LOGIC;
           scrat_oe  : out STD_LOGIC;
           reset_all : in  STD_LOGIC;
           read_str  : out STD_LOGIC;
           write_str : out STD_LOGIC;
           flag_z    : in  STD_LOGIC;
           write_z   : out STD_LOGIC;
           set_z     : out STD_LOGIC;
           reset_z   : out STD_LOGIC;
           flag_c    : in  STD_LOGIC;
           write_c   : out STD_LOGIC;
           set_c     : out STD_LOGIC;
           reset_c   : out STD_LOGIC;
           sel_alu   : out STD_LOGIC_VECTOR (4 downto 0);
           msel_1    : out STD_LOGIC;
           msel_0    : out STD_LOGIC_VECTOR (1 downto 0);
           we_rf     : out STD_LOGIC;
           oe_rf     : out STD_LOGIC;
           optimus_2 : in  STD_LOGIC_VECTOR (1 downto 0);
           optimus_1 : in  STD_LOGIC_VECTOR (4 downto 0);
           msel_2    : out STD_LOGIC_VECTOR (2 downto 0);
           res_sp    : out STD_LOGIC;
           sp_dec    : out STD_LOGIC;
           sp_inc    : out STD_LOGIC;
           sp_load   : out STD_LOGIC;
           p_oe      : out STD_LOGIC;
           p_inc     : out STD_LOGIC;
           load_pc   : out STD_LOGIC;
           reset_pc  : out STD_LOGIC;
           msel_3    : out STD_LOGIC);
end component;

component INST_REG_COMP is
    Port ( d_in       : in  STD_LOGIC_VECTOR (17 downto 0);
           pc_imm     : out STD_LOGIC_VECTOR (9 downto 0);
           op_a       : out STD_LOGIC_VECTOR (4 downto 0);
           op_b       : out STD_LOGIC_VECTOR (1 downto 0);
           addr_out_x : out STD_LOGIC_VECTOR (4 downto 0);
           addr_out_y : out STD_LOGIC_VECTOR (4 downto 0);
           imm        : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component LATCH_1BIT_COMP is
    Port ( clk   : in  STD_LOGIC;
           d_in  : in  STD_LOGIC;
           set   : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           we    : in  STD_LOGIC;
           d_out : out STD_LOGIC);
end component;

component MUX_2TO1_8BIT_COMP is
    Port ( in0, in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           sel      : in  STD_LOGIC;
           mux_out  : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component MUX_2TO1_10BIT_COMP is
    Port ( in0, in1 : in  STD_LOGIC_VECTOR (9 downto 0);
           sel      : in  STD_LOGIC;
           mux_out  : out STD_LOGIC_VECTOR (9 downto 0));
end component;

component MUX_3TO1_8BIT_COMP is
    Port ( in0, in1, in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           sel           : in  STD_LOGIC_VECTOR (1 downto 0);
           mux_out       : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component MUX_4TO1_8BIT_COMP is
    Port ( in0, in1, in2, in3 : in  STD_LOGIC_VECTOR (7 downto 0);
           sel                : in  STD_LOGIC_VECTOR (1 downto 0);
           mux_out            : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component MUX_5TO1_8BIT_COMP is
    Port ( in0, in1, in2, in3, in4 : in  STD_LOGIC_VECTOR (7 downto 0);
           sel                     : in  STD_LOGIC_VECTOR (2 downto 0);
           mux_out                 : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component PC_COMP is
    Port ( clk     : in  STD_LOGIC;
           p_reset : in  STD_LOGIC;
           pc_in   : in  STD_LOGIC_VECTOR (9 downto 0);
           pc_load : in  STD_LOGIC;
           pc_inc  : in  STD_LOGIC;
           pc_oe   : in  STD_LOGIC;
           pc_val  : out STD_LOGIC_VECTOR (9 downto 0);
           pc_out  : out STD_LOGIC_VECTOR (9 downto 0));
end component;

component REGISTER_FILE_COMP is
    Port ( clk         : in  STD_LOGIC;
           we_reg_file : in  STD_LOGIC;
           oe_reg_file : in  STD_LOGIC;
           addr_in_x   : in  STD_LOGIC_VECTOR (4 downto 0);
           addr_in_y   : in  STD_LOGIC_VECTOR (4 downto 0);
           w_addr      : in  STD_LOGIC_VECTOR (4 downto 0);
           data_in     : in  STD_LOGIC_VECTOR (7 downto 0);
           data_out_x  : out STD_LOGIC_VECTOR (7 downto 0);
           data_out_a  : out STD_LOGIC_VECTOR (7 downto 0);
           data_out_y  : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component SCRATCHPAD_COMP is
    Port ( addr_sp : in    STD_LOGIC_VECTOR (7 downto 0);
           we_sp   : in    STD_LOGIC;
           oe_sp   : in    STD_LOGIC;
           clk     : in    STD_LOGIC;
           data_sp : inout STD_LOGIC_VECTOR (9 downto 0));
end component;

component SP_COMP is
    Port ( clk    : in  STD_LOGIC;
           s_res  : in  STD_LOGIC;
           load   : in  STD_LOGIC;
           s_data : in  STD_LOGIC_VECTOR (7 downto 0);
           inc    : in  STD_LOGIC;
           dec    : in  STD_LOGIC;
           d_out  : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component PLUS_ONE_COMP is
    Port ( input  : in  STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component MINUS_ONE_COMP is
    Port ( input  : in  STD_LOGIC_VECTOR (7 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component prog_rom is 
   port (     ADDRESS : in  std_logic_vector(9 downto 0); 
          INSTRUCTION : out std_logic_vector(17 downto 0); 
                  CLK : in  std_logic);  
end component;

component OUT_BUFFER_COMP is
    Port ( input  : in  STD_LOGIC_VECTOR (7 downto 0);
           tri_l  : in  STD_LOGIC;
           output : out STD_LOGIC_VECTOR (7 downto 0));
end component;

--------------------------------------
-------------- SIGNALS ---------------
--------------------------------------

signal IN_P       : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal INST       : STD_LOGIC_VECTOR (17 downto 0);
signal OP1        : STD_LOGIC_VECTOR (4 downto 0);
signal OP2        : STD_LOGIC_VECTOR (1 downto 0);
signal RD         : STD_LOGIC_VECTOR (4 downto 0);
signal RS         : STD_LOGIC_VECTOR (4 downto 0);
signal IMM_VAL    : STD_LOGIC_VECTOR (7 downto 0);
signal BACK_STACK : STD_LOGIC_VECTOR (9 downto 0);
signal RF_Y       : STD_LOGIC_VECTOR (7 downto 0);
signal ADDR_SP    : STD_LOGIC_VECTOR (7 downto 0);
signal SCRAT_ADDR : STD_LOGIC_VECTOR (7 downto 0);
signal DEC_SP     : STD_LOGIC;
signal INC_SP     : STD_LOGIC;
signal LOAD_SP    : STD_LOGIC;
signal WE_REG     : STD_LOGIC;
signal REG_IN     : STD_LOGIC_VECTOR (7 downto 0);
signal ALU_SUM    : STD_LOGIC_VECTOR (7 downto 0);
signal MUX0_SEL   : STD_LOGIC_VECTOR (1 downto 0);
signal MUX1_SEL   : STD_LOGIC;
signal MUX2_SEL   : STD_LOGIC_VECTOR (2 downto 0);
signal MUX3_SEL   : STD_LOGIC;
signal ALU_SEL    : STD_LOGIC_VECTOR (4 downto 0);
signal C_RESET    : STD_LOGIC;
signal C_SET      : STD_LOGIC;
signal C_WE       : STD_LOGIC;
signal C_FLAG     : STD_LOGIC;
signal Z_RESET    : STD_LOGIC;
signal Z_SET      : STD_LOGIC;
signal Z_WE       : STD_LOGIC;
signal Z_FLAG     : STD_LOGIC;
signal ALU_Z      : STD_LOGIC;
signal ALU_C      : STD_LOGIC;
signal ST_WE      : STD_LOGIC;
signal ST_OE      : STD_LOGIC;
signal LD_PC      : STD_LOGIC;
signal INC_PC     : STD_LOGIC;
signal ALU_IN_A   : STD_LOGIC_VECTOR (7 downto 0);
signal ALU_IN_B   : STD_LOGIC_VECTOR (7 downto 0);  
signal PC_DATA_IN : STD_LOGIC_VECTOR (9 downto 0);
signal P_VAL      : STD_LOGIC_VECTOR (9 downto 0);
signal ADDR_SP_P1 : STD_LOGIC_VECTOR (7 downto 0);
signal ADDR_SP_M1 : STD_LOGIC_VECTOR (7 downto 0);
signal OE_REG     : STD_LOGIC;
signal OE_PC      : STD_LOGIC;
signal RES        : STD_LOGIC;
signal PC_RES     : STD_LOGIC;
signal SP_RES     : STD_LOGIC;
signal WRITE_SIG  : STD_LOGIC;
signal READ_SIG   : STD_LOGIC;
signal RW_SIG     : STD_LOGIC;
signal TRACTOR    : STD_LOGIC_VECTOR (9 downto 0);  -- Bus

begin

    RES          <= RESET;
    IN_P         <= IN_PORT;
    WRITE_STROBE <= WRITE_SIG;
    READ_STROBE  <= READ_SIG;
--    PORT_ID      <= IMM_VAL;
--    OUT_PORT     <= TRACTOR(7 downto 0);
    RW_SIG       <= WRITE_SIG OR READ_SIG;

    --------------------------------------
    ------------- PORT MAPS --------------
    --------------------------------------

    MUX0: MUX_4TO1_8BIT_COMP port map ( in0     => IN_P,
                                        in1     => ALU_SUM,
                                        in2     => TRACTOR(7 downto 0),
                                        in3     => ALU_IN_B,
                                        sel     => MUX0_SEL,
                                        mux_out => REG_IN);

    MUX1: MUX_2TO1_8BIT_COMP port map ( in0     => RF_Y,
                                        in1     => IMM_VAL,
                                        sel     => MUX1_SEL,
                                        mux_out => ALU_IN_B);

    MUX2: MUX_5TO1_8BIT_COMP port map ( in0     => RF_Y,
                                        in1     => IMM_VAL,
                                        in2     => ADDR_SP,
                                        in3     => ADDR_SP_P1,
                                        in4     => ADDR_SP_M1,
                                        sel     => MUX2_SEL,
                                        mux_out => SCRAT_ADDR);

    MUX3: MUX_2TO1_10BIT_COMP port map ( in0     => TRACTOR,
                                         in1     => BACK_STACK,
                                         sel     => MUX3_SEL,
                                         mux_out => PC_DATA_IN);
 
    CONTROL_UNIT: CONTROL_UNIT_COMP port map ( clk       => CLK_GLOBAL,
--                                             inter     => -- Skip for now
                                               scrat_we  => ST_WE,
                                               scrat_oe  => ST_OE,
                                               reset_all => RES,
                                               read_str  => READ_SIG,
                                               write_str => WRITE_SIG,
                                               flag_z    => Z_FLAG,
                                               write_z   => Z_WE,
                                               set_z     => Z_SET,
                                               reset_z   => Z_RESET,
                                               flag_c    => C_FLAG,
                                               write_c   => C_WE,
                                               set_c     => C_SET,
                                               reset_c   => C_RESET,
                                               sel_alu   => ALU_SEL,
                                               msel_1    => MUX1_SEL,
                                               msel_0    => MUX0_SEL,
                                               we_rf     => WE_REG,
                                               oe_rf     => OE_REG,
                                               optimus_2 => OP2,
                                               optimus_1 => OP1,
                                               msel_2    => MUX2_SEL,
                                               res_sp    => SP_RES,
                                               sp_dec    => DEC_SP,
                                               sp_inc    => INC_SP,
                                               sp_load   => LOAD_SP,
                                               p_oe      => OE_PC,
                                               p_inc     => INC_PC,
                                               load_pc   => LD_PC,
                                               reset_pc  => PC_RES,
                                               msel_3    => MUX3_SEL);

    REGISTER_FILE: REGISTER_FILE_COMP port map ( clk         => CLK_GLOBAL,
                                                 we_reg_file => WE_REG,
                                                 oe_reg_file => OE_REG,
                                                 addr_in_x   => RD,
                                                 addr_in_y   => RS,
                                                 w_addr      => RD,
                                                 data_in     => REG_IN,
                                                 data_out_x  => TRACTOR(7 downto 0),
                                                 data_out_a  => ALU_IN_A,
                                                 data_out_y  => RF_Y);

    ALU: ALU_COMP port map ( cin        => C_FLAG,
                             alu_select => ALU_SEL,
                             a          => ALU_IN_A,
                             b          => ALU_IN_B,
                             z_out      => ALU_Z,
                             c_out      => ALU_C,
                             sum        => ALU_SUM);

    C_LATCH: LATCH_1BIT_COMP port map ( clk   => CLK_GLOBAL,
                                        d_in  => ALU_C,
                                        set   => C_SET,
                                        reset => C_RESET,
                                        we    => C_WE,
                                        d_out => C_FLAG);

    Z_LATCH: LATCH_1BIT_COMP port map ( clk   => CLK_GLOBAL,
                                        d_in  => ALU_Z,
                                        set   => Z_SET,
                                        reset => Z_RESET,
                                        we    => Z_WE,
                                        d_out => Z_FLAG);

    SP: SP_COMP port map ( clk    => CLK_GLOBAL,
                           s_res  => SP_RES,
                           load   => LOAD_SP,
                           s_data => TRACTOR(7 downto 0),
                           inc    => INC_SP,
                           dec    => DEC_SP,
                           d_out  => ADDR_SP);

    PLUS_ONE : PLUS_ONE_COMP port map ( input  => ADDR_SP,
                                          output => ADDR_SP_P1);

    MINUS_ONE : MINUS_ONE_COMP port map ( input  => ADDR_SP,
                                          output => ADDR_SP_M1);

    PC: PC_COMP port map ( clk     => CLK_GLOBAL,
                           p_reset => PC_RES,
                           pc_in   => PC_DATA_IN,
                           pc_load => LD_PC,
                           pc_inc  => INC_PC,
                           pc_oe   => OE_PC,
                           pc_val  => P_VAL,
                           pc_out  => TRACTOR);

    INST_MEM: prog_rom port map ( address     => P_VAL,
                                  instruction => INST,
                                  clk         => CLK_GLOBAL);

    SCRATCHPAD: SCRATCHPAD_COMP port map ( addr_sp => SCRAT_ADDR,
                                           we_sp   => ST_WE,
                                           oe_sp   => ST_OE,
                                           clk     => CLK_GLOBAL,
                                           data_sp => TRACTOR);

    INST_REG: INST_REG_COMP port map ( d_in       => INST,
                                       pc_imm     => BACK_STACK,
                                       op_a       => OP1,
                                       op_b       => OP2,
                                       addr_out_x => RD,
                                       addr_out_y => RS,
                                       imm        => IMM_VAL);
                                       
    OUT_BUFFER: OUT_BUFFER_COMP port map ( input  => TRACTOR(7 downto 0),
                                           tri_l  => WRITE_SIG,
                                           output => OUT_PORT);

    PORT_ID_BUFFER: OUT_BUFFER_COMP port map ( input  => IMM_VAL,
                                               tri_l  => RW_SIG,
                                               output => PORT_ID);

end Behavioral;