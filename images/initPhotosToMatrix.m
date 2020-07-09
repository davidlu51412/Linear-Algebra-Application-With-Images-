pkg load image

faceNum = 8;

% this is for .01 img resize;
m = 31;
n = 24;

% % This is for .03 img resize
% m = 93;
% n = 70;

% This is for .05 img resize
% m = 155;
% n = 116;

allDluFaces = zeros(m*n, faceNum);
for i=1:faceNum
    tempStr = strcat('dluface', mat2str(i), '.jpeg');
    tempIMG = imread(tempStr);
    tempIMG = rgb2gray(tempIMG);
    tempIMG = imresize(tempIMG, .01);
    tempIMG = compressIMG(tempIMG);
    allDluFaces(:, i) = tempIMG';
end

save('allDluFaces.mat', 'allDluFaces');