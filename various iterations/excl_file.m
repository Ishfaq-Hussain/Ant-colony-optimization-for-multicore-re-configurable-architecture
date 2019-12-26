e=5;
for vi=3:3:18
   
    %%index for xls sheet
    d=strcat('c',num2str(e))
   
    %%cache file 
    res=strcat('ca1',num2str(vi),'.mat' )
    load(res)
    xlswrite('var_itr_f.xls', ca_1, 'cache_fr_iterations', d)
    
    %%core file
    res=strcat('co1',num2str(vi),'.mat' )
    load(res)
    xlswrite('var_itr_f.xls', co_1, 'core_fr_iterations', d)
   
    %%frequency file
    res=strcat('fr1',num2str(vi),'.mat' )
    load(res)
    xlswrite('var_itr_f.xls', fr_1, 'freq_foriteration', d)
    
    %%tot_pow consumption file
    res=strcat('tot_pow',num2str(vi),'.mat' )
    load(res)
    xlswrite('var_itr_f.xls', tot_pow, 'tot_pow', d)
    
    %%tot_thr file       
    res=strcat('tot_thr',num2str(vi),'.mat' )
    load(res)
    xlswrite('var_itr_f.xls', tot_thr, 'tot_thr', d)
    
    
    
    e=e+26;
    
    
end
   
   