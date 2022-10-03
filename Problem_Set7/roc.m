function [pd,pf] = roc(detfunname,Gamma,y0,y1)
eval(['D0 = ',detfunname,'(y0,Gamma);']);
eval(['D1 = ',detfunname,'(y1,Gamma);']);
pf = sum(D0)/length(y0);
pd = sum(D1)/length(y1);
