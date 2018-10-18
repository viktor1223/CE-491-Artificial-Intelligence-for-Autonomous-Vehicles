function [XTrain,XTest,yTrain,yTest] = mySplitData(X, y, rate)

NumSample = size(X,1); %X is your input matrix, y is output label
numTrain = rate * NumSample;
numTest = (1- rate ) * NumSample;
numLabels = unique(y); % how many unique labels present
%how many sample per label in training
TrainPerLabel = floor(numTrain/length(numLabels));
TestPerLabel = floor(numTest/length(numLabels)); % how many sample per label in test
XTrain = [ ]; yTrain = [ ]; %create empty matrix for train/test data
XTest = [ ]; yTest =[ ];

for i = 1:length(numLabels)
    idx = find(y==numLabels(i,1)); % get the index of that row where each label is present
    XTmp = X(idx,:); % get values of X stored at that particular Label(class)
    xidx = (randperm(size(XTmp,1)))'; % shuffle the data
    XTrainTmp = XTmp(xidx (1:TrainPerLabel,1),:);
    yTrainTmp = (ones(TrainPerLabel,1))*double(numLabels(i,1));
    XTestTmp = XTmp(xidx(TrainPerLabel+1:end),:); % remaining rows for testing
    numXtest = size( XTestTmp,1);
    yTestTmp = (ones(numXtest,1))*double(numLabels(i,1));
    XTrain = [XTrain; XTrainTmp];
    yTrain = [yTrain; yTrainTmp];
    XTest = [XTest; XTestTmp];
    yTest = [yTest; yTestTmp];
end

end
