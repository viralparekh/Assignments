
%Question 1
clear all;
clc;
[sImg cmap]=(imread('octone.gif'));
 sImg = ind2rgb(sImg, cmap);
% Seperate R G and B component
fImgR = sImg(:,:,1);
fImgG = sImg(:,:,2);
fImgB = sImg(:,:,3);

%Create Mask 
m1=fImgG>0.6;
m2=fImgR>0.6;
m3=fImgB>0.6;
m=m1&m2&~m3;
se = strel('disk',5);
m = imclose(m,se);
m=imfill(m,'holes');

%Display masked image
img=zeros(size(sImg));
 img(:,:,1)=m.*sImg(:,:,1);
 img(:,:,2)=m.*sImg(:,:,2);
 img(:,:,3)=m.*sImg(:,:,3);
 
figure;imshow(sImg),title('Original Image') 
figure;imshow(img),title('Extracted Yellow Stars')
