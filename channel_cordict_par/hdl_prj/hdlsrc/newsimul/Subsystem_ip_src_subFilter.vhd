-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\newsimul\Subsystem_ip_src_subFilter.vhd
-- Created: 2023-04-25 13:19:38
-- 
-- Generated by MATLAB 9.14 and HDL Coder 4.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Subsystem_ip_src_subFilter
-- Source Path: newsimul/Subsystem/Subsystem/Channelizer/FilterBank/subFilter
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Subsystem_ip_src_Subsystem_pkg.ALL;

ENTITY Subsystem_ip_src_subFilter IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        dinReg2_0_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        coefIn                            :   IN    vector_of_std_logic_vector16(0 TO 1);  -- sfix16_En19 [2]
        dinRegVld                         :   IN    std_logic;
        syncReset                         :   IN    std_logic;
        dout_1_re                         :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
        );
END Subsystem_ip_src_subFilter;


ARCHITECTURE rtl OF Subsystem_ip_src_subFilter IS

  -- Component Declarations
  COMPONENT Subsystem_ip_src_FilterTapWvldIn
    PORT( clk                             :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          dinReg2_0_re                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          coefIn_0                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En19
          addin                           :   IN    std_logic_vector(47 DOWNTO 0);  -- sfix48_En34
          multVld                         :   IN    std_logic;
          tapout                          :   OUT   std_logic_vector(47 DOWNTO 0)  -- sfix48_En34
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Subsystem_ip_src_FilterTapWvldIn
    USE ENTITY work.Subsystem_ip_src_FilterTapWvldIn(rtl);

  -- Signals
  SIGNAL intdelay_reg                     : std_logic_vector(0 TO 2);  -- ufix1 [3]
  SIGNAL tapoutVld                        : std_logic;
  SIGNAL addin                            : signed(47 DOWNTO 0);  -- sfix48_En34
  SIGNAL intdelay_reg_1                   : std_logic_vector(0 TO 1);  -- ufix1 [2]
  SIGNAL multVld                          : std_logic;
  SIGNAL tapout                           : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL ZERO_OUT                         : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL tapout_1                         : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL tapout_signed                    : signed(47 DOWNTO 0);  -- sfix48_En34
  SIGNAL dout_cast                        : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL muxOut                           : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dout_1_re_tmp                    : signed(15 DOWNTO 0);  -- sfix16_En15

BEGIN
  u_FilterTap_1 : Subsystem_ip_src_FilterTapWvldIn
    PORT MAP( clk => clk,
              enb_1_32_0 => enb_1_32_0,
              dinReg2_0_re => dinReg2_0_re,  -- sfix16_En15
              coefIn_0 => coefIn(0),  -- sfix16_En19
              addin => std_logic_vector(addin),  -- sfix48_En34
              multVld => multVld,
              tapout => tapout  -- sfix48_En34
              );

  u_FilterTap_2 : Subsystem_ip_src_FilterTapWvldIn
    PORT MAP( clk => clk,
              enb_1_32_0 => enb_1_32_0,
              dinReg2_0_re => dinReg2_0_re,  -- sfix16_En15
              coefIn_0 => coefIn(1),  -- sfix16_En19
              addin => tapout,  -- sfix48_En34
              multVld => multVld,
              tapout => tapout_1  -- sfix48_En34
              );

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      intdelay_reg <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        IF syncReset = '1' THEN
          intdelay_reg <= (OTHERS => '0');
        ELSE 
          intdelay_reg(0) <= dinRegVld;
          intdelay_reg(1 TO 2) <= intdelay_reg(0 TO 1);
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_process;

  tapoutVld <= intdelay_reg(2);

  addin <= to_signed(0, 48);

  intdelay_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      intdelay_reg_1 <= (OTHERS => '0');
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        intdelay_reg_1(0) <= dinRegVld;
        intdelay_reg_1(1) <= intdelay_reg_1(0);
      END IF;
    END IF;
  END PROCESS intdelay_1_process;

  multVld <= intdelay_reg_1(1);

  ZERO_OUT <= to_signed(16#0000#, 16);

  tapout_signed <= signed(tapout_1);

  dout_cast <= tapout_signed(34 DOWNTO 19);

  
  muxOut <= ZERO_OUT WHEN tapoutVld = '0' ELSE
      dout_cast;

  intdelay_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dout_1_re_tmp <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        IF syncReset = '1' THEN
          dout_1_re_tmp <= to_signed(16#0000#, 16);
        ELSE 
          dout_1_re_tmp <= muxOut;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  dout_1_re <= std_logic_vector(dout_1_re_tmp);

END rtl;

