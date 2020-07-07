function [X] = decompressIMG(compIMG)
    % m and n are the size of image after resizing the image m x n;

    % This is for .01 img resize
    % m = 31;
    % n = 24;

    % This is for .05 img resize
    m = 155;
    n = 116;
    
    X = zeros(m, n);
    X = double(X);
    cLen = length(compIMG);
    counter = 1;
    for i=1:m
        for j=1:n
            X(i,j) = compIMG(1, counter);
            counter++;
        end
    end 
end