function [bits]=calcbits(bounds,precision)

% Determine the number of bits to represent a float number to the precision provided.
% bits      - the number of bits required per variable
% bounds    - the bounds on the variables
% precision - the least difference to distinguish two numbers
bits=ceil(log2((bounds(:,2)-bounds(:,1))' ./ precision));
