function standardPlot(f, a)
%standardPlot(f, a)
% optional inputs f, a are figure and axes handles respectively. defaults
% are gcf and gca respectively. This function sets the background color of
% the figure to white and sets the fontsize and fontweight of the axes
if ~exist('f', 'var') || isempty(f)
    f = gcf; 
end
if ~exist('a', 'var') || isempty(a)
    a = gca; 
end

set(f, 'Color', 'w');
set(a, 'FontSize', 20, 'FontWeight', 'bold');

end