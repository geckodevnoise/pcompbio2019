
function [PeakLengths]=find_peak_lengths_Jan192016(rectangle,f_resize);

%this code finds the point from which we can draw the largest circle and uses that as the center



mu=mean(mean(rectangle))
sigma=std(double(rectangle(rectangle>=0)))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% STEP 3
PeakLengths=[];
for threshold=floor(mu-sigma):ceil(mu+sigma)
    positive_pattern=(rectangle<threshold);
    negative_pattern=(rectangle>threshold);

    total_area=sum(sum(double(rectangle>=0)));
%%% Calculating Peak Length
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cm=f_resize/2.54;
    peak_area=sum(sum(bwmorph(positive_pattern,'skel',inf)));
    valley_area=sum(sum(bwmorph(negative_pattern,'skel',inf)));
    peak_length_interval=2*total_area/(peak_area+valley_area)/cm;
    PeakLengths=[PeakLengths,peak_length_interval];
end

PeakLengths=[];
for threshold=floor(mu-sigma):ceil(mu+sigma)
    positive_pattern=(rectangle<threshold);
    negative_pattern=(rectangle>threshold);

    total_area=sum(sum(double(rectangle>=0)));
%%% Calculating Peak Length
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cm=f_resize/2.54;
S1=bwmorph(positive_pattern,'skel',inf);
S2=bwmorph(negative_pattern,'skel',inf);
    peak_area=sum(sum(S1(6:51,6:84)));
    valley_area=sum(sum(S2(6:51,6:84)));
    peak_length_interval=2*total_area/(peak_area+valley_area)/cm;
    PeakLengths=[PeakLengths,peak_length_interval];
end

