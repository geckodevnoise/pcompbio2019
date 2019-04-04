function [ ff ] = vectorrepresentation( FF )
global n
% The input FF is a function represented as a square matrix of size n.
% The output ff is the same function represented as a 
% column vector. vectorrepresentation is the inverse function of
% gridrepresentation.


ff=reshape(FF,n^2,1); 


end

