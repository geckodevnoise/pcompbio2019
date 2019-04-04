function [mm]= space_index(ii, jj)
%a function which returns a single number index for the spatial position
global n


mm = ii+n*(jj-1);

end

