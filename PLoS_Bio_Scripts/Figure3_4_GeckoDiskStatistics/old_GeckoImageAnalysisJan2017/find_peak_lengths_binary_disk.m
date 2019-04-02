
function [peak_length]=find_peak_lengths_binary_disk(binary_gecko_disk,ROI,f_resize);



positive_pattern=binary_gecko_disk.*ROI;
positive_pattern=binary_gecko_disk;
%figure(3), imagesc(positive_pattern)
%%% total_area=sum(sum(double(positive_pattern))); 
%what was I thinking there???
total_area=sum(sum(ROI));
negative_pattern=(binary_gecko_disk==0);
%%% Calculating Peak Length
peak_area=sum(sum(bwmorph(positive_pattern,'skel',inf).*ROI));
figure(3)
% subplot(1,2,1)
imagesc(bwmorph(positive_pattern,'skel',inf).*ROI)
%imagesc(positive_pattern)
valley_area=sum(sum(bwmorph(negative_pattern,'skel',inf).*ROI));
figure(3)
%subplot(1,2,2)

skeletons=bwmorph(negative_pattern,'skel',inf)+2*bwmorph(positive_pattern,'skel',inf);
imagesc(skeletons.*ROI)
axis square
colormap(flipud(gray))
%imagesc(negative_pattern.*ROI)
peak_length=2*total_area/(peak_area+valley_area)
cm=f_resize/2.54;
peak_length=2*total_area/(peak_area+valley_area)/cm;
inches=f_resize;
peak_length=2*total_area/(peak_area+valley_area)/inches;

