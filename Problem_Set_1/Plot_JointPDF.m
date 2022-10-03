load('2rvdata.mat')
figure(1)
pdf2d(x4,y4);
[p,x,y,P] = pdf2d(x4,y4);
marginal_px = sum(p,1);
figure(2)
plot(x(1,:),marginal_px)
title('Marginal distribution px4(x4)');
xlabel('x4'); ylabel('px4(x4)')
marginal_py = sum(p,2);
figure(3)
plot(y(:,1),marginal_py)
title('Marginal distribution py4(y4)')
xlabel('y4'); ylabel('py4(y4)')

% covariance matrix
cov1 = cov(x1,y1);
cov2 = cov(x2,y2);
cov3 = cov(x3,y3);
cov4 = cov(x4,y4);


% correlation coeff
corr1 = corr(x1,y1);
corr2 = corr(x2,y2);
corr3 = corr(x3,y3);
corr4 = corr(x4,y4);

% E[XY]
E_x1y1 = cov1(1,2) + (mean(x1)*mean(y1));
E_x2y2 = cov2(1,2) + (mean(x2)*mean(y2));
E_x3y3 = cov3(1,2) + (mean(x3)*mean(y3));
E_x4y4 = cov4(1,2) + (mean(x4)*mean(y4));

% empirical conditional pdf yi = 0.5
My= -4:0.25:4;Mx = min(x1):0.1:max(x1);
[p,x,y,P] = pdf2d(x1,y1,Mx,My);
marginal_py = sum(p,2);
cond_pdf = p(19,:)/marginal_py(19);
figure(1)
plot(x(1,:),cond_pdf)
title('empirical conditional pdf: pX1|Y1(x1|y1 = .5)');
xlabel('x1'); ylabel('pX1|Y1(x1|y1 = .5)')

% empirical conditional pdf yi = 0.75
cond_pdf = p(20,:)/marginal_py(20);
figure(2)
plot(x(1,:),cond_pdf)
title('empirical conditional pdf: pX1|Y1(x1|y1 = .75)');
xlabel('x1'); ylabel('pX1|Y1(x1|y1 = .75)')

% 1st set is independent, 
% uncorrelated: 1st, 2nd, 4th
