%% b
load('cfar2.mat')
imagesc(X);
imagesc(Y);
plot(Y(6,:)); hold on; plot(Y(50,:)); hold on; plot(Y(60,:)); hold on; plot(Y(30,:))
title ('few rows from obs Y')
% mean and variance varies significantly between different observations.

Nw = [7, 9, 13, 15];
z = cell(1,4);
for i = 1:length(Nw)
    z{i} = cfar(Y,Nw(i));
end
imagesc(z{1})
colormap(gray)
title('Z for Nw = 7');
figure(2)
imagesc(z{2})
colormap(gray)
title('Z for Nw = 9');
figure(3)
imagesc(z{3})
colormap(gray)
title('Z for Nw = 13');
figure(4)
imagesc(z{4})
colormap(gray)
title('Z for Nw = 15');
% larger the window, better the ability to detect the target
p = z{4};
[i,j] = find(p<-2.35);
p(i,j) = min(min(p));
imagesc(p)
colormap(gray)
% Nw = 15 and Z>-2.35, but background has values above this threshold so
% cannot isolate the background from target completely.

