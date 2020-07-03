load('allDluFaces.mat');
pkg load image

%loads a matrix storing the compressed version of the multiple images of my face
X = allDluFaces;
[n m] = size(X);

% STEP 1: first you want to mean normalize and do feature scaling
%just normalizing means, no feature scaling
MEANSUM = sum(X) / m;
X_normalized = X - MEANSUM;


% dimensions of original images after being scaled down by .025 for efficiency purposes
origX = 31;
origY = 24;

% number of photos I have
numPhotos = 6;


% More advanced way with mean normalization and feature scaling
    % mu = mean(X);
    % X_normalized = bsxfun(@minus, X, mu);
    % SIGMA = std(X_normalized);
    % X_normalized = bsxfun(@rdivide, X_normalized, SIGMA);

%

% STEP 2: we want to find a vector that will minimize projection error (NOT LSRL)
% covariance matrix

% I have made the images .01X the size of its orignal size, since SVD takes too long

% This is the next step, could be done seperately since it takes, I could have loaded
% The U matrix that holds the eigenvectors after running a seperate file to calculate it
SIGMA = (1 / m) * X_normalized * X_normalized';
[U S V] = svd(SIGMA);
%

numDispEigVecs = 8;
for i = 1:numDispEigVecs;
    figure;
    colormap(gray);
    temp = decompressIMG(U(:, i)');
    imagesc(temp);
end

% % reduce from N-DIMENSIONS to K-DIMENSIONS. So Find Vectors U1, U2, ..., UK to minimize projection error, 
% % we want to reduce to this dimension
% k = 200;

% U_reduce = U(:, 1:k);
% Z = U_reduce' * X_normalized;


% %recover the data
% X_recovered = U_reduce * Z; 

% figure;
% title('Reconstructed Image')
% X_recovered = X_recovered + MEANSUM;
% imshow(uint8(X_recovered));



pause;

