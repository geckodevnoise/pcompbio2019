function [val,isterm,dir] = eventcheckchange(t,UU)
global lastUU

valbuild=1;
for j=0:1:10
    valbuild=valbuild*(t-j);
end
val=valbuild;
if(max(max(abs(UU-lastUU)))<1e-4)
    isterm=1;
else
    isterm=0;
    lastUU=UU;
end
disp(['Event t=' num2str(t)]);
dir = 0; % direction of crossing, doesn't matter here

end

