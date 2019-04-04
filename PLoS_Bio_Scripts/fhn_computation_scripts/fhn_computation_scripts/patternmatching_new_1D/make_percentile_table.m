%% produces a table in which each row and each column represents a gecko.
%% The entry in cell (i,j) is the percentile of gecko i in the phenotype cloud of gecko j


percentile_table_normalized=zeros(9,9);
percentile_table_distfct=zeros(9,9);
load('U:\tglimm\texte\biology\animal_patterns_audi\fitzhugh_nagumo\patternmatching\gecko_image_data.mat');


   gecko_id=gecko_data(:,4);
percentile_table_normalized(2:9,1)=gecko_id;
percentile_table_normalized(1,2:9)=gecko_id;

percentile_table_distfct(2:9,1)=gecko_id;
percentile_table_distfct(1,2:9)=gecko_id;


for i=1:8
    for j=1:8
        [p1,p2]=find_percentile(gecko_data(i,2),gecko_data(i,3),j);
        percentile_table_normalized(i+1,j+1)=p1;
        percentile_table_distfct(i+1,j+1)=p2;
    end
end
disp('Percentile table based on z-scores of phenotype cloud');
percentile_table_normalized

disp('Percentile table based on distance function used in optimaztion of genotype');
percentile_table_distfct