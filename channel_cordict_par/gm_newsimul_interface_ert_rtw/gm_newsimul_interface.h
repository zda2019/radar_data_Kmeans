/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: gm_newsimul_interface.h
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

#ifndef RTW_HEADER_gm_newsimul_interface_h_
#define RTW_HEADER_gm_newsimul_interface_h_
#ifndef gm_newsimul_interface_COMMON_INCLUDES_
#define gm_newsimul_interface_COMMON_INCLUDES_
#include "ToAsyncQueueTgtAppSvc/ToAsyncQueueTgtAppSvcCIntrf.h"
#include "rtwtypes.h"
#include "rtw_extmode.h"
#include "sysran_types.h"
#include "dt_info.h"
#include "ext_work.h"
#include "axi_lct.h"
#endif                              /* gm_newsimul_interface_COMMON_INCLUDES_ */

#include "gm_newsimul_interface_types.h"
#include <stddef.h>
#include <float.h>
#include "rt_defines.h"
#include <string.h>
#include "rt_nonfinite.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetFinalTime
#define rtmGetFinalTime(rtm)           ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetRTWExtModeInfo
#define rtmGetRTWExtModeInfo(rtm)      ((rtm)->extModeInfo)
#endif

#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

#ifndef rtmStepTask
#define rtmStepTask(rtm, idx)          ((rtm)->Timing.TaskCounters.TID[(idx)] == 0)
#endif

#ifndef rtmGetStopRequested
#define rtmGetStopRequested(rtm)       ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
#define rtmSetStopRequested(rtm, val)  ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
#define rtmGetStopRequestedPtr(rtm)    (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
#define rtmGetT(rtm)                   ((rtm)->Timing.taskTime0)
#endif

#ifndef rtmGetTFinal
#define rtmGetTFinal(rtm)              ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetTPtr
#define rtmGetTPtr(rtm)                (&(rtm)->Timing.taskTime0)
#endif

#ifndef rtmTaskCounter
#define rtmTaskCounter(rtm, idx)       ((rtm)->Timing.TaskCounters.TID[(idx)])
#endif

/* Block signals (default storage) */
typedef struct {
  cint16_T obj[99999];
  int32_T DataTypeConversion;          /* '<S6>/DataTypeConversion' */
  cint16_T DataTypeConversion1[100000];/* '<S1>/Data Type Conversion1' */
} B_gm_newsimul_interface_T;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  hdl_serializer1D_gm_newsimul__T obj; /* '<S3>/HDL1DSe' */
  zynq_AXIRead_gm_newsimul_inte_T obj_p;/* '<S10>/AXI4-Interface Read' */
  zynq_AXIRead_gm_newsimul_inte_T obj_n;/* '<S9>/AXI4-Interface Read' */
  zynq_AXIRead_gm_newsimul_inte_T obj_a;/* '<S8>/AXI4-Interface Read' */
  zynq_AXIWrite_gm_newsimul_int_T obj_nd;/* '<S12>/AXI4-Interface Write' */
  zynq_AXIWrite_gm_newsimul_int_T obj_n0;/* '<S11>/AXI4-Interface Write' */
  struct {
    void *AQHandles;
  } TAQSigLogging_InsertedFor_Subsy;   /* synthesized block */

  uint8_T is_active_c3_hdlsllib;       /* '<S3>/IntToEnumConverter' */
  uint8_T is_active_c1_hdlsllib;       /* '<S3>/EnumToIntConverter' */
  boolean_T doneDoubleBufferReInit;    /* '<S3>/IntToEnumConverter' */
  boolean_T doneDoubleBufferReInit_h;  /* '<S3>/EnumToIntConverter' */
} DW_gm_newsimul_interface_T;

/* Parameters (default storage) */
struct P_gm_newsimul_interface_T_ {
  creal_T Constant_Value[100000];      /* Expression: yr_c(:,1)
                                        * Referenced by: '<Root>/Constant'
                                        */
  boolean_T Constant1_Value;           /* Expression: true
                                        * Referenced by: '<Root>/Constant1'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_gm_newsimul_interface_T {
  const char_T *errorStatus;
  RTWExtModeInfo *extModeInfo;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    uint32_T checksums[4];
  } Sizes;

  /*
   * SpecialInfo:
   * The following substructure contains special information
   * related to other components that are dependent on RTW.
   */
  struct {
    const void *mappingInfo;
  } SpecialInfo;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    time_T taskTime0;
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    uint32_T clockTick1;
    struct {
      uint32_T TID[2];
    } TaskCounters;

    time_T tFinal;
    boolean_T stopRequestedFlag;
  } Timing;
};

/* Block parameters (default storage) */
extern P_gm_newsimul_interface_T gm_newsimul_interface_P;

/* Block signals (default storage) */
extern B_gm_newsimul_interface_T gm_newsimul_interface_B;

/* Block states (default storage) */
extern DW_gm_newsimul_interface_T gm_newsimul_interface_DW;

/* External function called from main */
extern void gm_newsimul_interface_SetEventsForThisBaseStep(boolean_T *eventFlags);
extern void rate_scheduler(void);

/* Model entry point functions */
extern void gm_newsimul_interface_initialize(void);
extern void gm_newsimul_interface_step0(void);
extern void gm_newsimul_interface_step1(void);
extern void gm_newsimul_interface_step(int_T tid);
extern void gm_newsimul_interface_terminate(void);

/* Real-time Model object */
extern RT_MODEL_gm_newsimul_interfac_T *const gm_newsimul_interface_M;
extern volatile boolean_T stopRequested;
extern volatile boolean_T runModel;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'gm_newsimul_interface'
 * '<S1>'   : 'gm_newsimul_interface/Serialize and Quantize1'
 * '<S2>'   : 'gm_newsimul_interface/Subsystem'
 * '<S3>'   : 'gm_newsimul_interface/Serialize and Quantize1/Serialize Input'
 * '<S4>'   : 'gm_newsimul_interface/Serialize and Quantize1/Serialize Input/EnumToIntConverter'
 * '<S5>'   : 'gm_newsimul_interface/Serialize and Quantize1/Serialize Input/IntToEnumConverter'
 * '<S6>'   : 'gm_newsimul_interface/Subsystem/AXI4SlaveRead'
 * '<S7>'   : 'gm_newsimul_interface/Subsystem/AXI4SlaveWrite'
 * '<S8>'   : 'gm_newsimul_interface/Subsystem/AXI4SlaveRead/AXI4SlaveRead_amp'
 * '<S9>'   : 'gm_newsimul_interface/Subsystem/AXI4SlaveRead/AXI4SlaveRead_angle'
 * '<S10>'  : 'gm_newsimul_interface/Subsystem/AXI4SlaveRead/AXI4SlaveRead_vaild'
 * '<S11>'  : 'gm_newsimul_interface/Subsystem/AXI4SlaveWrite/AXI4SlaveWrite_dataimag'
 * '<S12>'  : 'gm_newsimul_interface/Subsystem/AXI4SlaveWrite/AXI4SlaveWrite_datareal'
 */
#endif                                 /* RTW_HEADER_gm_newsimul_interface_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
