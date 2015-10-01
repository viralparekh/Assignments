clear;
clc;
P1='D:\MS CSE\Assignments\DIP\Assignment2\rupee-symbol.jpg';
P2='D:\MS CSE\Assignments\DIP\Assignment2\test-images-for-q2\son3.gif';


% Original image and fourier transform
MainImg=rgb2gray(imread(P1));
[x1 y1]=size(MainImg);
fMain=myFFT(MainImg);


%Scaling of pixel value of image and fourier transform [m,n]->a[m,n]
%a=5
scale1=MainImg(:,:).*5;
fscale1=myFFT(scale1);


%scaling of image [m n]->[am an]
%a=2
scale2=imresize(MainImg,2);
fscale2=myFFT(scale2);


%shifting  [m n]->[m+m0, n+n0]
m=-50;
n=-50;
for i=1:x1
    for j=1:y1
        shift1(i,j)=MainImg(mod(i+m,x1)+1,mod(j+n,y1)+1);

    end
end

fshift1=myFFT(shift1);


%Reflection on N/2
for i=1:x1
    for j=1:y1
        ref(i,y1-j+1)=MainImg(i,j);
    end
end
fref=myFFT(ref);


figure(1),
subplot(2,2,1),imshow(MainImg),title('Original Image');
subplot(2,2,2),imshow(fMain),title('Origianl Fourier Transform');
subplot(2,2,3),imshow(scale1),title('Scling of pixel value');
subplot(2,2,4),imshow(fscale1),title('Fourier transform for scaling pixel value');

figure(2),
subplot(2,2,1),imshow(scale2),title('scaling of image');
subplot(2,2,2),imshow(fscale2),title('ft for scaled image');
subplot(2,2,3),imshow(shift1),title('shifting of image');
subplot(2,2,4),imshow(fshift1),title('fft for shifted image');

figure(3),
subplot(2,1,1),imshow(ref),title('reflection of image');
subplot(2,1,2),imshow(fref),title('fft for reflected image');







