load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');
%load('optimal_param_list.mat');


for j=1:8
    gecko_id=gecko_data(j,4);
   
   
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

    
    gecko_ss=gecko_data_pl_ss_ee_fa(j,2);
    mean_ss=mean(statslist(:,2));
    
    optrho=optimal_param;
optR=iniR;
optd=inid;
    %% statslist=[statslist; [PL,SS,EE,FA]];
       FigHandle = figure('Position', [0, 0, 900, 305]);
    subplot(1,3,1)
    hold on
 %   title(['Gecko ' num2str(gecko_id) ' d_{mean}=' num2str(mean(ddlist(:,1)))]);
  title(['Gecko ' num2str(gecko_id) ]);
    scatter(statslist(:,2)*gecko_ss/mean_ss, statslist(:,3),3,'filled');
    scatter(gecko_data_pl_ss_ee_fa(:,2), gecko_data_pl_ss_ee_fa(:,3),3,'r');
    
    for i = 1:8
        
        % Label the points with the index
        
        t=text(1.01*gecko_data_pl_ss_ee_fa(i,2),0.99*gecko_data_pl_ss_ee_fa(i,3),num2str(gecko_data(i,4)));
        t.FontSize=8;
        t.Color=[1 0 0];
        
    end
    xlabel('SS');
    ylabel('EE');
    
    xlim([0.03 0.07]);
    ylim([0.5 0.9]);
    
    subplot(1,3,2)
    hold on
    title(['optimal param rho=' num2str(optrho), '  R=' num2str(optR) ]);
    scatter(statslist(:,2)*gecko_ss/mean_ss, statslist(:,4),3,'filled');
    scatter(gecko_data_pl_ss_ee_fa(:,2), gecko_data_pl_ss_ee_fa(:,4),3,'r');
    
    for i = 1:8
        
        % Label the points with the index
        
        t=text(1.01*gecko_data_pl_ss_ee_fa(i,2),0.99*gecko_data_pl_ss_ee_fa(i,4),num2str(gecko_data_pl_ss_ee_fa(i,5)));
        t.FontSize=8;
        t.Color=[1 0 0];
        
    end
    
    %xlim([0.95*min(statslist(:,2)./statslist(:,1)) 1.05*max(statslist(:,2)./statslist(:,1))]);
    xlabel('SS');
    ylabel('FA');
    
    xlim([0.03 0.07]);
        ylim([0.22 0.36]);
    
    
    subplot(1,3,3)
    hold on
    


%   title(['Gecko ' num2str(gecko_id) ' optimal param rho=' num2str(optrho), '  R=' num2str(optR) '   d=' num2str(optd)]);
    scatter(statslist(:,3), statslist(:,4),3,'filled');
    scatter(gecko_data(:,2), gecko_data(:,3),3,'r');
    
    for i = 1:8
        
        % Label the points with the index
        
        t=text(1.01*gecko_data(i,2),0.99*gecko_data(i,3),num2str(gecko_data(i,4)));
        t.FontSize=8;
        t.Color=[1 0 0];
        
    end
    
        xlabel('EE');
    ylabel('FA');
    
    %xlim([0.95*min(statslist(:,2)./statslist(:,1)) 1.05*max(statslist(:,2)./statslist(:,1))]);
  
     imname=[ num2str(gecko_id) '_data.png'];
    saveas(gcf,imname);
end
