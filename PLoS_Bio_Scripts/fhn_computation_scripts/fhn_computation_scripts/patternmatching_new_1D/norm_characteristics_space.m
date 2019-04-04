function [ dd ] = norm_characteristics_space(rhog, Rg,diffcoeffg)

global UU c1u
%global rho R diffcoeff


%rho=rhog;
%R=Rg;
%diffcoeff=diffcoeffg;

fn(rhog,Rg,diffcoeffg);
endt=size(UU)*[1 0]';   % endt is the index in the t-vector that corresponds to end time
GG=gridrepresentation(c1u*UU(endt,:)');

[PL,SS,EE,FA]=pattern_stats(GG,0,0)
dd=(SS/PL-0.8055)^2/0.8055^2+0.5*(EE-0.7020)^2/0.7020^2+(FA-0.2939)^2/0.2939^2;


end

