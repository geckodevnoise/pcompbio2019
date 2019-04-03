%this was modified on Dec 20th
function [peak_length]=find_peak_lengths_binary_disk(binary_gecko_disk,ROI,f_resize);



positive_pattern=binary_gecko_disk.*ROI;
positive_pattern=binary_gecko_disk;%Dec 20
%figure(3), imagesc(positive_pattern)
%%% total_area=sum(sum(double(positive_pattern))); 
%what was I thinking there???
total_area=sum(sum(ROI));
negative_pattern=(binary_gecko_disk==0);
%%% Calculating Peak Length
peak_area=sum(sum(bwmorph(positive_pattern,'skel',inf).*ROI));
valley_area=sum(sum(bwmorph(negative_pattern,'skel',inf).*ROI));
cm=f_resize/2.54;
peak_length=2*total_area/(peak_area+valley_area)/cm;
figure(1)
%subplot(1,2,2)
imagesc(bwmorph(negative_pattern,'skel',inf).*ROI+ROI+bwmorph(positive_pattern,'skel',inf).*ROI)