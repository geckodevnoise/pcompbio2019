

%on May 23rd
%added a line to FirstFigure_HeadCutToDisk_Jan28_2016
%to calculate the diameter of the gecko spot

% gecko_labels=[681   682   731   732   735   763   772   773];
% all_diameters=[];
% for i=1:8
% gecko=gecko_labels(i);
% all_diameters(i)=ExtractRadius_HeadCutToDisk_May23_2017(gecko,f);
% end
% all_diameters =[0.9898    1.0334    0.9017    1.0033    0.8221    1.0232    1.3004    0.8830];



%this function shows the processed disk
%rotated to match the head picture

%%% gecko
%%% 681, 682, 731, 732, 735, 763, 772, 773
%%%


function disk_diameter=ExtractRadius_HeadCutToDisk_May23_2017(gecko,f);
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

[gecko_disk,ROI]=CutGeckoImageToDisk(gecko);
gecko_image=double(gecko_disk).*ROI;
track_center=ROI;
%cut and rotate
a=round(Rx-0.75*cm);
b=round(Rx+0.75*cm);
c=round(Ry-0.75*cm);
d=round(Ry+0.75*cm);
track_center=track_center+0.0;
track_center(Rx,Ry)=5;
cut=gecko_image(a:b,c:d);
cut2=ROI(a:b,c:d);
cut3=track_center(a:b,c:d);
rotated=imrotate(cut,f_rot,'crop');
rotated2=imrotate(cut2,f_rot,'crop');
rotated3=imrotate(cut3,f_rot,'crop');
[newRx,newRy]=find(rotated3==5)
m=size(rotated);
a=m(1,1);
b=m(1,2);
rotated(rotated2==0)=255;
%rotated(a-5:a-4,(b-fix(0.75*cm)):(b-fix(0.25*cm)))=255;
rotated(a-5:a-4,(b-fix(0.6*cm)):(b-fix(0.1*cm)))=0;
figure(f)
imagesc(rotated), axis equal
set(gca,'XTick',[])
set(gca,'YTick',[])
colormap gray
cut_gecko_image=rotated;
[m,n]=size(cut_gecko_image)
blank_slate=ones(fix(cm*10),fix(cm*10))*255;
newBSx=fix(cm*10/2);
newBSy=fix(cm*10/2);
a=newBSx-fix(m/2);
b=newBSx+fix(m/2);
c=newBSy-fix(n/2);
d=newBSy+fix(n/2);
blank_slate(a:b,c:d)=cut_gecko_image;
hw=fix(.75*cm);
blank_slate=blank_slate(newBSx-hw:newBSx+hw,newBSy-hw:newBSy+hw);
cut_gecko_image=blank_slate;
size(cut_gecko_image)
figure(f)
imagesc(cut_gecko_image), axis equal
set(gca,'XTick',[])
set(gca,'YTick',[])
xlim([1,2*hw])
ylim([1,2*hw])

'number of pixels per cm:'
cm=f_resize/2.54
'diameter in pixels'
dm=sum(cut_gecko_image(:,newRy)<255)
'absolute diameter of the cut disk'
disk_diameter=dm/cm




