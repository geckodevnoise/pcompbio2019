
function figure_eight_gecko_radii_Dec18(f)

gecko_labels=[681   682   731   732   735   763   772   773];
 
figure(f)
for i=1:8
    gecko=gecko_labels(i)
    draw_gecko_cloud_Dec18(gecko,[.6 .6 .6],f);
end
for i=1:8
    gecko=gecko_labels(i)
    draw_gecko_radius_Dec18(gecko,50,f,'m');
end