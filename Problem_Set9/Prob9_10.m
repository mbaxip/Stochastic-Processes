%% a
load trees
size_X = size(X);
W = 20*randn(size_X(1),size_X(2));
Y = X + W;
imagesc(X,[1 128]);
axis image
colormap gray
title('original data X');
imagesc(Y,[1 128]);
axis image
colormap gray
title('Observed noisy data Y');
x = X(:); y = Y(:); w = W(:);
R = cov(w) * speye(90300);
MSE_Y =  immse(x,y); % MSE_Y = 396.5855

%% b
[Dx,Dy] = dgrad([258 350]);
Dt = [Dx;Dy];
q = 3*var(Dt*x);
xmap = ( inv(R) + inv(q)*Dt'*Dt )\(inv(R)*y);
N1 = size_X(1); N2 = size_X(2);
Xmap = reshape(xmap,N1,N2);
figure(1)
subplot(1,3,1)
imagesc(X,[1 128]);
axis image
colormap gray
title('original image X');
hold on 
subplot(1,3,2)
imagesc(Y,[1 128]);
axis image
colormap gray
title('observed noisy image Y');
hold on 
subplot(1,3,3)
imagesc(Xmap,[1 128]);
axis image
colormap gray
title('map estimate Xmap');
MSE_Xmap =  immse(X,Xmap); % MSE_Xmap = 87.1861