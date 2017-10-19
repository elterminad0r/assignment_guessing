{$MODE OBJFPC}

unit PBinary;

interface

procedure perform_bsearch;

implementation

uses PUser, SysUtils;

function binary_search(lower, upper: integer): integer;
var
    mid: integer;
    is_ge: boolean;
begin
    while upper - lower > 1 do begin
        writeln(#13#10 + '(lo ', lower, ', hi ', upper, ')');
        mid := (upper + lower) div 2;
        is_ge := oracle('Is your number greater than or equal to ' + IntToStr(mid) + '? ');
        if is_ge then
            lower := mid
        else
            upper := mid;
    end;
    binary_search := lower;
end;

procedure perform_bsearch;
var
    guess: integer;
    lower, upper: integer;
begin
    read_lohi(1, 101, lower, upper);
    writeln('welcome to the binary search game! Think of a number: ', lower, ' <= x < ', upper);
    guess := binary_search(lower, upper);
    writeln('your number was ', guess);
end;

end.
