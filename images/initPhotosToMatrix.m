pkg load image

faceNum = 8;
m = 31;
n = 24;
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