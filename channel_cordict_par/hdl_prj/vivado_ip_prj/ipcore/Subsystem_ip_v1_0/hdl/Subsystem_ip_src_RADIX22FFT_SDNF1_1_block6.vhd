-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\newsimul\Subsystem_ip_src_RADIX22FFT_SDNF1_1_block6.vhd
-- Created: 2023-04-25 13:19:38
-- 
-- Generated by MATLAB 9.14 and HDL Coder 4.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Subsystem_ip_src_RADIX22FFT_SDNF1_1_block6
-- Source Path: newsimul/Subsystem/Subsystem/Channelizer/FFT/RADIX22FFT_SDNF1_1
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Subsystem_ip_src_RADIX22FFT_SDNF1_1_block6 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        twdlXdin_8_re                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        twdlXdin_8_im                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        twdlXdin_24_re                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        twdlXdin_24_im                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        twdlXdin_1_vld                    :   IN    std_logic;
        dout_15_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dout_15_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dout_16_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dout_16_im                        :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
        );
END Subsystem_ip_src_RADIX22FFT_SDNF1_1_block6;


ARCHITECTURE rtl OF Subsystem_ip_src_RADIX22FFT_SDNF1_1_block6 IS

  -- Signals
  SIGNAL twdlXdin_8_re_signed             : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL twdlXdin_8_im_signed             : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL twdlXdin_24_re_signed            : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL twdlXdin_24_im_signed            : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Radix22ButterflyG1_NF_btf1_re_reg : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG1_NF_btf1_im_reg : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG1_NF_btf2_re_reg : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG1_NF_btf2_im_reg : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG1_NF_dinXtwdl_vld_dly1 : std_logic;
  SIGNAL Radix22ButterflyG1_NF_btf1_re_reg_next : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL Radix22ButterflyG1_NF_btf1_im_reg_next : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL Radix22ButterflyG1_NF_btf2_re_reg_next : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL Radix22ButterflyG1_NF_btf2_im_reg_next : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL Radix22ButterflyG1_NF_dinXtwdl_vld_dly1_next : std_logic;
  SIGNAL dout_15_re_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dout_15_im_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dout_16_re_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dout_16_im_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dout_15_vld                      : std_logic;

