pkg load image

faceNum = 69;

% this is for .01 img resize;
% m = 31;
% n = 24;

% % This is for .03 img resize
m = 93;
n = 70;
size = .03;

% This is for .05 img resize
% m = 155;
% n = 116;

glassesDlu = zeros(faceNum, m*n);

for i=1:faceNum
    tempStr = strcat('glasses', mat2str(i), '.jpg');
    tempIMG = imread(tempStr);
    tempIMG = rgb2gray(tempIMG);
    tempIMG = imrotate(tempIMG, 270);
    tempIMG = imresize(tempIMG, size);
    tempIMG = compressIMG(tempIMG);
    glassesDlu(i,:) = tempIMG;
end

save('RPS.mat', 'RPS');