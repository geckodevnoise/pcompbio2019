
%This is the script for generating the time series.

%modified from generate_phenotypes_Feb23




function generate_phenotypes_Nov30_2018(gecko,a,b);



global geckoA
global geckoB
global TimeSteps

gecko=682;
gecko=735;
[D1,fu,fv,gu,gv,m,threshold]=retrieve_genotype_Feb23(gecko);
deltaT=1000;
for time=1:(600000/deltaT)
    if time==1
        [geckoA,geckoB]=RxnDiff_specifyALL(1,D1,fu,fv,gu,deltaT,3);
    else
        [geckoA,geckoB]=RxnDiff_specifyALL(0,D1,fu,fv,gu,deltaT,3);
    end
    cd(['TimeSeriesGecko',num2str(gecko)])
    name=['gecko',num2str(gecko),'phenotype',num2str(10000000+time*deltaT),'.mat']
    save(name,'geckoA')
    figure(3)
    name=['gecko',num2str(gecko),'phenotype',num2str(10000000+time*deltaT),'.jpg']
    print('-djpeg',name)
    cd ..
end

