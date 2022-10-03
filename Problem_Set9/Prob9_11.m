%% a
load trees
size_X = size(X);
w = 20*randn(size_X(1),size_X(2));
Y = X + w;
MSE_Y =  immse(X,Y); % MSE_Y = 396.5855
figure(1)
subplot(1,2,1)
imagesc(X,[1 128]);
axis image
colormap gray
title('original data X');
hold on
subplot(1,2,2)
imagesc(Y,[1 128]);
axis image
colormap gray
title('Observed noisy data Y');

%% b
N1 = size_X(1); N2 = size_X(2);
N = N1*N2;
Sxx = (abs(fft2(X)).^2)/N;
Rxx = ifft2(Sxx);

%% c
H = Sxx./(Sxx+400);
imagesc(fftshift(H));
title('Low Pass filter H(f1,f2)');

%% d
Xwf = real(ifft2(fft2(Y).*H));
MSE_Xwf =  immse(X,Xwf); % MSE_Xwf = 71.3233
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
title('Wiener filtered image Xwf');