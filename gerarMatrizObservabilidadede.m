function E=gerarMatrizObservabilidadede(A,C)
    for i=1:size(A)
        E(i,:)=C*A^(i-1);
    end
end