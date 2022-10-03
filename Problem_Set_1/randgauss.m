function [Y] = randgauss(N)
% Usage: [Y] = randgauss(N)
% Creates N Gaussian distributed random numbers
% N: number of random variables to be created
% Y: vector of Gaussian random variables:N[0,1],transformed from X: U[0,1]
X = rand(N,1000);
mean_X = mean(X,2);
mean_mean = mean(mean_X);
std_mean = std(mean_X);
standard_normal_Y = ((mean_X - mean_mean)/std_mean);
Y = standard_normal_Y;