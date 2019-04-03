
%these are used for image processing
%they are NOT rotated

gecko_labels=[681   682   731   732   735   763   772   773];

f=10;
for i=1:8
    gecko=gecko_labels(i);
    FirstFigure_UncutHead_Jan28_2016(gecko,f);
    
    axis off
    axis equal
    set(gca, 'LooseInset', [0,0,0,0]);
    print('-djpeg',['UncutGeckoRectangle',num2str(gecko),'.jpg'])
end
    