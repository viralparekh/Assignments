function msk = Mask1Create(i,j,sig)

m=double(zeros(i,j));

for p=1:i
    for q=1:j
       m(p,q)=(p-round(i/2))^2+(q-round(j/2))^2;
    end
end
 msk = exp(-(m.^2)/(2*sig^2));
end

