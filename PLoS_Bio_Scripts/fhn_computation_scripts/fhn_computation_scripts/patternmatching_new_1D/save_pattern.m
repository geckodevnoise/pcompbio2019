function save_pattern(GG,thresh,iter)

pattern=GG<=thresh;
filename=['example' num2str(iter) '.jpg'];
imwrite(pattern,filename);



end

