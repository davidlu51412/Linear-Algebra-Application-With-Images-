pkg load image

examples = 165;


% this is for .01 img resize; FOR SELFIE CAMERA
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

rps = zeros(examples * 3, m*n);
reverseStr = '';
counter = 1;
for i=1:examples
    percentDone = 100 * i / examples;
    msg = sprintf('Percent done: %3.1f', percentDone); %Don't forget this semicolon
    fprintf([reverseStr, msg]);
    reverseStr = repmat(sprintf('\b'), 1, length(msg));
    tempStr = strcat('rps', mat2str(i), '.jpg');
    tempIMG = imread(tempStr);
    tempIMG = rgb2gray(tempIMG);
    
    tempIMG = imresize(tempIMG, .01);
    tempIMG = imrotate(tempIMG, 270);
    dark = imadjust(tempIMG, [0 1], [0 .5]);
    bright = imadjust(tempIMG, [0 1], [.5 1]);
    compliment = imcomplement(tempIMG);
    
    tempIMG = compressIMG(tempIMG);
    dark = compressIMG(dark);
    bright = compressIMG(bright);

    rps(counter,:) = tempIMG;
    counter++;
    rps(counter,:) = dark;
    counter++;
    rps(counter,:) = bright;
    counter++;
end

save('rps.mat', 'rps');