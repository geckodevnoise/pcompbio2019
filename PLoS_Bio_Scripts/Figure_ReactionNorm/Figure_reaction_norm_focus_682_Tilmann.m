
%this subroutine plots the cloud for #682 only
%it sorts the cloud points by distance from center
%and colors those that are closest or furthest 
%different colors

function Figure_reaction_norm_focus_682_Tilmann

b=1000;%how many simulated patterns to consider

gecko_labels=[681   682   731   732   735   763   772   773];
colors = [0   0     0     100   100   100     0    51    62     0     0     0
          0     51   100     0    10    82    34    51    31   100    51     0
        100     58     75    0    72     0     0   100    27    75    58    48]'/100;

%visit each pattern one at a time
%and cut to the right size
%and plot the EE and FA statistics for that pattern
figure(2)
sss=20;%20 for size of the scatter points
hold off
setFA=[];
setEE=[];
for i=2:2 %consider 2nd gecko only (#682)
    gecko=gecko_labels(i);
    for number=1:b
        [EE,FA]=stats_one_phenotype_cutTilmannPatterns_May24_2017(gecko,number,0);
        %scatter(EE,FA,sss,'MarkerEdgeColor',colors(2,:),'MarkerFaceColor',colors(2,:))
        %scatter(EE,FA,sss,'MarkerEdgeColor',[.7 .7 .7],'MarkerFaceColor',[.7 .7 .7])

        %hold on
        
        setFA(number)=FA;
        setEE(number)=EE;
    end
end

%if interested in their relative differences from the center
%can plot the closest and furthest %s in different colors
meanFA=mean(setFA);
meanEE=mean(setEE);
stdFA=std(setFA);
stdEE=std(setEE);
normedFA=(setFA-meanFA)/stdFA;
normedEE=(setEE-meanEE)/stdEE;
%using Tilmann's function
normedFA=(setFA-meanFA)/meanFA;
normedEE=(setEE-meanEE)/meanEE;


distances=sqrt(normedFA.^2+normedEE.^2);
sorted_distances=sort(distances);
radius=sorted_distances(fix(b*.5));
radius2=sorted_distances(fix(b*.95));
%radius=sorted_distances(fix(b*.01));
%radius2=sorted_distances(fix(b*.95));

for i=1:b
    if distances(i)>radius
        c=[.7 .7 .7];%colors(4,:);
        scatter(setEE(i),setFA(i),sss,'MarkerEdgeColor',c,'MarkerFaceColor',c)
        hold on
    end
end
for i=1:b
    if distances(i)<radius
        i=i
        c=[.2 .2 .4];%colors(1,:);
        %scatter(setEE(i),setFA(i),sss,'MarkerEdgeColor',[.7 .7 .7],'MarkerFaceColor',c)
        scatter(setEE(i),setFA(i),sss,'MarkerEdgeColor',c,'MarkerFaceColor',[.7 .7 .7],'LineWidth',2)
        hold on
    end
end
sss=50;
for i=1:3
    i=i
    c=[.7 .0 .3];%colors(1,:);
    scatter(setEE(i),setFA(i),sss,'MarkerEdgeColor',c,'MarkerFaceColor',c,'LineWidth',2)
    hold on
end


draw_natural_phenotypes_May22_2017
axis square
xlim([0.55,0.93]);
ylim([0.21,0.37]);

%scatter(meanEE,meanFA,100,'mp','filled')