load('theta.mat');
load('testGlassDlu.mat');
load('HDtestGlassDlu.mat');

%X is going to be some other images of my face
X = testGlassDlu;
X = [ones(size(X,1), 1) X];
HDIMG = HDtestGlass;
finalProbability = sigmoid(X * theta);
[m n] = size(X);

for i=1:m
    disp('prediction: ');
    finalProbability(i,1)
    if finalProbability(i,1)>=.5
        disp('David is wearing glasses');
    else 
        disp('David is not wearing glasses');
    end
    temp = HDIMG(i,:);
    temp = decompressIMG(temp);
    imshow(uint8(temp));
    pause;
end