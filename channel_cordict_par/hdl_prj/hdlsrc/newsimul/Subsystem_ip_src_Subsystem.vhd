-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\newsimul\Subsystem_ip_src_Subsystem.vhd
-- Created: 2023-04-25 13:19:39
-- 
-- Generated by MATLAB 9.14 and HDL Coder 4.1
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 5e-10
-- Target subsystem base rate: 5e-10
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        5e-10
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- amp                           ce_out        5e-10
-- angle                         ce_out        5e-10
-- vaild                         ce_out        5e-10
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Subsystem_ip_src_Subsystem
-- Source Path: newsimul/Subsystem
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Subsystem_ip_src_Subsystem IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        datareal                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataimag                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        ce_out                            :   OUT   std_logic;
        amp                               :   OUT   std_logic_vector(16 DOWNTO 0);  -- sfix17_En15
        angle                             :   OUT   std_logic_vector(18 DOWNTO 0);  -- sfix19_En16
        vaild                             :   OUT   std_logic
        );
END Subsystem_ip_src_Subsystem;


ARCHITECTURE rtl OF Subsystem_ip_src_Subsystem IS

  -- Component Declarations
  COMPONENT Subsystem_ip_src_Subsystem_tc
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          enb                             :   OUT   std_logic;
          enb_1_1_1                       :   OUT   std_logic;
          enb_1_32_0                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT Subsystem_ip_src_Subsystem_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          In1                             :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          In2                             :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          S_re                            :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          S_im                            :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
          );
  END COMPONENT;

  COMPONENT Subsystem_ip_src_Subsystem1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          Indata_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          Indata_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          amp                             :   OUT   std_logic_vector(16 DOWNTO 0);  -- sfix17_En15
          angle                           :   OUT   std_logic_vector(18 DOWNTO 0);  -- sfix19_En16
          vaild                           :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Subsystem_ip_src_Subsystem_tc
    USE ENTITY work.Subsystem_ip_src_Subsystem_tc(rtl);

  FOR ALL : Subsystem_ip_src_Subsystem_block
    USE ENTITY work.Subsystem_ip_src_Subsystem_block(rtl);

  FOR ALL : Subsystem_ip_src_Subsystem1
    USE ENTITY work.Subsystem_ip_src_Subsystem1(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL enb_1_32_0                       : std_logic;
  SIGNAL enb_1_1_1                        : std_logic;
  SIGNAL serializer_PostProcessed_re      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL serializer_PostProcessed_im      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Subsystem1_out1                  : std_logic_vector(16 DOWNTO 0);  -- ufix17
  SIGNAL Subsystem1_out2                  : std_logic_vector(18 DOWNTO 0);  -- ufix19
  SIGNAL Subsystem1_out3                  : std_logic;

BEGIN
  u_Subsystem_tc : Subsystem_ip_src_Subsystem_tc
    PORT MAP( clk => clk,
              reset => reset,
              clk_enable => clk_enable,
              enb => enb,
              enb_1_1_1 => enb_1_1_1,
              enb_1_32_0 => enb_1_32_0
              );

  u_Subsystem : Subsystem_ip_src_Subsystem_block
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              enb_1_32_0 => enb_1_32_0,
              In1 => datareal,  -- sfix16_En15
              In2 => dataimag,  -- sfix16_En15
              S_re => serializer_PostProcessed_re,  -- sfix16_En15
              S_im => serializer_PostProcessed_im  -- sfix16_En15
              );

  u_Subsystem1 : Subsystem_ip_src_Subsystem1
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              Indata_re => serializer_PostProcessed_re,  -- sfix16_En15
              Indata_im => serializer_PostProcessed_im,  -- sfix16_En15
              amp => Subsystem1_out1,  -- sfix17_En15
              angle => Subsystem1_out2,  -- sfix19_En16
              vaild => Subsystem1_out3
              );

  ce_out <= enb_1_1_1;

  amp <= Subsystem1_out1;

  angle <= Subsystem1_out2;

  vaild <= Subsystem1_out3;

END rtl;
