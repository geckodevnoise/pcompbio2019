function [ dd,thresh ] = find_threshold( GG )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
Dist=[];
mm=min(min(GG));
MM=max(max(GG));
for ii=mm:(MM-mm)/100:MM
[PL,SS,EE,FA]=pattern_stats(GG,ii,0);
dd=abs(SS/PL-0.8055)^2/0.8055^2+abs(EE-0.7020)^2/0.7020^2+0.5*abs(FA-0.2939)^2/0.2939^2;
Dist=[Dist; dd];
end

[dd,ii]=min(Dist);

thresh=mm+(ii-1)*(MM-mm)/100;

end

