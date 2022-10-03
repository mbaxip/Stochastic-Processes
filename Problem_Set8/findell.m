function [ell] = findell(w)
% w: image matrix containing the current window of data
% ell: corresponding normalized center pixel or test statistic.
[Nr,Nc] = size(w);
x = [w(:,1);w(:,Nc);w(1,2:Nc-1)';w(Nr,2:Nc-1)'];
m = mean(x);
sigma = std(x);
ell = (w((Nr+1)/2,(Nc+1)/2) - m)/sigma;