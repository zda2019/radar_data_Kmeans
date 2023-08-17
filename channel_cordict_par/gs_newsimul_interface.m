%--------------------------------------------------------------------------
% Host Interface Script
% 
% Generated with MATLAB 9.14 (R2023a) at 13:22:54 on 25/04/2023.
% This script was created for the IP Core generated from design 'newsimul'.
% 
% Use this script to access DUT ports in the design that were mapped to compatible IP core interfaces.
% You can write to input ports in the design and read from output ports directly from MATLAB.
% To write to input ports, use the "writePort" command and specify the port name and input data. The input data will be cast to the DUT port's data type before writing.
% To read from output ports, use the "readPort" command and specify the port name. The output data will be returned with the same data type as the DUT port.
% Use the "release" command to release MATLAB's control of the hardware resources.
%--------------------------------------------------------------------------

%% Program FPGA
% Uncomment the lines below to program FGPA hardware with the designated bitstream and configure the processor with the corresponding devicetree.
% MATLAB will connect to the board with an SSH connection to program the FPGA.
% If you need to change login parameters for your board, using the following syntax:
% hProcessor = xilinxsoc(ipAddress, username, password);
hProcessor = xilinxsoc();
% programFPGA(hProcessor, "hdl_prj\vivado_ip_prj\vivado_prj.runs\impl_1\system_top_wrapper.bit", "devicetree_axilite_iio.dtb");

%% Create fpga object
hFPGA = fpga(hProcessor);

%% Setup fpga object
% This function configures the "fpga" object with the same interfaces as the generated IP core
gs_newsimul_setup(hFPGA);

%% Write/read DUT ports
% Uncomment the following lines to write/read DUT ports in the generated IP Core.
% Update the example data in the write commands with meaningful data to write to the DUT.
%% AXI4-Lite
% writePort(hFPGA, "datareal", zeros([1 1]));
% writePort(hFPGA, "dataimag", zeros([1 1]));
% data_amp = readPort(hFPGA, "amp");
% data_angle = readPort(hFPGA, "angle");
% data_vaild = readPort(hFPGA, "vaild");

%% Release hardware resources
release(hFPGA);

