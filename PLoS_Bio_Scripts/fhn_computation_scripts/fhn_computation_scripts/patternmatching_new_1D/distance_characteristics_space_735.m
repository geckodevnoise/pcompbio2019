function [ dd, thresh] = distance_characteristics_space(rhog, Rg,diffcoeffg,ss_pl,ee,fa)

global UU c1u
%global rho R diffcoeff


%rho=rhog;
%R=Rg;
%diffcoeff=diffcoeffg;

fn(rhog,Rg,diffcoeffg);
endt=size(UU)*[1 0]';   % endt is the index in the t-vector that corresponds to end time
GG=gridrepresentation(c1u*UU(endt,:)');


ref_param=[ss_pl ee fa]; %% reference parameters: gecko 735

Dist=[];
mm=min(min(GG));
MM=max(max(GG));
for ii=mm:(MM-mm)/100:MM
[PL,SS,EE,FA]=pattern_stats(GG,ii,0);
dd=abs(SS/PL-ref_param(1))^2/ref_param(1)^2+abs(EE-ref_param(2))^2/ref_param(2)^2+0.5*abs(FA-ref_param(3))^2/ref_param(3)^2;
Dist=[Dist; dd];
end

[dd,ii]=min(Dist);

thresh=mm+(ii-1)*(MM-mm)/100;
end

