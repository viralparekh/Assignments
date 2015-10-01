function val = NCC2( MainImg,KeyImg )

n=size(MainImg,1)*size(MainImg,2);
F=double(reshape(MainImg,n,1));
T=double(reshape(KeyImg,n,1));

tMean=mean(T);
fMean=mean(F);


F=F-fMean;
T=T-tMean;

val=uint8((sum(F.*T)/(sum(F.^2)*sum(T.^2))^0.5));

end


