
function [centerEE,centerFA,radius]=draw_gecko_radius_Dec18(gecko,percent_inclusion,f,c)

a=1;b=100;
EE=[];
FA=[];

[D1,fu,fv,gu,gv,m,FT]=retrieve_genotype_Dec18(gecko);
for number=a:b
    [PL,SS,EE(number),FA(number),FT]=draw_genotype_phenotype_Dec18(0,0,fu,FT,number);
end
hold on
 
centerEE=mean(EE);
centerFA=mean(FA);
radius=0;
if percent_inclusion==0
    scatter(centerEE,centerFA,'filled',c)
else
    distances=[];
    for number=a:b
        distances(number)=sqrt( (EE(number)-centerEE)^2 + (FA(number)-centerFA)^2);
    end
    distances=sort(distances,'ascend');
    size(distances);
    percent_inclusion;
    ceil(percent_inclusion/100*b);
    radius=(distances(ceil(percent_inclusion/100*b)));
    viscircles([centerEE,centerFA],radius,'Color',c);
end

%draw_natural_phenotypesAug23('EE','FA',.03,'k')
[Xmin,Xmax,Xm,Xticks,Ymin,Ymax,Ym,Yticks]=draw_natural_phenotypes_Dec18(.0,'k');



