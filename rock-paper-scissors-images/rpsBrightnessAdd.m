rawImgs = 99;
counter = 1;
for i=1:rawImgs
    percentDone = 100 * i / examples;
    msg = sprintf('Percent done: %3.1f', percentDone); %Don't forget this semicolon
    fprintf([reverseStr, msg]);
    reverseStr = repmat(sprintf('\b'), 1, length(msg));

    
    tempStr = strcat('rps', mat2str(i), '.jpg');
    tempIMG = imread(tempStr);
    lowbright = imadjust(tempIMG, [0 1], [0 .5]);
    highbright = imadjust(tempIMG, [0 1], [.5 1]);
    saveStr = strcat('rps', mat2str(rawImgs + counter), ',jpg');
    save(saveStr, lowbright);)
    counter++;
    saveStr = strcat('rps', mat2str(rawImgs + counter), ',jpg');
    
end
