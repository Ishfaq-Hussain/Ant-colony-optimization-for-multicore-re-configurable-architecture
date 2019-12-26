e=5;
for vA=4:4:20
   %%index on xls sheet
    d=strcat('c',num2str(e)) 
    
    %%Cache file
    res=strcat('ca1',num2str(vA),'.mat' )
    load(res) 
    xlswrite('var_ant_f.xls', ca_1, 'cache_fr_ants', d)

    %%core file
    res=strcat('co1',num2str(vA),'.mat' )
    load(res)
    xlswrite('var_ant_f.xls', co_1, 'core_fr_ants', d)
    
    %%frequency file
    res=strcat('fr1',num2str(vA),'.mat' )
    load(res)
    xlswrite('var_ant_f.xls', fr_1, 'freq_for_ants', d)
    
    %%tot_pow consumption file
    res=strcat('tot_pow',num2str(vA),'.mat' )
    load(res)
    xlswrite('var_ant_f.xls', tot_pow, 'tot_pow', d)
    
    %%tot_thr file   
    
    res=strcat('tot_thr',num2str(vA),'.mat' )
    load(res)
    xlswrite('var_ant_f.xls', tot_thr, 'tot_thr', d)
    
    
    e=e+26;
    

end