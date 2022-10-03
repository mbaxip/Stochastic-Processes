%% a
N = 5000;
u = randn(1,N);
Np = 1;
Nf = 100;
[Suu,w,a,b] = psdest2(u,Np,Nf);
semilogy(w,Suu);
xlabel('frequency(w)'); ylabel('Power(Suu)'); title('Power Spectral density for gaussian white noise')
zplane(b,a);
title('Pole\Zero locations of AR model for white noise')
% White noise is not dependent on its past, therefore poles are zeros

%%b
N = 5000;
u = randn(1,N);
Np = 2;
Nf = 100;
% System1
b0 = [5, 0]; a0 = [1, -1.3, 0.845];
Y1 = filter(b0,a0,u);
[Syy1,w1,a,b] = psdest2(Y1,Np,Nf);
[psd_th_y1,w_th_1] = syspsd(b0,a0,Nf);
semilogy(w1,Syy1)
hold on
semilogy(w_th_1,psd_th_y1)
xlabel('frequency(w)'); ylabel('Power(S_y_y_1)'); title('Power Spectral density for system 1')
legend('Empirical PSD', 'Theoretical PSD')

% System2
b1 = [1, 1.3, 0.845];  a1 = [1, -1.3, 0.845];
Y2 = filter(b1,a1,u);
[Syy2,w2,a,b] = psdest2(Y2,Np,Nf);
[psd_th_y2,w_th_2] = syspsd(b1,a1,Nf);
semilogy(w2,Syy2)
hold on
semilogy(w_th_2,psd_th_y2)
xlabel('frequency(w)'); ylabel('Power(S_y_y_2)'); title('Power Spectral density for system 2')
legend('Empirical PSD', 'Theoretical PSD')

% System3
b2 = [0.3, 0]; a2 = [1, -0.8];
Y3 = filter(b2,a2,u);
[Syy3,w3,a,b] = psdest2(Y3,Np,Nf);
[psd_th_y3,w_th_3] = syspsd(b2,a2,Nf);
semilogy(w3,Syy3)
hold on
semilogy(w_th_3,psd_th_y3)
xlabel('frequency(w)'); ylabel('Power(S_y_y_3)'); title('Power Spectral density for system 3')
legend('Empirical PSD', 'Theoretical PSD')

% System4
b3 = [0.06, 0.12, 0.06]; a3 = [1,-1.3, 0.845];
Y4 = filter(b3,a3,u);
[Syy4,w4,a,b] = psdest2(Y4,Np,Nf);
[psd_th_y4,w_th_4] = syspsd(b3,a3,Nf);
semilogy(w4,Syy4)
hold on
semilogy(w_th_4,psd_th_y4)
xlabel('frequency(w)'); ylabel('Power(S_y_y_4)'); title('Power Spectral density for system 4')
legend('Empirical PSD', 'Theoretical PSD')

% System5
b4 = [0.845, -1.3, 1]; a4 = [1, -1.3, 0.845];
Y5 = filter(b4,a4,u);
[Syy5,w5,a,b] = psdest2(Y5,Np,Nf);
[psd_th_y5,w_th_5] = syspsd(b4,a4,Nf);
semilogy(w5,Syy5)
hold on
semilogy(w_th_5,psd_th_y5)
xlabel('frequency(w)'); ylabel('Power(S_y_y_5)'); title('Power Spectral density for system 5')
legend('Empirical PSD', 'Theoretical PSD')

%%c
% Investigate the effect of using some higher model orders (Np = 2,3,5,10,...) by comparing the 
% estimated and true power spectral density for system #0 (system1 in our
% case)
N = 5000; u = randn(1,N); Nf = 100;
Np = [2,3,5,10,20];
b0 = [5, 0]; a0 = [1, -1.3, 0.845];
Y1 = filter(b0,a0,u);
i = 1;
Syy = zeros(length(Np),Nf);w1 = zeros(length(Np),Nf); a = cell(1,length(Np)); b = cell(1,length(Np));
for i = 1:length(Np)
    Np_temp = Np(i);
[Syy(i,:),w1(i,:),a{i},b{i}] = psdest2(Y1,Np_temp,Nf);
end
[psd_th_y1,w_th_1] = syspsd(b0,a0,Nf);
for i = 1:length(Np)
semilogy(w1(i,:),Syy(i,:))
hold on
end
hold on
semilogy(w_th_1,psd_th_y1)
xlabel('frequency(w)'); ylabel('Power(S_y_y_1)'); title('Power Spectral density for system 1')
legend('Np= 2','Np = 3','Np = 5','Np = 10','Np = 20', 'Theoretical PSD')

for i = 1:length(Np)
 figure(i)
zplane(b{i},a{i});
temp = Np(i);
title(['Np = ',num2str(temp)])
end

zplane(b0,a0)
title('True Pole/Zero')

%% d
N = 5000; u = randn(1,N); Nf = 100;
Np = [1,2,3,6,12,20];
b1 = [1, 1.3, 0.845];  a1 = [1, -1.3, 0.845];
Y2 = filter(b1,a1,u);
i = 1;
Syy = zeros(length(Np),Nf);w1 = zeros(length(Np),Nf); a = cell(1,length(Np)); b = cell(1,length(Np));
for i = 1:length(Np)
    Np_temp = Np(i);
[Syy(i,:),w2(i,:),a{i},b{i}] = psdest2(Y2,Np_temp,Nf);
end
[psd_th_y2,w_th_2] = syspsd(b1,a1,Nf);
for i = 1:length(Np)
semilogy(w2(i,:),Syy(i,:))
hold on
end
hold on
semilogy(w_th_2,psd_th_y2)
xlabel('frequency(w)'); ylabel('Power(S_y_y_2)'); title('Power Spectral density for system 2 (system #1)')
legend('Np= 1','Np = 2','Np = 3','Np = 6','Np = 12','Np = 20', 'Theoretical PSD')

for i = 1:length(Np)
 figure(i)
zplane(b{i},a{i});
temp = Np(i);
title(['Np = ',num2str(temp)])
end

zplane(b1,a1)
title('True Pole/Zero')
