function L=acharL(r,Q,T,Ao)
    polyObserver=poly(r)
    polyObserver=flip(polyObserver)
    aux=size(polyObserver)
    polyObserver=polyObserver(1:aux(2)-1)
    polyObserver=transpose(polyObserver)
    aux=size(Q)
    lObservador=polyObserver+Ao(:,aux(1))
    L=T*lObservador
end