%% part e: Z is uniformly distributed with zero mean and unit variance
clear all;clc;
N = 1000000;
Z = sqrt(12)*(rand(2,N)-.5);
L = [3/2,1/2;1/2,3/2];
X = (L*Z);
m_x = mean(X,2);
R_X = (X*X')/N - (m_x * m_x');
%figure(1)
%pdf2d(X(1,:),X(2,:))
figure(2)
pdf2d(Z(1,:),Z(2,:))

%R_X =

%     2.4983    1.4986
%     1.4986    2.5025
% same as when Z was gaussian