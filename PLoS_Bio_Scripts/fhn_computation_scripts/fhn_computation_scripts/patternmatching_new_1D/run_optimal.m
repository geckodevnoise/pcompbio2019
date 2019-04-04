


statslist=[];
ddlist=[];
for j=1:30
    [dd,threshold]=distance_characteristics_space(3.075,0.0380,0.0212);
    GG=gridrepresentation(c1u*UU(endt,:)');
    [PL,SS,EE,FA]=pattern_stats(GG,threshold,0);
    ddlist=[ddlist; [dd,threshold]];
    statslist=[statslist; [PL,SS,EE,FA]];
    save_pattern(GG,threshold,j)
end
save([dir '/optimal_stat.mat'],'ddlist','statslist');
    
    