-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\newsimul\Subsystem_ip_src_FilterTapWvldInC0.vhd
-- Created: 2023-04-25 13:19:38
-- 
-- Generated by MATLAB 9.14 and HDL Coder 4.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Subsystem_ip_src_FilterTapWvldInC0
-- Source Path: newsimul/Subsystem/Subsystem/Channelizer/FilterBank/subFilter/FilterTapWvldInC0
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Subsystem_ip_src_FilterTapWvldInC0 IS
  PORT( clk                               :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        addin                             :   IN    std_logic_vector(47 DOWNTO 0);  -- sfix48_En34
        multVld                           :   IN    std_logic;
        tapout                            :   OUT   std_logic_vector(47 DOWNTO 0)  -- sfix48_En34
        );
END Subsystem_ip_src_FilterTapWvldInC0;


ARCHITECTURE rtl OF Subsystem_ip_src_FilterTapWvldInC0 IS

  -- Signals
  SIGNAL addin_signed                     : signed(47 DOWNTO 0);  -- sfix48_En34
  SIGNAL fTap_addout_reg                  : signed(47 DOWNTO 0) := to_signed(0, 48);  -- sfix48
  SIGNAL fTap_addout_reg_next             : signed(47 DOWNTO 0);  -- sfix48_En34
  SIGNAL tapout_tmp                       : signed(47 DOWNTO 0);  -- sfix48_En34

BEGIN
  addin_signed <= signed(addin);

  -- FilterTapWvldInC0
  fTap_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        fTap_addout_reg <= fTap_addout_reg_next;
      END IF;
    END IF;
  END PROCESS fTap_process;

  fTap_output : PROCESS (addin_signed, fTap_addout_reg, multVld)
  BEGIN
    fTap_addout_reg_next <= fTap_addout_reg;
    tapout_tmp <= fTap_addout_reg;
    IF multVld = '1' THEN 
      fTap_addout_reg_next <= addin_signed;
    END IF;
  END PROCESS fTap_output;


  tapout <= std_logic_vector(tapout_tmp);

END rtl;

