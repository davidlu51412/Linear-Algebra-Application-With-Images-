RGBFACE = imread('dluface.jpeg');
GREYFACE = rgb2gray(RGBFACE);
save('dluface.mat','GREYFACE');