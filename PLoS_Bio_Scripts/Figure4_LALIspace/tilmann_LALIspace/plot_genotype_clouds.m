percentile=15;
colors=distinguishable_colors(8);

load('percetiledata_jan18.mat','percentilemat','gecko_ids','nthresh','nrho','threshmin','threshmax','rhomin','rhomax','m','optd','optR');
percentilemat1=percentilemat;
threshmin1=threshmin;
threshmax1=threshmax;
rhomin1=rhomin;
rhomax1=rhomax;
load('percetiledata_jan25.mat','percentilemat','gecko_ids','nthresh','nrho','threshmin','threshmax','rhomin','rhomax','m','optd','optR');
percentilemat2=percentilemat;
threshmin2=threshmin;
threshmax2=threshmax;
rhomin2=rhomin;
rhomax2=rhomax;
load('percetiledata_jan30.mat','percentilemat','gecko_ids','nthresh','nrho','threshmin','threshmax','rhomin','rhomax','m','optd','optR');

percentilemat=[percentilemat1; percentilemat2; percentilemat];
threshmin=min([threshmin1 threshmin2 threshmin]);
threshmax=max([threshmax1 threshmax2 threshmax]);
rhomin=min([rhomin1 rhomin2 rhomin]);
rhomax=max([rhomax1 rhomax2 rhomax]);



       FigHandle = figure('Position', [0, 0, 500, 305]);
hold on
for i=1:8
gecko_id=gecko_ids(i);
geckopercentiledata=percentilemat(:,[1 2 i+2]);
geckopercentiledata(:,3)=(geckopercentiledata(:,3)>(100-percentile));
threshmucloud=geckopercentiledata(all(geckopercentiledata,2),:); %% delete all rows where percentile is less or equal to 80
xx=threshmucloud(:,1);
yy=threshmucloud(:,2);
dt=DelaunayTri(xx,yy);
[K AV]=convexHull(dt);
fill(xx(K),yy(K),colors(i,:));

%scatter(threshmucloud(:,1), threshmucloud(:,2), 'filled');
    xlabel('$\rho$','Interpreter','LaTeX');
    ylabel('threshold');
xlim([rhomin rhomax]);
ylim([threshmin threshmax]);
title(['Percentile density for gecko ' num2str(gecko_id)]);
end

legend(num2str(gecko_ids(1)),num2str(gecko_ids(2)),num2str(gecko_ids(3)),num2str(gecko_ids(4)),num2str(gecko_ids(5)),num2str(gecko_ids(6)),num2str(gecko_ids(7)),num2str(gecko_ids(8)))




%load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');
load('optimal_param_list.mat');


       
                 scatter(optimal_param_list(:,2), optimal_param_list(:,5),10, 'filled', 'black');
                     xlabel('$rho$');
    ylabel('threshold');
    
       
for j=1:8
 
    %% statslist=[statslist; [PL,SS,EE,FA]];


    hold on
 %   title(['Gecko ' num2str(gecko_id) ' d_{mean}=' num2str(mean(ddlist(:,1)))]);
  title(['Genotype clouds at ' num2str(percentile) 'th percentile']);
  
  gecko_id=optimal_param_list(j,1);
  rho=optimal_param_list(j,2);
  thresh=optimal_param_list(j,5);      
  
  
end

    xlabel('$\rho$','Interpreter','LaTeX');
    ylabel('threshold concentration (absolute)');
    
  %  xlim([0.03 0.07]);
   % ylim([0.5 0.9]);
    
 
     imname=[ 'optimal_param_data_absolute_threshold.png'];
    saveas(gcf,imname);
    
