function [Rxx,lag] = syscor(b,a,maxlag)
% [Rxx,lag] = syscor(b,a,maxlag)
%
% b      : Vector of numerator coefficients. 
% a      : Vector of denominator coefficients.
% maxlag : Maximum number of lags to compute. OPTIONAL. Default: maxlag=50.
%
% Rxx    : Vector of Theoretical autocorrelation values for the given system 
% lag    : Corresponding vector of lags
%
% Calculates the theoretical values of the autocorrelation function for the
% output of the system described by the coefficients in b and a when driven
% by white noise. Recall this function is given by:
% 
% Rxx(t) = h(t)*h(-t);
%
% The system is assumed to be described in MATLAB format, where the vectors
% of coefficients define a discrete-time system as follows:
%
% y(n) = b(1)*x(n) + b(2)*x(n-1) + ... + b(nb+1)*x(n-nb)
%       - a(2)*y(n-1) - ... - a(na+1)*y(n-na)

% W. C. Karl 2/10/98

if nargin <3
  maxlag = 50;
end;

% Find impulse response
[h,t]=impz(b,a,maxlag+1);

% Find Autocorrelation function and vectors of lags from impulse response
% Rxx(t) = h(t) * h(-t)
Rxx = conv(h,flipud(h(:)));
lag = -(length(h)-1):(length(h)-1);



