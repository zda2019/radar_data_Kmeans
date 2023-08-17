function [tpwv,t,f] = pWignerVille(x,fs)

N = numel(x);
hWin = hamming(N/4+1);
lenWin = (numel(hWin)-1)/2; 
tpwv= zeros (N,N);
for ii=1:N
    maxTau = min([ii-1,N-ii,lenWin]);
    tau = -maxTau:maxTau; 
    idx = rem(N+tau,N)+1;
    tpwv(idx,ii) = hWin(lenWin+1+tau).*x(ii+tau).*conj(x(ii-tau));
end
tpwv= fft(tpwv);
tpwv = tpwv.';

% Construct the time and frequency axis using fs
[m,n] = size(tpwv);
t = 0 : 1/fs : (m-1)/fs;
f = 0 : fs/(2*n) : (n-1)*fs/(2*n);
end

