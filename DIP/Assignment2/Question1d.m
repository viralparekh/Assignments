%%Question 1 d
% Implementation of template matching by integral image
clear;
clc;
P1='D:\MS CSE\Assignments\DIP\Assignment2\vegan-modified.jpg';
P2='D:\MS CSE\Assignments\DIP\Assignment2\soy-dessert.jpg';

MainImg=imresize(imread(P1),0.25);
KeyImg=imresize(imread(P2),0.25);

[x1,y1]=size(MainImg);
[x2,y2]=size(KeyImg);


iImg=cumsum(cumsum(double(MainImg)),2);
iImg=[zeros(size(iImg,1)+1,1) [zeros(1,size(iImg,2));iImg]];

tmp=MainImg.^2;
i2Img=cumsum(cumsum(double(tmp)),2);
i2Img=[zeros(size(i2Img,1)+1,1) [zeros(1,size(i2Img,2));i2Img]];

minval=0;
n1=1;
n2=1;
tic;
for p=1:x1-x2
    for q=1:y1-y2
         tmp=NCCintTry(iImg,i2Img,MainImg,KeyImg,p,q);
        if(tmp>minval)
            n1=p;
            n2=q;
            minval=tmp;
        end
    end
end
toc;

Result=Rect(n1,n2,n1+x2,n2+y2,MainImg,1);
figure(1),imshow(Result)
