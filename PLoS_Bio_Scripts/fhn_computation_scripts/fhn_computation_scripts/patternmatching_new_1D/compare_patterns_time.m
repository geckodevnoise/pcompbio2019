GG=gridrepresentation(c1u*UU(2,:)');

[dd, thresh]=find_threshold(GG);

pattern=GG<=thresh;
figure
subplot(1,2,1)
imagesc(pattern);
title(['t=25        d=' num2str(dd)]);

GG=gridrepresentation(c1u*UU(3,:)');
[dd, thresh]=find_threshold(GG);

pattern=GG<=thresh;
subplot(1,2,2)
imagesc(pattern);
title(['end time t_{end}=' num2str(te) '           d=' num2str(dd)]);