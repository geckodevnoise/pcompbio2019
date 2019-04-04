load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\gecko_image_data.mat');

figure
subplot(3,1,1)
hold on
histogram(statslist(:,2)./statslist(:,1),10)
title('SS/PL');
plot(gecko_data(:,1),zeros(1,8),'o');
for i = 1:8

     % Label the points with the index

     t=text(gecko_data(i,1),-5,num2str(gecko_data(i,4)));
     t.FontSize=8;
     t.Color=[1 0 0];

end

%xlim([0.95*min(statslist(:,2)./statslist(:,1)) 1.05*max(statslist(:,2)./statslist(:,1))]);
    

subplot(3,1,2)
hold on
histogram(statslist(:,3),10)
title('EE');
plot(gecko_data(:,2),zeros(1,8),'o');
%xlim([0.95*min(statslist(:,3)) 1.05*max(statslist(:,3))]);
for i = 1:8

     % Label the points with the index

     t=text(gecko_data(i,2),-2,num2str(gecko_data(i,4)));
     t.FontSize=8;
     t.Color=[1 0 0];

end


subplot(3,1,3)
hold on
histogram(statslist(:,4),10)
title('FA');
plot(gecko_data(:,3),zeros(1,8),'o');
%xlim([0.95*min(statslist(:,4)) 1.05*max(statslist(:,4))]);
for i = 1:8

     % Label the points with the index

     t=text(gecko_data(i,3),-5,num2str(gecko_data(i,4)));
     t.FontSize=8
     t.Color=[1 0 0];

end