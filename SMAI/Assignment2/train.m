function [Theta1 Theta2] = train(input_layer_size,hidden_layer_size,num_labels,X,Y,itr,eta)


Theta1 = randomWeights(input_layer_size, hidden_layer_size);
Theta2 = randomWeights(hidden_layer_size, num_labels);

DTheta1=zeros(size(Theta1));
DTheta2=zeros(size(Theta2));



num_labels = size(Theta2, 1);
m = size(X, 1);

for ii=1:itr
  ta=randperm(m);
  
  for idx=1:m
    ds=ta(idx);

    [p net1 net2]=predict(Theta1,Theta2,X(ds,:));
    Z=output_predict(p,num_labels);
 
    errork=Y(ds,:)-Z;
    Derrror=sum(-(errork));
    
    Dnetk=net2.*(1.- net2);
    Dnetj=net1.*(1.- net1);
    netj=[1 net1];
    
    senstvtK=Dnetk.*errork;
    DTheta2=eta*(senstvtK'*netj);
      
    senstvtJ=(senstvtK*Theta2(:,2:size(Theta2,2))).*Dnetj;
    DTheta1=eta*(senstvtJ'*[1 X(ds,:)]) ;
    
  
    Theta1=Theta1+DTheta1;
    Theta2=Theta2+DTheta2;

  end


end

endfunction
