function [ cc1u cc8u ] = steadystate()
% computes steady state (R0 is 1) 
%   with Michaelis-Menten term in gamma (the new version)


global aa bb

cc1u=aa+bb;
cc8u=bb./(aa+bb).^2;


end

