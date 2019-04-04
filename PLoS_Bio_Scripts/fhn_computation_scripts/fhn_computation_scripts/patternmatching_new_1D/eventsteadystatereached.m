function [val,isterm,dir] = eventsteadystatereached(t,UU)
global terminate_flag
val=terminate_flag;
isterm=1;
dir = 0; % direction of crossing, doesn't matter here

end

