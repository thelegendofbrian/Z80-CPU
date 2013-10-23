----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:00:05 02/09/2011 
-- Design Name: 
-- Module Name:    CONTROL_UNIT_COMP - Behavioral 
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

entity CONTROL_UNIT_COMP is
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
end CONTROL_UNIT_COMP;

architecture Behavioral of CONTROL_UNIT_COMP is

  type state_type is (ST_init, ST_fet, ST_exec);
  signal PS,NS : state_type;
  signal OP_CODE : STD_LOGIC_VECTOR (6 downto 0) := "0000000";

begin

OP_CODE <= optimus_1 & optimus_2;

-- Sync process --
sync_p: process (CLK,NS,reset_all)
begin
  if (reset_all = '1') then
    PS <= ST_init;
  elsif (rising_edge(CLK)) then
    PS <= NS;
  end if;
end process sync_p;

-- Comb process --
comb_p: process (OP_CODE,PS,flag_c,flag_z)
begin
  case PS is
    -- STATE: the init cycle -----------------------------------
    when ST_init =>
      NS        <= ST_fet;
      scrat_we  <= '0';
      scrat_oe  <= '0';
      read_str  <= '0';
      write_str <= '0';
      write_z   <= '0';
      set_z     <= '0';
      reset_z   <= '0';
      write_c   <= '0';
      set_c     <= '0';
      reset_c   <= '0';
      sel_alu   <= "00000";
      msel_1    <= '0';
      msel_0    <= "00";
      we_rf     <= '0';
      oe_rf     <= '0';
      msel_2    <= "000";
      res_sp    <= '1';
      sp_dec    <= '0';
      sp_inc    <= '0';
      sp_load   <= '0';
      p_oe      <= '0';
      p_inc     <= '0';
      load_pc   <= '0';
      reset_pc  <= '1';
      msel_3    <= '0';

    -- STATE: the fetch cycle -----------------------------------
    when ST_fet =>
      NS        <= ST_exec;
      scrat_we  <= '0';
      scrat_oe  <= '0';
      read_str  <= '0';
      write_str <= '0';
      write_z   <= '0';
      set_z     <= '0';
      reset_z   <= '0';
      write_c   <= '0';
      set_c     <= '0';
      reset_c   <= '0';
      sel_alu   <= "00000";
      msel_1    <= '0';
      msel_0    <= "00";
      we_rf     <= '0';
      oe_rf     <= '0';
      msel_2    <= "000";
      res_sp    <= '0';
      sp_dec    <= '0';
      sp_inc    <= '0';
      sp_load   <= '0';
      p_oe      <= '0';
      p_inc     <= '1';
      load_pc   <= '0';
      reset_pc  <= '0';
      msel_3    <= '0';
  -------------------------------------------------------------
   
  -- STATE: the execute cycle ---------------------------------
  when ST_exec =>
    -- Moore outputs for the execute cycle (these do not
    -- depend on the OP_CODE inputs)
      NS        <= ST_fet;
      scrat_we  <= '0';
      scrat_oe  <= '0';
      read_str  <= '0';
      write_str <= '0';
      write_z   <= '0';
      set_z     <= '0';
      reset_z   <= '0';
      write_c   <= '0';
      set_c     <= '0';
      reset_c   <= '0';
      sel_alu   <= "00000";
      msel_1    <= '0';
      msel_0    <= "00";
      we_rf     <= '0';
      oe_rf     <= '0';
      msel_2    <= "000";
      res_sp    <= '0';
      sp_dec    <= '0';
      sp_inc    <= '0';
      sp_load   <= '0';
      p_oe      <= '0';
      p_inc     <= '0';
      load_pc   <= '0';
      reset_pc  <= '0';
      msel_3    <= '0';
    -- handle the individual instructions provided by the
    -- instruction opcode. These are Moore outputs.

    case OP_CODE is
      when "0000000" =>   --AND  R1,R2
        sel_alu <= "10000";
        write_z <= '1';
        we_rf   <= '1';
        oe_rf  <= '1';
        msel_0 <= "01";
        msel_1 <= '0';
      when "0000001" =>   --OR   R1,R2 
        sel_alu <= "10001";
        write_z <= '1';
        we_rf     <= '1';
        oe_rf  <= '1';
        msel_0 <= "01";
        msel_1 <= '0';
      when "0000010" => --EXOR R1,R2
        sel_alu <= "10010";  
        write_z <= '1';
        we_rf     <= '1';
        oe_rf  <= '1';
        msel_0 <= "01";
        msel_1 <= '0';
      when "0000011" => --TEST R1,R2
        sel_alu <= "10011";
        write_z <= '1';
        oe_rf  <= '1';
        msel_0 <= "01";
        msel_1 <= '0';
      when "0000100" =>
        sel_alu <= "00000"; --ADD  R1,R2
        oe_rf  <= '1';
        msel_0 <= "01";
        msel_1 <= '0';
        write_c <= '1';
        write_z <= '1';
        we_rf     <= '1';
      when "0000101"   =>
        sel_alu <= "00001"; --ADDC R1,R2
        oe_rf  <= '1';
        msel_0 <= "01";
        msel_1 <= '0';
        write_c <= '1';
        write_z <= '1';
        we_rf     <= '1';
      when "0000110"   =>
        sel_alu <= "00010"; --SUB  R1,R2
        oe_rf  <= '1';
        msel_0 <= "01";
        msel_1 <= '0';
        write_c <= '1';
        write_z <= '1';
        we_rf     <= '1';
      when "0000111" =>
        sel_alu <= "00011"; --SUBC R1,R2
        oe_rf  <= '1';
        msel_0 <= "01";
        msel_1 <= '0';
        write_c <= '1';
        write_z <= '1';
        we_rf     <= '1';
      when "0001000" =>
        sel_alu  <= "00100"; --CMP R1,R2
        msel_0   <= "01";
        msel_1   <= '0';
        oe_rf    <= '1';
        write_c  <= '1';
        write_z  <= '1';
      when "0001001"   =>
        msel_0   <= "11";    --MOV R1,R2
        msel_1   <= '0';
        oe_rf    <= '1';
        we_rf    <= '1';
      when "0001010"   =>
        msel_2   <= "000";    --LD  R1,(R2)
        scrat_oe <= '1';
        msel_0   <= "10";
        we_rf    <= '1';
      when "0001011"   =>
        msel_2   <= "000";    --ST  R1,(R2)
        oe_rf    <= '1';
        scrat_we <= '1';
      when "1000000" | "1000001" | "1000010" | "1000011" =>
        sel_alu <= "10000"; -- AND  R1,0x01
        msel_1  <= '1';
        msel_0  <= "01";
        write_z <= '1';
        oe_rf   <= '1';
        we_rf   <= '1';
      when "1000100" | "1000101" | "1000110" | "1000111" =>
        sel_alu <= "10001"; -- OR   R1,0x01
        msel_1  <= '1';
        msel_0  <= "01";
        write_z <= '1';
        oe_rf   <= '1';
        we_rf   <= '1';
      when "1001000" | "1001001" | "1001010" | "1001011" =>
        sel_alu <= "10010"; -- EXOR R1,0x01
        msel_1  <= '1';
        msel_0  <= "01";
        write_z   <= '1';
        oe_rf   <= '1';
        we_rf     <= '1';
      when "1001100" | "1001101" | "1001110" | "1001111" =>
        sel_alu <= "10011"; -- TEST R1,0x01
        msel_1  <= '1';
        msel_0  <= "01";
        write_z   <= '1';
        oe_rf   <= '1';
      when "1010000" | "1010001" | "1010010" | "1010011" =>
        sel_alu <= "00000"; -- ADD  R1,0x01
        msel_1  <= '1';
        msel_0  <= "01";
        write_c   <= '1';
        write_z   <= '1';
        oe_rf   <= '1';
        we_rf     <= '1';
      when "1010100" | "1010101" | "1010110" | "1010111" =>
        sel_alu <= "00001"; -- ADDC R1,0x01
        msel_1  <= '1';
        msel_0  <= "01";
        write_c   <= '1';
        write_z   <= '1';
        oe_rf   <= '1';
        we_rf     <= '1';
      when "1011000" | "1011001" | "1011010" | "1011011" =>
        sel_alu <= "00010"; -- SUB  R1,0x01
        msel_1  <= '1';
        msel_0  <= "01";
        write_c   <= '1';
        write_z   <= '1';
        oe_rf   <= '1';
        we_rf     <= '1';
      when "1011100" | "1011101" | "1011110" | "1011111" =>
        sel_alu <= "00011"; -- SUBC R1,0x01
        msel_1  <= '1';
        msel_0  <= "01";
        write_c   <= '1';
        write_z   <= '1';
        oe_rf   <= '1';
        we_rf     <= '1';
      when "1100000" | "1100001" | "1100010" | "1100011" =>
        sel_alu <= "00100"; -- CMP  R1,0x01
        msel_1  <= '1';
        msel_0  <= "01";
        write_c   <= '1';
        write_z   <= '1';
        oe_rf   <= '1';
      when "1100100" | "1100101" | "1100110" | "1100111" =>
        msel_0  <= "00";    -- IN   R1,0x01
        read_str <= '1';
        we_rf     <= '1';
      when "1101000" | "1101001" | "1101010" | "1101011" =>
        oe_rf   <= '1';     -- OUT  R1,0x01
        write_str <= '1';
      when "1101100" | "1101101" | "1101110" | "1101111" =>
        msel_1  <= '1';     -- MOV R1,0x01
        msel_0  <= "11";
        oe_rf   <= '1';
        we_rf     <= '1';
      when "1110000" | "1110001" | "1110010" | "1110011" =>
        msel_2   <= "001";   -- LD   R1,0x01
        scrat_oe <= '1';
        msel_0   <= "10";
        we_rf     <= '1';
      when "1110100" | "1110101" | "1110110" | "1110111" =>
        scrat_we <= '1';    -- ST   R1,0x01
        msel_2   <= "001";
        oe_rf    <= '1';
      when "0010000" =>
        msel_3   <= '1'; --BRN  0x3FF
        load_pc  <= '1';
      when "0010001" =>
        load_pc  <= '1'; --CALL 0x3FF
        msel_3   <= '1';
        sp_dec   <= '1';
        scrat_we <= '1';
        p_oe     <= '1';
        msel_2   <= "010";
      when "0010010" =>
        msel_3   <= '1'; --BREQ 0x3FF
        if flag_z = '1' then
          load_pc  <= '1';
        else
          load_pc  <= '0';
        end if;
      when "0010011" =>
        msel_3   <= '1'; --BRNE 0x3FF
        if flag_z = '0' then
          load_pc  <= '1';
        else
          load_pc  <= '0';
        end if;
      when "0010100" =>
        msel_3   <= '1'; --BRCS 0x3FF
        if flag_c = '1' then
          load_pc  <= '1';
        else
          load_pc  <= '0';
        end if;
      when "0010101" =>
        msel_3   <= '1'; --BRCC 0x3FF
        if flag_c = '0' then
          load_pc  <= '1';
        else
          load_pc  <= '0';
        end if;
      when "0100000" =>
        sel_alu <= "10100"; --LSL R1
        we_rf     <= '1';
        write_c <= '1';
        write_z <= '1';
        msel_0  <= "01";
        oe_rf   <= '1';
      when "0100001" =>
        sel_alu <= "10101"; --LSR R1
        we_rf     <= '1';
        write_c <= '1';
        write_z <= '1';
        msel_0  <= "01";
        oe_rf   <= '1';
      when "0100010" =>
        sel_alu <= "10110"; --ROL R1
        we_rf     <= '1';
        write_c <= '1';
        write_z <= '1';
        msel_0  <= "01";
        oe_rf   <= '1';
      when "0100011" =>
        sel_alu <= "10111"; --ROR R1
        we_rf     <= '1';
        write_c <= '1';
        write_z <= '1';
        msel_0  <= "01";
        oe_rf   <= '1';
      when "0100100" =>
        sel_alu  <= "11000"; --ASR R1
        msel_0   <= "01";
        oe_rf    <= '1';
        write_c  <= '1';
        write_z  <= '1';
        we_rf     <= '1';
      when "0100101" =>
        sp_dec   <= '1'; --PUSH R1
        msel_2   <= "100";
        oe_rf    <= '1';
        scrat_we <= '1';
      when "0100110" =>
        sp_inc   <= '1'; --POP R1
        msel_2   <= "010";
        msel_0   <= "10";
        scrat_oe <= '1';
        we_rf    <= '1';
      when "0101000" | "0101001" | "0101010" | "0101011" =>
        sp_load  <= '1'; --WSP R1
        oe_rf    <= '1';
      when "0110000" =>
        reset_c  <= '1'; --CLC
      when "0110001"   =>
        set_c    <= '1'; --SEC
      when "0110010"   =>
        load_pc  <= '1'; --RET
        msel_3   <= '0';
        sp_inc   <= '1';
        scrat_oe <= '1';
        msel_2   <= "011";
      when "0110100" => --SEI@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      when "0110101"   => --CLI@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      when "0110110"   => --RETID@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      when "0110111"   => --RETIE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      when others  =>
        NS <= ST_fet;
        scrat_we  <= '0';
        scrat_oe  <= '0';
        read_str  <= '0';
        write_str <= '0';
        write_z   <= '0';
        set_z     <= '0';
        reset_z   <= '0';
        write_c   <= '0';
        set_c     <= '0';
        reset_c   <= '0';
        sel_alu   <= "00000";
        msel_1    <= '0';
        msel_0    <= "00";
        we_rf     <= '0';
        oe_rf     <= '0';
        msel_2    <= "000";
        res_sp    <= '0';
        sp_dec    <= '0';
        sp_inc    <= '0';
        sp_load   <= '0';
        p_oe      <= '0';
        p_inc     <= '0';
        load_pc   <= '0';
        reset_pc  <= '0';
        msel_3    <= '0';
    end case;
  when others =>
    NS <= ST_fet;
    scrat_we  <= '0';
    scrat_oe  <= '0';
    read_str  <= '0';
    write_str <= '0';
    write_z   <= '0';
    set_z     <= '0';
    reset_z   <= '0';
    write_c   <= '0';
    set_c     <= '0';
    reset_c   <= '0';
    sel_alu   <= "00000";
    msel_1    <= '0';
    msel_0    <= "00";
    we_rf     <= '0';
    oe_rf     <= '0';
    msel_2    <= "000";
    res_sp    <= '0';
    sp_dec    <= '0';
    sp_inc    <= '0';
    sp_load   <= '0';
    p_oe      <= '0';
    p_inc     <= '0';
    load_pc   <= '0';
    reset_pc  <= '0';
    msel_3    <= '0';
  end case;
end process comb_p;

end Behavioral;

