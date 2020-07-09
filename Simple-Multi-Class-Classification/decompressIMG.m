function [X] = decompressIMG(compIMG)
    % m and n are the size of image after resizing the image m x n;

    % This is for .01 img resize
    % m = 31;
    % n = 24;

    % This is for .03 img resize
    m = 93;
    n = 70;
   
    % This is for .05 img resize
    % m = 155;
    % n = 116;
    
    X = zeros(m, n);
    X = double(X);
    cLen = length(compIMG);
    counter = 1;
    for i=1:m
        X(i,1:n) = compIMG(1, counter:(counter+n-1));
        counter += n;
    end 
end