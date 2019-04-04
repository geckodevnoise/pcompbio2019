
param=optimal_param;
[dd,threshold]=distance_characteristics_space_center_of_mass(param(1),param(2),param(3));
%%% make runs for checking statistics
statslist=[];
ddlist=[];
for j=1:50
    
    fn(param(1),param(2),param(3));
    endt=size(UU)*[1 0]';   % endt is the index in the t-vector that corresponds to end time
    GG=gridrepresentation(c1u*UU(endt,:)');
    
    
    ref_param=[0.8914    0.7208    0.3045]; %% reference parameters: the center of mass of the 8 images
    
    [PL,SS,EE,FA]=pattern_stats(GG,threshold,0);
    dd=abs(SS/PL-ref_param(1))^2/ref_param(1)^2+abs(EE-ref_param(2))^2/ref_param(2)^2+0.5*abs(FA-ref_param(3))^2/ref_param(3)^2;
    ddlist=[ddlist; [dd,threshold]];
    statslist=[statslist; [PL,SS,EE,FA]];
    save_pattern(GG,threshold,j)
end
save([dir '/optimal_stat.mat'],'ddlist','statslist');