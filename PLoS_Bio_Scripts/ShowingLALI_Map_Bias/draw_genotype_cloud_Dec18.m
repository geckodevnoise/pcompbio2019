
function draw_genotype_cloud_Dec18(fu,FT,c,f)

a=1;
b=100;

for number=a:b
    [PL,SS,normalizedX,normalizedY,FT]=draw_genotype_phenotype_Dec18(c,f,fu,FT,number);
    hold on
end

[Xmin,Xmax,Xm,Xticks,Ymin,Ymax,Ym,Yticks]=draw_natural_phenotypes_Dec18(.0,'r');