
%this function shows the whole head
%rotated so that the head is pointing at 180 degrees

%this shows a subset of the uncut image
%however
%all the analyses are done on the cut image
%which is also always shown rotated
%but the rotation must be done after the analyses

%%% gecko
%%% 681, 682, 731, 732, 735, 763, 772, 773
%%%
function uncut=FirstFigure_UncutHead_Jan27_2016(gecko,f);

cd OriginalGeckoImages
switch gecko
    

    
    case 681
        uncut_image='u681_w9_213.jpg';
        cut_image='c681_w9_213.jpg';
        f_rot=171.4;
        f_resize=213;
        hcx=163; hcy=204;%head center coordinates
        %these apply only for the uncut head
    case 682
        uncut_image='u682_w9_204.jpg';
        cut_image='c682_w9_204.jpg';
        f_rot=-25.2;
        f_resize=204;
        hcx=164; hcy=191;%head center coordinates
	case 731
        uncut_image='u731_w9_200.jpg';
        cut_image='c731_w9_200.jpg';
        f_rot=-22.4;
        f_resize=200;
        hcx=159; hcy=180;%head center coordinates
    case 732
        uncut_image='u732_w9_200.jpg';
        cut_image='c732_w9_200.jpg';
        f_rot=119.9;
        f_resize=200;
        hcx=221; hcy=253;%head center coordinates
    case 735
        uncut_image='u735_w9_207.jpg';
        cut_image='c735_w9_207.jpg';
        f_rot=10.9;
        f_resize=207;
        hcx=179; hcy=168;%head center coordinates
    case 763
        uncut_image='u763_w9_211.jpg';
        cut_image='c763_w9_211.jpg';
        f_rot=-5.1;
        f_resize=211;
        hcx=172; hcy=192;%head center coordinates
    case 772
        uncut_image='u772_w9_209.jpg';
        cut_image='c772_w9_209.jpg';
        f_rot=-65.5;
        f_resize=209;
        hcx=181; hcy=146;%head center coordinates        
    case 773
        uncut_image='u773_w9_210.jpg';
        cut_image='c773_w9_210.jpg';
        f_rot=-1.1;
        f_resize=210;
        hcx=165; hcy=202;%head center coordinates 
        

end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%scaling considerations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'number of pixels per inch:'
f_resize=f_resize
'number of pixels per cm:'
cm=f_resize/2.54

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% STEP 0
%%% Using Original Uncut Head
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gecko_image=imread(uncut_image);
gecko_image=gecko_image(:,:,1);
%cut and rotate
rotated=imrotate(gecko_image,f_rot,'crop');
a=round(hcy-1.0*cm);
b=round(hcy+1.0*cm);
c=round(hcx-1.5*cm);
d=round(hcx+1.5*cm);

a=round(hcy-0.75*cm);
b=round(hcy+0.75*cm);
c=round(hcx-1.5*cm);
d=round(hcx+1.5*cm);


cut=rotated(a:b,c:d);
x=size(cut);
a=x(1,1);
b=x(1,2);
cut(a-13:a-11,(b-fix(0.75*cm)):(b-fix(0.25*cm)))=0;
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%% making figure here
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
figure(f)
imagesc(cut)
%axis equal, axis off
colormap gray
cd ..





