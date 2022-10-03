function [z] = cfar(y,Nw)
% Nw: size of the Nw*Nw window used for background estimation
% The function returns as output an image matrix z containing the value of the test statistic 
% l(y) at each pixel.
z = nlfilter(y,[Nw Nw],'findell'); % Now the CFAR simply slides a window across the image 
% and uses the pixels at the edges of this window to normalize the center pixel of the window.
