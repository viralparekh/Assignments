
function a = sspMargin (a,Y,MaxItr,b)
itr=1;
AY=a'*Y;
while(size(find(AY<b),2)>0 && itr<MaxItr)
  itr=itr+1;
  AY=a'*Y;
  for j=1:size(AY,2)
    if(AY(j)<b)
        a=a+Y(:,j);
        break;
      end
      
  end
AY=a'*Y;
end
itr
endfunction
