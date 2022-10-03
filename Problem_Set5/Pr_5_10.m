%% Prob 5.10.a

%% Test PSD of white noise
N = 5000;
u = randn(1,N);
maxlag = 50;
[Suu,w] = psdest1(u,maxlag);
semilogy(w,Suu)
xlabel('frequency(w)'); ylabel('Power(Suu)'); title('Power Spectral density for white noise')

%% b PSDs for 5 systems
maxlag = 100; Nf = 100;
% System1
[Syy1,w1] = psdest1(Y1,maxlag);
[psd_th_y1,w_th_1] = syspsd(b0,a0,Nf);
semilogy(w1,Syy1)
hold on
semilogy(w_th_1,psd_th_y1)
xlabel('frequency(w)'); ylabel('Power(S_y_y_1)'); title('Power Spectral density for system 1, maxlag = 100')
legend('Empirical PSD', 'Theoretical PSD')
% System2
[Syy2,w2] = psdest1(Y2,maxlag);
[psd_th_y2,w_th_2] = syspsd(b1,a1,Nf);
semilogy(w2,Syy2)
hold on
semilogy(w_th_2,psd_th_y2)
xlabel('frequency(w)'); ylabel('Power(S_y_y_2)'); title('Power Spectral density for system 2, maxlag = 100')
legend('Empirical PSD', 'Theoretical PSD')
% System3
[Syy3,w3] = psdest1(Y3,maxlag);
[psd_th_y3,w_th_3] = syspsd(b2,a2,Nf);
semilogy(w3,Syy3)
hold on
semilogy(w_th_3,psd_th_y3)
xlabel('frequency(w)'); ylabel('Power(S_y_y_3)'); title('Power Spectral density for system 3, maxlag = 100')
legend('Empirical PSD', 'Theoretical PSD')
% System4
[Syy4,w4] = psdest1(Y4,maxlag);
[psd_th_y4,w_th_4] = syspsd(b3,a3,Nf);
semilogy(w4,Syy4)
hold on
semilogy(w_th_4,psd_th_y4)
xlabel('frequency(w)'); ylabel('Power(S_y_y_4)'); title('Power Spectral density for system 4, maxlag = 100')
legend('Empirical PSD', 'Theoretical PSD')
% System5
[Syy5,w5] = psdest1(Y5,maxlag);
[psd_th_y5,w_th_5] = syspsd(b4,a4,Nf);
semilogy(w5,Syy5)
hold on
semilogy(w_th_5,psd_th_y5)
xlabel('frequency(w)'); ylabel('Power(S_y_y_5)'); title('Power Spectral density for system 5, maxlag = 100')
legend('Empirical PSD', 'Theoretical PSD')