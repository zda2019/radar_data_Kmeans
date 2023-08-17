function fftplot(signal, fs)

% signal: 离散信号 % time: 离散时间

N = length(signal); 
X = abs(fftshift(fft(signal))); 
f = linspace(-fs/2, fs/2, N);

figure; 
plot(f,X); 
xlabel('Frequency (Hz)'); 
ylabel('Amplitude'); 
title('FFT plot'); 
grid on;

end