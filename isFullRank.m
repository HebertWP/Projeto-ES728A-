%{
    @brief Return true if the matriz have full rank
    @param: E matriz to be checked 
%}
function out=isFullRank(E)
    if rank(E)==size(E)
        out=true;
    else
        out=false;
    end
end