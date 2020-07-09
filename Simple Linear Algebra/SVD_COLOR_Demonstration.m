pkg load image

X = imread('dluface.jpeg');


figure
imshow(X)
title('Original Image')
% resizing so it takes less time to compute
X = imresize(X, .2);
inc = size(X,2);
R = reshape(X, size(X,1), size(X,2) * size(X,3));

figure
imshow(R)
title('Convert RGB to 2-D Matrix')


% SVD decomp
[U S V] = svd(R);
A = U * S * V';

figure
imshow(uint8(U))
title('U')

figure
imshow(uint8(S))
title('S')

figure
imshow(uint8(V))
title('V')

figure
imshow(uint8(A))
title('recontruction U * S * inv(V)')

% init a 3-D matrix
Final = zeros(size(X));

%S
Final(:,:,1) = A(:,1:inc);
Final(:,:,2) = A(:, (inc+1):(2*inc));
Final(:,:,3) = A(:, (2*inc+1):(3*inc));

figure
Final = uint8(Final);
imshow(Final);
title('Final SVD Reconstruction')
pause;
    