function [s ] = sigmoid(z)
%SIGMOID activation function

s = zeros(size(z));
s = 1./(1 + exp(-1*z));

end
