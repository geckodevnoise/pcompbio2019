load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');
%load('optimal_param_list.mat');
colors=distinguishable_colors(8);

figure 
hold on

for j=1:8
    gecko_id=gecko_data(j,4);
   
    dir=[num2str(gecko_id)];
      
        
    load([dir '/optimization_results.mat']);
    load([dir '/optimal_stat.mat'],'ddlist','statslist');

    
    gecko_ss=gecko_data_pl_ss_ee_fa(j,2);
    mean_ss=mean(statslist(:,2));
    
    optrho=optimal_param;
optR=iniR;
optd=inid;
    %% statslist=[statslist; [PL,SS,EE,FA]];
   %    FigHandle = figure('Position', [0, 0, 900, 305]);
 


%   title(['Gecko ' num2str(gecko_id) ' optimal param rho=' num2str(optrho), '  R=' num2str(optR) '   d=' num2str(optd)]);
    scatter(statslist(:,3), statslist(:,4),30,'filled', 'MarkerFaceColor', colors(j,:));
end
    

    
    for i = 1:8
        scatter(gecko_data(i,2), gecko_data(i,3),60,'filled', 'MarkerFaceColor', colors(i,:),'MarkerEdgeColor', 'black', 'LineWidth',2.5);
        % Label the points with the index
        
        t=text(1.01*gecko_data(i,2),0.99*gecko_data(i,3),num2str(gecko_data(i,4)));
        t.FontSize=15;
        t.Color=[0.1 0 0];
        
    end
    
        xlabel('EE');
    ylabel('FA');
    
     title(['Phenotype clouds for each genotype parameter sets']);
  
legend(num2str(gecko_id(1)),num2str(gecko_id(2)),num2str(gecko_id(3)),num2str(gecko_id(4)),num2str(gecko_id(5)),num2str(gecko_id(6)),num2str(gecko_id(7)),num2str(gecko_id(8)))



    
    %xlim([0.95*min(statslist(:,2)./statslist(:,1)) 1.05*max(statslist(:,2)./statslist(:,1))]);
  
     imname=[ num2str(gecko_id) '_data.png'];
    saveas(gcf,imname);
