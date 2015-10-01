% Question 4 a
% Cylindrical Projection

clear all;
clc;

sImg=imread('map.gif');
[m n]=size(sImg);

rImg=zeros(m,floor(n*sin(n)));
[m1,n1]=size(rImg);

for i=1:m
    for j=1:n
        Y=j;
        x=-1*(1-((i-1)/(m-1)))+1*((i-1)/(m-1));
        k=(asin(x)*180/3.14);
        k=(k<-90)*-90+(k>-90)*k;
        k=1*(1-((k+90)/180))+m*((k+90)/180);
        k=floor((k));
        rImg(i,j)=sImg(k,Y);
    end
end

figure;imshow(sImg,[]),title('Original Map');
figure;imshow(rImg,[]),title('Cylindrical Projection of Map');