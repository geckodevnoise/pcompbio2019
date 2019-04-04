function [ dd, thresh] = distance_characteristics_space(rhog, Rg,diffcoeffg,ss_pl,ee,fa)

global c1u UU
%global rho R diffcoeff

numruns=50; %% was 15


%rho=rhog;
%R=Rg;
%diffcoeff=diffcoeffg;

dd=0;
thresh=0;
meanfunc=0;
iiav=0;


for kk=1:numruns
fn(rhog,Rg,diffcoeffg);
endt=size(UU)*[1 0]';   % endt is the index in the t-vector that corresponds to end time
GG=gridrepresentation(c1u*UU(endt,:)');


%ref_param=[ss_pl ee fa]; %% reference parameters
mm=min(min(GG));
MM=max(max(GG));
Dist=[];
for ii=mm:(MM-mm)/100:MM
[PL,SS,EE,FA]=pattern_stats(GG,ii,0);
ddrun=(EE-ee)^2/ee^2+(FA-fa)^2/fa^2;
Dist=[Dist; ddrun];
end

[ddrun,ii]=min(Dist);

iiav=iiav+ii;  %%keep track of threshold id (relative to max,min and absolute threshold
threshrun=mm+(ii-1)*(MM-mm)/100;

thresh=thresh+threshrun;
dd=dd+ddrun;
meanfunc=meanfunc+mean(mean(GG));
end

dd=dd/numruns;
thresh=thresh/numruns;
meanfunc=meanfunc/numruns;
iiav=iiav/numruns;

threshid=iiav;

%disp([' thresh=' num2str(thresh) ', ithreshold_id=' num2str(iiav) 'mean=' num2str(meanfunc), '  dist=' num2str(dd)]);

end

