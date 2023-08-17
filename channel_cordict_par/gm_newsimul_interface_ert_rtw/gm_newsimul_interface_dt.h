/*
 * gm_newsimul_interface_dt.h
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "gm_newsimul_interface".
 *
 * Model version              : 1.19
 * Simulink Coder version : 9.9 (R2023a) 19-Nov-2022
 * C source code generated on : Tue Apr 25 13:46:15 2023
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "ext_types.h"

/* data type size table */
static uint_T rtDataTypeSizes[] = {
  sizeof(real_T),
  sizeof(real32_T),
  sizeof(int8_T),
  sizeof(uint8_T),
  sizeof(int16_T),
  sizeof(uint16_T),
  sizeof(int32_T),
  sizeof(uint32_T),
  sizeof(boolean_T),
  sizeof(fcn_call_T),
  sizeof(int_T),
  sizeof(pointer_T),
  sizeof(action_T),
  2*sizeof(uint32_T),
  sizeof(int32_T),
  sizeof(int64_T),
  sizeof(uint64_T),
  sizeof(int16_T),
  sizeof(int32_T),
  sizeof(int32_T),
  sizeof(hdl_serializer1D_gm_newsimul__T),
  sizeof(zynq_AXIRead_gm_newsimul_inte_T),
  sizeof(int32_T),
  sizeof(int32_T),
  sizeof(zynq_AXIWrite_gm_newsimul_int_T),
  sizeof(uint64_T),
  sizeof(int64_T),
  sizeof(uint_T),
  sizeof(char_T),
  sizeof(uchar_T),
  sizeof(time_T)
};

/* data type name table */
static const char_T * rtDataTypeNames[] = {
  "real_T",
  "real32_T",
  "int8_T",
  "uint8_T",
  "int16_T",
  "uint16_T",
  "int32_T",
  "uint32_T",
  "boolean_T",
  "fcn_call_T",
  "int_T",
  "pointer_T",
  "action_T",
  "timer_uint32_pair_T",
  "physical_connection",
  "int64_T",
  "uint64_T",
  "int16_T",
  "int32_T",
  "int32_T",
  "hdl_serializer1D_gm_newsimul__T",
  "zynq_AXIRead_gm_newsimul_inte_T",
  "int32_T",
  "int32_T",
  "zynq_AXIWrite_gm_newsimul_int_T",
  "uint64_T",
  "int64_T",
  "uint_T",
  "char_T",
  "uchar_T",
  "time_T"
};

/* data type transitions for block I/O structure */
static DataTypeTransition rtBTransitions[] = {
  { (char_T *)(&gm_newsimul_interface_B.DataTypeConversion), 18, 0, 1 },

  { (char_T *)(&gm_newsimul_interface_B.DataTypeConversion1[0].re), 17, 1,
    200000 }
  ,

  { (char_T *)(&gm_newsimul_interface_DW.obj), 20, 0, 1 },

  { (char_T *)(&gm_newsimul_interface_DW.obj_p), 21, 0, 3 },

  { (char_T *)(&gm_newsimul_interface_DW.obj_nd), 24, 0, 2 },

  { (char_T *)
    (&gm_newsimul_interface_DW.TAQSigLogging_InsertedFor_Subsy.AQHandles), 11, 0,
    1 },

  { (char_T *)(&gm_newsimul_interface_DW.is_active_c3_hdlsllib), 3, 0, 2 },

  { (char_T *)(&gm_newsimul_interface_DW.doneDoubleBufferReInit), 8, 0, 2 }
};

/* data type transition table for block I/O structure */
static DataTypeTransitionTable rtBTransTable = {
  8U,
  rtBTransitions
};

/* data type transitions for Parameters structure */
static DataTypeTransition rtPTransitions[] = {
  { (char_T *)(&gm_newsimul_interface_P.Constant_Value[0].re), 0, 1, 200000 },

  { (char_T *)(&gm_newsimul_interface_P.Constant1_Value), 8, 0, 1 }
};

/* data type transition table for Parameters structure */
static DataTypeTransitionTable rtPTransTable = {
  2U,
  rtPTransitions
};

/* [EOF] gm_newsimul_interface_dt.h */
