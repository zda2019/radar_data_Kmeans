-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\newsimul\Subsystem_ip_src_FilterTapWvldIn_block25.vhd
-- Created: 2023-04-25 13:19:38
-- 
-- Generated by MATLAB 9.14 and HDL Coder 4.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Subsystem_ip_src_FilterTapWvldIn_block25
-- Source Path: newsimul/Subsystem/Subsystem/Channelizer/FilterBank/subFilter/FilterTapWvldIn
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Subsystem_ip_src_FilterTapWvldIn_block25 IS
  PORT( clk                               :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        dinReg2_26_re                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn_0                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En19
        addin                             :   IN    std_logic_vector(47 DOWNTO 0);  -- sfix48_En34
        multVld                           :   IN    std_logic;
        tapout                            :   OUT   std_logic_vector(47 DOWNTO 0)  -- sfix48_En34
        );
END Subsystem_ip_src_FilterTapWvldIn_block25;


ARCHITECTURE rtl OF Subsystem_ip_src_FilterTapWvldIn_block25 IS

  -- Signals
  SIGNAL dinReg2_26_re_signed             : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL coefIn_0_signed                  : signed(15 DOWNTO 0);  -- sfix16_En19
  SIGNAL addin_signed                     : signed(47 DOWNTO 0);  -- sfix48_En34
  SIGNAL fTap_din_reg                     : signed(15 DOWNTO 0) := to_signed(16#0000#, 16);  -- sfix16
  SIGNAL fTap_coef_reg                    : signed(15 DOWNTO 0) := to_signed(16#0000#, 16);  -- sfix16
  SIGNAL fTap_mult_reg                    : signed(31 DOWNTO 0) := to_signed(0, 32);  -- sfix32
  SIGNAL fTap_addout_reg                  : signed(47 DOWNTO 0) := to_signed(0, 48);  -- sfix48
  SIGNAL fTap_din_reg_next                : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL fTap_coef_reg_next               : signed(15 DOWNTO 0);  -- sfix16_En19
  SIGNAL fTap_mult_reg_next               : signed(31 DOWNTO 0);  -- sfix32_En34
  SIGNAL fTap_addout_reg_next             : signed(47 DOWNTO 0);  -- sfix48_En34
  SIGNAL tapout_tmp                       : signed(47 DOWNTO 0);  -- sfix48_En34

BEGIN
  dinReg2_26_re_signed <= signed(dinReg2_26_re);

  coefIn_0_signed <= signed(coefIn_0);

  addin_signed <= signed(addin);

  -- FilterTap
  fTap_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        fTap_din_reg <= fTap_din_reg_next;
        fTap_coef_reg <= fTap_coef_reg_next;
        fTap_mult_reg <= fTap_mult_reg_next;
        fTap_addout_reg <= fTap_addout_reg_next;
      END IF;
    END IF;
  END PROCESS fTap_process;

  fTap_output : PROCESS (addin_signed, coefIn_0_signed, dinReg2_26_re_signed, fTap_addout_reg,
       fTap_coef_reg, fTap_din_reg, fTap_mult_reg, multVld)
    VARIABLE add_cast : signed(47 DOWNTO 0);
  BEGIN
    add_cast := to_signed(0, 48);
    fTap_addout_reg_next <= fTap_addout_reg;
    tapout_tmp <= fTap_addout_reg;
    IF multVld = '1' THEN 
      add_cast := resize(fTap_mult_reg, 48);
      fTap_addout_reg_next <= add_cast + addin_signed;
    END IF;
    fTap_mult_reg_next <= fTap_din_reg * fTap_coef_reg;
    fTap_din_reg_next <= dinReg2_26_re_signed;
    fTap_coef_reg_next <= coefIn_0_signed;
  END PROCESS fTap_output;


  tapout <= std_logic_vector(tapout_tmp);

END rtl;

