close all
clear;
clc

% 系统采样率：4GHz
fs = 4e9;
%adc采样率
fadc = 1.2e9;
%系统总时间：1ms
tAll = 1e-3;
%系统时间刻度
t = linspace(0,tAll,fs*tAll);
len = size(t,2);
% 光速：3.0*10^8m/s
c = physconst('LightSpeed');


%RWR系统参数
%------RWR系统位置与速度
%1、rwr位置：rwrPos
%2、rwr速度：rwrVel
rwrPos= [-3000;1000;1000];  
rwrVel= [200; 0; 0]; 

%-------------------------------------------雷达数据----------------------------------------------
source = [];
ang = [];
%radar_c:参考雷达
radarPos = [0;0;0];
radarVel = [0;0;0];
fc = 1.2e9;
T = 2e-6;
PRF = 1/(200e-6);
BW = 20e6;
sizeTx = [2,2];
gain = 5;
peakPower = 1e7;
[source_of_radar_c,ang_c] = radarEnv(fs,tAll,c,rwrPos,rwrVel,radarPos,radarVel,fc,T,PRF,BW,sizeTx,gain,peakPower);
%可视化
figure();
subplot(2,1,1);
plot(t,real(source_of_radar_c));
subplot(2,1,2);
plot(t,imag(source_of_radar_c));
fftplot(source_of_radar_c,fs);
figure();
stft(source_of_radar_c,fs);

source = [source, source_of_radar_c(1:len,:)];
ang = [ang, ang_c];


%radar_1:雷达1
radarPos = [0;500;0];
radarVel = [0;0;0];
fc = 1.1e9;
T = 5e-6;
PRF = 1/(500e-6);
BW = 25e6;
sizeTx = [2,2];
gain = 5;
peakPower = 1e7;
[source_of_radar_c,ang_c] = radarEnv(fs,tAll,c,rwrPos,rwrVel,radarPos,radarVel,fc,T,PRF,BW,sizeTx,gain,peakPower);
%可视化
figure();
subplot(2,1,1);
plot(t,real(source_of_radar_c));
subplot(2,1,2);
plot(t,imag(source_of_radar_c));
fftplot(source_of_radar_c,fs);
figure();
stft(source_of_radar_c,fs);

source = [source, source_of_radar_c(1:len,:)];%信号
ang = [ang, ang_c];%角度


%radar_1:雷达2
radarPos = [800;0;0];
radarVel = [0;0;0];
fc = 1e9;
T = 10e-6;
PRF = 1/(800e-6);
BW = 40e6;
sizeTx = [2,2];
gain = 5;
peakPower = 1e7;
[source_of_radar_c,ang_c] = radarEnv(fs,tAll,c,rwrPos,rwrVel,radarPos,radarVel,fc,T,PRF,BW,sizeTx,gain,peakPower);
%可视化
figure();
subplot(2,1,1);
plot(t,real(source_of_radar_c));
subplot(2,1,2);
plot(t,imag(source_of_radar_c));
fftplot(source_of_radar_c,fs);
figure();
stft(source_of_radar_c,fs);

source = [source, source_of_radar_c(1:len,:)];
ang = [ang, ang_c];


%%
%------------------------------------------------------------接收端--------------------------------------------------------------
%%接收天线
size_rwr = [2,2];
dip = phased.IsotropicAntennaElement('BackBaffled',true);
antennaRx = phased.URA('ElementSpacing',repmat((c/2e9)/2,1,2),'Size', size_rwr,'Element',dip);

collector = phased.Collector('Sensor',antennaRx,'OperatingFrequency',fadc);%窄带信号收集器
rx = phased.ReceiverPreamp('Gain',0,'NoiseMethod','Noise power', 'NoisePower',2.5e-6,'SeedSource','Property', 'Seed',2018);

% Collect the waves at the receiver
yr = collector(source,ang);
yr = rx(yr);
%可视化
figure();
subplot(2,1,1);
plot(real(yr(:,1)));
subplot(2,1,2);
plot(imag(yr(:,1)));
fftplot(yr(:,1),fs);
figure();
stft(yr(:,1),fs);

%%
% 截取50us数据
truncTime = 50e-6;
truncInd = round(truncTime*fs);
% k = randi([0,tAll/truncTime])
k = 0;
yr_c = yr((k*truncTime*fs + 1) : (k*truncTime*fs + truncInd),:);
figure();
subplot(2,1,1);
plot(real(yr_c(:,1)));
subplot(2,1,2);
plot(imag(yr_c(:,1)));
fftplot(yr_c(:,1),fs);
figure();
stft(yr_c(:,1),fs);

