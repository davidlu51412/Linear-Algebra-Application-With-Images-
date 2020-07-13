function [jVal, gradient] = costFunction(theta, X, y, lambda)
    m = size(X,1);
    hypo_probability = sigmoid(X * theta);
    % gives us a #examples X 1 matrix
    hypo = hypo_probability;

    % compute regularization
    regularizationNum =  + sum(theta(2:end).^2) * lambda / (2 * m);
    % compute cost
    jVal = - (1 / m) * sum(y .* log(hypo) + (1 - y) .* log(1 - hypo)) + regularizationNum;
    % compute gradient
    gradient = (1 / m ) * X' * (hypo - y);

    % Accounting for regularization
    regThetaAdd = lambda * theta / m;
    gradient(2:end) = gradient(2:end) + regThetaAdd(2:end);
end