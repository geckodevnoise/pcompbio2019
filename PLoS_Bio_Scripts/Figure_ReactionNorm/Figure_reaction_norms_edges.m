
function Figure_reaction_norms_closest50

b=100;
gecko_labels=[681   682   731   732   735   763   772   773];
gecko_labels=[773   735   682   772   731   763   732   681];
colors = [0   0     0     100   100   100     20    51    62     0     0     0
          0     51   80     0    10    82    54    51    31   100    51     0
        100     58     75    0    72     0     20   100    27    75    58    48]'/100;
q=[1.0000    1.0000    1.0000
    1.0000         0         0
         0         0    1.0000
    0.4828    0.1034    0.4138
    1.0000    0.1034    0.7241
    1.0000    0.8276         0
         0    0.3448         0
         0    0.5172    0.5862
    0.6207    0.3103    0.2759
         0    1.0000    0.7586
         0    0.5172    0.5862
         0         0    0.4828
    0.5862    0.8276    0.3103
    0.7500    0.7500    0.7500
    0.8276    0.0690    1.0000
    0.4828    0.1034    0.4138];
figure(2)
hold off

for i=1:8
    gecko=gecko_labels(i)
    for number=1:b
        [EE,FA]=stats_one_phenotype_cutgeckoA_May23_2017(gecko,number,0);
        %scatter(EE,FA,[],'MarkerEdgeColor',colors(i,:),'MarkerFaceColor',[.7 .7 .7],'LineWidth',3)
        %scatter(EE,FA,[],'MarkerEdgeColor',colors(i,:),'LineWidth',3)
        %hold on
        setFA(number)=FA;
        setEE(number)=EE;
    end
    
    %plot only if in most likely 50%
    meanFA=mean(setFA);
    meanEE=mean(setEE);
    stdFA=std(setFA);
    stdEE=std(setEE);
    %normedFA=(setFA-meanFA)/stdFA;
    %normedEE=(setEE-meanEE)/stdEE;
    %using Tilmann's function
    normedFA=(setFA-meanFA)/meanFA;
    normedEE=(setEE-meanEE)/meanEE;

    distances=sqrt(normedFA.^2+normedEE.^2);
    sorted_distances=sort(distances);
    radius=sorted_distances(fix(b*.5));
%     for j=1:b
%         if distances(j)<radius
%             j=j
%             c=[.5 .5 .6];%colors(1,:);
%             %scatter(setEE(i),setFA(i),sss,'MarkerEdgeColor',[.7 .7 .7],'MarkerFaceColor',c)
%             scatter(setEE(j),setFA(j),[],'MarkerEdgeColor',colors(i,:),'LineWidth',3)
%             hold on
%         end
%     end
    k=boundary([setEE;setFA]',0);
    plot(setEE(k),setFA(k),'Color',q(i+1,:),'LineWidth',2)
    hold on
    

    
end
draw_natural_phenotypes_Dec19_2017
xlim([0.41,0.97]);
ylim([0.14,0.38]);
axis square
set(gca,'FontSize',20)