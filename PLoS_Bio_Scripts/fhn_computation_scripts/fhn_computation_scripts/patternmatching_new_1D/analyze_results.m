disp(['Mean distance to #732 in parameter space: ' num2str(mean(ddlist(:,1)))]);
disp(['Standard deviation of distance: ' num2str(std(ddlist(:,1)))]);


meanlist=mean(statslist)';

tableresults=cell(6,5);
tableresults(:,1)={'', 'PL', 'SS', 'EE', 'FA', 'SS/PL'};
tableresults(1,2:5)={'mean', 'std', '#732', 'percent difference'};
tableresults(2:6,4)={'', '', 0.7020,0.2939,0.8055 };
tableresults(2:5,2)=mat2cell(mean(statslist)', [1 1 1 1],[1]);
tableresults(2:5,3)=mat2cell(std(statslist)', [1 1 1 1],[1]);
tableresults(6,2:3)={mean(statslist(:,2)./statslist(:,1)), std(statslist(:,2)./statslist(:,1))};
tableresults(4:5,5)=mat2cell(100*((meanlist(3:4)-[0.7020 0.2939]')./[0.7020 0.2939]'), [1 1],[1]);
tableresults{6,5}=100*(mean(statslist(:,2)./statslist(:,1))-0.8055)/0.8055;
disp(tableresults);