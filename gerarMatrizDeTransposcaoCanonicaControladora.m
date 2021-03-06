function T=gerarMatrizDeTransposcaoCanonicaControladora(E,A)
    inver=inv(E);
    sizeM=size(E);
    sizeM=sizeM(1,1);
    p=inver(sizeM,:);
    
    for i=1:size(E)
        T(i,:)=p*A^(i-1);
    end
    T=inv(T);
end 
