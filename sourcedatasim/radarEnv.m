function [source, tgtAng] = radarEnv(fs,tAll,c,rwrPos,rwrVel,radarPos,radarVel,fc,T,PRF,BW,size,gain,peakPower)
%雷达发射器与环境的集合，更具输入参数直接得到rwr处的离散数据
%总系统参数------------------------------------------
% -fs:采样率
% -tAll:仿真总时长
% -c:光速
% -rwrPos：rwr位置
% -rwrVel：rwr速度
%雷达参数---------------------------------------------
% -radarPos：radar位置
% -radarVel：radar速度
% -fc：频率
% -T：脉宽
% -PRF：脉冲重复频率
% -BW：带宽
%天线参数-----------------------------------------------
% -size：天线阵个数
% -gain：天线增益(dB)
% -peakPower：峰值功率(W)

rwrPose = phased.Platform(rwrPos, rwrVel); 
radarPose = phased.Platform(radarPos,radarVel);
numPulses = ceil(tAll*PRF);%ceil:向上取整
wavGen= phased.LinearFMWaveform('SampleRate',fs,'PulseWidth',T,'SweepBandwidth',BW,'PRF',PRF,'FrequencyOffset',fc);
antennaTx = phased.URA('ElementSpacing',repmat((c/fc)/2, 1, 2), 'Size', size);
tx = phased.Transmitter('Gain', gain, 'PeakPower',peakPower);
radiator = phased.Radiator( 'Sensor', antennaTx, 'OperatingFrequency', fc);
envIn = phased.FreeSpace('TwoWayPropagation',false,'SampleRate', fs,'OperatingFrequency',fc);
source = simulatetransmission(fs,PRF,numPulses,wavGen,rwrPose,radarPose,rwrPos,radarPos,rwrVel,radarVel,tx,radiator,envIn);
source = source(1:fs*tAll,:);
[~, tgtAng] = rangeangle(radarPos,rwrPos);
end

