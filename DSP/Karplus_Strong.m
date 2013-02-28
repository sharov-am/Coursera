function y = ks_loop(x, alpha, D)

% Length of the output signal must be larger than the length of the input signal,
% that is, D must be larger than 1 
if D < 1   
    error('Duration D must be greater than 1');
end    
    
% Make sure the input is a row-vector
x = x(:).';

% Number of input samples
M = length(x);

% Number of output samples
size_y = D * M;

% Initialize with random input x
y = zeros(1, size_y);
y(1:M) = x;

for index = (M+1):size_y
    y(index) = alpha * y(index - M);
end

y = y(:);

return