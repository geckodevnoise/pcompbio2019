
function make_figures_closest_patterns(Tilmann)

gecko_labels=[681   682   731   732   735   763   772   773];

for i=1:8
    gecko=gecko_labels(i)
    Figure_find_closest_phenotypes(gecko,1,100,2,Tilmann);
    name=['closest1_gecko',num2str(gecko),'.jpg'];
    print('-djpeg',name) 
end