load dluface.mat
% It will load the img_names variable into variables list. 
% you can check it by typing whos in command window
X = GREYFACE;
X = X(772:end,:); 
% RESIZE TO SQUARE MATRIX
% X's DATA TYPE IS UINT8
% CONVERSION of DIFF TYPES: MATRIX = uint8(SOME MATRIX);


disp('QR FACTORIZATION');

[Q R] = qr(X);
A = Q * R;
Q = uint8(Q);
R = uint8(R);
A = uint8(A);

figure
imshow(X)
title('ORIGINAL IMG - QR FACTORIZATION')


figure
imshow(Q)
title('Q')
% THE REASON WHY Q is just a black image is because it is an orthonormal basis of eigenvectors and thus, it
% spans the entire dimension of this image(matrix). So it is quite literally a black square.

figure
imshow(R)
title('R')
% Found by inv(Q) * A = R


figure
imshow(A)
title('RECONSTRUCTION: Q * R')
% Reconstruction of X with Q * R

pause;