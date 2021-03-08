function T=gerarMatrizDeTransposcaoCanonicaControladora(E,A)
    inver=inv(E);%inverse of E
    sizeM=size(E);
    sizeM=sizeM(1,1);%take the number of last line
    p=inver(sizeM,:);%p igual to last line
    for i=1:size(E)         %add for every row
        T(i,:)=p*A^(i-1);   %p*A^i
    end
    T=inv(T);
end