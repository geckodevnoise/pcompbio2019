%%% make runs for checking statistics
statslist=[];
ddlist=[];
for j=1:50
    
    fn(param(1),param(2),param(3));
    endt=size(UU)*[1 0]';   % endt is the index in the t-vector that corresponds to end time
    GG=gridrepresentation(c1u*UU(endt,:)');
    
    [PL,SS,EE,FA]=pattern_stats(GG,threshold,0);  
    ref_param=[0.8340    0.7810    0.2680]; %% reference parameters: gecko 735
    dd=abs(SS/PL-ref_param(1))^2/ref_param(1)^2+abs(EE-ref_param(2))^2/ref_param(2)^2+0.5*abs(FA-ref_param(3))^2/ref_param(3)^2;
  
    ddlist=[ddlist; [dd,threshold]];
    statslist=[statslist; [PL,SS,EE,FA]];
    save_pattern(GG,threshold,j)
end
save([dir '/optimal_stat.mat'],'ddlist','statslist');
