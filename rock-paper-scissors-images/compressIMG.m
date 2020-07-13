function [X] = compressIMG(IMG)
    % loads into a row of image points
    [m n] = size(IMG);
    X = zeros(1, m*n);
    counter = 1;
    for i=1:m
        X(1, counter:(counter + n - 1)) = IMG(i, :);
        counter += n;
    end 

    % X is a 1 X (m*n) matrix
end