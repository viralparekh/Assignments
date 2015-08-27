clear all;
close all; 
clc;

Path='D:\MS CSE\Assignments\DIP\assignment1\assigment1\face.png';
sImg = imread(Path);

temp = double(sImg);
[p1 q1] = size(sImg);
sigma1 = 15;
sigma2 = 15;

inp=5;

% Computing Gs  smoothing differences in coordinates in Mask1
inp=5;
mask1 = Mask1Create(inp,inp,sigma1);
[x y]=size(mask1);
xby2=floor(x/2);

mask2 = double(zeros(x,y));

% Computing smoothing differences in intensities using Gaussian function
% and appplying combind mask to main image

% Here Mask is 5*5 and sigma1=15 sigma2 =15
Result = double(sImg);
for i=xby2+1:p1-xby2
    for j=xby2+1:q1-xby2
        if(mod(x,2)==1)
            mask2 = double(exp(-1*((temp(i-xby2:i+xby2,j-xby2:j+xby2)-temp(i,j)).^2)/(2*sigma2^2)));
            mask = mask1.*mask2;
             Result(i,j)= (1/sum(sum(mask)))*sum(sum(mask.*temp(i-xby2:i+xby2,j-xby2:j+xby2)));
        else
             mask2 = double(exp(-1*((temp(i-xby2+1:i+xby2,j-xby2+1:j+xby2)-temp(i,j)).^2)/(2*sigma2^2)));
             mask = mask1.*mask2;
             Result(i,j)= (1/sum(sum(mask)))*sum(sum(mask.*temp(i-xby2+1:i+xby2,j-xby2+1:j+xby2)));
        end    
        
    end
end
subplot(1,2,1),imshow(sImg),title('Original Image')
subplot(1,2,2),imshow(uint8(double(Result))),title('Image after Bilateral transform')
