function Y = output_predict (pred,size_output)

Y=zeros(size(pred,1),size_output);


for i=1:size(pred,1)
  Y(i,pred(i))=1;
end
endfunction
