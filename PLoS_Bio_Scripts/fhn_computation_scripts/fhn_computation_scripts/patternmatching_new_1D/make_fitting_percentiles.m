%% This script computes the fitting percentage of each gecko in phenotype space:
%% We compute the percentage of points in phenotype space (generated from the genotype
%% of each gecko) that are closer to the mean values of FA and SS than the gecko itself.
%% (E.g. a value of '30th percentile' means that 70% of the generated points are
%% closer to the mean of the cloud than the gecko itself.


load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');
%load('optimal_param_list.mat');



tableresults=cell(9,6);
tableresults(1,:)={'Gecko ID', 'gecko FA', 'mean FA', 'gecko EE', 'mean EE', 'percentile (100%-perfect)'};



for j=1:8
    gecko_id=gecko_data(j,4);
   
%   
%     
%     if((gecko_id==763))
%         dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter40'];
%     else if((gecko_id==681)||(gecko_id==773)||(gecko_id==772)||(gecko_id==682)||(gecko_id==731))
%         dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter35'];
%         else
%         dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter20'];
%         end
%     end

    if((gecko_id==763))
        dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter40'];
    else if((gecko_id==772)||(gecko_id==682)||(gecko_id==681)||(gecko_id==773))
            dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter35'];
        else if((gecko_id==731))
                dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter50'];
            else
                dir=[num2str(gecko_id) '_TolFun0.0001_TolX0.0001_MaxIter20'];
            end
        end
    end
        
    load([dir '/optimization_results.mat']);
    load([dir '/optimal_stat.mat'],'ddlist','statslist');

    
    gecko_fa=gecko_data_pl_ss_ee_fa(j,4);
    mean_fa=mean(statslist(:,4));
    
    gecko_ee=gecko_data_pl_ss_ee_fa(j,3);
    mean_ee=mean(statslist(:,3));
    
    
    distlist=(statslist(:,3)-mean_ee).^2+(statslist(:,4)-mean_fa).^2;
    distgecko=(gecko_ee-mean_ee).^2+(gecko_fa-mean_fa).^2;
    
    percentile=sum(distlist>distgecko)/size(statslist(:,1),1)*100;
    
    
    tableresults(j+1,:)=mat2cell([gecko_id gecko_fa mean_fa gecko_ee mean_ee percentile], [1],[1 1 1 1 1 1]);
    
end


disp(tableresults);
disp('');

