
function a = ssp (a,Y,MaxItr)
itr=1;
while(size(find(a'*Y<0),2)>0 && itr<MaxItr)
  itr=itr+1;
  AY=a'*Y;
  for j=1:size(AY,2)
    if(AY(j)<0)
        a=a+Y(:,j);
        break;
      end
      
  end

end
itr
endfunction
