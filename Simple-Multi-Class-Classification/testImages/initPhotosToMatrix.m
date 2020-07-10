pkg load image

faceNum = 6;

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

testGlassDlu = zeros(faceNum, m*n);
% 36 * (m*n) matrix

% 3088 * 2316 is the original dimensions
HDtestGlass = zeros(faceNum, 155 * 116);

for i=1:faceNum
    tempStr = strcat('testglass', mat2str(i), '.jpg');
    tempIMG = imread(tempStr);
    tempIMG = rgb2gray(tempIMG);
    tempIMG = imrotate(tempIMG, 270);
    QualityIMG = imresize(tempIMG, .05);
    HDtestGlass(i,:) = compressIMG(QualityIMG);
    tempIMG = imresize(tempIMG, size);
    tempIMG = compressIMG(tempIMG);
    testGlassDlu(i,:) = tempIMG;
    
end
save('HDtestGlassDlu.mat', 'HDtestGlass');
save('testGlassDlu.mat', 'testGlassDlu');