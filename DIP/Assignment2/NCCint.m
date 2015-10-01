function val = NCCintTry(iImg,i2Img,Main,KeyImg,p,q )

[x2 y2]=size(KeyImg);

n=size(KeyImg,1)*size(KeyImg,2);

T=double(KeyImg(:));
tMean=mean(T);
tStd=std(T);
T=double(T-tMean);


fmean=double((iImg(p+x2,q+y2)+iImg(p,q)-iImg(p+x2,q)-iImg(p,q+y2))/n);
fStd=double(sqrt(abs(((i2Img(p+x2,q+y2)+i2Img(p,q)-i2Img(p+x2,q)-i2Img(p,q+y2))-(fmean^2))/n)));

F=Main(p:p+x2-1,q:q+y2-1);
F=F(:);
F=double(F-fmean);
val=uint8((sum((F.*T)/(fStd*tStd))));
        

end