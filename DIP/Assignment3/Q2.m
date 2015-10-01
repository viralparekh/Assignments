clc;clear all;

%Image read
simg=imread('circles1.jpg','jpg');
simg=rgb2gray(simg);

%Logic to convert given image to binary image with distinguish circles.
mask= fspecial('gaussian',[5,5],3);
fimg=imfilter(simg,mask);
se = strel('disk',15);
fimg = imtophat(fimg,se);
se = strel('disk',2);
fimg = imerode(fimg,se);
fimg=adapthisteq(fimg);
se = strel('disk',15);
fimg = imtophat(fimg,se);
BW = im2bw(fimg,0.18);

%Get connected components in the image
[L num]=bwlabel(BW);


%count number of lables in each category by eroding the image
nn=zeros(10,1);
for i=1:1:10
    se = strel('disk',i);
    tmp=imerode(BW,se);
    [Lt numt]=bwlabel(tmp);
    nn(i)=numt;
end


%calculate size of each connected component in the image
csize=zeros(num,1);
for i=1:num
    csize(i)=size(find(L==i),1);
end
%Sort the circle according to size 
[val ind]=sort(csize);


D=sort(nn);
ll=zeros(size(L));
for j=1:size(D)-1
   kk=zeros(size(L));
   for i=D(j):D(j+1)
        kk(find(L==ind(i)))=1;
        ll=ll+kk;
   end
   figure,imshow(kk),title(strcat('catogary no :',num2str(j)));

end
 
figure;imshow(simg),title('Original Image')
figure;imshow(ll),title('combined seperated image to verify whether every circle is counted or not')
