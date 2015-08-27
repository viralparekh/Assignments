% Spot the differences between the two sets of images (given below) and write a
% program to automatically annotate (mark) the differences with red color bound-
% ing boxes (rectangles).
% a.) Set1: spot1-diff1.jpg and spot1-diff2.jpg
% b.) Set2: spot2-diff1.png and spot2-diff2.png


clear;
clc;

%Ask user to input the set of image for computation
prompt = 'Which set of Image you want to use?(1/2) :';
x = input(prompt);
if(x==1)
    Path1='spot1-diff1.jpg';
    Path2='spot1-diff2.jpg';    
    Img1 = imread(Path1,'jpg');
    Img2 = imread(Path2,'jpg');
else
    Path1='spot2-diff1.png';
    Path2='spot2-diff2.png';
    Img1 = imread(Path1,'png');
    Img2 = imread(Path2,'png');
end


%Take difference of intensity of pixels of two images 
Result1= Img1-Img2;

%Get the height and width of image for computation
[i,j,z]=size(Result1);

%Averaging (smooth)the difference image to remove noise errors
af=ones(3,3);
af(2,2)=2;
Result1=imfilter(Result1,af);
Result1=floor((1/9)*Result1);

Result=Result1(:,:,1)+Result1(:,:,2)+Result1(:,:,3);

box=false;
dl=0;

%compute size of rectangles based on non zero values in difference of
%images
for a=1:1:i
    de=false;
    for b=1:1:j
        if(Result(a,b)>15) %15 is threshold value for summation of RGB channel effectively it will ignore intensity value 5
            de=true;
            if(box==false)
                box=true;
                c1=[a,b];
                c2=[a,b];
            else
                if(c1(2)>b)
                    c1(2)=b;
                end
                if(c2(2)<b)
                    c2=[a,b];
                else
                    c2(1)=a;
                end
            end
        
        end
    end
    if(de==false)
        dl=dl+1;
    end
    if(box==true && dl>=1)
    
    %Drawing Red Rectangle onto the image    
    Img1=Rect(c1(1),c1(2),c2(1),c2(2),Img1);
    Img2=Rect(c1(1),c1(2),c2(1),c2(2),Img2);
          
        box=false;
        dl=0;
        c1=[0,0];
        c2=[0,0];
    end
end
        
subplot(1,3,1), imshow(Img1),title('Original Image1 with Boxes')
subplot(1,3,2), imshow(Img2),title('Original Image2 with Boxes')
subplot(1,3,3), imshow(Result),title('Difference of Images')


