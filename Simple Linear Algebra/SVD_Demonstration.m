load dluface.mat
pkg load image
% It will load the img_names variable into variables list. 
% you can check it by typing whos in command window
X = GREYFACE;

% LOWER QUALITY SO SVD TAKES LESS TIME
R = imresize(X, .5);

[U, S, V] = svd(R);

 A = U * S * V';

figure
imshow(X)
title('ORIGINAL IMG - QR FACTORIZATION')


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

pause;