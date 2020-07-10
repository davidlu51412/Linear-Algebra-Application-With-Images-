load('glassesDlu.mat');
load('y.mat');
X = glassesDlu;
% put 1's before each entry to account for theta0;

% normalize
mu = mean(X);
X_normalized = bsxfun(@minus, X, mu);
SIGMA = std(X_normalized);
X_normalized = bsxfun(@rdivide, X_normalized, SIGMA);

X_normalized = [ones(size(X,1), 1) X];
initial_theta = zeros(size(X_normalized,2), 1);
%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 200);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = fminunc(@(t)(costFunction(t, X_normalized, y, 0)), initial_theta, options);

save('theta.mat', 'theta');