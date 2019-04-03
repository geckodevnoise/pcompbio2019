
function figure_grids_Dec18

c=[.7 .7 .7];
%[centerEE,centerFA,radius]=draw_genotype_radius_1215(0.826,1.4157,0,3,'b');
vary_fu=[.814,.815,.817,.818,.819,.820,.822,.825,.826,.830,.834,.835,.838,.842,.845];
GenotypeGrid_fu=[.810,.811,.814,.817,.82,.822,.826,.83,.834];%,.838,.842,.845];
GenotypeGrid_fu=.810:.004:.834;
GenotypeGrid_FT=[1.1:.1:1.7];
size(GenotypeGrid_fu,2)*size(GenotypeGrid_FT,2)
f=11;
figure(f)
for i=1:size(GenotypeGrid_fu,2)
    for j=1:size(GenotypeGrid_FT,2) 
        GenotypeGrid_fu(i)
        GenotypeGrid_FT(j)
        scatter(GenotypeGrid_fu(i),GenotypeGrid_FT(j),'filled','MarkerFaceColor',c)
        hold on
    end
end
figure(f)
for i=1:(size(GenotypeGrid_fu,2)-1)
    for j=1:size(GenotypeGrid_FT,2) 
        line([GenotypeGrid_fu(i),GenotypeGrid_fu(i+1)],[GenotypeGrid_FT(j),GenotypeGrid_FT(j)],'Color',c)
        hold on
    end
end
for i=1:size(GenotypeGrid_fu,2)
    for j=1:(size(GenotypeGrid_FT,2)-1) 
        line([GenotypeGrid_fu(i),GenotypeGrid_fu(i)],[GenotypeGrid_FT(j),GenotypeGrid_FT(j+1)],'Color',c)
        hold on
    end
end
set(gca,'YTick',[1.1:.2:1.7])

draw_LALIspace_Dec18(f,'k');
xlim([.806,.838])
ylim([1.01,1.79])
box on
set(gca,'FontSize',22)
xlabel('Activation Rate fu')
ylabel('Threshold Relative to Mean')
axis square




figure(102)
f=102;
PhenotypeMatrix=zeros(size(GenotypeGrid_fu,2),size(GenotypeGrid_FT,2));
PhenotypeMatrix(:,:,1) =[0.5590    0.5449    0.5362    0.5221    0.5108    0.5019    0.4880
    0.6795    0.6637    0.6521    0.6345    0.6234    0.6112    0.6007
    0.7740    0.7570    0.7421    0.7236    0.7123    0.6970    0.6830
    0.8607    0.8426    0.8264    0.8095    0.7968    0.7769    0.7580
    0.9144    0.9039    0.8902    0.8652    0.8471    0.8232    0.8034
    0.9429    0.9380    0.9258    0.9064    0.8862    0.8652    0.8389
    0.9319    0.9436    0.9340    0.9141    0.8937    0.8705    0.8406];
PhenotypeMatrix(:,:,2) =[0.7349    0.5974    0.4696    0.3492    0.2355    0.1273    0.0247
    0.8427    0.6919    0.5499    0.4140    0.2861    0.1660    0.0518
    0.9613    0.7904    0.6279    0.4756    0.3319    0.1950    0.0652
    1.0837    0.8884    0.7025    0.5272    0.3612    0.2040    0.0544
    1.2059    0.9765    0.7582    0.5507    0.3557    0.1713   -0.0020
    1.3374    1.0625    0.7993    0.5481    0.3119    0.0912   -0.1130
    1.4351    1.0955    0.7707    0.4632    0.1776   -0.0845   -0.3225];

% Make PhenotypeMatrix
% count=0;
% PhenotypeMatrix=zeros(size(GenotypeGrid_fu,2),size(GenotypeGrid_FT,2),2);
% for i=1:size(GenotypeGrid_fu,2)
%     for j=1:size(GenotypeGrid_FT,2) 
%         count=count+1
%         fu=GenotypeGrid_fu(i);
%         FT=GenotypeGrid_FT(j);
%         [centerEE,centerFA,radius]=draw_genotype_radius_1215(fu,FT,0,f,'b');
%         PhenotypeMatrix(i,j,1)=centerEE;
%         PhenotypeMatrix(i,j,2)=centerFA;
%         hold on
%     end
% end
figure(107)
for i=1:size(GenotypeGrid_fu,2)
    for j=1:size(GenotypeGrid_FT,2) 
        scatter(PhenotypeMatrix(i,j,1),PhenotypeMatrix(i,j,2),'filled','MarkerFaceColor',c)
        hold on
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