%带通滤波带宽：100MHz
stepFreq = 100e6;

%通道数
numChan = fs/stepFreq;
channelizer = dsp.Channelizer('NumFrequencyBands', numChan, 'StopbandAttenuation', 80);
%可视化前4个通道
freqz(channelizer, 1:4)
title('Zoomed Channelizer Response for First Four Filters')
xlim([0 0.2])

%%
% 带通滤波
subData = channelizer(yr_c);

%对于接收到的信号，有4个通道，且每个通道都对应40路的滤波，
%1、需要先对4个通道中的能量进行累加，看40路中那一路有频率响应
%2、再在4个通道中对这一路子女好进行信号处理

%premute:按照向量 dimorder 指定的顺序重新排列数组的维度
%pulsint:非相干整合
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
%找到对应子带
detfBand = fs*(detInd-1)/(fs/stepFreq);

%更新fs
fs = stepFreq;
%%
%测向
doaEst = phased.MUSICEstimator2D('OperatingFrequency',detfBand,'PropagationSpeed',c,...
    'SensorArray',antennaRx,'DOAOutputPort',true,'AzimuthScanAngles',-90:.5:90,...
    'ElevationScanAngles',-90:.5:90, 'NumSignalsSource', 'Property','NumSignals', 1);

[mSpec,doa] = doaEst(subData_r);
plotSpectrum(doaEst,'Title','2-D MUSIC Spatial Spectrum Top View');
view(0,90); 
axis([-30 0 -30 0]);

%%
%其他参数测量
% Configure the beamformer object to steer the beam before combining the
% channels
beamformer = phased.PhaseShiftBeamformer('SensorArray',antennaRx,...
    'OperatingFrequency',fc,'DirectionSource','Input port');

% Apply the beamforming, and visualize the beam steered radiation
% pattern
mBeamf = beamformer(subData_r, doa);

% Find the location of the emitter
altimeterElev = rwrPos(3);
d = abs(altimeterElev/sind(doa(2)));

%%
% Compute the pseudo Wigner-Ville transform
[tpwv,t,f] = pWignerVille(mBeamf,fs);

% Plot the pseudo Wigner-Ville transform
imagesc(f*1e-6,t*1e6,pow2db(abs(tpwv./max(tpwv(:)))));
xlabel('Frequency (MHz)'); ylabel('Time(\mus)');
clim([-50 0]); 
clb = colorbar; 
clb.Label.String = 'Normalized Power (dB)';
title ('Pseudo Wigner-Ville Transform')

%%
% Normalize the pseudo Wigner-Ville image
twvNorm = abs(tpwv)./max(abs(tpwv(:)));

% Implement a median filter to clear the noise
filImag = medfilt2(twvNorm,[7 7]);

% Use threshold to convert filtered image into binary image
BW = imbinarize(filImag./max(filImag(:)), 0.15);
imagesc(f*1e-6,t*1e6,BW); colormap('gray');
xlabel('Frequency (MHz)'); ylabel('Time(\mus)');
title ('Pseudo Wigner-Ville Transform - BW')

%%
% Compute the Hough transform of the image and plot
[H,T,R] = hough(BW);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
title('Hough Transform of the Image')

%%
% Compute peaks in the transform, up to 5 peaks
P  = houghpeaks(H,5);
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','g'); xlim([-90 -50]); ylim([-5000 0])

%%

lines = houghlines(BW,T,R,P,'FillGap',3e-6*fs,'MinLength',1e-6*fs);
coord = [lines(:).point1; lines(:).point2];

% Plot the detected lines superimposed on the binary image
clf;
imagesc(f*1e-6, t*1e6, BW); colormap(gray); hold on
xlabel('Frequency (MHz)')
ylabel('Time(\mus)')
title('Hough Transform — Detected Lines')
for ii = 1:2:2*size(lines,2)
    plot(f(coord(:,ii))*1e-6, t(coord(:,ii+1))*1e6,'LineWidth',2,'Color','green');
end

%%
% Calculate the parameters using the line co-ordinates
pulDur = t(coord(2,2)) - t(coord(1,2));         % Pulse duration
bWidth = f(coord(2,1)) - f(coord(1,1));         % Pulse Bandwidth
pulRI = abs(t(coord(1,2)) - t(coord(1,2)));     % Pulse repetition interval
detFc = detfBand + f(coord(2,1));               % Center frequency

displayParameters(pulRI, pulDur, bWidth,detFc, doa,d);


%%
% save("data_all.mat","yr");
% save("data_50us.mat","yr_c");


