{$MODE OBJFPC}

program PInter;

uses PBinary, PLinear, PUser, PFracLinear, PFracBinary;

// 'user interface' to the implemented algorithms and procedures
begin
    while true do begin
        if oracle('Would you like to perform an integer binary search? ') then
            perform_bsearch
        else if oracle('Would you like to perform a rational binary search? ') then
            perform_fracbsearch
        else if oracle('Would you like to perform an integer linear search? ') then
            perform_lsearch
        else if oracle('Would you like to perform a rational linear search? ') then
            perform_fraclsearch;
    end;
end.
