clear all;
close all; clc;

Path='D:\MS CSE\Assignments\DIP\assignment1\assigment1\bell.jpg';
sImg=imread(Path);

% Different value for weight A
A1=1;
A2=1.5;
A3=1.8;
A4=2;

% Different masks 3*3 and 5*5 for smoothing
SMask1=int16(ones(3,3));
SMask2=int16(ones(5,5));

[i j]=size(sImg);

SmoothImg1=sImg;
SmoothImg2=sImg;
HBImage1=sImg;
HBImage2=sImg;
HBImage3=sImg;
HBImage4=sImg;
HBImage5=sImg;

sImg=int16(sImg);
SmoothImg1=int16(SmoothImg1);
SmoothImg2=int16(SmoothImg2);
HBImage1=int16(HBImage1);
HBImage2=int16(HBImage2);
HBImage3=int16(HBImage3);
HBImage4=int16(HBImage4);
HBImage5=int16(HBImage5);


for p=2:i-1
    for q=2:j-1
         SmoothImg1(p,q)=(1/9)*sum(sum(SMask1.*sImg(p-1:p+1,q-1:q+1)));
    end
end

for p=3:i-2
    for q=3:j-2
         SmoothImg2(p,q)=(1/25)*sum(sum(SMask2.*sImg(p-2:p+2,q-2:q+2)));
    end
end

% SmoothImg1 and SmoothImg2 are smooth images after applying filter
 
% Compute Fs
SharpImg1=sImg-SmoothImg1;
SharpImg1=sImg+SharpImg1;
SharpImg2=sImg-SmoothImg2;
SharpImg2=sImg+SharpImg2;

% Applying formula  Fhb=(A-1)F+ Fs  for different values of A

HBImg1=(A1-1)*sImg+SharpImg1;
HBImg2=(A1-1)*sImg+SharpImg2;

HBImg3=(A2-1)*sImg+SharpImg1;
HBImg4=(A3-1)*sImg+SharpImg1;
HBImg5=uint8((A4-1)*int16(sImg)+SharpImg1);

sImg=uint8(sImg);
HBImg1=uint8(HBImg1);
HBImg2=uint8(HBImg2);
HBImg3=uint8(HBImg3);
HBImg4=uint8(HBImg4);
HBImg5=uint8(HBImg5);

% Displaying Result
subplot(2,3,1),imshow(sImg),title('Original Image');        
subplot(2,3,2),imshow(HBImg1),title('HighBoost with smooth mask window size 5*5 A=1');
subplot(2,3,3),imshow(HBImg2),title('HighBoost with smooth mask window size 3*3 A=1');        
subplot(2,3,4),imshow(HBImg3),title('HighBoost with A=1.5');
subplot(2,3,5),imshow(HBImg4),title('HighBoost with A=1.8');        
subplot(2,3,6),imshow(HBImg5),title('HighBoost with A=2');
