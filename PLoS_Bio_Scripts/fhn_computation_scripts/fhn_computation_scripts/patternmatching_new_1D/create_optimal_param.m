load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');

optimal_param_list=[];

for j=1:8
    gecko_id=gecko_data(j,4);
   
  if((gecko_id==763))
        dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter40'];
    else if((gecko_id==772)||(gecko_id==682)||(gecko_id==681)||(gecko_id==773)||(gecko_id==731))
            dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter35'];
        else %if((gecko_id==731))
              %  dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter35'];
            %else
                dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter20'];
            %end
        end
    end

    load([dir '/optimization_results.mat']);
    load([dir '/optimal_stat.mat'],'ddlist','statslist');
    load([dir '/mean_concentrations.mat'],'mm');

    optrho=optimal_param(1);
optR=iniR;
optd=inid;
optthresh=threshold;

optimal_param_list=[optimal_param_list; gecko_id optrho optR optd optthresh optthresh/mm mm];

end
save('optimal_param_list.mat', 'optimal_param_list');