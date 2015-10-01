function a = sspRM (a,Y,MaxItr,b)
itr=1;
AY=a'*Y;
while(size(find(AY<b),2)>0 && itr<MaxItr)
  itr=itr+1;
  AY=a'*Y;
  for j=1:size(AY,2)
    if(AY(j)<b)
        a=a+1.7*Y(:,j)*((b-AY(j))/sum(Y(:,j).^2));
        break;
      end
      
  end
AY=a'*Y;
end
itr
endfunction


