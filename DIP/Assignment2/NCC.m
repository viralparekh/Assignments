function val = NCC( MainImg,KeyImg )

n=size(MainImg,1)*size(MainImg,2);
F=double(reshape(MainImg,n,1));
T=double(reshape(KeyImg,n,1));

tMean=mean(T);
fMean=mean(F);

fStd=std(F);
tStd=std(T);

F=F-fMean;
T=T-tMean;

val=uint8((sum((F.*T)/(fStd*tStd)))/n);

end

