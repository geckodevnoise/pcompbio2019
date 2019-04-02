

%this function shows the skeletonized disk
%with a threshold equal to mean-sigma
%rotated to match the head picture

%%% gecko
%%% 681, 682, 731, 732, 735, 763, 772, 773
%%%
function skeletonized_image=FirstFigure_SkeletonizedHead_Jan28_2016(gecko,f);

switch gecko
    
    case 681
        uncut_image='u681_w9_213.jpg';
        cut_image='c681_w9_213.jpg';
        f_rot=171.4;
        f_resize=213;
        Rx=135; Ry=89; radius=1717;
    case 682
        uncut_image='u682_w9_204.jpg';
        cut_image='c682_w9_204.jpg';
        f_rot=-25.2;
        f_resize=204;
        Rx=109; Ry=109; radius=1665;
	case 731
        uncut_image='u731_w9_200.jpg';
        cut_image='c731_w9_200.jpg';
        f_rot=-22.4;
        f_resize=200;
        Rx=70; Ry=176; radius=1237;
    case 732
        uncut_image='u732_w9_200.jpg';
        cut_image='c732_w9_200.jpg';
        f_rot=119.9;
        f_resize=200;
        Rx=124; Ry=95; radius=1553;
    case 735
        uncut_image='u735_w9_207.jpg';
        cut_image='c735_w9_207.jpg';
        f_rot=10.9;
        f_resize=207;
        Rx=110; Ry=166; radius=1089;
    case 763
        uncut_image='u763_w9_211.jpg';
        cut_image='c763_w9_211.jpg';
        f_rot=-5.1;
        f_resize=211;
        Rx=85; Ry=126; radius=1825;
    case 772
        uncut_image='u772_w9_209.jpg';
        cut_image='c772_w9_209.jpg';
        f_rot=-65.5;
        f_resize=209;
        Rx=100; Ry=96; radius=2925;        
    case 773
        uncut_image='u773_w9_210.jpg';
        cut_image='c773_w9_210.jpg';
        f_rot=-1.1;
        f_resize=210;
        Rx=89; Ry=198; radius=1370;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%scaling considerations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'number of pixels per inch:'
f_resize=f_resize
'number of pixels per cm:'
cm=f_resize/2.54

%start from processed disk
[gecko_disk,ROI]=CutGeckoImageToDisk(gecko);
gecko_image=gecko_disk;

%threshold and binarize
doubled=double(gecko_image).*ROI;
%threshold=mean(doubled(ROI))-std(doubled(ROI));
%threshold=mean(gecko_image(ROI));
threshold=0;
[binary_gecko_disk,adjusted_mean,adjusted_sigma]=BinarizeProcessedGeckoImage(gecko_disk,ROI,threshold);
threshold=adjusted_mean-adjusted_sigma;
[binary_gecko_disk,adjusted_mean,adjusted_sigma]=BinarizeProcessedGeckoImage(gecko_disk,ROI,threshold);
gecko_image=binary_gecko_disk;

%make skeletons
q=3;
binary_gecko_disk=increase_res(binary_gecko_disk,q);
ROI=increase_res(ROI,q);
positive_pattern=bwconvhull(binary_gecko_disk,'objects');
negative_pattern=(positive_pattern==0);
sss=[1 1 1; 1 1 1; 1 1 1];
ss=[0 1 0; 1 1 1; 0 1 0];
s=[1];
peaks=imdilate(bwmorph(positive_pattern,'skel',inf),sss);
valleys=imdilate(bwmorph(negative_pattern,'skel',inf),sss);
skeletons=2*peaks+3*valleys;
gecko_image=skeletons;%just skeletons
gecko_image=skeletons.*ROI+positive_pattern;
gecko_image=max(skeletons.*ROI+binary_gecko_disk,3*peaks);
cm=cm*q;

%cut and rotate
a=round(q*Rx-0.75*cm);
b=round(q*Rx+0.75*cm);
c=round(q*Ry-0.75*cm);
d=round(q*Ry+0.75*cm);
cut=gecko_image(a:b,c:d);
rotated=imrotate(cut,f_rot,'crop');
m=size(rotated);
a=m(1,1);
b=m(1,2);
%rotated(a-q*5:a-q*4,(b-fix(0.75*cm)):(b-fix(0.25*cm)))=255;
rotated(a-q*5:a-q*4,(b-fix(0.6*cm)):(b-fix(0.1*cm)))=max(max(rotated))+1;
figure(f)
imagesc(min(rotated,4)), axis equal, axis off
colormap(flipud(gray))
skeletonized_image=rotated;


