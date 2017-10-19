{$MODE OBJFPC}

program PInter;

uses PBinary, PLinear, PUser;

begin
    while true do begin
        if oracle('Would you like to do a binary search? ') then
            perform_bsearch
        else
            perform_lsearch;
    end;
end.
