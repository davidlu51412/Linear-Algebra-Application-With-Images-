load('glassesDlu.mat');
load('y.mat');
X = glassesDlu;
% put 1's before each entry to account for theta0;

X = [ones(size(X,1), 1) X];
initial_theta = zeros(size(X,2), 1);
%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = fminunc(@(t)(costFunction(t, X, y, 0)), initial_theta, options);

save('theta.mat', 'theta');