function [Syy,w,a,b] = psdest2(y,Np,Nf)
%% Usage: [Syy,w,a,b] = psdest2(y,Np,Nf)
% y: input data vector
% Np: number of poles in the AR model
% Nf: number of frequency samples to generate
% Syy: estimated power spectral density
% w: corresponding vector of frequency values 
% a and b: vectors of denominator and numerator coefficients defining the estimated AR model.

[Ryy,lag] = xcorr(y,Np,'unbiased');
Ryy = Ryy(Np+1:2*Np+1);
Ryy = Ryy(:);
a = toeplitz(Ryy(1:Np)) \ (-Ryy(2:Np+1));
a = [1 a'];
b2 = a*Ryy;
b = [sqrt(b2) 0];
[Syy,w] = syspsd(b,a,Nf);
