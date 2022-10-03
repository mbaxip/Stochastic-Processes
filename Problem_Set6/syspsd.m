function [psd,w] = syspsd(b,a,Nf)
% [psd,w] = syspsd(b,a,Nf)
%
% b   : Vector of system numerator coefficients
% a   : Vector of system denominator coefficients
% Nf  : Number of frequency points to generate in [0 pi]. 
%       OPTIONAL. Default: Nf = 50. 
%
% psd : Theoretical power spectral at frequency points in w
% w   : Vector of corresponding frequency points
%
% Finds the theoretical PSD for the discrete-time system described by:
%
% y(n) = b(1)*x(n) + b(2)*x(n-1) + ... + b(nb+1)*x(n-nb)
%       - a(2)*y(n-1) - ... - a(na+1)*y(n-na)
% 
% It does this by finding the frequency response H(w) using MATLABs function
% freqz.m and then calculating |H(w)|^2. 

% W. C. Karl 2/10/98

if nargin < 3
  Nf = 50;
end;

% Find Frequency response of system
[H,w] = freqz(b,a,Nf);

% PSD values are |H(w)|^2
psd = abs(H).^2;


