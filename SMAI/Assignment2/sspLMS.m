function a = sspLMS (a,Y,MaxItr,b)
itr=1;
AY=a'*Y;
eta=0.01;

while(size(find((eta*(b-AY)*Y')<0),2)>0 && itr<MaxItr)
  itr=itr+1;
  
  s=0;
  for j=1:size(AY,2)
        s=s+Y(:,j)*((b-AY(j)));  
  end
  a=a+eta*s;
  eta=eta*0.8;
  
AY=a'*Y;
end
itr
eta*(b-AY)*Y'
endfunction


