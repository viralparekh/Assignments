%% Question 2
% step-1 -> fourier transform of both image
% step-2 -> use thresholding, bwmorphing to get the points
% step-3 -> Determin angle from points


clear;
clc;

P1='D:\MS CSE\Assignments\DIP\Assignment2\test-images-for-q2\son3.gif';
P2='D:\MS CSE\Assignments\DIP\Assignment2\test-images-for-q2\son3rot1.gif';
P3='D:\MS CSE\Assignments\DIP\Assignment2\test-images-for-q2\son3rot2.gif';
P4='D:\MS CSE\Assignments\DIP\Assignment2\test-images-for-q2\son3rot3.gif';


[sImg cmap]=imread(P1);

inp=1;
inp=input('Please select second image to compare (1,2,3):');  %commented
% for publishing purpose
if(inp==1)
    [r1Img cmap1]=imread(P2);
elseif(inp==2)
    [r1Img cmap1]=imread(P3);
else
    [r1Img cmap1]=imread(P4);
end
[r1Img cmap1]=imread(P4);

[x1 y1]=size(sImg);
[x2 y2]=size(r1Img);
ft=myFFT(sImg);
ftr1=myFFT(r1Img);

BW = im2bw(ft,0.65);
BW=bwmorph(BW,'shrink');
aa=BW;
BWr1 = im2bw(ftr1,0.85);
BWr1=bwmorph(BWr1,'shrink');
bb=BWr1;




point=[0 0];
point1=[0 0];
for i=1:x1
    for j=1:y1
        if(BW(i,j)>0)
            point=[point;[i j]];
           
        end
        if(BWr1(i,j)>0)
            point1=[point1;[i j]];
           
        end
    end
end




point=point(2:size(point,1),:);
point1=point1(2:size(point1,1),:);

   x1=point(1,1);
   x2=point(size(point,1),1);
   y1=point(1,2);
   y2=point(size(point,1),2);
   a1=(atan((y2-y1)/(x2-x1)))*180/pi;
   ind=linepoints(x1,y1,x2,y2,size(sImg));
   

BW(ind) = 255;
BW=bwmorph(BW,'thicken');
 
 
   x1=point1(1,1);
   x2=point1(size(point1,1),1);
   y1=point1(1,2);
   y2=point1(size(point1,1),2);
   a2=atan((y2-y1)/(x2-x1))*180/pi;


ind =linepoints(x1,y1,x2,y2,size(r1Img));

BWr1(ind) = 255;
 BWr1=bwmorph(BWr1,'thicken');
 BWr1=bwmorph(BWr1,'diag');



angle=a1-a2;
disp('Rotation of image is :')
disp(angle)
figure(1),
subplot(2,2,1),imshow(sImg,cmap);
subplot(2,2,2),imshow(BW,cmap);
subplot(2,2,3),imshow(r1Img,cmap1);
subplot(2,2,4),imshow(BWr1,cmap);
