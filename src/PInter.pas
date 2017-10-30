{$MODE OBJFPC}

program PInter;

uses PBinary, PLinear, PUser, PFracLinear;

begin
    while true do begin
        if oracle('Would you like to do a binary search? ') then
            perform_bsearch
        else if oracle('Would you like to perform a rational linear search? ') then
            perform_fraclsearch
        else
            perform_lsearch;
    end;
end.
