-----------------------------------------------------------------------------
-- Definition of a single port ROM for RATASM defined by prog_rom.psm 
--  
-- Generated by RATASM Assembler 
--  
-- Standard IEEE libraries  
--  
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library unisim;
use unisim.vcomponents.all;
-----------------------------------------------------------------------------


entity prog_rom is 
   port (     ADDRESS : in std_logic_vector(9 downto 0); 
          INSTRUCTION : out std_logic_vector(17 downto 0); 
                  CLK : in std_logic);  
end prog_rom;



architecture low_level_definition of prog_rom is

   -----------------------------------------------------------------------------
   -- Attributes to define ROM contents during implementation synthesis. 
   -- The information is repeated in the generic map for functional simulation. 
   -----------------------------------------------------------------------------

   attribute INIT_00 : string; 
   attribute INIT_01 : string; 
   attribute INIT_02 : string; 
   attribute INIT_03 : string; 
   attribute INIT_04 : string; 
   attribute INIT_05 : string; 
   attribute INIT_06 : string; 
   attribute INIT_07 : string; 
   attribute INIT_08 : string; 
   attribute INIT_09 : string; 
   attribute INIT_0A : string; 
   attribute INIT_0B : string; 
   attribute INIT_0C : string; 
   attribute INIT_0D : string; 
   attribute INIT_0E : string; 
   attribute INIT_0F : string; 
   attribute INIT_10 : string; 
   attribute INIT_11 : string; 
   attribute INIT_12 : string; 
   attribute INIT_13 : string; 
   attribute INIT_14 : string; 
   attribute INIT_15 : string; 
   attribute INIT_16 : string; 
   attribute INIT_17 : string; 
   attribute INIT_18 : string; 
   attribute INIT_19 : string; 
   attribute INIT_1A : string; 
   attribute INIT_1B : string; 
   attribute INIT_1C : string; 
   attribute INIT_1D : string; 
   attribute INIT_1E : string; 
   attribute INIT_1F : string; 
   attribute INIT_20 : string; 
   attribute INIT_21 : string; 
   attribute INIT_22 : string; 
   attribute INIT_23 : string; 
   attribute INIT_24 : string; 
   attribute INIT_25 : string; 
   attribute INIT_26 : string; 
   attribute INIT_27 : string; 
   attribute INIT_28 : string; 
   attribute INIT_29 : string; 
   attribute INIT_2A : string; 
   attribute INIT_2B : string; 
   attribute INIT_2C : string; 
   attribute INIT_2D : string; 
   attribute INIT_2E : string; 
   attribute INIT_2F : string; 
   attribute INIT_30 : string; 
   attribute INIT_31 : string; 
   attribute INIT_32 : string; 
   attribute INIT_33 : string; 
   attribute INIT_34 : string; 
   attribute INIT_35 : string; 
   attribute INIT_36 : string; 
   attribute INIT_37 : string; 
   attribute INIT_38 : string; 
   attribute INIT_39 : string; 
   attribute INIT_3A : string; 
   attribute INIT_3B : string; 
   attribute INIT_3C : string; 
   attribute INIT_3D : string; 
   attribute INIT_3E : string; 
   attribute INIT_3F : string; 
   attribute INITP_00 : string; 
   attribute INITP_01 : string; 
   attribute INITP_02 : string; 
   attribute INITP_03 : string; 
   attribute INITP_04 : string; 
   attribute INITP_05 : string; 
   attribute INITP_06 : string; 
   attribute INITP_07 : string; 


   ----------------------------------------------------------------------
   -- Attributes to define ROM contents during implementation synthesis.
   ----------------------------------------------------------------------

   attribute INIT_00 of ram_1024_x_18 : label is "44098BA154803401806B030A0310430962AA610F6B016A0074005E817E010000";  
   attribute INIT_01 of ram_1024_x_18 : label is "06004A5846098BA15480340480DB05A5051245098BA15480340280A304AF0411";  
   attribute INIT_02 of ram_1024_x_18 : label is "8C01548034E08BA154803410815B078707014A5847098BA154803408811B061F";  
   attribute INIT_03 of ram_1024_x_18 : label is "6AAB8BA15F803F0281EB0AFF2AAA6A558BA15F803F0181B30A110ADB6A357F00";  
   attribute INIT_04 of ram_1024_x_18 : label is "0A7F0A036AFE8BA15F803F08825B0AFE0A026A7F8BA15F803F0482230AFF4A54";  
   attribute INIT_05 of ram_1024_x_18 : label is "047764778BA1810161008C015F803FE082CB0ADF2A006ABE8BA15F803F108293";  
   attribute INIT_06 of ram_1024_x_18 : label is "8380C10483808BA1810441808350C102835304668BA1810241808318C101831A";  
   attribute INIT_07 of ram_1024_x_18 : label is "8400C110A401841164778BA18110418083C0C108A3C0845564FF8BA181084180";  
   attribute INIT_08 of ram_1024_x_18 : label is "8480C140A4808001C4118BA1814041808440C120A441800084FF8BA181204180";  
   attribute INIT_09 of ram_1024_x_18 : label is "6011410061D18BA15F803F0184DB015081FF200160505F807F008C0141808180";  
   attribute INIT_0A of ram_1024_x_18 : label is "5F803F04857B01222102A0FF6022410061FF8BA15F803F02852B011181D02001";  
   attribute INIT_0B of ram_1024_x_18 : label is "603320016022200160118BA15F803F0885CB0142210220016042410061008BA1";  
   attribute INIT_0C of ram_1024_x_18 : label is "0122210286AB0133210286AB0144210286AB0155210220016055200160442001";  
   attribute INIT_0D of ram_1024_x_18 : label is "870B01888B118BA15F803F2086DB01778B018BA15F803F1086AB0111210286AB";  
   attribute INIT_0E of ram_1024_x_18 : label is "8BA15480340187730A016A0174008C015F803F80873B00598B398BA15F803F40";  
   attribute INIT_0F of ram_1024_x_18 : label is "4DAA7502AA028BA15480340487DB0C014C5A4A5B8BA15480340287A30B014B51";  
   attribute INIT_10 of ram_1024_x_18 : label is "0C018F04AA048BA154803410885B0E018E034AB376038BA154803408881B0D01";  
   attribute INIT_11 of ram_1024_x_18 : label is "800124028BA14180012188E30203820262012401640061008C01548034E08893";  
   attribute INIT_12 of ram_1024_x_18 : label is "E203800124088BA141800121895B0205C20224048BA14180012189230207A203";  
   attribute INIT_13 of ram_1024_x_18 : label is "80018BA14F802F0189EB4C506C092A586B046A058C01418021F0012189A30201";  
   attribute INIT_14 of ram_1024_x_18 : label is "2F048A834C506C012A5A6B046A058BA14F802F028A3B4C506C0A2A596B046A05";  
   attribute INIT_15 of ram_1024_x_18 : label is "8AF84F802F802F402F202F102F088AF34C506C022A5B6B026A0580018BA14F80";  
   attribute INIT_16 of ram_1024_x_18 : label is "402141014409200880028B61630A610160018002618880028B29613080026177";  
   attribute INIT_17 of ram_1024_x_18 : label is "80028BAB3D008BBB3C008BCBDB017B5EDC017CFFDD017DFF80028B618B9AC301";  
   attribute INIT_18 of ram_1024_x_18 : label is "0000000000000000000000000000000080028BA15E819E015F807F008BA18BA1";  
   attribute INIT_19 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_1A of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_1B of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_1C of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_1D of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_1E of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_1F of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_20 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_21 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_22 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_23 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_24 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_25 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_26 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_27 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_28 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_29 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_2A of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_2B of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_2C of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_2D of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_2E of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_2F of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_30 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_31 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_32 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_33 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_34 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_35 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_36 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_37 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_38 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_39 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_3A of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_3B of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_3C of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_3D of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_3E of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INIT_3F of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INITP_00 of ram_1024_x_18 : label is "22CB22CB20B232C8F2CE3738DCE3738ECE3B38EF38E340E340E3038C0E30FFFC";  
   attribute INITP_01 of ram_1024_x_18 : label is "3CE3038C38FCE30E30E30E34D34D35DDDDCE35DCE37DCE3DDCE3DFCE218B218B";  
   attribute INITP_02 of ram_1024_x_18 : label is "488BBB42004FDD373AA833D3833CE0CF4E0CF38398C3A30E630EEF38FCE3CCE3";  
   attribute INITP_03 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000004EF0";  
   attribute INITP_04 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INITP_05 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INITP_06 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  
   attribute INITP_07 of ram_1024_x_18 : label is "0000000000000000000000000000000000000000000000000000000000000000";  


