X = load('testface.jpg');
pkg load image;

X = rgb2gray(X);
Xr = imresize(X, .01);

% % gives us a 30,30 plot
% plot(30,30)


% to display axis on image
axis image off;
axis image on;

% gives us a rectangle at (0, 0) with a width of 30x30 with a border of green, and a blue fill
rectangle("Position", [0;0;30;30], "EdgeColor", 'green', "FaceColor", 'blue');

