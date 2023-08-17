function [data,cluster] = generate_GMM(N)
%数据规模
% N = N;
%数据维度
% dim=2;

%混合比例
para_pi = [0.4, 0.15, 0.15, 0.15, 0.15];

%第一类数据
mul = [0, 0]; % 均值
S1 = [1, 0; 0, 1]; % 协方差
data1 = mvnrnd(mul, S1, N); % 产生高斯分布数据

%第二类数据
mu2 = [2, 7]; % 均值
S2 = [1, 0; 0, 1]; % 协方差
data2 = mvnrnd(mu2, S2, N); % 产生高斯分布数据

%第三类数据
mu3 = [5, 0]; % 均值
S3 = [2, 0; 0, 2]; % 协方差
data3 = mvnrnd(mu3, S3, N); % 产生高斯分布数据

%第四类数据
mu4 = [11, 7]; % 均值
S4 = [3, 0; 0, 3]; % 协方差
data4 = mvnrnd(mu4, S4, N); % 产生高斯分布数据

%第五类数据
mu5 = [16, 9]; % 均值
S5 = [2, 0; 0, 2]; % 协方差
data5 = mvnrnd(mu5, S5, N); % 产生高斯分布数据

% data = [data1, ones(length(data1),1)*1; data2, ones(length(data2),1)*2; data3, ones(length(data3),1)*3; data4, ones(length(data4),1)*4; data5, ones(length(data5),1)*5];

data = [data1; data2; data3; data4; data5];
cluster = [ones(length(data1),1)*1;ones(length(data2),1)*2;ones(length(data3),1)*3;ones(length(data4),1)*4;ones(length(data5),1)*5;];

%显示数据
plot(data1(:, 1), data1(:, 2), 'bo');
hold on;
plot(data2(:, 1), data2(:, 2), 'ro');
plot(data3(:, 1), data3(:, 2), 'go');
plot(data4(:, 1), data4(:, 2), 'ko');
plot(data5(:, 1), data5(:, 2), 'mo');


end
