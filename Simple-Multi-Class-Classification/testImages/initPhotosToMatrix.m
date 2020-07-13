pkg load image

examples = 9;

% this is for .01 img resize; FOR SELFIE
% m = 31;
% n = 24;

% this is for .01 img resize; FOR FRONT CAMERA
m = 41;
n = 31;

% % This is for .03 img resize
% m = 93;
% n = 70;

% This is for .05 img resize
% m = 155;
% n = 116;

% This is for .1 img resize FRONT CAMERA
HDm = 303;
HDn = 404;

testrps = zeros(examples, m*n);
% 36 * (m*n) matrix

% 3088 * 2316 is the original dimensions
HDrps = zeros(examples, HDm * HDn);
reverseStr = '';
for i=1:examples
    percentDone = 100 * i / examples;
    msg = sprintf('Percent done: %3.1f', percentDone); %Don't forget this semicolon
    fprintf([reverseStr, msg]);
    reverseStr = repmat(sprintf('\b'), 1, length(msg));
    tempStr = strcat('testrps', mat2str(i), '.jpg');
    tempIMG = imread(tempStr);
    tempIMG = rgb2gray(tempIMG);
    tempIMG = imrotate(tempIMG, 270);
    % QualityIMG = imresize(tempIMG, .1);
    % HDrps(i,:) = compressIMG(QualityIMG);
    tempIMG = imresize(tempIMG, .01);
    tempIMG = compressIMG(tempIMG);
    testrps(i,:) = tempIMG;
    
end
save('HDrps.mat', 'HDrps');
save('testrps.mat', 'testrps');