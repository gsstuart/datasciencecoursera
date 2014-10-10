function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
n = rows(theta);
J_history = zeros(num_iters, 1);

%{
disp('initial values:')
X
y
theta
alpha
%}

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
        thetatemp = zeros(n, 1);
        theta0sum = 0;
        theta1sum = 0;
%        for i = 1:m
            % thetatemp = zeros(n, 1);
 %           h0xi = X(i,:) * theta;
  %          yi = y(i);
            
%            for j = 1:n
%                thetatemp(j,1) = thetatemp(j,1) + ((h0xi - yi) * X(i,j));
%            end

% thetatemp = thetatemp + ((h0xi - yi) * X(i,:))';

% thetatemp = thetatemp + ((X * theta - y)' * X)';
            % theta0sum = theta0sum + ((h0xi - yi) * X(i,1));
            % theta1sum = theta1sum + ((h0xi - yi) * X(i,2));           
   %     end

%        theta = theta - alpha * (1/m) * thetatemp;

theta = theta - alpha * (1/m) * ((X * theta - y)' * X)' ;
        
        % theta(1) = theta(1) - alpha * (1/m) * thetatemp(1);
        % theta(2) = theta(2) - alpha * (1/m) * thetatemp(2);
        % theta(3) = theta(3) - alpha * (1/m) * thetatemp(3);
        

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
