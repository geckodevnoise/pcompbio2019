

%pick a genotype [fu_g,FT_g]
%and a gecko

%this function looks at the cloud of that genotype
%and determines how well the gecko fits in that cloud
%[centerEE,centerFA,normalizedFA,normalizedEE,percent_distance]=distance_from_phenotype_center_Dec23(fu_g,FT_g,gecko);



vary_fu_g=.8:.001:.86;%61
vary_fu_g=.8:.005:.86;%13
vary_FT_g=0.80:.0175:1.85;%61
vary_FT_g=0.80:.0875:1.85;%61
vary_FT_g=0:.02:3;
gecko_limits=[  772  .810  .828 0.84  1.30
                735  .820  .845 1.30  1.70
                682  .818  .838 1.20  1.50
                731  .810  .832 1.10  1.50
                763  .810  .832 1.10  1.50
                773  .810  .824 1.40  1.4
                732  .810  .828 1.30  1.70
                681  .807  .820 0.84  1.40
                301  .810  .815 0.00  0.16
                302  .816  .820 0.10  0.48
                303  .821  .830 0.44  1.00
                304  .831  .838 0.94  1.18
                305  .816  .838 0.00  0.10
                306  .821  .838 0.10  0.44
                307  .831  .838 0.44  1.00
                308  .810  .838 1.56  2.00
                309  .834  .838 1.40  1.56
                310  .838  .842 0.00  1.85
                311 .843   .845 0.00  1.85
                312  .820  .830 0.82  1.22
                313  .807  .820 0.82  1.22
                314  .830  .845 0.82  1.22
                315  .800  .806 0.82  1.22
                316  .800  .806 1.22  1.85
                317  .808  .809 1.22  1.85
                318  .807  .807 1.22  1.85
                319  .845  .850 1.20  1.40
                320 .838  .850 1.10  1.40
                321 .800  .810 1.10  1.20];

if 1==1
            
for k=29:29
gecko=gecko_limits(k,1)
minFU=gecko_limits(k,2);
maxFU=gecko_limits(k,3);
minFT=gecko_limits(k,4);
maxFT=gecko_limits(k,5);
%for all geckos
vary_fu_g=.8:.001:.85;
vary_FT_g=0:.02:3;
distance_grid_b=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
max_count=size(minFU:.001:maxFU,2)*size(minFT:.02:maxFT,2)
count=0;
for fu_g=minFU:.001:maxFU
    for FT_g=minFT:.02:maxFT
        count=count+1
        if gecko>500
            [cEE,cFA,nFA,nEE,percent_distance]=distance_from_phenotype_center_Apr17(fu_g,FT_g,gecko);
        else
            [cEE,cFA,nFA,nEE,percent_distance]=distance_from_phenotype_center_Apr17(fu_g,FT_g,682);
        end
        i=find(abs(vary_fu_g-fu_g)==min(abs(vary_fu_g-fu_g)));
        j=find(abs(vary_FT_g-FT_g)==min(abs(vary_FT_g-FT_g)));
        distance_grid_b(j,i)=percent_distance;
        if cFA<0
           distance_grid_b(j,i)=111;
        end
        if cFA>1.2
           distance_grid_b(j,i)=112;
        end
    end
end
distance_grid=distance_grid_b;
save(['distance_grid_',num2str(gecko),'c.mat'],'distance_grid')
end

end



vary_fu_g=.8:.001:.85;
vary_FT_g=0:.02:3;
distance_grid_all=zeros(size(vary_FT_g,2),size(vary_fu_g,2));
boundary=zeros(size(vary_FT_g,2),size(vary_fu_g,2));

for k=1:28
    gecko=gecko_limits(k,1)
    load(['distance_grid_',num2str(gecko),'c.mat'])
    %pattern=(distance_grid<99).*(distance_grid>0)+(distance_grid<50).*(distance_grid>0)*k;
    boundary=max(boundary,distance_grid==111);
    boundary=max(boundary,distance_grid==112);
    if max(gecko==[763 735 773 681])
        pattern=(distance_grid<50).*(distance_grid>0)*5;
    else
        pattern=(distance_grid<50).*(distance_grid>0)*8;
    end
    distance_grid_all=distance_grid_all+pattern;
end

distance_grid_all=distance_grid_all+14*boundary;
distance_grid_all(distance_grid_all==0)=16;
distance_grid_all(distance_grid_all==13)=8;
figure(11),hold off, image(distance_grid_all)
axis xy
colormap vga
colormap gray
Xticks=(11:10:46); 
set(gca,'XTick',(Xticks))
set(gca,'XTickLabel',vary_fu_g(Xticks))
Yticks=(26:10:140); 
set(gca,'YTick',(Yticks))
set(gca,'YTickLabel',vary_FT_g(Yticks))
xlim([2,46])
ylim([42,93])
set(gca,'FontSize',22)
xlabel('Activation Rate {f_u}')
ylabel('Threshold Relative to Mean')
hold on
gecko_labels=[681   682   731   732   735   763   772   773];
for i=1:8
    gecko=gecko_labels(i);
    cd ../GeckoMatFiles
    [D1,fu,fv,gu,gv,m,FT]=retrieve_genotype_Feb23(gecko);
    cd ../Figure4_LALIspace
    i=min(find(abs(vary_fu_g-fu)==min(abs(vary_fu_g-fu))));
    j=min(find(abs(vary_FT_g-FT)==min(abs(vary_FT_g-FT))));
    scatter(i,j,80,'k','filled')
    scatter(i,j,20,'w','filled')
    if gecko==682
        scatter(i,j,80,'k','filled')
        scatter(i,j,20,'w','filled')
    end
    if gecko==731
        text(i+1,j+3,num2str(gecko),'Color',[0 0 0],'FontSize',18)
    elseif gecko==735
        text(i+1,j+3,num2str(gecko),'Color',[0 0 0],'FontSize',18)
    else
        text(i-2,j+3,num2str(gecko),'Color',[0 0 0],'FontSize',18)
    end
        hold on
end

axis square

fu=.806;FT=1.75;
i=min(find(abs(vary_fu_g-fu)==min(abs(vary_fu_g-fu))));
j=min(find(abs(vary_FT_g-FT)==min(abs(vary_FT_g-FT))));
scatter(i,j,100,'p','k','filled')
text(i+1,j,'A','Color',[0 0 0],'FontSize',18)

fu=.805;FT=1.1;
fu=.804;FT=1.0;
i=min(find(abs(vary_fu_g-fu)==min(abs(vary_fu_g-fu))));
j=min(find(abs(vary_FT_g-FT)==min(abs(vary_FT_g-FT))));
%scatter(i,j,80,[.6 .6 .6],'filled')
scatter(i,j,100,'p','k','filled')
text(i+1,j,'B','Color',[0 0 0],'FontSize',18)

fu=.84;FT=1.7;
i=min(find(abs(vary_fu_g-fu)==min(abs(vary_fu_g-fu))));
j=min(find(abs(vary_FT_g-FT)==min(abs(vary_FT_g-FT))));
scatter(i,j,100,'p','k','filled')
text(i+1,j,'C','Color',[0 0 0],'FontSize',18)
fu=.835;FT=0.9;
i=min(find(abs(vary_fu_g-fu)==min(abs(vary_fu_g-fu))));
j=min(find(abs(vary_FT_g-FT)==min(abs(vary_FT_g-FT))));
scatter(i,j,100,'p','k','filled')
text(i+1,j,'D','Color',[0 0 0],'FontSize',18)





