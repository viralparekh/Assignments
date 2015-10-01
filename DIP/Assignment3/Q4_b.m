% Question 4 b
% Mercartor Projection

clear all;
clc;

sImg=imread('map.gif');
[m n]=size(sImg);

rImg=zeros(m,floor(n*sin(n)));
[m1,n1]=size(rImg);


for i=1:m
    for j=1:n
        Y=j;
        x=-2.7184*(1-((i-1)/(m-1)))+2.7184*((i-1)/(m-1));
        k=((2*(atan(exp(x))-pi/4))*180/pi);
        k=1*(1-((k+90)/180))+m*((k+90)/180);
        k=floor((k));
        rImg(i,j)=sImg(k,Y);
    end
end
figure;imshow(sImg,[]),title('Original Map');
figure;imshow(rImg,[]),title('Mercartor Projection of Map');