/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: gm_newsimul_interface.c
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

#include "gm_newsimul_interface.h"
#include "gm_newsimul_interface_types.h"
#include "rtwtypes.h"
#include <math.h>
#include "rt_nonfinite.h"
#include <string.h>
#include "gm_newsimul_interface_private.h"
#include "gm_newsimul_interface_dt.h"

/* user code (top of source file) */
/* System '<Root>/Subsystem' */
#include "axi_lct.h"

/* Block signals (default storage) */
B_gm_newsimul_interface_T gm_newsimul_interface_B;

/* Block states (default storage) */
DW_gm_newsimul_interface_T gm_newsimul_interface_DW;

/* Real-time model */
static RT_MODEL_gm_newsimul_interfac_T gm_newsimul_interface_M_;
RT_MODEL_gm_newsimul_interfac_T *const gm_newsimul_interface_M =
  &gm_newsimul_interface_M_;

/* Forward declaration for local functions */
static void gm_newsimul_int_SystemCore_step(hdl_serializer1D_gm_newsimul__T *obj,
  const cint16_T varargin_1[100000], boolean_T varargin_2, cint16_T *varargout_1,
  boolean_T *varargout_2, boolean_T *varargout_3);

/*
 * Set which subrates need to run this base step (base rate always runs).
 * This function must be called prior to calling the model step function
 * in order to remember which rates need to run this base step.  The
 * buffering of events allows for overlapping preemption.
 */
void gm_newsimul_interface_SetEventsForThisBaseStep(boolean_T *eventFlags)
{
  /* Task runs when its counter is zero, computed via rtmStepTask macro */
  eventFlags[1] = ((boolean_T)rtmStepTask(gm_newsimul_interface_M, 1));
}

/*
 *         This function updates active task flag for each subrate.
 *         The function is called in the model base rate function.
 *         It maintains SampleHit information to allow scheduling
 *         of the subrates from the base rate function.
 */
void rate_scheduler(void)
{
  /* Compute which subrates run during the next base time step.  Subrates
   * are an integer multiple of the base rate counter.  Therefore, the subtask
   * counter is reset when it reaches its limit (zero means run).
   */
  (gm_newsimul_interface_M->Timing.TaskCounters.TID[1])++;
  if ((gm_newsimul_interface_M->Timing.TaskCounters.TID[1]) > 99999) {/* Sample time: [5.0E-5s, 0.0s] */
    gm_newsimul_interface_M->Timing.TaskCounters.TID[1] = 0;
  }
}

static void gm_newsimul_int_SystemCore_step(hdl_serializer1D_gm_newsimul__T *obj,
  const cint16_T varargin_1[100000], boolean_T varargin_2, cint16_T *varargout_1,
  boolean_T *varargout_2, boolean_T *varargout_3)
{
  int32_T i;
  if (obj->pCnt == 0) {
    obj->pDataInValid = varargin_2;
  }

  if (obj->pCnt == 0) {
    *varargout_1 = varargin_1[0];
  } else {
    *varargout_1 = obj->pMatrixBuffer[0];
  }

  if (obj->pCnt == 0) {
    for (i = 0; i < 99999; i++) {
      obj->pMatrixBuffer[i] = varargin_1[(i + 2) - 1];
    }
  } else {
    for (i = 0; i < 99998; i++) {
      gm_newsimul_interface_B.obj[i] = obj->pMatrixBuffer[(i + 2) - 1];
    }

    gm_newsimul_interface_B.obj[99998] = varargin_1[99999];
    memcpy(&obj->pMatrixBuffer[0], &gm_newsimul_interface_B.obj[0], 99999U *
           sizeof(cint16_T));
  }

  if ((obj->pCnt == 0) && obj->pDataInValid) {
    *varargout_2 = true;
  } else {
    *varargout_2 = false;
  }

  if (obj->pDataInValid && (obj->pCnt < 100000)) {
    *varargout_3 = true;
  } else {
    *varargout_3 = false;
  }

  if (obj->pCnt == 99999) {
    obj->pCnt = 0;
  } else if (obj->pCnt > 2147483646) {
    obj->pCnt = MAX_int32_T;
  } else {
    obj->pCnt++;
  }
}

