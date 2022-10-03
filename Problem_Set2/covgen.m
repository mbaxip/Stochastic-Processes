function [X] = covgen(N,R)
% Generates gaussian random vector X with given covariance matrix
% Usage: X = covgen(N,R)
% N: Desired number of sample vectors 
% R: covariance matrix of desired X, dimension P*P
% X: Desired gaussian random vector, X=[X1,..,Xp]', each having
%    N samples.
L = sqrtm(R);
Z = randn(length(R), N);
X = L*Z;

%% Implement the function with a given R
% R_X = [5/2,3/2;3/2,5/2];
% N= 1000000;
% X = covgen(N,R_X);

%% check answer
%m_x = mean(X,2);
%R_X = (X*X')/N - (m_x * m_x'); % covariance matrix


