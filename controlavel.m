function out=controlavel(E)
    if rank(E)==size(E)
        out=true;
    else
        out=false;
    end
end
    