
clc;
clear;

w1=[1 7;7 8;4 5;6 3;8 9;7 5];
w2=[3 1;2 4;1 3;4 3;7 1;4 2];

  
 
 Y=[[ones(size(w1,1),1),w1];-[ones(size(w2,1),1),w2]];
 Y=Y';
 a=[1;1;1];
 

MaxItr=1000

ip=input('Enter Choice 1/2/3/4 : ');

if(ip==4)
  margin=2;
  a=sspLMS (a,Y,MaxItr,margin);
elseif ip==3
   margin=2;
  a=sspRM(a,Y,MaxItr,margin);
elseif ip==2
  margin=2;
  a=sspMargin(a,Y,MaxItr,margin);
else
  a=ssp(a,Y,MaxItr);
end
 

 
% Plot points and Hyperplane 
plot(w1(:,1),w1(:,2), "bo;Class 1;","markersize",10,w2(:,1),w2(:,2),"r*;Class 2;","markersize",10);
axis([-15,15,-15,15]);
t=-10:10;
Z= -a(1)/a(3)-a(2)*t/a(3);
hold on; 
plot(t,Z, '-')
hold off;