begin

   ----------------------------------------------------------------------
   --Instantiate the Xilinx primitive for a block RAM 
   --INIT values repeated to define contents for functional simulation 
   ----------------------------------------------------------------------
   ram_1024_x_18: RAMB16_S18 
   --synthesitranslate_off
   --INIT values repeated to define contents for functional simulation
   generic map ( 
          INIT_00 => X"44098BA154803401806B030A0310430962AA610F6B016A0074005E817E010000",  
          INIT_01 => X"06004A5846098BA15480340480DB05A5051245098BA15480340280A304AF0411",  
          INIT_02 => X"8C01548034E08BA154803410815B078707014A5847098BA154803408811B061F",  
          INIT_03 => X"6AAB8BA15F803F0281EB0AFF2AAA6A558BA15F803F0181B30A110ADB6A357F00",  
          INIT_04 => X"0A7F0A036AFE8BA15F803F08825B0AFE0A026A7F8BA15F803F0482230AFF4A54",  
          INIT_05 => X"047764778BA1810161008C015F803FE082CB0ADF2A006ABE8BA15F803F108293",  
          INIT_06 => X"8380C10483808BA1810441808350C102835304668BA1810241808318C101831A",  
          INIT_07 => X"8400C110A401841164778BA18110418083C0C108A3C0845564FF8BA181084180",  
          INIT_08 => X"8480C140A4808001C4118BA1814041808440C120A441800084FF8BA181204180",  
          INIT_09 => X"6011410061D18BA15F803F0184DB015081FF200160505F807F008C0141808180",  
          INIT_0A => X"5F803F04857B01222102A0FF6022410061FF8BA15F803F02852B011181D02001",  
          INIT_0B => X"603320016022200160118BA15F803F0885CB0142210220016042410061008BA1",  
          INIT_0C => X"0122210286AB0133210286AB0144210286AB0155210220016055200160442001",  
          INIT_0D => X"870B01888B118BA15F803F2086DB01778B018BA15F803F1086AB0111210286AB",  
          INIT_0E => X"8BA15480340187730A016A0174008C015F803F80873B00598B398BA15F803F40",  
          INIT_0F => X"4DAA7502AA028BA15480340487DB0C014C5A4A5B8BA15480340287A30B014B51",  
          INIT_10 => X"0C018F04AA048BA154803410885B0E018E034AB376038BA154803408881B0D01",  
          INIT_11 => X"800124028BA14180012188E30203820262012401640061008C01548034E08893",  
          INIT_12 => X"E203800124088BA141800121895B0205C20224048BA14180012189230207A203",  
          INIT_13 => X"80018BA14F802F0189EB4C506C092A586B046A058C01418021F0012189A30201",  
          INIT_14 => X"2F048A834C506C012A5A6B046A058BA14F802F028A3B4C506C0A2A596B046A05",  
          INIT_15 => X"8AF84F802F802F402F202F102F088AF34C506C022A5B6B026A0580018BA14F80",  
          INIT_16 => X"402141014409200880028B61630A610160018002618880028B29613080026177",  
          INIT_17 => X"80028BAB3D008BBB3C008BCBDB017B5EDC017CFFDD017DFF80028B618B9AC301",  
          INIT_18 => X"0000000000000000000000000000000080028BA15E819E015F807F008BA18BA1",  
          INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INITP_00 => X"22CB22CB20B232C8F2CE3738DCE3738ECE3B38EF38E340E340E3038C0E30FFFC",  
          INITP_01 => X"3CE3038C38FCE30E30E30E34D34D35DDDDCE35DCE37DCE3DDCE3DFCE218B218B",  
          INITP_02 => X"488BBB42004FDD373AA833D3833CE0CF4E0CF38398C3A30E630EEF38FCE3CCE3",  
          INITP_03 => X"0000000000000000000000000000000000000000000000000000000000004EF0",  
          INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",  
          INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000")  


   --synthesis translate_on
   port map(  DI => "0000000000000000",
             DIP => "00",
              EN => '1',
              WE => '0',
             SSR => '0',
             CLK => clk,
            ADDR => address,
              DO => INSTRUCTION(15 downto 0),
             DOP => INSTRUCTION(17 downto 16)); 

--
end low_level_definition;
--
----------------------------------------------------------------------
-- END OF FILE prog_rom.vhd
----------------------------------------------------------------------
