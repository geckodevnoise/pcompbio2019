global n m M deltax DDD
global maxx UU c1u c8u iniflag terminate_flag lastUU lastT

load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');
% 
% for ii=[6 8 2 3 7]
%     tic
%     optimize_pattern(gecko_data(ii,1),gecko_data(ii,2),gecko_data(ii,3),gecko_data(ii,4));
%     toc
% end

%create_pattern_data
iniflag=1;

for ii=[]  %[1 4 7 8]
     tic
     recalculate_threshold(gecko_data(ii,1),gecko_data(ii,2),gecko_data(ii,3),gecko_data(ii,4));
     toc
end
create_optimal_param;
create_pattern_data;