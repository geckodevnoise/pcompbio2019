
function create_praeter_naturam

%point A
for number=1:3
    fu=.805;
    FT=1.0;
    show_one_phenotype_fu_FT_Sept09_2017(fu,FT,number,9)
    name=['A_fu',num2str(fu*1000),'FT',num2str(FT*1000),'_',num2str(number),'.jpg']
    print('-djpeg',name)
end

%point B
for number=1:3
    fu=.835;
    FT=1.0;
    show_one_phenotype_fu_FT_Sept09_2017(fu,FT,number,9)
    name=['B_fu',num2str(fu*1000),'FT',num2str(FT*1000),'_',num2str(number),'.jpg']
    print('-djpeg',name)
end