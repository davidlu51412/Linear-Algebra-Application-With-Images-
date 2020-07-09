function [X] = compressIMG(IMG)
    % loads into a row of image points
    [m n] = size(IMG);
    X = zeros(1, m*n);
    counter = 1;
    for i=1:m
        for j=1:n
            X(1, counter) = IMG(i,j);
            counter++;
        end
    end 
end