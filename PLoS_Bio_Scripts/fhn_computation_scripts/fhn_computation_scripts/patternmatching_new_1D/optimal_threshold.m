function [ dd, thresh] = optimal_threshold(rhog, Rg,diffcoeffg,ss_pl,ee,fa)
%% improvement of distance_characteristics_space: instead of optimizing the distance at every run, taking average of thresholds,
%% we find teh threshold that leads to a cloud whose c.o.m. is closest to the point in phenotype space


global c1u UU
%global rho R diffcoeff

numruns=15; %% was 15
numthresh=400;

%rho=rhog;
%R=Rg;
%diffcoeff=diffcoeffg;

dd=0;
thresholds=linspace(1.5,2.1,numthresh);

fa_data=[]; %% fa_data and ee_data are 100 by numruns arrays; each column corresponds to a threshold and each row to a different run
ee_data=[];


for kk=1:numruns
    fn(rhog,Rg,diffcoeffg);
    endt=size(UU)*[1 0]';   % endt is the index in the t-vector that corresponds to end time
    GG=gridrepresentation(c1u*UU(endt,:)');
    
    
    fa_row=[];
    ee_row=[];
    for ii=1:numthresh
        [PL,SS,EE,FA]=pattern_stats(GG,thresholds(ii),0);
        fa_row=[fa_row FA];
        ee_row=[ee_row EE];
    end
    fa_data=[fa_data; fa_row];
    ee_data=[ee_data; ee_row];
end

ee_mean=mean(ee_data);
fa_mean=mean(fa_data);

ddlist=(ee-ee_mean).^2/ee^2+(fa-fa_mean).^2/fa^2;
[dd,ii]=min(ddlist);
disp(['dist=' num2str(dd)]);

thresh=thresholds(ii);


end

