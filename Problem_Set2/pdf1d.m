function [p,x,P]=pdf1d(xdata,xbins)
% [p,x,P] = pdf1d(xdata,M) or [p,x] = pdf1d(ydata,xbins)
%
% xdata   : Vector of data samples. 
% xbins   : If xbins is a scalar, uses xbins equally spaced bins between
%           min(xdata) and max(xdata). If xbins is a vector, uses bins with
%           centers specified in vector xbins. OPTIONAL: Default xbins=10.
%
% p       : Vector of the pdf value estimates at the bins with centers given
%           in x
% x       : Vector of bin centers. 
% P       : Vector of the corresponding PDF (CDF) value estimates at the
%           bins with centers given in x
%
% Finds the histogram-based pdf estimate of p_X(x) and PDF (CDF) estimate of
% P_X(x) given the data in xdata. Uses the MATLAB function "hist.m" to
% generate the bin counts. Then normalizes them so pdf "integrates" to 1. If
% no output argument is given plots the estimate via plot(x,p) or plot(x,P)

% W. C. Karl 1/6/98

if nargin == 0
  error('Requires one or two input arguments.')
end
if nargin == 1
  xbins = 10;
end
Npts = length(xdata);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find bin boundaries and widths
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Find x bin centers and x bin boundaries
% xx contains the bin boundaries, xc the bin centers
minxdata = min(min(xdata));
maxxdata = max(max(xdata));
if length(xbins) == 1
  bincsep = (maxxdata - minxdata) ./ xbins;
  xx = [minxdata-10*eps + bincsep*(0:xbins-1), maxxdata];
  xc = xx(1:length(xx)-1) + bincsep/2;  
else
  xx = xbins(:)';
  bincsep = diff(xx);
  xx = [minxdata-10*eps xx(1:length(xx)-1)+bincsep/2 maxxdata];
  xc = xbins;
end
Nbinx = length(xx)-1; % Number of x bins
dx = diff(xx);        % Vector of x bin widths (difference between boundaries)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find raw bin counts 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialization
p = zeros(Nbinx,1);
P = zeros(Nbinx,1);

for jx = 1:Nbinx % Inner loop over x bins
  disp(['Percent done: ',int2str(jx/Nbinx*100)])

  % Find number of points in current xbin
  p(jx,1) = sum( xx(jx)<xdata & xdata<=xx(jx+1) );
    
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Normalize raw bin counts 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% To normalize for pdf p_X(x) we want to take the raw count p(i) in bin i, and
% divide by Npts*dxi, where Npts is the total number of data points and
% dxi is the area of bin i. To normalize for PDF (CDF) P we want to take the
% raw count p(i) in bin i, divide by Npts and take the cumulative sum.

P = cumsum(p/Npts);
p = p./(dx(:)*Npts);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find corresponding bin centers (x points)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = xc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot if desired
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargout == 0
  clf
  subplot(211)
  plot(x,p);
  xlabel('x');
  ylabel('p_X(x)');
  title(['pdf estimate, ',int2str(Npts),' points'])
  subplot(212)
  plot(x,P);
  xlabel('x');
  ylabel('P_X(x)');
  title(['PDF (CDF) estimate, ',int2str(Npts),' points'])
  subplot
end;
