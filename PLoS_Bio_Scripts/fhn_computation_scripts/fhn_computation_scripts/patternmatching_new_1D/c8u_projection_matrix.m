function [ AA ] = c8u_projection_matrix()
%% For a given input vector RR, AA*RR computes the projection to the
%% c1u-component

global m n


AA=horzcat(sparse(n^2,2*n^2), speye(n^2));


end