BEGIN
  twdlXdin_8_re_signed <= signed(twdlXdin_8_re);

  twdlXdin_8_im_signed <= signed(twdlXdin_8_im);

  twdlXdin_24_re_signed <= signed(twdlXdin_24_re);

  twdlXdin_24_im_signed <= signed(twdlXdin_24_im);

  -- Radix22ButterflyG1_NF
  Radix22ButterflyG1_NF_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Radix22ButterflyG1_NF_btf1_re_reg <= to_signed(16#00000#, 17);
      Radix22ButterflyG1_NF_btf1_im_reg <= to_signed(16#00000#, 17);
      Radix22ButterflyG1_NF_btf2_re_reg <= to_signed(16#00000#, 17);
      Radix22ButterflyG1_NF_btf2_im_reg <= to_signed(16#00000#, 17);
      Radix22ButterflyG1_NF_dinXtwdl_vld_dly1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        Radix22ButterflyG1_NF_btf1_re_reg <= Radix22ButterflyG1_NF_btf1_re_reg_next;
        Radix22ButterflyG1_NF_btf1_im_reg <= Radix22ButterflyG1_NF_btf1_im_reg_next;
        Radix22ButterflyG1_NF_btf2_re_reg <= Radix22ButterflyG1_NF_btf2_re_reg_next;
        Radix22ButterflyG1_NF_btf2_im_reg <= Radix22ButterflyG1_NF_btf2_im_reg_next;
        Radix22ButterflyG1_NF_dinXtwdl_vld_dly1 <= Radix22ButterflyG1_NF_dinXtwdl_vld_dly1_next;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG1_NF_process;

  Radix22ButterflyG1_NF_output : PROCESS (Radix22ButterflyG1_NF_btf1_im_reg, Radix22ButterflyG1_NF_btf1_re_reg,
       Radix22ButterflyG1_NF_btf2_im_reg, Radix22ButterflyG1_NF_btf2_re_reg,
       Radix22ButterflyG1_NF_dinXtwdl_vld_dly1, twdlXdin_1_vld,
       twdlXdin_24_im_signed, twdlXdin_24_re_signed, twdlXdin_8_im_signed,
       twdlXdin_8_re_signed)
    VARIABLE add_cast : signed(16 DOWNTO 0);
    VARIABLE add_cast_0 : signed(16 DOWNTO 0);
    VARIABLE sra_temp : signed(16 DOWNTO 0);
    VARIABLE sub_cast : signed(16 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(16 DOWNTO 0);
    VARIABLE sra_temp_0 : signed(16 DOWNTO 0);
    VARIABLE add_cast_1 : signed(16 DOWNTO 0);
    VARIABLE add_cast_2 : signed(16 DOWNTO 0);
    VARIABLE sra_temp_1 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_1 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(16 DOWNTO 0);
    VARIABLE sra_temp_2 : signed(16 DOWNTO 0);
  BEGIN
    add_cast := to_signed(16#00000#, 17);
    add_cast_0 := to_signed(16#00000#, 17);
    sub_cast := to_signed(16#00000#, 17);
    sub_cast_0 := to_signed(16#00000#, 17);
    add_cast_1 := to_signed(16#00000#, 17);
    add_cast_2 := to_signed(16#00000#, 17);
    sub_cast_1 := to_signed(16#00000#, 17);
    sub_cast_2 := to_signed(16#00000#, 17);
    Radix22ButterflyG1_NF_btf1_re_reg_next <= Radix22ButterflyG1_NF_btf1_re_reg;
    Radix22ButterflyG1_NF_btf1_im_reg_next <= Radix22ButterflyG1_NF_btf1_im_reg;
    Radix22ButterflyG1_NF_btf2_re_reg_next <= Radix22ButterflyG1_NF_btf2_re_reg;
    Radix22ButterflyG1_NF_btf2_im_reg_next <= Radix22ButterflyG1_NF_btf2_im_reg;
    Radix22ButterflyG1_NF_dinXtwdl_vld_dly1_next <= twdlXdin_1_vld;
    IF twdlXdin_1_vld = '1' THEN 
      add_cast := resize(twdlXdin_8_re_signed, 17);
      add_cast_0 := resize(twdlXdin_24_re_signed, 17);
      Radix22ButterflyG1_NF_btf1_re_reg_next <= add_cast + add_cast_0;
      sub_cast := resize(twdlXdin_8_re_signed, 17);
      sub_cast_0 := resize(twdlXdin_24_re_signed, 17);
      Radix22ButterflyG1_NF_btf2_re_reg_next <= sub_cast - sub_cast_0;
      add_cast_1 := resize(twdlXdin_8_im_signed, 17);
      add_cast_2 := resize(twdlXdin_24_im_signed, 17);
      Radix22ButterflyG1_NF_btf1_im_reg_next <= add_cast_1 + add_cast_2;
      sub_cast_1 := resize(twdlXdin_8_im_signed, 17);
      sub_cast_2 := resize(twdlXdin_24_im_signed, 17);
      Radix22ButterflyG1_NF_btf2_im_reg_next <= sub_cast_1 - sub_cast_2;
    END IF;
    sra_temp := SHIFT_RIGHT(Radix22ButterflyG1_NF_btf1_re_reg, 1);
    dout_15_re_tmp <= sra_temp(15 DOWNTO 0);
    sra_temp_0 := SHIFT_RIGHT(Radix22ButterflyG1_NF_btf1_im_reg, 1);
    dout_15_im_tmp <= sra_temp_0(15 DOWNTO 0);
    sra_temp_1 := SHIFT_RIGHT(Radix22ButterflyG1_NF_btf2_re_reg, 1);
    dout_16_re_tmp <= sra_temp_1(15 DOWNTO 0);
    sra_temp_2 := SHIFT_RIGHT(Radix22ButterflyG1_NF_btf2_im_reg, 1);
    dout_16_im_tmp <= sra_temp_2(15 DOWNTO 0);
    dout_15_vld <= Radix22ButterflyG1_NF_dinXtwdl_vld_dly1;
  END PROCESS Radix22ButterflyG1_NF_output;


  dout_15_re <= std_logic_vector(dout_15_re_tmp);

  dout_15_im <= std_logic_vector(dout_15_im_tmp);

  dout_16_re <= std_logic_vector(dout_16_re_tmp);

  dout_16_im <= std_logic_vector(dout_16_im_tmp);

END rtl;

