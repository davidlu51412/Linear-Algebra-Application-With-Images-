pkg load image

faceNum = 36;

% this is for .01 img resize;
% m = 31;
% n = 24;

% % This is for .03 img resize
m = 93;
n = 70;

% This is for .05 img resize
% m = 155;
% n = 116;

glassesDlu = zeros(faceNum, m*n);
% 36 * (m*n) matrix

for i=1:faceNum
    tempStr = strcat('glasses', mat2str(i), '.jpg');
    tempIMG = imread(tempStr);
    tempIMG = rgb2gray(tempIMG);
    tempIMG = imrotate(tempIMG, 270);
    tempIMG = imresize(tempIMG, .03);
    tempIMG = compressIMG(tempIMG);
    glassesDlu(i,:) = tempIMG;
end

save('glassesDlu.mat', 'glassesDlu');