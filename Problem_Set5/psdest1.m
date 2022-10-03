function [Syy,w] = psdest1(y,maxlag)
%% Usage: [Syy,w] = psdest1(y,maxlag)
% y: input data vector
% maxlag: number of lags to use in the correlation estimate,
% Syy: estimated power spectral density
% w: corresponding vector of frequency values

%%
[Ryy,lag] = xcorr(y,maxlag,'unbiased');
Syy = abs(fft(Ryy)); % Taking only positive frequencies
Syy = Syy(1:maxlag+1); % Nyquist fs/2 max frequency possible
w = linspace(0,pi,maxlag+1); % generate maxlag+1 uniformly spaced frequency values in the range [0, ?]


