for v_i=3:3:18
    maxit=v_i;
    res=strcat('maxit1',num2str(v_i),'.mat' )
    save('res')
end