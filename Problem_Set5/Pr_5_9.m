%% Prob 5.9.a
N = 5000;
u = randn(1,N);
maxlag = 50;
[Rest,lags] = xcorr(u,maxlag,'unbiased'); % computed autocorrelation from data
plot(lags,Rest,'-ob')
hold on
Ruu_k = [zeros(1,50), 1, zeros(1,50)]; % theoretical autocorrelation
plot(lags,Ruu_k ,'r')
xlabel('lags'); ylabel('Ruu(k)');

% Theoretical autocorrelation function of white noise is diracdelta(k).
% Empirical autocorrelation function matches very well with theoretical
% function.

%% Prob 5.9.b
% System1
b0 = [5, 0]; a0 = [1, -1.3, 0.845];
zplane(b0,a0);
title ('System1')
[h1,t1] = impz(b0,a0,50);
impz(b0,a0,50)
xlabel('time'); ylabel('Impulse Response')
title ('System1')
% System2
b1 = [1, 1.3, 0.845];  a1 = [1, -1.3, 0.845];
zplane(b1,a1);
title ('System2')
[h2,t2] = impz(b1,a1,50);
impz(b1,a1,50)
xlabel('time'); ylabel('Impulse Response')
title ('System2') 
% System3
b2 = [0.3, 0]; a2 = [1, -0.8];
zplane(b2,a2);
title ('System3')
[h3,t3] = impz(b2,a2,50);
impz(b2,a2,50)
xlabel('time'); ylabel('Impulse Response')
title ('System3') 
% System4
b3 = [0.06, 0.12, 0.06]; a3 = [1,-1.3, 0.845];
zplane(b3,a3);
title ('System4')
[h4,t4] = impz(b3,a3,50);
impz(b3,a3,50)
xlabel('time'); ylabel('Impulse Response')
title ('System4') 
% System5
b4 = [0.845, -1.3, 1]; a4 = [1, -1.3, 0.845];
zplane(b4,a4);
title ('System5')
[h5,t5] = impz(b4,a4,50);
impz(b4,a4,50)
xlabel('time'); ylabel('Impulse Response')
title ('System5')

%% Prob 5.9.c
% System1
Y1 = filter(b0,a0,u);
pdf1d(Y1);
% System2
Y2 = filter(b1,a1,u);
pdf1d(Y2);
% System3
Y3 = filter(b2,a2,u);
pdf1d(Y3);
% System4
Y4 = filter(b3,a3,u);
pdf1d(Y4);
% System5
Y5 = filter(b4,a4,u);
pdf1d(Y5);

%% Prob 5.9.d

% System1
[RestY1,lagsY1] = xcorr(Y1,maxlag,'unbiased'); % empirical
plot(lagsY1,RestY1,'-ob')
[Ryy1,lag_th_y1] = syscor(b0,a0,maxlag); % theoretical for white noise input RYY(n) = h(n)*h(?n).
hold on
plot(lag_th_y1,Ryy1 ,'r')
xlabel('lags'); ylabel('R_y_y_1(k)');
title ('System1')
legend('Empirical Autocorrelation','Theoretical Autocorrelation')
% System2
[RestY2,lagsY2] = xcorr(Y2,maxlag,'unbiased');
plot(lagsY2,RestY2,'-ob')
[Ryy2,lag_th_y2] = syscor(b1,a1,maxlag);
hold on
plot(lag_th_y2,Ryy2 ,'r')
xlabel('lags'); ylabel('R_y_y_2(k)');
title ('System2')
legend('Empirical Autocorrelation','Theoretical Autocorrelation')
% System3
[RestY3,lagsY3] = xcorr(Y3,maxlag,'unbiased');
plot(lagsY3,RestY3,'-ob')
[Ryy3,lag_th_y3] = syscor(b2,a2,maxlag);
hold on
plot(lag_th_y3,Ryy3 ,'r')
xlabel('lags'); ylabel('R_y_y_3(k)');
title ('System3')
legend('Empirical Autocorrelation','Theoretical Autocorrelation')
% System4
[RestY4,lagsY4] = xcorr(Y4,maxlag,'unbiased');
plot(lagsY4,RestY4,'-ob')
[Ryy4,lag_th_y4] = syscor(b3,a3,maxlag);
hold on
plot(lag_th_y4,Ryy4 ,'r')
xlabel('lags'); ylabel('R_y_y_4(k)');
title ('System4')
legend('Empirical Autocorrelation','Theoretical Autocorrelation')
% System5
[RestY5,lagsY5] = xcorr(Y5,maxlag,'unbiased');
plot(lagsY5,RestY5,'-ob')
[Ryy5,lag_th_y5] = syscor(b4,a4,maxlag);
hold on
plot(lag_th_y5,Ryy5 ,'r')
xlabel('lag5'); ylabel('R_y_y_5(k)');
title ('System5')
legend('Empirical Autocorrelation','Theoretical Autocorrelation')

%% Prob 5.9.e

% System1
[Ruy1,lag1] = xcorr(u,Y1,maxlag,'unbiased');
impz(b0,a0,50)
hold on
plot(lag1,Ruy1)
legend('Estimated impulse response','True impulse response'); title ('System1')
% System2
[Ruy2,lag2] = xcorr(u,Y2,maxlag,'unbiased');
impz(b1,a1,50)
hold on
plot(lag2,Ruy2)
legend('Estimated impulse response','True impulse response'); title ('System2')
% System3
[Ruy3,lag3] = xcorr(u,Y3,maxlag,'unbiased');
impz(b2,a2,50)
hold on
plot(lag3,Ruy3)
legend('Estimated impulse response','True impulse response'); title ('System3')
% System4
[Ruy4,lag4] = xcorr(u,Y4,maxlag,'unbiased');
impz(b3,a3,50)
hold on
plot(lag4,Ruy4)
legend('Estimated impulse response','True impulse response'); title ('System4')
% System5
[Ruy5,lag5] = xcorr(u,Y5,maxlag,'unbiased');
impz(b4,a4,50)
hold on
plot(lag5,Ruy5)
legend('Estimated impulse response','True impulse response'); title ('System5')