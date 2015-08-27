clear;
clc;

sImgPath='D:\MS CSE\Assignments\DIP\assignment1\assigment1\office.jpg';
sImg=imread(sImgPath);
sImg=rgb2gray(sImg);
[i,j]=size(sImg);

%    compute Histogram for orignal image
 Hist=double(zeros(256,1));   
   for p=1:i
       for q=1:j
           Hist(sImg(p,q)+1)=Hist(sImg(p,q)+1)+1;
       end
   end
   
%   compute PDF for original image
   pHist=Hist;
   pHist(:)=pHist(:)/(i*j);
%   Compute cdf for original image 
   cdf=double(zeros(256,1));
   
   for p=1:256
       cdf(p)=sum(pHist(1:p));
   end
   


% Generating Histogram and CDF for Ramp and Step 
HistRamp=double(ones(256,1));
cdfRamp=double(ones(256,1));

for m=1:256
    HistRamp(m)=m;
end
HistRamp =HistRamp/sum(HistRamp(1:256));

for m=1:256
    cdfRamp(m)=sum(HistRamp(1:m));
end


HistStep=double(ones(256,1));
cdfStep=double(ones(256,1));

HistStep(1:128)=0;
HistStep(128:256)=1;
HistStep =HistStep/sum(HistStep(1:256));



for m=1:256
    cdfStep(m)=sum(HistStep(1:m));
end




   ResultRamp=zeros(i,j);
   ResultStep=zeros(i,j);
 
% Final Mapping Function
   cdf1=double(zeros(256,1));
   cdf2=double(zeros(256,1));
  
%    Compute final mapping
   for q=1:256
       [x,ind]=min(abs(cdfRamp-cdf(q)));
       cdf2(q)=ind;
   end
   
   for q=1:256
       [x,ind]=min(abs(cdfStep-cdf(q)));
       cdf1(q)=ind;    
   end
     
%    Constructing final image from final maping cdf1 cdf2
   
 for p=1:i
       for q=1:j
          ResultRamp(p,q)=cdf2(sImg(p,q)+1);
       end
 end
 
 for p=1:i
       for q=1:j
          ResultStep(p,q)=cdf1(sImg(p,q)+1);
       end
 end
 
 
 ResultRamp=uint8(ResultRamp);
 ResultStep=uint8(ResultStep);
   

subplot(4,2,1),imshow(sImg),title('Original Image')
subplot(4,2,2),plot(cdf(:,:,1)),title('CDF of Original Image')
subplot(4,2,3),plot(HistRamp),title('Hist Ramp')
subplot(4,2,4),plot(cdfRamp),title('CDF Ramp')
subplot(4,2,5),imshow(ResultStep),title('Histogram Matching with Step function')
subplot(4,2,6),imshow(ResultRamp),title('Histogram matching with Ramp function')
subplot(4,2,7),plot(HistStep),title('Hist Step')
subplot(4,2,8),plot(cdfStep),title('CDF Step')




