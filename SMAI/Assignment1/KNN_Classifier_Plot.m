% KNN Classifier Implementation
% Viral Parekh
% Roll No :201507535
% Assignment-1 (SM in AI)

clear;
clc;

% Path to DataSet
Path2DataSet1='IrisData.txt';
Path2DataSet2='BreastCancer.txt';
Path2DataSet3='BalanceScale1.txt';
Path2DataSet4='Titanic.txt';

inp=input('Enter value to select dataset (1/2/3/4) :');
% Read Dataset as per user input
if(inp==1)
 Data= textread(Path2DataSet1) ;
elseif(inp==2)
    Data= textread(Path2DataSet2) ;
elseif(inp==3)
    Data= textread(Path2DataSet3) ;
else
    Data= textread(Path2DataSet4) ;
end
 
%  Initialize variable for statistical analysis
 Accuracy=zeros(5,5);
 MeanAccuracy=zeros(5,5);
 STD=zeros(5,5);
 cnt=zeros(5,5);

 for nFold=2:5
    Accuracy=zeros(nFold,5);
    for pNo=1:nFold
% Call function kFold to divide dataset in to TraningData and
% SampleData partition
        [TrainData TrueClass SampleData GroundTruth]=kFold(Data,nFold,pNo);
        for kval=1:5
% Run KNNClassify function to get prediction for sample data            
           pClass=KNNClassify(TrainData,TrueClass,SampleData,kval);
%          pClass = knnclassify(SampleData, TrainData, TrueClass,kval);
       
% Compute Misclassified samples
           Misclassified=0;
           for i=1:size(pClass)
                if(pClass(i)~=GroundTruth(i))
                  Misclassified=Misclassified+1;
                end
           end
%  Compute Accuracy and feed the value into array for post calculation
            ptError=(Misclassified*100)/size(pClass,1);
            ptAccuracy=100-ptError;
          
            Accuracy(pNo,kval)=ptAccuracy;
        end
    end
    
    for cc=1:5
    STD(nFold,cc)=std(Accuracy(:,cc));
    MeanAccuracy(nFold,cc)=mean(Accuracy(:,cc));
    end
 end



% Plot the accuracy for 2,3,4,5 fold scenerio
x=1:1:5;
subplot(2,2,1),errorbar(x,MeanAccuracy(2,:),STD(2,:),'rx'),title(strcat('2 Fold    #MeanAccuracy=',num2str(mean(MeanAccuracy(2,:))))),ylabel('Mean Accuracy'),xlabel('K ->'),axis([0 6 50 110 ])
subplot(2,2,2),errorbar(x,MeanAccuracy(3,:),STD(3,:),'rx'),title(strcat('3 Fold    #MeanAccuracy=',num2str(mean(MeanAccuracy(3,:))))),ylabel('Mean Accuracy'),xlabel('K ->'),axis([0 6 50 110 ])
subplot(2,2,3),errorbar(x,MeanAccuracy(4,:),STD(4,:),'rx'),title(strcat('4 Fold    #MeanAccuracy=',num2str(mean(MeanAccuracy(4,:))))),ylabel('Mean Accuracy'),xlabel('K ->'),axis([0 6 50 110 ])
subplot(2,2,4),errorbar(x,MeanAccuracy(5,:),STD(5,:),'rx'),title(strcat('5 Fold    #MeanAccuracy=',num2str(mean(MeanAccuracy(5,:))))),ylabel('Mean Accuracy'),xlabel('K ->'),axis([0 6 50 110 ])


disp(strcat('2 Fold   Mean Accuracy=',num2str(mean(MeanAccuracy(2,:)))));
disp(strcat('3 Fold   Mean Accuracy=',num2str(mean(MeanAccuracy(3,:)))));
disp(strcat('4 Fold   Mean Accuracy=',num2str(mean(MeanAccuracy(4,:)))));
disp(strcat('5 Fold   Mean Accuracy=',num2str(mean(MeanAccuracy(5,:)))));

