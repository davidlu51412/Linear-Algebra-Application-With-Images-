load('rps.mat');
load('y.mat');
X = rps;
% put 1's before each entry to account for theta0;

[m n] = size(X);
% normalize
mu = mean(X);
X_normalized = bsxfun(@minus, X, mu);
SIGMA = std(X_normalized);
X_normalized = bsxfun(@rdivide, X_normalized, SIGMA);

X_normalized = [ones(size(X,1), 1) X];
initial_theta = zeros(n + 1, 1);

%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 

% for rock, paper, scissors
theta = zeros(n + 1, 3);
for i=1:3
    [theta(:, i), cost] = fminunc(@(t)(costFunction(t, X_normalized, y(:,i), 17)), initial_theta, options);
end


% best one so far is 400 iter, 17
save('theta.mat', 'theta');