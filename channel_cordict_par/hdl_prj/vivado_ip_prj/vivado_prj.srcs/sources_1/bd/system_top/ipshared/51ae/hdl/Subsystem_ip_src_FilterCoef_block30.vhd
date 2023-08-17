-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\newsimul\Subsystem_ip_src_FilterCoef_block30.vhd
-- Created: 2023-04-25 13:19:38
-- 
-- Generated by MATLAB 9.14 and HDL Coder 4.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Subsystem_ip_src_FilterCoef_block30
-- Source Path: newsimul/Subsystem/Subsystem/Channelizer/FilterBank/FilterCoef
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Subsystem_ip_src_Subsystem_pkg.ALL;

ENTITY Subsystem_ip_src_FilterCoef_block30 IS
  PORT( CoefOut                           :   OUT   vector_of_std_logic_vector16(0 TO 1)  -- sfix16_En19 [2]
        );
END Subsystem_ip_src_FilterCoef_block30;


ARCHITECTURE rtl OF Subsystem_ip_src_FilterCoef_block30 IS

  -- Signals
  SIGNAL CoefData                         : signed(15 DOWNTO 0);  -- sfix16_En19
  SIGNAL CoefData_1                       : signed(15 DOWNTO 0);  -- sfix16_En19
  SIGNAL CoefOut_tmp                      : vector_of_signed16(0 TO 1);  -- sfix16_En19 [2]

BEGIN
  -- CoefReg_1
  CoefData <= to_signed(16#4000#, 16);

  -- CoefReg_2
  CoefData_1 <= to_signed(16#0000#, 16);

  CoefOut_tmp(0) <= CoefData;
  CoefOut_tmp(1) <= CoefData_1;

  outputgen: FOR k IN 0 TO 1 GENERATE
    CoefOut(k) <= std_logic_vector(CoefOut_tmp(k));
  END GENERATE;

END rtl;

