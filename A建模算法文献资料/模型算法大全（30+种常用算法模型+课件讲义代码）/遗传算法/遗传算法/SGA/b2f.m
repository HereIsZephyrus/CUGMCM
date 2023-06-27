function [fval] = b2f(bval,bounds,bits)
% Return the float number corresponing to the binary representation of bval.
% fval   - the float representation of the number
% bval   - the binary representation of the number
% bounds - the bounds on the variables
% bits   - the number of bits to represent each variable
scale=(bounds(:,2)-bounds(:,1))'./(2.^bits-1); %The range of the variables
numVars=size(bounds,1);
cs=[0 cumsum(bits)]; 
for i=1:numVars
  a=bval((cs(i)+1):cs(i+1));
  fval(i)=sum(2.^(size(a,2)-1:-1:0).*a)*scale(i)+bounds(i,1);
end