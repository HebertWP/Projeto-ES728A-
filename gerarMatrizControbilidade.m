
function E=gerarMatrizControbilidade(A,B)
    for i=1:size(A)
        E(:,i)=A^(i-1)*B;
    end
end