
%this subroutine plots the cloud for #682 only
%it sorts the cloud points by distance from center
%and colors those that are closest or furthest 
%different colors

function Figure_reaction_norm_focus_682_Tilmann

b=200;%how many simulated patterns to consider

gecko_labels=[681   682   731   732   735   763   772   773];
colors = [0   0     0     100   100   100     20    51    62     0     0     0
          0     51   80     0    10    82    54    51    31   100    51     0
        100     58     75    0    72     0     20   100    27    75    58    48]'/100;

%visit each pattern one at a time
%and cut to the right size
%and plot the EE and FA statistics for that pattern
figure(2)
sss=50;%20 for size of the scatter points
hold off
setFA=[];
setEE=[];
for i=1:8 %consider 2nd gecko only (#682)
    gecko=gecko_labels(i);
    for number=1:b
        [EE,FA]=stats_one_phenotype_cutTilmannPatterns_May24_2017(gecko,number,0);
        %scatter(EE,FA,sss,'MarkerEdgeColor',colors(2,:),'MarkerFaceColor',colors(2,:))
        scatter(EE,FA,[],'MarkerEdgeColor',colors(i,:),'LineWidth',3)
        hold on
    end
end







draw_natural_phenotypes_May22_2017
xlim([0.45,0.96]);
ylim([0.14,0.38]);
ylim([0.13,0.375]);
axis square

%scatter(meanEE,meanFA,100,'mp','filled')