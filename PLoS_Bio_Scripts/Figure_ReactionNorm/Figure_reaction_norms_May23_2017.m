
function Figure_reaction_norms_May23_2017


gecko_labels=[681   682   731   732   735   763   772   773];
colors = [0   0     0     100   100   100     20    51    62     0     0     0
          0     51   80     0    10    82    54    51    31   100    51     0
        100     58     75    0    72     0     20   100    27    75    58    48]'/100;
figure(1)
hold off
for i=1:8
    gecko=gecko_labels(i)
    for number=1:100
        [EE,FA]=stats_one_phenotype_cutgeckoA_May23_2017(gecko,number,0);
        %scatter(EE,FA,[],'MarkerEdgeColor',colors(i,:),'MarkerFaceColor',[.7 .7 .7],'LineWidth',3)
        scatter(EE,FA,[],'MarkerEdgeColor',colors(i,:),'LineWidth',3)
        hold on
    end
end

draw_natural_phenotypes_May22_2017
xlim([0.45,0.96]);
ylim([0.14,0.38]);
ylim([0.13,0.375]);
axis square