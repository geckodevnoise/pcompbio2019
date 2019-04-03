
c=[.7 .7 .7];

GenotypeGrid_fu=.810:.004:.830,.831:.001:.836;
GenotypeGrid_FT=[0.5:.25:1.25];
size(GenotypeGrid_fu,2)*size(GenotypeGrid_FT,2)

%Make PhenotypeMatrix
count=0;
PhenotypeMatrix=zeros(size(GenotypeGrid_fu,2),size(GenotypeGrid_FT,2),2);
for i=1:size(GenotypeGrid_fu,2)
    for j=1:size(GenotypeGrid_FT,2) 
        count=count+1
        fu=GenotypeGrid_fu(i);
        FT=GenotypeGrid_FT(j);
        [centerEE,centerFA,radius]=draw_genotype_radius_Dec18(fu,FT,0,f,'b');
        PhenotypeMatrix(i,j,1)=centerEE;
        PhenotypeMatrix(i,j,2)=centerFA;
        hold on
    end
end



figure(107)
for i=1:size(GenotypeGrid_fu,2)
    for j=1:size(GenotypeGrid_FT,2) 
        scatter(PhenotypeMatrix(i,j,1),PhenotypeMatrix(i,j,2),'filled','MarkerFaceColor',c)
        hold on
        if i==5
            scatter(PhenotypeMatrix(i,j,1),PhenotypeMatrix(i,j,2),'filled','MarkerFaceColor','m')
        end
    end
end

for i=1:(size(GenotypeGrid_fu,2)-1)
    for j=1:size(GenotypeGrid_FT,2) 
        line([PhenotypeMatrix(i,j,1),PhenotypeMatrix(i+1,j,1)],[PhenotypeMatrix(i,j,2),PhenotypeMatrix(i+1,j,2)],'Color',c)
        hold on
    end
end
for i=1:(size(GenotypeGrid_fu,2))
    for j=1:(size(GenotypeGrid_FT,2)-1) 
        line([PhenotypeMatrix(i,j,1),PhenotypeMatrix(i,j+1,1)],[PhenotypeMatrix(i,j,2),PhenotypeMatrix(i,j+1,2)],'Color',c)
        hold on
    end
end

[Xmin,Xmax,Xm,Xticks,Ymin,Ymax,Ym,Yticks]=draw_natural_phenotypes_Dec18(.0,'k')

y=4;%'FA'
Yticks=0.15:0.05:.45;
%Yticks=0.2:0.1:.4;
Yticks2=Ym*(Yticks-Ymax)+1;
set(gca,'YTick',Yticks2)
set(gca,'YTickLabel',Yticks)
xlim([.4,1.1])
ylim([-.5,1.6])