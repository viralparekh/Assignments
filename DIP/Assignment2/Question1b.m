%% Question1 b
% Result : absolute sum difference method do not work with modified image
clear;
clc;
P1='D:\MS CSE\Assignments\DIP\Assignment2\vegan-modified.jpg';
P2='D:\MS CSE\Assignments\DIP\Assignment2\soy-dessert.jpg';

MainImg=imresize(imread(P1),0.5);
KeyImg=imresize(imread(P2),0.5);

[x1,y1]=size(MainImg);
[x2,y2]=size(KeyImg);

minval=255*x2*y2;

tic;
for p=1:x1-x2
    for q=1:y1-y2
        tmp=sum(sum(abs(MainImg(p:p+x2-1,q:q+y2-1)-KeyImg(1:x2,1:y2))));

             if(tmp<minval)
            n1=p;
            n2=q;
            minval=tmp;
        end
    end
end
toc;
Result=Rect(n1,n2,n1+x2,n2+y2,MainImg,1);
figure(1),imshow(Result)
