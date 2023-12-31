-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\newsimul\Subsystem_ip_dut.vhd
-- Created: 2023-04-25 13:19:48
-- 
-- Generated by MATLAB 9.14 and HDL Coder 4.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Subsystem_ip_dut
-- Source Path: Subsystem_ip/Subsystem_ip_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Subsystem_ip_dut IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        datareal                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataimag                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        ce_out                            :   OUT   std_logic;  -- ufix1
        amp                               :   OUT   std_logic_vector(16 DOWNTO 0);  -- sfix17_En15
        angle                             :   OUT   std_logic_vector(18 DOWNTO 0);  -- sfix19_En16
        vaild                             :   OUT   std_logic  -- ufix1
        );
END Subsystem_ip_dut;


ARCHITECTURE rtl OF Subsystem_ip_dut IS

  -- Component Declarations
  COMPONENT Subsystem_ip_src_Subsystem
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset                           :   IN    std_logic;
          datareal                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataimag                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          ce_out                          :   OUT   std_logic;  -- ufix1
          amp                             :   OUT   std_logic_vector(16 DOWNTO 0);  -- sfix17_En15
          angle                           :   OUT   std_logic_vector(18 DOWNTO 0);  -- sfix19_En16
          vaild                           :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Subsystem_ip_src_Subsystem
    USE ENTITY work.Subsystem_ip_src_Subsystem(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL amp_sig                          : std_logic_vector(16 DOWNTO 0);  -- ufix17
  SIGNAL angle_sig                        : std_logic_vector(18 DOWNTO 0);  -- ufix19
  SIGNAL vaild_sig                        : std_logic;  -- ufix1

BEGIN
  u_Subsystem_ip_src_Subsystem : Subsystem_ip_src_Subsystem
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset => reset,
              datareal => datareal,  -- sfix16_En15
              dataimag => dataimag,  -- sfix16_En15
              ce_out => ce_out_sig,  -- ufix1
              amp => amp_sig,  -- sfix17_En15
              angle => angle_sig,  -- sfix19_En16
              vaild => vaild_sig  -- ufix1
              );

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  amp <= amp_sig;

  angle <= angle_sig;

  vaild <= vaild_sig;

END rtl;

