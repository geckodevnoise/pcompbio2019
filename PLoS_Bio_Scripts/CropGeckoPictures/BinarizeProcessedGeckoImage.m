
%this takes a given processed image 
%and processes it accordingly:

%1. applies the threshold
%2. fills regions
%3. empties noise

function [binary_gecko_disk,adjusted_mean,adjusted_sigma]=BinarizeProcessedGeckoImage_Jan28_2016(gecko_disk,ROI,threshold)



%1. Using processed gecko image
gecko_image=gecko_disk;
gecko_image=adapthisteq(gecko_image,'NumTiles',[25,25]);
adjusted_mean=mean(gecko_image(ROI==1));
adjusted_sigma=std(double(gecko_image(ROI==1)));

%2. Apply threshold.
%threshold=mean(gecko_image(ROI==1))-std(double(gecko_image(ROI==1)))
positive_pattern=(gecko_image<threshold).*(ROI==1);
gecko_image=positive_pattern;

%3. Fill holes in regions
positive_pattern=bwareaopen(positive_pattern,10);
positive_pattern=imfill(positive_pattern==1,'holes');


%4. Remove stray pixels
negative_pattern=(positive_pattern==0);
negative_pattern=bwareaopen(negative_pattern,10,4);


%5. Smooth contour
negative_pattern=imerode(negative_pattern,[1 1; 1 1]);
binary_gecko_disk=(negative_pattern==0);
% %fill holes again
% binary_gecko_disk=imfill(binary_gecko_disk==1,'holes');

%% A and B
% % %1. Using processed gecko image
% % gecko_image=gecko_disk;
% % 
% % %2. Apply threshold.
% % positive_pattern=(gecko_image<threshold).*(ROI==1);
% % gecko_image=positive_pattern;
% % 
% % %3. Fill holes in regions
% % positive_pattern=bwareaopen(positive_pattern,10);
% % 
% % %4. Remove stray pixels
% % negative_pattern=(positive_pattern==0);
% % negative_pattern=bwareaopen(negative_pattern,10,4);
% % 
% % %5. Smooth contour
% % negative_pattern=imerode(negative_pattern,[1 1; 1 1]);
% % binary_gecko_disk=(negative_pattern==0);
