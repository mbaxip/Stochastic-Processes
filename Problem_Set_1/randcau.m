function [Y] = randcau(N)
% Usage: [Y] = randcau(N)
% Creates N Cauchy random variable
% N: number of random variables to be created
% Y: vector of cauchy random variables transformed from X: U[0,1]
X = rand(N,1);
P_inverse_x = tan(pi*(X-0.5));
Y = P_inverse_x;