function [pks_loc,locs_loc]=Eliminate_adjacent_peaks(pks_loc,locs_loc)
if size(pks_loc,2)>1
    A=locs_loc;
    B=pks_loc;
    i=1;
    while i<length(A)
        if (A(i+1)-A(i))<4
            A(i+1) = [];
            B(i+1) = [];
        else
            i = i + 1;
        end
    end
end
end