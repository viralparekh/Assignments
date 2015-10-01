clear   ; close all; clc;

input_layer_size  = 64;
hidden_layer_size = 10; 
num_labels = 2;  


load X.mat;

t=X(:,65);
t(find(t==7))=2;
t(find(t==0))=1;
t1=t;
t=output_predict(t,num_labels);
X=X(:,1:64);
itr=10;
eta=0.1;
[Theta1 Theta2]=train(input_layer_size,hidden_layer_size,num_labels,X,t,itr,eta);

   
pred = predict(Theta1,Theta2,X);
fprintf('\nTraining Accuracy: %f\n', mean(double(pred == t1)) * 100);


load test07.mat;
t=X(:,65);
t(find(t==7))=2;
t(find(t==0))=1;
t1=t;
t=output_predict(t,num_labels);
X=X(:,1:64); 
   
pred = predict(Theta1,Theta2,X);
fprintf('\nTest Accuracy: %f\n', mean(double(pred == t1)) * 100);



