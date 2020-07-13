load('theta.mat');
load('testrps.mat');

X = testrps;
X = [ones(size(X,1), 1) X];
HDIMG = testrps;

finalProbability = sigmoid(X * theta);
[m n] = size(X);

for i=1:m
    disp('IMAGE');
    disp('-------------');
    disp('probability: ')
    finalProbability(i,:)
    [value index] = max(finalProbability(i,:));
    disp('prediction: ')
    if index==1
        disp('you chose rock')
    elseif index==2
        disp('you chose paper')
    elseif index==3
        disp('you chose scissors')
    end
    temp = HDIMG(i,:);
    temp = decompressIMG(temp);
    imshow(uint8(temp));
    pause;
end