/* Model step function for TID0 */
void gm_newsimul_interface_step0(void) /* Sample time: [5.0E-10s, 0.0s] */
{
  int_T tid = 0;
  cint16_T b_varargout_1;
  uint32_T rtb_DataTypeConversion;
  int16_T rtb_ComplextoRealImag_o1;
  int16_T rtb_ComplextoRealImag_o2;
  boolean_T rtb_HDL1DSe_o2;
  boolean_T rtb_HDL1DSe_o3;

  {                                    /* Sample time: [5.0E-10s, 0.0s] */
    rate_scheduler();
  }

  /* MATLABSystem: '<S3>/HDL1DSe' incorporates:
   *  Constant: '<Root>/Constant1'
   *  DataTypeConversion: '<S1>/Data Type Conversion1'
   *  RateTransition: '<S3>/rateTrans'
   */
  gm_newsimul_int_SystemCore_step(&gm_newsimul_interface_DW.obj,
    gm_newsimul_interface_B.DataTypeConversion1,
    gm_newsimul_interface_P.Constant1_Value, &b_varargout_1, &rtb_HDL1DSe_o2,
    &rtb_HDL1DSe_o3);

  /* ComplexToRealImag: '<Root>/Complex to Real-Imag' incorporates:
   *  MATLABSystem: '<S3>/HDL1DSe'
   */
  rtb_ComplextoRealImag_o1 = b_varargout_1.re;
  rtb_ComplextoRealImag_o2 = b_varargout_1.im;

  /* Outputs for Atomic SubSystem: '<Root>/Subsystem' */

  /* DataTypeConversion: '<S7>/DataTypeConversion' incorporates:
   *  ComplexToRealImag: '<Root>/Complex to Real-Imag'
   */
  rtb_DataTypeConversion = (uint32_T)rtb_ComplextoRealImag_o1;

  /* MATLABSystem: '<S12>/AXI4-Interface Write' */
  AXI4LITE_WRITE(gm_newsimul_interface_DW.obj_nd.DeviceState,
                 &rtb_DataTypeConversion, 256U, 4U);

  /* DataTypeConversion: '<S7>/DataTypeConversion1' incorporates:
   *  ComplexToRealImag: '<Root>/Complex to Real-Imag'
   */
  rtb_DataTypeConversion = (uint32_T)rtb_ComplextoRealImag_o2;

  /* MATLABSystem: '<S11>/AXI4-Interface Write' */
  AXI4LITE_WRITE(gm_newsimul_interface_DW.obj_n0.DeviceState,
                 &rtb_DataTypeConversion, 260U, 4U);

  /* MATLABSystem: '<S8>/AXI4-Interface Read' */
  AXI4LITE_READ(gm_newsimul_interface_DW.obj_a.DeviceState,
                &rtb_DataTypeConversion, 264U, 4U);

  /* DataTypeConversion: '<S6>/DataTypeConversion' incorporates:
   *  MATLABSystem: '<S8>/AXI4-Interface Read'
   */
  gm_newsimul_interface_B.DataTypeConversion = (rtb_DataTypeConversion & 65536U)
    != 0U ? (int32_T)rtb_DataTypeConversion | -65536 : (int32_T)
    rtb_DataTypeConversion & 65535;

  /* MATLABSystem: '<S9>/AXI4-Interface Read' */
  AXI4LITE_READ(gm_newsimul_interface_DW.obj_n.DeviceState,
                &rtb_DataTypeConversion, 268U, 4U);

  /* MATLABSystem: '<S10>/AXI4-Interface Read' */
  AXI4LITE_READ(gm_newsimul_interface_DW.obj_p.DeviceState,
                &rtb_DataTypeConversion, 272U, 4U);

  /* End of Outputs for SubSystem: '<Root>/Subsystem' */

  /* ToAsyncQueueBlock generated from: '<Root>/Subsystem' */
  {
    if (tid == 0) {
      {
        double time = gm_newsimul_interface_M->Timing.taskTime0;
        void *pData = (void *)&gm_newsimul_interface_B.DataTypeConversion;
        int32_T size = 1*sizeof(int32_T);
        sendToAsyncQueueTgtAppSvc(2429109634U, time, pData, size);
      }
    }
  }

  /* External mode */
  rtExtModeUploadCheckTrigger(2);
  rtExtModeUpload(0, (real_T)gm_newsimul_interface_M->Timing.taskTime0);

  /* signal main to stop simulation */
  {                                    /* Sample time: [5.0E-10s, 0.0s] */
    if ((rtmGetTFinal(gm_newsimul_interface_M)!=-1) &&
        !((rtmGetTFinal(gm_newsimul_interface_M)-
           gm_newsimul_interface_M->Timing.taskTime0) >
          gm_newsimul_interface_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(gm_newsimul_interface_M, "Simulation finished");
    }

    if (rtmGetStopRequested(gm_newsimul_interface_M)) {
      rtmSetErrorStatus(gm_newsimul_interface_M, "Simulation finished");
    }
  }

  /* Update absolute time */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++gm_newsimul_interface_M->Timing.clockTick0)) {
    ++gm_newsimul_interface_M->Timing.clockTickH0;
  }

  gm_newsimul_interface_M->Timing.taskTime0 =
    gm_newsimul_interface_M->Timing.clockTick0 *
    gm_newsimul_interface_M->Timing.stepSize0 +
    gm_newsimul_interface_M->Timing.clockTickH0 *
    gm_newsimul_interface_M->Timing.stepSize0 * 4294967296.0;

  /* If subsystem generates rate grouping Output functions,
   * when tid is used in Output function for one rate,
   * all Output functions include tid as a local variable.
   * As result, some Output functions may have unused tid.
   */
  UNUSED_PARAMETER(tid);
}

