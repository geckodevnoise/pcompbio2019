load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');

optimal_param_list=[];

for j=1:8
    gecko_id=gecko_data(j,4);
   
        dir=[num2str(gecko_id)];
       

    load([dir '/optimization_results.mat']);
   % load([dir '/optimal_stat.mat'],'ddlist','statslist');
  %  load([dir '/mean_concentrations.mat'],'mm');
  
  mm=1;

    optrho=optimal_param(1);
optR=iniR;
optd=inid;
optthresh=threshold;

optimal_param_list=[optimal_param_list; gecko_id optrho optR optd optthresh optthresh/mm mm];

end
save('optimal_param_list.mat', 'optimal_param_list');