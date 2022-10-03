function [D,z] = matched1(y,Gamma,s)
%% Usage [D,z] = matched1(y,Gamma,s)
% y: matrix of data samples with each row corresponding to a separate observation
% Gamma: vector of threshold values
% s: row vectorcontaining the deterministic signal s(n).
[Ny,Ns] = size(y);
Ng = length(Gamma);
s = s(:)';
h = fliplr(s);
z = zeros(Ny,2*Ns-1);
for i = 1:Ny
z(i,:) = conv(y(i,:),h);
end;
ell = z(:,Ns);
D = ell*ones(1,Ng) > ones(Ny,1)*Gamma;