/* Model step function for TID1 */
void gm_newsimul_interface_step1(void) /* Sample time: [5.0E-5s, 0.0s] */
{
  int_T tid = 1;
  real_T tmp;
  real_T tmp_0;
  int32_T i;
  for (i = 0; i < 100000; i++) {
    /* DataTypeConversion: '<S1>/Data Type Conversion1' incorporates:
     *  Constant: '<Root>/Constant'
     *  Reshape: '<S1>/Reshape2'
     */
    tmp_0 = floor(gm_newsimul_interface_P.Constant_Value[i].re * 32768.0);
    if (rtIsNaN(tmp_0) || rtIsInf(tmp_0)) {
      tmp_0 = 0.0;
    } else {
      tmp_0 = fmod(tmp_0, 65536.0);
    }

    tmp = floor(gm_newsimul_interface_P.Constant_Value[i].im * 32768.0);
    if (rtIsNaN(tmp) || rtIsInf(tmp)) {
      tmp = 0.0;
    } else {
      tmp = fmod(tmp, 65536.0);
    }

    /* DataTypeConversion: '<S1>/Data Type Conversion1' */
    gm_newsimul_interface_B.DataTypeConversion1[i].re = (int16_T)(tmp_0 < 0.0 ?
      (int32_T)(int16_T)-(int16_T)(uint16_T)-tmp_0 : (int32_T)(int16_T)(uint16_T)
      tmp_0);
    gm_newsimul_interface_B.DataTypeConversion1[i].im = (int16_T)(tmp < 0.0 ?
      (int32_T)(int16_T)-(int16_T)(uint16_T)-tmp : (int32_T)(int16_T)(uint16_T)
      tmp);
  }

  rtExtModeUpload(1, (real_T)((gm_newsimul_interface_M->Timing.clockTick1) *
    5.0E-5));

  /* Update absolute time */
  /* The "clockTick1" counts the number of times the code of this task has
   * been executed. The resolution of this integer timer is 5.0E-5, which is the step size
   * of the task. Size of "clockTick1" ensures timer will not overflow during the
   * application lifespan selected.
   */
  gm_newsimul_interface_M->Timing.clockTick1++;

  /* If subsystem generates rate grouping Output functions,
   * when tid is used in Output function for one rate,
   * all Output functions include tid as a local variable.
   * As result, some Output functions may have unused tid.
   */
  UNUSED_PARAMETER(tid);
}

/* Use this function only if you need to maintain compatibility with an existing static main program. */
void gm_newsimul_interface_step(int_T tid)
{
  switch (tid) {
   case 0 :
    gm_newsimul_interface_step0();
    break;

   case 1 :
    gm_newsimul_interface_step1();
    break;

   default :
    /* do nothing */
    break;
  }
}

