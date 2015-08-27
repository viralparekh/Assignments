clear;
clc;
sImgPath='D:\MS CSE\Assignments\DIP\assignment1\assigment1\office.jpg';
sImg=imread(sImgPath);
[i,j,k]=size(sImg);

    
 Hist=zeros(255,1,3);   
%  Compute Histogram
   for p=1:i
       for q=1:j
           Hist(sImg(p,q)+1)=Hist(sImg(p,q)+1)+1;
       end
   end
   
 
%   Compute PDF
   pHist=Hist;
   pHist(:)=pHist(:)/(i*j);
   
%  Compute CDF
cdf=pHist;
   for p=2:255
       cdf(p)=cdf(p)+cdf(p-1);
   end
   
   
%    Final Mapping
   Result=zeros(i,j,3);
   Result(:,:,:)=cdf(sImg(:,:,:)+1);
   
   Result=Result*255;
   Result=uint8(Result);
   
%    Compute Histogram for Resultant image
    ResultHist=zeros(255,1,3);   
   for p=1:i
       for q=1:j
           ResultHist(Result(p,q)+1)=ResultHist(Result(p,q)+1)+1;
       end
   end
   
ResultHist=ResultHist/(i*j);


subplot(2,2,1),imshow(sImg),title('Original Image')
subplot(2,2,2),bar(pHist(:,:,1)),title('OriginalHistogram')
subplot(2,2,3),imshow(Result),title('Result')
subplot(2,2,4),bar(ResultHist(:,:,1)),title('Result Histogram')
