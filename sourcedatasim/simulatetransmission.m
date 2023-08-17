function txPulseTrain = simulatetransmission(fs,PRF,numPulses,wavGen,rwrPose,radarPose,rwrPos,radarPos,rwrVel,radarVel,tx,radiator,envIn)
    %参数：
    %系统参数-----------------------------------------------------
    %1、-fs:采样率
    %雷达参数-----------------------------------------------------
    %2、-PRF：脉冲重复频率
    %3、-numPulses:脉冲数
    %4、-wavGen:波形对象
    %5、-rwrPose:rwr平台
    %6、-radarPose:radar平台
    %7、-rwrPos:rwr位置
    %8、-radarPos:radar位置
    %9、-rwrVel:rwr速度
    %10、-radarVel:radar速度
    %发射器与天线------------------------------------------------
    %11、tx：发射器
    %12、radiator:辐射器
    %13、envIn:环境
    txPulseTrain = zeros(round(fs/PRF),numPulses); 
    for i = 1:numPulses
        xt = wavGen();%产生一个脉冲信号
        [~, tgtAng] = rangeangle(rwrPos, radarPos);%计算与rwr的角度
        xt = tx(xt);               %加载到发射器
        xt = radiator(xt,tgtAng); %加载到辐射器
        xt = envIn(xt,rwrPos,radarPos, rwrVel, radarVel);%加载到环境

        [rwrPos, ~] = rwrPose(1/PRF); %rwr位置改变
        [radarPos, ~] = radarPose(1/PRF); %radar位置改变

        txPulseTrain(:,i) = xt; %记录接收到的一个脉冲
    end
    txPulseTrain = txPulseTrain (:);%脉冲整合为一个向量
end

