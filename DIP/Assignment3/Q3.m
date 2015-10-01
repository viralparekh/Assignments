% Question: 3
clear all;
clc;

% Load foreground and backbround images
bImg=double(imread('Background.jpg'));
fImg=double(imread('Foreground.jpg'));
 
% Seperate R G and B component
fImgR = fImg(:,:,1);
fImgG = fImg(:,:,2);
fImgB = fImg(:,:,3);

% Calculate Luminance
Luminance = 0.3*fImgR+0.59*fImgG+0.11*fImgB;
 
% substract luminance from green image
diffG_Y=mat2gray(fImgG-Luminance);

% emprical threshold value
thres = 120/255;
 

mask = diffG_Y < thres;
 
final(:,:,1)=fImg(:,:,1).*mask + bImg(:,:,1).*(1-mask);
final(:,:,2)=fImg(:,:,2).*mask + bImg(:,:,2).*(1-mask);
final(:,:,3)=fImg(:,:,3).*mask + bImg(:,:,3).*(1-mask);
% imshow(mat2gray(final));


figure(1);
subplot(1,2,1),imshow(uint8(fImg)),title('Foreground image');
subplot(1,2,2),imshow(uint8(bImg)),title('Background image');
figure(2);
subplot(1,1,1),imshow(uint8(final)),title('Final image');