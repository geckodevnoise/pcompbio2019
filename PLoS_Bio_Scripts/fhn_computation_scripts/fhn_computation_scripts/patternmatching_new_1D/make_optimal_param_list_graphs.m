load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');
load('optimal_param_list.mat');

       FigHandle = figure('Position', [0, 0, 500, 305]);
       
                 scatter(optimal_param_list(:,2), optimal_param_list(:,5),3,'r');
                     xlabel('$rho$');
    ylabel('threshold');
    
       
for j=1:8
 
    %% statslist=[statslist; [PL,SS,EE,FA]];


    hold on
 %   title(['Gecko ' num2str(gecko_id) ' d_{mean}=' num2str(mean(ddlist(:,1)))]);
  title(['Optimal parameters ']);
  
  gecko_id=optimal_param_list(j,1);
  rho=optimal_param_list(j,2);
  thresh=optimal_param_list(j,5);      
  
        t=text(1.001*rho,0.999*thresh,num2str(gecko_id));
        t.FontSize=8;
        t.Color=[1 0 0];
        
    end
    xlabel('$\rho$','Interpreter','LaTeX');
    ylabel('threshold concentration (absolute)');
    
  %  xlim([0.03 0.07]);
   % ylim([0.5 0.9]);
    
 
     imname=[ 'optimal_param_data_absolute_threshold.png'];
    saveas(gcf,imname);
    
    
    
    
    
    
       FigHandle = figure('Position', [0, 0, 500, 305]);
       
                 scatter(optimal_param_list(:,2), optimal_param_list(:,6),3,'r');
                     xlabel('$rho$');
    ylabel('threshold (relative to mean concentration)');
    
       
for j=1:8
 
    %% statslist=[statslist; [PL,SS,EE,FA]];


    hold on
 %   title(['Gecko ' num2str(gecko_id) ' d_{mean}=' num2str(mean(ddlist(:,1)))]);
  title(['Optimal parameters ']);
  
  gecko_id=optimal_param_list(j,1);
  rho=optimal_param_list(j,2);
  thresh=optimal_param_list(j,6);      
  
        t=text(1.001*rho,0.999*thresh,num2str(gecko_id));
        t.FontSize=8;
        t.Color=[1 0 0];
        
    end
    xlabel('$\rho$','Interpreter','LaTeX');
    ylabel('threshold');
    
  %  xlim([0.03 0.07]);
   % ylim([0.5 0.9]);
    
 
     imname=[ 'optimal_param_data_relative_threshold.png'];
    saveas(gcf,imname);
    
