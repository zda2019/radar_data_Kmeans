/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: gm_newsimul_interface_types.h
 *
 * Code generated for Simulink model 'gm_newsimul_interface'.
 *
 * Model version                  : 1.19
 * Simulink Coder version         : 9.9 (R2023a) 19-Nov-2022
 * C/C++ source code generated on : Tue Apr 25 13:46:15 2023
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_gm_newsimul_interface_types_h_
#define RTW_HEADER_gm_newsimul_interface_types_h_
#include "rtwtypes.h"
#ifndef struct_tag_3XdrVRk5lSRHzM2HwgmmuH
#define struct_tag_3XdrVRk5lSRHzM2HwgmmuH

struct tag_3XdrVRk5lSRHzM2HwgmmuH
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  AXI4_struct * DeviceState;
};

#endif                                 /* struct_tag_3XdrVRk5lSRHzM2HwgmmuH */

#ifndef typedef_zynq_AXIRead_gm_newsimul_inte_T
#define typedef_zynq_AXIRead_gm_newsimul_inte_T

typedef struct tag_3XdrVRk5lSRHzM2HwgmmuH zynq_AXIRead_gm_newsimul_inte_T;

#endif                             /* typedef_zynq_AXIRead_gm_newsimul_inte_T */

#ifndef struct_tag_TKweGKuRobA5EcQADQoAP
#define struct_tag_TKweGKuRobA5EcQADQoAP

struct tag_TKweGKuRobA5EcQADQoAP
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  AXI4_struct * DeviceState;
};

#endif                                 /* struct_tag_TKweGKuRobA5EcQADQoAP */

#ifndef typedef_zynq_AXIWrite_gm_newsimul_int_T
#define typedef_zynq_AXIWrite_gm_newsimul_int_T

typedef struct tag_TKweGKuRobA5EcQADQoAP zynq_AXIWrite_gm_newsimul_int_T;

#endif                             /* typedef_zynq_AXIWrite_gm_newsimul_int_T */

#ifndef struct_tag_IrFbbV66W9DNqUmgWii6CG
#define struct_tag_IrFbbV66W9DNqUmgWii6CG

struct tag_IrFbbV66W9DNqUmgWii6CG
{
  int32_T isInitialized;
  int32_T pCnt;
  cint16_T pMatrixBuffer[99999];
  boolean_T pDataInValid;
};

#endif                                 /* struct_tag_IrFbbV66W9DNqUmgWii6CG */

#ifndef typedef_hdl_serializer1D_gm_newsimul__T
#define typedef_hdl_serializer1D_gm_newsimul__T

typedef struct tag_IrFbbV66W9DNqUmgWii6CG hdl_serializer1D_gm_newsimul__T;

#endif                             /* typedef_hdl_serializer1D_gm_newsimul__T */

/* Parameters (default storage) */
typedef struct P_gm_newsimul_interface_T_ P_gm_newsimul_interface_T;

/* Forward declaration for rtModel */
typedef struct tag_RTM_gm_newsimul_interface_T RT_MODEL_gm_newsimul_interfac_T;

#endif                           /* RTW_HEADER_gm_newsimul_interface_types_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
