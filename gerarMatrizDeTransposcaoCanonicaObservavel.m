function T=gerarMatrizDeTransposcaoCanonicaObservavel(Q,A)
    iQ=[inv(Q)];
    sizeM=size(Q);
    sizeM=sizeM(1);
    q=[iQ(:,sizeM)];
    for i=1:size(Q)         %add for every row
        T(:,i)=A^(i-1)*q;   %p*A^i
    end
end