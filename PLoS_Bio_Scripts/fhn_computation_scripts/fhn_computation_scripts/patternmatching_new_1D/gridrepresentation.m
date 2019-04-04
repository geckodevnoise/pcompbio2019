function [ FF ] = gridrepresentation( ff )
global n
% The input ff is a function represented as a column vector of length n^2,
% where the first n entries correspond to the points (1,1),
% (2,1),...,(n,1),
% the next n entries correspond to points (1,2), (2,2), ..., (n,2), and so
% forth. The function gridreprsentation turns this into a square matrix
% by rearranging the the first n entries of the vector to be the first row
% of the matrix, the second n entries to be the second column etc.


FF=reshape(ff,n,n); 


end

