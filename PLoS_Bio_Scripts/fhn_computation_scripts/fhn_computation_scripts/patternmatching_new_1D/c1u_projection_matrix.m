function [ AA ] = c1u_projection_matrix()
%% For a given input vector RR, AA*RR computes the projection to the
%% c1u-component

global n


AA=horzcat(sparse(speye(n^2), sparse(n^2,n^2));


end
