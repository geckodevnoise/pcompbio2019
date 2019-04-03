
%these are not the ones used for image processing
%could be updated later to correct this

gecko_labels=[681   682   731   732   735   763   772   773];

for i=1:8
    gecko=gecko_labels(i);
    FirstFigure_SkeletonizedHead_Jan28_2016(gecko,3);
    set(gca, 'LooseInset', [0,0,0,0]);
    %set(gca,'LooseInset',get(gca,'TightInset'))
    print('-djpeg',['GeckoSkeletonized',num2str(gecko),'.jpg'])
end


    