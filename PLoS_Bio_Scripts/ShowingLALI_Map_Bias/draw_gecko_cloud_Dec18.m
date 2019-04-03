
function draw_gecko_cloud_Dec18(gecko,c,f)

a=1;
b=100;
[D1,fu,fv,gu,gv,m,FT]=retrieve_genotype_Dec18(gecko);
for number=a:b
    [PL,SS,normalizedX,normalizedY,FT]=draw_genotype_phenotype_Dec18(c,f,fu,FT,number);
 hold on
end

[Xmin,Xmax,Xm,Xticks,Ymin,Ymax,Ym,Yticks]=draw_natural_phenotypes_Dec18(.0,'k');

ylim([-0.1,1.125])
xlim([0,1.05])
xlim([0.4,1.125])
%xlim([.35,1.2])
Xticks2=Xm*(Xticks-Xmax)+1;
Yticks2=Ym*(Yticks-Ymax)+1;
set(gca,'XTick',Xticks2)
set(gca,'XTickLabel',Xticks)
Xticks=['0.50';'0.55';'0.60';'0.65';'0.70';'0.75';'0.80'];
set(gca,'XTickLabel',Xticks)
set(gca,'YTick',Yticks2)
Yticks=['0.25';'0.30';'0.35'];
set(gca,'YTickLabel',Yticks)
