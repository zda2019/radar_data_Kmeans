% 系统采样率：4GHz
fs = 4e9;
%系统总时间：1ms
tAll = 1e-3;
%系统时间刻度
t = linspace(0,tAll,fs*tAll);
% 光速：3.0*10^8m/s
c = physconst('LightSpeed');


%RWR系统参数
%------RWR系统位置与速度
%1、rwr位置：rwrPos
%2、rwr速度：rwrVel
rwrPos= [-3000;1000;1000];  
rwrVel= [200; 0; 0];   
rwrPose = phased.Platform(rwrPos, rwrVel);




%信号发射系统参数
%------发射系统位置与速度
%1、radar位置：radarPos
%2、radar速度：radarVel
radarPos = [0;0;0];
radarVel = [0;0;0];
radarPose = phased.Platform(radarPos,radarVel);


%------脉冲信号
%1、波形：LFM
%2、载频：fc
%3、脉宽：T
%4、脉冲重复频率：PRF
%5、带宽： BW
%6、脉冲数目：numsPluse 或采样点数： numSamples 利用采样点数对齐数据,
fc = 1.8e9;
T = 3e-6;
PRF = 1/(15e-6);
BW = 30e6;
numPulses = ceil(tAll*PRF);%ceil:向上取整
wavGen= phased.LinearFMWaveform('SampleRate',fs,'PulseWidth',T,'SweepBandwidth',BW,'PRF',PRF,'FrequencyOffset',fc);


%------天线与辐射环境
%1、阵元个数：size
%2、增益：gain
%3、峰值功率：peakPower
size = [2,2];
gain = 5;
peakPower = 100;
antennaTx = phased.URA('ElementSpacing',repmat((c/fc)/2, 1, 2), 'Size', size);
tx = phased.Transmitter('Gain', gain, 'PeakPower',peakPower);
radiator = phased.Radiator( 'Sensor', antennaTx, 'OperatingFrequency', fc);
envIn = phased.FreeSpace('TwoWayPropagation',false,'SampleRate', fs,'OperatingFrequency',fc);


txPulseTrain = simulatetransmission(fs,PRF,numPulses,wavGen,rwrPose,radarPose,rwrPos,radarPos,rwrVel,radarVel,tx,radiator,envIn);


%原始信号可视化
figure();
subplot(2, 1, 1);
title('real');
plot(real(wavGen()));
subplot(2, 1, 2);
title('imag');
plot(imag(wavGen()));








