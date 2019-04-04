function [ r] = abspos(i,j)
%% x-coordinate for site (i,j)
global deltax

r=deltax*sqrt(i^2+j^2);



end