/* Model initialize function */
void gm_newsimul_interface_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));
  rtmSetTFinal(gm_newsimul_interface_M, 4.99995E-5);
  gm_newsimul_interface_M->Timing.stepSize0 = 5.0E-10;

  /* External mode info */
  gm_newsimul_interface_M->Sizes.checksums[0] = (3421579224U);
  gm_newsimul_interface_M->Sizes.checksums[1] = (596608554U);
  gm_newsimul_interface_M->Sizes.checksums[2] = (1891130870U);
  gm_newsimul_interface_M->Sizes.checksums[3] = (1004719197U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[10];
    gm_newsimul_interface_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    systemRan[2] = &rtAlwaysEnabled;
    systemRan[3] = &rtAlwaysEnabled;
    systemRan[4] = &rtAlwaysEnabled;
    systemRan[5] = &rtAlwaysEnabled;
    systemRan[6] = &rtAlwaysEnabled;
    systemRan[7] = &rtAlwaysEnabled;
    systemRan[8] = &rtAlwaysEnabled;
    systemRan[9] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(gm_newsimul_interface_M->extModeInfo,
      &gm_newsimul_interface_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(gm_newsimul_interface_M->extModeInfo,
                        gm_newsimul_interface_M->Sizes.checksums);
    rteiSetTPtr(gm_newsimul_interface_M->extModeInfo, rtmGetTPtr
                (gm_newsimul_interface_M));
  }

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    gm_newsimul_interface_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 31;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.BTransTable = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.PTransTable = &rtPTransTable;
  }

  {
    zynq_AXIRead_gm_newsimul_inte_T *obj_0;
    zynq_AXIWrite_gm_newsimul_int_T *obj;
    int32_T i;
    char_T b[14];
    static const char_T tmp[14] = "/dev/mwipcore";

    {
      /* user code (Start function Header) */

      /* System '<Root>/Subsystem' */
      AXI4LITE_RESET_IPCORE("/dev/mwipcore");
    }

    /* SystemInitialize for Atomic SubSystem: '<Root>/Subsystem' */

    /* Start for MATLABSystem: '<S12>/AXI4-Interface Write' */
    gm_newsimul_interface_DW.obj_nd.matlabCodegenIsDeleted = false;
    obj = &gm_newsimul_interface_DW.obj_nd;
    gm_newsimul_interface_DW.obj_nd.isInitialized = 1;
    gm_newsimul_interface_DW.obj_nd.DeviceState = NULL;
    for (i = 0; i < 14; i++) {
      b[i] = tmp[i];
    }

    obj->DeviceState = AXI4LITE_INIT(&b[0]);
    gm_newsimul_interface_DW.obj_nd.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S12>/AXI4-Interface Write' */

    /* Start for MATLABSystem: '<S11>/AXI4-Interface Write' */
    gm_newsimul_interface_DW.obj_n0.matlabCodegenIsDeleted = false;
    obj = &gm_newsimul_interface_DW.obj_n0;
    gm_newsimul_interface_DW.obj_n0.isInitialized = 1;
    gm_newsimul_interface_DW.obj_n0.DeviceState = NULL;
    for (i = 0; i < 14; i++) {
      b[i] = tmp[i];
    }

    obj->DeviceState = AXI4LITE_INIT(&b[0]);
    gm_newsimul_interface_DW.obj_n0.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S11>/AXI4-Interface Write' */

    /* Start for MATLABSystem: '<S8>/AXI4-Interface Read' */
    gm_newsimul_interface_DW.obj_a.matlabCodegenIsDeleted = false;
    obj_0 = &gm_newsimul_interface_DW.obj_a;
    gm_newsimul_interface_DW.obj_a.isInitialized = 1;
    gm_newsimul_interface_DW.obj_a.DeviceState = NULL;
    for (i = 0; i < 14; i++) {
      b[i] = tmp[i];
    }

    obj_0->DeviceState = AXI4LITE_INIT(&b[0]);
    gm_newsimul_interface_DW.obj_a.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S8>/AXI4-Interface Read' */

    /* Start for MATLABSystem: '<S9>/AXI4-Interface Read' */
    gm_newsimul_interface_DW.obj_n.matlabCodegenIsDeleted = false;
    obj_0 = &gm_newsimul_interface_DW.obj_n;
    gm_newsimul_interface_DW.obj_n.isInitialized = 1;
    gm_newsimul_interface_DW.obj_n.DeviceState = NULL;
    for (i = 0; i < 14; i++) {
      b[i] = tmp[i];
    }

    obj_0->DeviceState = AXI4LITE_INIT(&b[0]);
    gm_newsimul_interface_DW.obj_n.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S9>/AXI4-Interface Read' */

    /* Start for MATLABSystem: '<S10>/AXI4-Interface Read' */
    gm_newsimul_interface_DW.obj_p.matlabCodegenIsDeleted = false;
    obj_0 = &gm_newsimul_interface_DW.obj_p;
    gm_newsimul_interface_DW.obj_p.isInitialized = 1;
    gm_newsimul_interface_DW.obj_p.DeviceState = NULL;
    for (i = 0; i < 14; i++) {
      b[i] = tmp[i];
    }

    obj_0->DeviceState = AXI4LITE_INIT(&b[0]);
    gm_newsimul_interface_DW.obj_p.isSetupComplete = true;

    /* End of Start for MATLABSystem: '<S10>/AXI4-Interface Read' */

    /* End of SystemInitialize for SubSystem: '<Root>/Subsystem' */

    /* Start for MATLABSystem: '<S3>/HDL1DSe' */
    gm_newsimul_interface_DW.obj.isInitialized = 1;
    gm_newsimul_interface_DW.obj.pDataInValid = true;
    memset(&gm_newsimul_interface_DW.obj.pMatrixBuffer[0], 0, 99999U * sizeof
           (cint16_T));

    /* InitializeConditions for MATLABSystem: '<S3>/HDL1DSe' */
    gm_newsimul_interface_DW.obj.pCnt = 0;
  }
}

