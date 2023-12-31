-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\newsimul\Subsystem_ip_src_RADIX22FFT_SDNF2_2_block8.vhd
-- Created: 2023-04-25 13:19:38
-- 
-- Generated by MATLAB 9.14 and HDL Coder 4.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Subsystem_ip_src_RADIX22FFT_SDNF2_2_block8
-- Source Path: newsimul/Subsystem/Subsystem/Channelizer/FFT/RADIX22FFT_SDNF2_2
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Subsystem_ip_src_RADIX22FFT_SDNF2_2_block8 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        rotate_19                         :   IN    std_logic;  -- ufix1
        dout_4_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dout_4_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dout_20_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dout_20_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dout_1_vld                        :   IN    std_logic;
        dout_19_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dout_19_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dout_20_re_1                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dout_20_im_1                      :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
        );
END Subsystem_ip_src_RADIX22FFT_SDNF2_2_block8;


ARCHITECTURE rtl OF Subsystem_ip_src_RADIX22FFT_SDNF2_2_block8 IS

  -- Signals
  SIGNAL dout_4_re_signed                 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dout_4_im_signed                 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dout_20_re_signed                : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dout_20_im_signed                : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Radix22ButterflyG2_NF_din_vld_dly : std_logic;
  SIGNAL Radix22ButterflyG2_NF_btf1_re_reg : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG2_NF_btf1_im_reg : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG2_NF_btf2_re_reg : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG2_NF_btf2_im_reg : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG2_NF_din_vld_dly_next : std_logic;
  SIGNAL Radix22ButterflyG2_NF_btf1_re_reg_next : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL Radix22ButterflyG2_NF_btf1_im_reg_next : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL Radix22ButterflyG2_NF_btf2_re_reg_next : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL Radix22ButterflyG2_NF_btf2_im_reg_next : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL dout_19_re_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dout_19_im_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dout_20_re_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dout_20_im_tmp                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dout_2_vld                       : std_logic;

