


clear all;
close all; clc;

Path='D:\MS CSE\Assignments\DIP\assignment1\assigment1\chip.png';
sImg=imread(Path,'png');

% sImg = rgb2gray(sImg);
sImg=im2double(sImg);
[m n]=size(sImg);

% Different value for C and Gamma for compution
c1= 1.2;
c2= 2;
y1=0.15;
y2=0.19;

Result1=c1*(sImg.^y1);
Result2=c2*(sImg.^y2);

% Using Adaptive Histogram for better image

 Result2=adapthisteq(Result2);


subplot(1,2,1),imshow(Result1),title('c=1.2 gamma=0.15')
subplot(1,2,2),imshow(Result2),title('c=2 gamma=0.19 and adaptive Histogram')
% From Result it seem that last two character for the chip vendor name are
%  T and S