/* Model terminate function */
void gm_newsimul_interface_terminate(void)
{
  /* Terminate for Atomic SubSystem: '<Root>/Subsystem' */

  /* Terminate for MATLABSystem: '<S12>/AXI4-Interface Write' */
  if (!gm_newsimul_interface_DW.obj_nd.matlabCodegenIsDeleted) {
    gm_newsimul_interface_DW.obj_nd.matlabCodegenIsDeleted = true;
    if ((gm_newsimul_interface_DW.obj_nd.isInitialized == 1) &&
        gm_newsimul_interface_DW.obj_nd.isSetupComplete) {
      AXI4LITE_TERMINATE(gm_newsimul_interface_DW.obj_nd.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S12>/AXI4-Interface Write' */

  /* Terminate for MATLABSystem: '<S11>/AXI4-Interface Write' */
  if (!gm_newsimul_interface_DW.obj_n0.matlabCodegenIsDeleted) {
    gm_newsimul_interface_DW.obj_n0.matlabCodegenIsDeleted = true;
    if ((gm_newsimul_interface_DW.obj_n0.isInitialized == 1) &&
        gm_newsimul_interface_DW.obj_n0.isSetupComplete) {
      AXI4LITE_TERMINATE(gm_newsimul_interface_DW.obj_n0.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S11>/AXI4-Interface Write' */

  /* Terminate for MATLABSystem: '<S8>/AXI4-Interface Read' */
  if (!gm_newsimul_interface_DW.obj_a.matlabCodegenIsDeleted) {
    gm_newsimul_interface_DW.obj_a.matlabCodegenIsDeleted = true;
    if ((gm_newsimul_interface_DW.obj_a.isInitialized == 1) &&
        gm_newsimul_interface_DW.obj_a.isSetupComplete) {
      AXI4LITE_TERMINATE(gm_newsimul_interface_DW.obj_a.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S8>/AXI4-Interface Read' */

  /* Terminate for MATLABSystem: '<S9>/AXI4-Interface Read' */
  if (!gm_newsimul_interface_DW.obj_n.matlabCodegenIsDeleted) {
    gm_newsimul_interface_DW.obj_n.matlabCodegenIsDeleted = true;
    if ((gm_newsimul_interface_DW.obj_n.isInitialized == 1) &&
        gm_newsimul_interface_DW.obj_n.isSetupComplete) {
      AXI4LITE_TERMINATE(gm_newsimul_interface_DW.obj_n.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S9>/AXI4-Interface Read' */

  /* Terminate for MATLABSystem: '<S10>/AXI4-Interface Read' */
  if (!gm_newsimul_interface_DW.obj_p.matlabCodegenIsDeleted) {
    gm_newsimul_interface_DW.obj_p.matlabCodegenIsDeleted = true;
    if ((gm_newsimul_interface_DW.obj_p.isInitialized == 1) &&
        gm_newsimul_interface_DW.obj_p.isSetupComplete) {
      AXI4LITE_TERMINATE(gm_newsimul_interface_DW.obj_p.DeviceState);
    }
  }

  /* End of Terminate for MATLABSystem: '<S10>/AXI4-Interface Read' */

  /* End of Terminate for SubSystem: '<Root>/Subsystem' */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
