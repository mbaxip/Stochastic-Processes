%% 7.6 b
y0 = randn(1,5000);
y1 = 2 + randn(1,5000);
Gamma = -1000:0.1:1000;
[pd,pf] = roc('det1',Gamma,y0,y1);
plot(pf,pd); xlabel('Pfa'); ylabel('Pd');
title('ROC plot')
hold on
[pd,pf] = roc('det2',Gamma,y0,y1);
plot(pf,pd);
hold on
[pd,pf] = roc('det3',Gamma,y0,y1);
plot(pf,pd);
hold on
[pd,pf] = roc('det4',Gamma,y0,y1);
plot(pf,pd);
legend('det1','det2','det3','det4');
% det1 : LRT optimal detector

%% c
y0 = randn(1,5000);
y1 = 2*randn(1,5000);
Gamma = -1000:0.1:1000;
[pd,pf] = roc('det1',Gamma,y0,y1);
plot(pf,pd); xlabel('Pfa'); ylabel('Pd');
title('ROC plot')
hold on
[pd,pf] = roc('det2',Gamma,y0,y1);
plot(pf,pd);
hold on
[pd,pf] = roc('det3',Gamma,y0,y1);
plot(pf,pd);
hold on
[pd,pf] = roc('det4',Gamma,y0,y1);
plot(pf,pd);
legend('det1','det2','det3','det4');
% det2 : LRT optimal detector

%% d
y0 = randn(1,5000);
y1 = repmat([0:1:4]',1,5000) + repmat(randn(1,5000),5,1);
Gamma = -1000:0.1:1000;
for i = 1:5
[pd,pf] = roc('det1',Gamma,y0,y1(i,:));
plot(pf,pd); 
hold on
end
hold off
xlabel('Pfa'); ylabel('Pd');title('ROC plot')
legend('Y1_m = 0','Y1_m = 1','Y1_m = 2','Y1_m = 3','Y1_m = 4')
% diff in means =2 % ROC becomes better as noise level is varied from 0 to
% 4

%% cauchy noise
y0 = randcau(1,5000);
y1 = repmat([0:1:4]',1,5000) + repmat(randcau(1,5000),5,1);
Gamma = -1000:0.1:1000;
for i = 1:5
[pd,pf] = roc('det1',Gamma,y0,y1(i,:));
plot(pf,pd); 
hold on
end
hold off
xlabel('Pfa'); ylabel('Pd');title('ROC plot')
legend('Y1_m = 0','Y1_m = 1','Y1_m = 2','Y1_m = 3','Y1_m = 4')
% m has to be 4

