percentile=15;
colors=distinguishable_colors(8);


colors =[   0.6207    0.3103    0.2759  %681
            0.4828    0.1034    0.4138  %682
            1.0000    0.8276         0  %731
            0    0.5172    0.5862       %732
            0         0    1.0000       %735
            0    0.3448         0       %763
            1.0000    0.1034    0.7241  %772
            1.0000         0         0];%773

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
gecko_ids
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
ylim([threshmin-.05*threshmin threshmax+.05*threshmin]);
%title(['Percentile density for gecko ' num2str(gecko_id)]);
end



%legend(num2str(gecko_ids(1)),num2str(gecko_ids(2)),num2str(gecko_ids(3)),num2str(gecko_ids(4)),num2str(gecko_ids(5)),num2str(gecko_ids(6)),num2str(gecko_ids(7)),num2str(gecko_ids(8)))




%load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');
load('optimal_param_list.mat');
scatter(optimal_param_list(:,2), optimal_param_list(:,5),60, 'filled', 'black');
scatter(optimal_param_list(:,2), optimal_param_list(:,5),10, 'filled', 'white');
xlabel('$rho$');
ylabel('threshold');
    
       
for j=1:8
 
    %% statslist=[statslist; [PL,SS,EE,FA]];


    hold on
 %   title(['Gecko ' num2str(gecko_id) ' d_{mean}=' num2str(mean(ddlist(:,1)))]);
 % title(['Genotype clouds at ' num2str(percentile) 'th percentile']);
  
  gecko_id=optimal_param_list(j,1);
  rho=optimal_param_list(j,2);
  thresh=optimal_param_list(j,5); 
  
  switch gecko_id
  
      case 773
      t=text(0.955*rho,1.009*thresh,num2str(gecko_id));
      t.FontSize=18;
      t.Color=[0.1 0 0];
      
      case 732
          t=text(0.95*rho,0.985*thresh,num2str(gecko_id));
          t.FontSize=18;
          t.Color=[0.0 0.0 0.0];
          scatter(optimal_param_list(4,2), optimal_param_list(4,5),10, [0.3 0.3 0.3], 'filled');
      
      case 763         
          t=text(1.001*rho,1.009*thresh,num2str(gecko_id));
          t.FontSize=18;
          t.Color=[0.1 0 0];
              
      case 772     
          t=text(1.01*rho,.98*thresh,num2str(gecko_id));
          t.FontSize=18;
          t.Color=[0.1 0 0];
      
      case 735
          t=text(.98*rho,1.015*thresh,num2str(gecko_id));
          t.FontSize=18;
          t.Color=[0.1 0 0];
      
      case 682
          t=text(1.0005*rho,0.994*thresh,num2str(gecko_id));
          t.FontSize=18;
          t.Color=[0.1 0 0];
          
          case 681
          t=text(1.01*rho,0.999*thresh,num2str(gecko_id));
          t.FontSize=18;
          t.Color=[0.1 0 0];
          
          case 731
          t=text(1.0005*rho,0.999*thresh,num2str(gecko_id));
          t.FontSize=18;
          t.Color=[0.1 0 0];

  end
end

    xlabel('$\rho$','Interpreter','LaTeX');
    ylabel('Threshold Concentration (absolute)');
    
  %  xlim([0.03 0.07]);
   % ylim([0.5 0.9]);
    
 
     imname=[ 'optimal_param_data_absolute_threshold.png'];
    saveas(gcf,imname);
    
    set(gca,'FontSize',22)
    box on
    title('')
    axis square
