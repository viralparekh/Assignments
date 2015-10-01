function [ PredicatedClass ] = KNNClassify( TrainData,TrueValue,SampleData,K)

 PredicatedClass=0;
 
% loop for each row of sample data/test data
 for i=1:size(SampleData)
 
% logic for distance function for dataset
    ss = repmat(SampleData(i,:),size(TrainData,1),1);
    ss=TrainData-ss;
    ss=ss.^2;
    Dist=sum(ss,2);    
    [sumValue Index]=sort(Dist);
% Determine class for K neighbours
    kNeighbours=TrueValue(Index(1:K));
    [Class Frequency]=mode(kNeighbours);
% Tie breaker logic
    if(Frequency<=K/2 && K>1)
           kNeighbours=TrueValue(Index(1:K+1));
           [Class Frequency]=mode(kNeighbours);
    end

    PredicatedClass=[PredicatedClass;Class];
 end
    
 PredicatedClass=PredicatedClass(2:size(PredicatedClass));

end
