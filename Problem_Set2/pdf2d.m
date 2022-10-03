function [p,x,y,P]=pdf2d(xdata,ydata,xbins,ybins)
% [p,x,y,P] = pdf2d(xdata,ydata,Mx,My) or 
% [p,x,y,P] = pdf2d(xdata,ydata,xbins,ybins)
%
% xdata   : Vector of x data samples. 
% ydata   : Vector of corresponding y data samples. 
% xbins   : If xbins is a scalar, uses xbins equally spaced bins between
%           min(xdata) and max(xdata). If xbins is a vector, uses bins with
%           centers specified in vector xbins. OPTIONAL: Default xbins=10.
% ybins   : If ybins is a scalar, uses ybins equally spaced bins between
%           min(ydata) and max(ydata). If ybins is a vector, uses bins with
%           centers specified in vector ybins. OPTIONAL: Default ybins=10.
%
% p       : Matrix of the pdf value estimates at the bins with centers given
%           in matrices x,y. 
% x       : Matrix of x bin centers. 
% y       : Matrix of corresponding y bin centers. (see meshgrid)
% P       : Vector of the corresponding PDF (CDF) value estimates at the
%           bins with centers given in x
%
% Finds the 2-D histogram-based pdf estimate of p_X(x) and PDF (CDF)
% estimate of P_X(x) given the data in xdata and ydata. If no output
% argument is given plots the estimate via mesh(x,y,p). The (1,1) element of
% p corresponds to the minimum values of x and y. This is the upper left
% hand corner of the plot. X values increase across columns, and y values
% increase down rows. Based on the MATLAB function hist.m 

% W. C. Karl 1/6/98

if nargin == 0
  error('Requires at least two input arguments.')
end
if nargin < 3
  xbins = 10;
end
if nargin < 4
  ybins = 10;
end
if length(xdata) ~= length(ydata)
  error('Lengths of xdata and ydata must be the same');
end;
if min(size(xdata)) > 1;
  error('Input data must be a vector');
end;
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

% Find y bin centers and y bin boundaries
% yy contains the bin boundaries, yc the bin centers
minydata = min(min(ydata));
maxydata = max(max(ydata));
if length(ybins) == 1
  bincsep = (maxydata - minydata) ./ ybins;
  yy = [minydata-10*eps + bincsep*(0:ybins-1), maxydata];
  yc = yy(1:length(yy)-1) + bincsep/2;  
else
  yy = ybins(:)';
  bincsep = diff(yy);
  yy = [minydata-10*eps yy(1:length(yy)-1)+bincsep/2 maxydata];
  yc = ybins;
end
Nbiny = length(yy)-1; % Number of y bins
dy = diff(yy);        % Vector of y bin widths (difference between boundaries)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find raw bin counts 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialization
p = zeros(Nbiny,Nbinx);
P = zeros(Nbiny,Nbinx);

for iy = 1:Nbiny; % Outer loop over y bins
  disp(['Percent done: ',int2str(iy/Nbiny*100)])
  
  % Find indicies of (x,y) values in the current y bin
  Iy = find( yy(iy)<ydata & ydata<=yy(iy+1) );
  
  for jx = 1:Nbinx % Inner loop over x bins

    % Find number of points in both current ybin and current xbin
    p(iy,jx) = sum( xx(jx)<xdata(Iy) & xdata(Iy)<=xx(jx+1) );
    
  end;
  
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Normalize raw bin counts 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% To normalize pdf p_X,Y(x,y) we want to take the raw count p(i,j) in bin
% i,j, and divide by Npts*dxi*dyj, where Npts is the total number of data
% points and dxi*dyj is the area of bin i,j. To normalize for PDF (CDF)
% P_X,Y(x,y) we want to take the raw count p(i,j) in bin i,j, divide by
% Npts and take the cumulative sum. 

P = cumsum(cumsum(p/Npts)')';
p = p ./ ((dy(:)*dx(:)')*Npts);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find corresponding x,y matrices
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[x,y] = meshgrid(xc,yc);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot if desired
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargout == 0
  clf
  subplot(211)
  meshc(x,y,p);
  xlabel('x')
  ylabel('y')  
  zlabel('p_X,Y(x,y)')
  title(['pdf estimate, ',int2str(Npts),' points'])
  subplot(212)
  meshc(x,y,P)
  xlabel('x')
  ylabel('y')  
  zlabel('P_X,Y(x,y)')
  title(['PDF (CDF) estimate, ',int2str(Npts),' points'])
  subplot
end;
