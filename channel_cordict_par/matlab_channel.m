% clear;
% close all;
% clc;
fs = 4e9;



data = load("data_50us.mat"); %50us数据
yr_c = data.yr_c;

t = 1:2:size(yr_c, 1);
yr_c = yr_c(t,:);
fs = fs/2;
figure();
subplot(2,1,1);
plot(real(yr_c(:,1)));
subplot(2,1,2);
plot(imag(yr_c(:,1)));
fftplot(yr_c(:,1),fs);
figure();
stft(yr_c(:,1),fs);

%%
% 参数：
%1、'NumFrequencyBands'：频段数量，2的次方，对应于FFT长度
%2、'DecimationFactor'：抽取因子
%3、'Specification'：滤波器设计参数或系数，选取滤波器约束方式，可选为"Number of taps per band and
%stopband attenuation"与"Coefficients"（使用属性指定滤波器系数）
%4、'NumTapsPerBand'：每个频带的滤波器系数数
%5、'StopbandAttenuation'：阻带衰减
%6、'LowpassCoefficients'：原型低通滤波器的系数
numChan = 32;%频带数目
Specification = 'Coefficients';

FFTLength = 32;
hc = dsp.Channelizer;
hc.NumTapsPerBand = 2;
hc.NumFrequencyBands = FFTLength;
hc.StopbandAttenuation = 60;
LowpassCoefficients = tf(hc);

%%


% FIRnums = load("FIRnums.mat");
% LowpassCoefficients = FIRnums.FIRnums;

channelizer = dsp.Channelizer('NumFrequencyBands', numChan, 'Specification', Specification,'LowpassCoefficients',LowpassCoefficients);

% 带通滤波
subData = channelizer(yr_c);

incohsubData = pulsint(permute(subData,[1,3,2]),'noncoherent');
%squeeze:删除长度为 1 的维度
incohsubData = squeeze(incohsubData); 

% 画能量分布图
%rms:求均方根
%pow2db:将功率转换为分贝
subbandPow = pow2db(rms(incohsubData,1).^2)+30;
figure();
plot(subbandPow);
xlabel('Band Index');
ylabel('Power (dBm)');


[~,detInd] = max(subbandPow);
subData_m = (subData(:,detInd,:));
subData_r = squeeze(subData_m);
figure();
plot(mag2db(abs(sum(subData_r,2)))+30)
ylabel('Power (dBm)')
title('Detected Subband from 100 Channels Combined Incoherently')


%%
c = physconst('LightSpeed');
size_rwr = [2,2];
dip = phased.IsotropicAntennaElement('BackBaffled',true);
antennaRx = phased.URA('ElementSpacing',repmat((c/2e9)/2,1,2),'Size', size_rwr,'Element',dip);


%找到对应子带

stepFreq = fs/numChan;
detfBand = fs*(detInd-1)/(fs/stepFreq);

%更新fs
fs = stepFreq;
%测向
doaEst = phased.MUSICEstimator2D('OperatingFrequency',detfBand,'PropagationSpeed',c,...
    'SensorArray',antennaRx,'DOAOutputPort',true,'AzimuthScanAngles',-90:.5:90,...
    'ElevationScanAngles',-90:.5:90, 'NumSignalsSource', 'Property','NumSignals', 1);

[mSpec,doa] = doaEst(subData_r);
plotSpectrum(doaEst,'Title','2-D MUSIC Spatial Spectrum Top View');
view(0,90); 
axis([-30 0 -30 0]);




%%
hdlsetuptoolpath('ToolName', 'Xilinx Vivado', 'ToolPath', 'D:\Xilinx\vivado2019\Vivado\2019.1\bin\vivado.bat');
h = zynq;




















