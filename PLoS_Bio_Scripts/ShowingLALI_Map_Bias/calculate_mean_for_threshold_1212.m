
function [mean_pixel_value,center,radius]=find_phenotype_location(fu,FractionalThreshold)

a=1;b=100;

FT=[];
for number=a:b
    [distance,PL,SS,EE,FA,FT]=draw_simulation_phenotypesDec13('EE','FA',c,f,gecko,number);
    [distance(number),FT(number)]=draw_simulation_phenotypesDec12('EE','FA',c,f,gecko,number);
    hold on
end
avgFT(g)=mean(FT)

draw_natural_phenotypesAug23('EE','FA',.03,'k')
