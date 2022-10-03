%% a
s = [zeros(1,9),0:1:5,4:-1:0,zeros(1,10)];
y=s;
Gamma = -1000:0.1:1000;
[D,z] = matched1(y,Gamma,s);
% ell = 85, Ns = 30
plot(z)
title ('filter output'); xlabel('time (n)'); ylabel('Z(n)');

%% b
s = [zeros(1,9),0:1:5,4:-1:0,zeros(1,10)]; % signal s(n)
w = 4*randn(1,length(s)); % White gaussian noise with variance 16
y0=w;
Gamma = -1000:0.1:1000;
[D0,z0] = matched1(y0,Gamma,s);
y1=s+w;
Gamma = -1000:0.1:1000;
[D1,z1] = matched1(y1,Gamma,s);
plot(z0); hold on; plot(z1);
title('Matched Filter output Z');
xlabel('time (n)'); ylabel('Z(n)');
legend('Z0','Z1');
% Values of Z(n) at time n = Ns = 30 for Z0 and Z1 are well seperated.
%% Gamma = 42.5
% It indeed seems true that for good performance we want gamma = 42.5


