function [An,Bn,Cn]=aplicarTranformacaodeSimiliraridade(A,B,C,T)
    An=inv(T)*A*T;
    Bn=inv(T)*B;
    Cn=C*T;
end

