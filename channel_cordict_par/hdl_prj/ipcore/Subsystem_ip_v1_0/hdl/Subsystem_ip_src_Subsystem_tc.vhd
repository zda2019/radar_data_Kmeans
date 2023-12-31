-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\newsimul\Subsystem_ip_src_Subsystem_tc.vhd
-- Created: 2023-04-25 13:19:38
-- 
-- Generated by MATLAB 9.14 and HDL Coder 4.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Subsystem_ip_src_Subsystem_tc
-- Source Path: Subsystem_tc
-- Hierarchy Level: 1
-- 
-- Master clock enable input: clk_enable
-- 
-- enb         : identical to clk_enable
-- enb_1_1_1   : identical to clk_enable
-- enb_1_32_0  : 32x slower than clk with last phase
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Subsystem_ip_src_Subsystem_tc IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        enb                               :   OUT   std_logic;
        enb_1_1_1                         :   OUT   std_logic;
        enb_1_32_0                        :   OUT   std_logic
        );
END Subsystem_ip_src_Subsystem_tc;


ARCHITECTURE rtl OF Subsystem_ip_src_Subsystem_tc IS

  -- Signals
  SIGNAL count32                          : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL comp_0_tmp                       : std_logic;
  SIGNAL phase_0_tmp                      : std_logic;
  SIGNAL phase_0                          : std_logic;
  SIGNAL enb_1_32_0_1                     : std_logic;

BEGIN
  enb <= clk_enable;

  enb_1_1_1 <= clk_enable;

  -- Count limited, Unsigned Counter
  --  initial value   = 1
  --  step value      = 1
  --  count to value  = 31
  counter_32_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      count32 <= to_unsigned(16#01#, 5);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF clk_enable = '1' THEN
        count32 <= count32 + to_unsigned(16#01#, 5);
      END IF;
    END IF;
  END PROCESS counter_32_process;


  
  comp_0_tmp <= '1' WHEN count32 = to_unsigned(16#1F#, 5) ELSE
      '0';

  phase_0_tmp <= comp_0_tmp AND clk_enable;

  phase_delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      phase_0 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF clk_enable = '1' THEN
        phase_0 <= phase_0_tmp;
      END IF;
    END IF;
  END PROCESS phase_delay_process;


  enb_1_32_0_1 <= phase_0 AND clk_enable;

  enb_1_32_0 <= enb_1_32_0_1;

END rtl;

