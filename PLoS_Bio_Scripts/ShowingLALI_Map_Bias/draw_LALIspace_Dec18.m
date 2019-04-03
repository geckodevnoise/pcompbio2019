
function draw_LALIspace_Dec18(f,c);


gecko_labels=[681   682   731   732   735   763   772   773];

figure(f)
for i=1:8
    gecko=gecko_labels(i);
    [D1,fu,fv,gu,gv,m,FT]=retrieve_genotype_Feb23(gecko);
    scatter(fu,FT,c,'filled')
    if gecko==731
        text(fu+.0005,FT+.025,num2str(gecko),'Color',c,'FontSize',18)
    else
        text(fu-.0015,FT+.04,num2str(gecko),'Color',c,'FontSize',18)
    end
        hold on
end

xlim([.806,.838])
ylim([1.05,1.75])
box on
set(gca,'FontSize',22)
xlabel('Activation Rate fu')
ylabel('Threshold Relative to Mean')
axis square

