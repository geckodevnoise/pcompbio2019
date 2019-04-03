
function [centerEE,centerFA,radius]=draw_genotype_radius_Dec18(fu,FractionalThreshold,percent_inclusion,f,c)

a=1;b=100;
EE=[];
FA=[];


for number=a:b
    [PL,SS,EE(number),FA(number),FT]=draw_genotype_phenotype_Dec18(0,f,fu,FractionalThreshold,number);
end
hold on
 
centerEE=mean(EE);
centerFA=mean(FA);
if sum(EE<0)>0
    centerEE=0;
    centerFA=0;
end
radius=0;
if percent_inclusion==0
    scatter(centerEE,centerFA,'filled',c)
else
    distances=[];
    for number=a:b
        distances(number)=sqrt( (EE(number)-centerEE)^2 + (FA(number)-centerFA)^2);
    end
    distances=sort(distances,'ascend');
    ceil(percent_inclusion/100*b)'
    radius=(distances(ceil(percent_inclusion/100*b)));
    viscircles([centerEE,centerFA],radius,'Color',c);
end

%draw_natural_phenotypesAug23('EE','FA',.03,'k')
[Xmin,Xmax,Xm,Xticks,Ymin,Ymax,Ym,Yticks]=draw_natural_phenotypes_Dec18(.0,'k');



