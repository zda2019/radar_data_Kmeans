/*
 * File Name:         hdl_prj\ipcore\Subsystem_ip_v1_0\include\Subsystem_ip_addr.h
 * Description:       C Header File
 * Created:           2023-04-25 13:19:48
*/

#ifndef SUBSYSTEM_IP_H_
#define SUBSYSTEM_IP_H_

#define  IPCore_Reset_Subsystem_ip       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_Subsystem_ip      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_Subsystem_ip   0x8  //contains unique IP timestamp (yymmddHHMM): 2304251319
#define  datareal_Data_Subsystem_ip      0x100  //data register for Inport datareal
#define  dataimag_Data_Subsystem_ip      0x104  //data register for Inport dataimag
#define  amp_Data_Subsystem_ip           0x108  //data register for Outport amp
#define  angle_Data_Subsystem_ip         0x10C  //data register for Outport angle
#define  vaild_Data_Subsystem_ip         0x110  //data register for Outport vaild

#endif /* SUBSYSTEM_IP_H_ */
