-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\newsimul\Subsystem_ip_src_TWDLMULT_SDNF1_3_block6.vhd
-- Created: 2023-04-25 13:19:39
-- 
-- Generated by MATLAB 9.14 and HDL Coder 4.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Subsystem_ip_src_TWDLMULT_SDNF1_3_block6
-- Source Path: newsimul/Subsystem/Subsystem/Channelizer/FFT/TWDLMULT_SDNF1_3
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Subsystem_ip_src_TWDLMULT_SDNF1_3_block6 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        dout_14_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dout_14_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dout_16_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dout_16_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dout_2_vld                        :   IN    std_logic;
        twdl_3_15_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        twdl_3_15_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        twdl_3_16_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        twdl_3_16_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        twdlXdin_15_re                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        twdlXdin_15_im                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        twdlXdin_16_re                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        twdlXdin_16_im                    :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
        );
END Subsystem_ip_src_TWDLMULT_SDNF1_3_block6;


ARCHITECTURE rtl OF Subsystem_ip_src_TWDLMULT_SDNF1_3_block6 IS

  -- Component Declarations
  COMPONENT Subsystem_ip_src_Complex4Multiply_block11
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          din1_re_dly3                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          din1_im_dly3                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          din1_vld_dly3                   :   IN    std_logic;
          twdl_3_15_re                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          twdl_3_15_im                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          twdlXdin_15_re                  :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          twdlXdin_15_im                  :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
          );
  END COMPONENT;

  COMPONENT Subsystem_ip_src_Complex4Multiply_block12
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          din2_re_dly3                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          din2_im_dly3                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          di2_vld_dly3                    :   IN    std_logic;
          twdl_3_16_re                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          twdl_3_16_im                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          twdlXdin_16_re                  :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          twdlXdin_16_im                  :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Subsystem_ip_src_Complex4Multiply_block11
    USE ENTITY work.Subsystem_ip_src_Complex4Multiply_block11(rtl);

  FOR ALL : Subsystem_ip_src_Complex4Multiply_block12
    USE ENTITY work.Subsystem_ip_src_Complex4Multiply_block12(rtl);

  -- Signals
  SIGNAL dout_14_re_signed                : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL din1_re_dly1                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL din1_re_dly2                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dout_14_im_signed                : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL din1_im_dly1                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL din1_im_dly2                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL din1_re_dly3                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL din1_im_dly3                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL din1_vld_dly1                    : std_logic;
  SIGNAL din1_vld_dly2                    : std_logic;
  SIGNAL din1_vld_dly3                    : std_logic;
  SIGNAL twdlXdin_15_re_tmp               : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL twdlXdin_15_im_tmp               : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dout_16_re_signed                : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL din2_re_dly1                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL din2_re_dly2                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dout_16_im_signed                : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL din2_im_dly1                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL din2_im_dly2                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL din2_re_dly3                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL din2_im_dly3                     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL di2_vld_dly1                     : std_logic;
  SIGNAL di2_vld_dly2                     : std_logic;
  SIGNAL di2_vld_dly3                     : std_logic;
  SIGNAL twdlXdin_16_re_tmp               : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL twdlXdin_16_im_tmp               : std_logic_vector(15 DOWNTO 0);  -- ufix16

BEGIN
  u_MUL4_1 : Subsystem_ip_src_Complex4Multiply_block11
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              din1_re_dly3 => std_logic_vector(din1_re_dly3),  -- sfix16_En15
              din1_im_dly3 => std_logic_vector(din1_im_dly3),  -- sfix16_En15
              din1_vld_dly3 => din1_vld_dly3,
              twdl_3_15_re => twdl_3_15_re,  -- sfix16_En14
              twdl_3_15_im => twdl_3_15_im,  -- sfix16_En14
              twdlXdin_15_re => twdlXdin_15_re_tmp,  -- sfix16_En15
              twdlXdin_15_im => twdlXdin_15_im_tmp  -- sfix16_En15
              );

  u_MUL4_2 : Subsystem_ip_src_Complex4Multiply_block12
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              din2_re_dly3 => std_logic_vector(din2_re_dly3),  -- sfix16_En15
              din2_im_dly3 => std_logic_vector(din2_im_dly3),  -- sfix16_En15
              di2_vld_dly3 => di2_vld_dly3,
              twdl_3_16_re => twdl_3_16_re,  -- sfix16_En14
              twdl_3_16_im => twdl_3_16_im,  -- sfix16_En14
              twdlXdin_16_re => twdlXdin_16_re_tmp,  -- sfix16_En15
              twdlXdin_16_im => twdlXdin_16_im_tmp  -- sfix16_En15
              );

  dout_14_re_signed <= signed(dout_14_re);

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_re_dly1 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_re_dly1 <= dout_14_re_signed;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  intdelay_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_re_dly2 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_re_dly2 <= din1_re_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  dout_14_im_signed <= signed(dout_14_im);

  intdelay_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_im_dly1 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_im_dly1 <= dout_14_im_signed;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  intdelay_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_im_dly2 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_im_dly2 <= din1_im_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  intdelay_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_re_dly3 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_re_dly3 <= din1_re_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_4_process;


  intdelay_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_im_dly3 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_im_dly3 <= din1_im_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_5_process;


  intdelay_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_vld_dly1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_vld_dly1 <= dout_2_vld;
      END IF;
    END IF;
  END PROCESS intdelay_6_process;


  intdelay_7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_vld_dly2 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_vld_dly2 <= din1_vld_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_7_process;


  intdelay_8_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_vld_dly3 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_vld_dly3 <= din1_vld_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_8_process;


  dout_16_re_signed <= signed(dout_16_re);

  intdelay_9_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din2_re_dly1 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_re_dly1 <= dout_16_re_signed;
      END IF;
    END IF;
  END PROCESS intdelay_9_process;


  intdelay_10_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din2_re_dly2 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_re_dly2 <= din2_re_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_10_process;


  dout_16_im_signed <= signed(dout_16_im);

  intdelay_11_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din2_im_dly1 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_im_dly1 <= dout_16_im_signed;
      END IF;
    END IF;
  END PROCESS intdelay_11_process;


  intdelay_12_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din2_im_dly2 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_im_dly2 <= din2_im_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_12_process;


  intdelay_13_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din2_re_dly3 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_re_dly3 <= din2_re_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_13_process;


  intdelay_14_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din2_im_dly3 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_im_dly3 <= din2_im_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_14_process;


  intdelay_15_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      di2_vld_dly1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        di2_vld_dly1 <= dout_2_vld;
      END IF;
    END IF;
  END PROCESS intdelay_15_process;


  intdelay_16_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      di2_vld_dly2 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        di2_vld_dly2 <= di2_vld_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_16_process;


  intdelay_17_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      di2_vld_dly3 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        di2_vld_dly3 <= di2_vld_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_17_process;


  twdlXdin_15_re <= twdlXdin_15_re_tmp;

  twdlXdin_15_im <= twdlXdin_15_im_tmp;

  twdlXdin_16_re <= twdlXdin_16_re_tmp;

  twdlXdin_16_im <= twdlXdin_16_im_tmp;

END rtl;