BEGIN
  dout_4_re_signed <= signed(dout_4_re);

  dout_4_im_signed <= signed(dout_4_im);

  dout_20_re_signed <= signed(dout_20_re);

  dout_20_im_signed <= signed(dout_20_im);

  -- Radix22ButterflyG2_NF
  Radix22ButterflyG2_NF_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Radix22ButterflyG2_NF_din_vld_dly <= '0';
      Radix22ButterflyG2_NF_btf1_re_reg <= to_signed(16#00000#, 17);
      Radix22ButterflyG2_NF_btf1_im_reg <= to_signed(16#00000#, 17);
      Radix22ButterflyG2_NF_btf2_re_reg <= to_signed(16#00000#, 17);
      Radix22ButterflyG2_NF_btf2_im_reg <= to_signed(16#00000#, 17);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        Radix22ButterflyG2_NF_din_vld_dly <= Radix22ButterflyG2_NF_din_vld_dly_next;
        Radix22ButterflyG2_NF_btf1_re_reg <= Radix22ButterflyG2_NF_btf1_re_reg_next;
        Radix22ButterflyG2_NF_btf1_im_reg <= Radix22ButterflyG2_NF_btf1_im_reg_next;
        Radix22ButterflyG2_NF_btf2_re_reg <= Radix22ButterflyG2_NF_btf2_re_reg_next;
        Radix22ButterflyG2_NF_btf2_im_reg <= Radix22ButterflyG2_NF_btf2_im_reg_next;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG2_NF_process;

  Radix22ButterflyG2_NF_output : PROCESS (Radix22ButterflyG2_NF_btf1_im_reg, Radix22ButterflyG2_NF_btf1_re_reg,
       Radix22ButterflyG2_NF_btf2_im_reg, Radix22ButterflyG2_NF_btf2_re_reg,
       Radix22ButterflyG2_NF_din_vld_dly, dout_1_vld, dout_20_im_signed,
       dout_20_re_signed, dout_4_im_signed, dout_4_re_signed, rotate_19)
    VARIABLE add_cast : signed(16 DOWNTO 0);
    VARIABLE add_cast_0 : signed(16 DOWNTO 0);
    VARIABLE add_cast_1 : signed(16 DOWNTO 0);
    VARIABLE add_cast_2 : signed(16 DOWNTO 0);
    VARIABLE sub_cast : signed(16 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_1 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(16 DOWNTO 0);
    VARIABLE sra_temp : signed(16 DOWNTO 0);
    VARIABLE add_cast_3 : signed(16 DOWNTO 0);
    VARIABLE add_cast_4 : signed(16 DOWNTO 0);
    VARIABLE add_cast_5 : signed(16 DOWNTO 0);
    VARIABLE add_cast_6 : signed(16 DOWNTO 0);
    VARIABLE sra_temp_0 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_3 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_4 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_5 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_6 : signed(16 DOWNTO 0);
    VARIABLE sra_temp_1 : signed(16 DOWNTO 0);
    VARIABLE sra_temp_2 : signed(16 DOWNTO 0);
  BEGIN
    add_cast_1 := to_signed(16#00000#, 17);
    add_cast_2 := to_signed(16#00000#, 17);
    sub_cast_1 := to_signed(16#00000#, 17);
    sub_cast_2 := to_signed(16#00000#, 17);
    add_cast_5 := to_signed(16#00000#, 17);
    add_cast_6 := to_signed(16#00000#, 17);
    sub_cast_5 := to_signed(16#00000#, 17);
    sub_cast_6 := to_signed(16#00000#, 17);
    add_cast := to_signed(16#00000#, 17);
    add_cast_0 := to_signed(16#00000#, 17);
    sub_cast := to_signed(16#00000#, 17);
    sub_cast_0 := to_signed(16#00000#, 17);
    add_cast_3 := to_signed(16#00000#, 17);
    add_cast_4 := to_signed(16#00000#, 17);
    sub_cast_3 := to_signed(16#00000#, 17);
    sub_cast_4 := to_signed(16#00000#, 17);
    Radix22ButterflyG2_NF_btf1_re_reg_next <= Radix22ButterflyG2_NF_btf1_re_reg;
    Radix22ButterflyG2_NF_btf1_im_reg_next <= Radix22ButterflyG2_NF_btf1_im_reg;
    Radix22ButterflyG2_NF_btf2_re_reg_next <= Radix22ButterflyG2_NF_btf2_re_reg;
    Radix22ButterflyG2_NF_btf2_im_reg_next <= Radix22ButterflyG2_NF_btf2_im_reg;
    Radix22ButterflyG2_NF_din_vld_dly_next <= dout_1_vld;
    IF rotate_19 /= '0' THEN 
      IF dout_1_vld = '1' THEN 
        add_cast_1 := resize(dout_4_re_signed, 17);
        add_cast_2 := resize(dout_20_im_signed, 17);
        Radix22ButterflyG2_NF_btf1_re_reg_next <= add_cast_1 + add_cast_2;
        sub_cast_1 := resize(dout_4_re_signed, 17);
        sub_cast_2 := resize(dout_20_im_signed, 17);
        Radix22ButterflyG2_NF_btf2_re_reg_next <= sub_cast_1 - sub_cast_2;
        add_cast_5 := resize(dout_4_im_signed, 17);
        add_cast_6 := resize(dout_20_re_signed, 17);
        Radix22ButterflyG2_NF_btf2_im_reg_next <= add_cast_5 + add_cast_6;
        sub_cast_5 := resize(dout_4_im_signed, 17);
        sub_cast_6 := resize(dout_20_re_signed, 17);
        Radix22ButterflyG2_NF_btf1_im_reg_next <= sub_cast_5 - sub_cast_6;
      END IF;
    ELSIF dout_1_vld = '1' THEN 
      add_cast := resize(dout_4_re_signed, 17);
      add_cast_0 := resize(dout_20_re_signed, 17);
      Radix22ButterflyG2_NF_btf1_re_reg_next <= add_cast + add_cast_0;
      sub_cast := resize(dout_4_re_signed, 17);
      sub_cast_0 := resize(dout_20_re_signed, 17);
      Radix22ButterflyG2_NF_btf2_re_reg_next <= sub_cast - sub_cast_0;
      add_cast_3 := resize(dout_4_im_signed, 17);
      add_cast_4 := resize(dout_20_im_signed, 17);
      Radix22ButterflyG2_NF_btf1_im_reg_next <= add_cast_3 + add_cast_4;
      sub_cast_3 := resize(dout_4_im_signed, 17);
      sub_cast_4 := resize(dout_20_im_signed, 17);
      Radix22ButterflyG2_NF_btf2_im_reg_next <= sub_cast_3 - sub_cast_4;
    END IF;
    sra_temp := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf1_re_reg, 1);
    dout_19_re_tmp <= sra_temp(15 DOWNTO 0);
    sra_temp_0 := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf1_im_reg, 1);
    dout_19_im_tmp <= sra_temp_0(15 DOWNTO 0);
    sra_temp_1 := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf2_re_reg, 1);
    dout_20_re_tmp <= sra_temp_1(15 DOWNTO 0);
    sra_temp_2 := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf2_im_reg, 1);
    dout_20_im_tmp <= sra_temp_2(15 DOWNTO 0);
    dout_2_vld <= Radix22ButterflyG2_NF_din_vld_dly;
  END PROCESS Radix22ButterflyG2_NF_output;


  dout_19_re <= std_logic_vector(dout_19_re_tmp);

  dout_19_im <= std_logic_vector(dout_19_im_tmp);

  dout_20_re_1 <= std_logic_vector(dout_20_re_tmp);

  dout_20_im_1 <= std_logic_vector(dout_20_im_tmp);

END rtl;

