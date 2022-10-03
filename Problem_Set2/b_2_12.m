N = 1000000;
Z1 = randn(N,1);
Z2 = randn(N,1);
Z = [Z1,Z2]';
L = [3/2,1/2;1/2,3/2];
X = (L*Z);
m_x = mean(X,2);
R_X = (X*X')/N - (m_x * m_x');
%R_X =

%     2.5018    1.5012
%     1.5012    2.4981

%% c
figure(1)
pdf2d(Z1,Z2)
figure(2)
pdf2d(X(1,:),X(2,:))