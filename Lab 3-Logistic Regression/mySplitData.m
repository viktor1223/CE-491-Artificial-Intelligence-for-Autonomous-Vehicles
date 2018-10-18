function [XTrain XTest yTrain yTest] = mySplitData(X, y, rate)

% Splits the data into training and testing

NumSample = size(X,1);
TrainSampleRatio = rate;

numTrain = TrainSampleRatio*NumSample;
numTest = (1-TrainSampleRatio)*NumSample;

numLabels = unique(y);

TrainPerLabel = floor(numTrain/length(numLabels));
TestPerLabel = floor(numTest/length(numLabels));

XTrain = [];
XTest = [];

yTrain = [];
yTest = [];

for i = 1:length(numLabels)
    idx=find(y==numLabels(i,1));
    XTmp = X(idx,:);
    
    xidx=(randperm(size(XTmp,1)))';
    XTrainTmp = XTmp(xidx (1:TrainPerLabel,1),:);
    yTrainTmp = (ones(TrainPerLabel,1))*numLabels(i,1);
    
    XTestTmp=XTmp(xidx(TrainPerLabel+1:end),:);
    numXtest = size(XTestTmp,1);
    yTestTmp = (ones(numXtest,1)*numLabels(i,1));
    
    XTrain = [XTrain; XTrainTmp];
    yTrain = [yTrain; yTrainTmp];
    
    XTest = [XTest; XTestTmp];
    yTest = [yTest; yTestTmp];
    
    
    
end
