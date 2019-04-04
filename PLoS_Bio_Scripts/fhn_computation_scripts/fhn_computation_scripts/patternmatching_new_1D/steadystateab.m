function [ cc1u cc8u ] = steadystateab(aaA bbB)
% computes steady state (R0 is 1) 
%   with Michaelis-Menten term in gamma (the new version)




cc1u=aaA+bbB;
cc8u=bbB./(aaA+bbB).^2;


end

