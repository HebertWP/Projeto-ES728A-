function E=gerarMatrizControbilidade(A,B)
    for i=1:size(A)         %add one row per time
        E(:,i)=A^(i-1)*B;   %A^i*B
    end
end