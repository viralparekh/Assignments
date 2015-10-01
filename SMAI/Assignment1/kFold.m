function [ TrainData TrueValue SampleData GroundTruth ] = kFold( Data,fold,pNo)

[nDataSets nFeatures]=size(Data);

% Detrimine size of partition
sPartition=floor(nDataSets/fold);

sData=zeros(1,nFeatures);
tData=zeros(1,nFeatures);

% Divide the data in to two part one for traingdata and true value other
% part sampledata and ground truth
for i=1:fold
    if(pNo==i)
        sData=[sData;Data((i-1)*sPartition+1:i*sPartition,:)];
    else
        tData=[tData;Data((i-1)*sPartition+1:i*sPartition,:)];
    end
end
% Adjust remaining data, ex if total datasets are 51 and numberof folds are
% 5 then 1 data set will be adjusted in training data (50+1)
rem=nDataSets-sPartition*fold;
if(rem~=0)
     tData=[tData;Data(nDataSets-rem:nDataSets,:)];
end


% Adjust Retrun value for the function
TrainData=tData(2:size(tData),1:nFeatures-1);
TrueValue=tData(2:size(tData),nFeatures);
SampleData=sData(2:size(sData),1:nFeatures-1);
GroundTruth=sData(2:size(sData),nFeatures);


end

