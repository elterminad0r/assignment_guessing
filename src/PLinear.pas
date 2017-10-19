{$MODE OBJFPC}

unit PLinear;

interface

procedure perform_lsearch;

implementation

uses PUser, SysUtils;

function linear_search: integer;
var
    i: integer = 0;
begin
    while not oracle('Is your number equal to ' + IntToStr(i) + '? ') do
        if i <= 0 then
            i := -i + 1
        else
            i := -i;
    linear_search := i;
end;

procedure perform_lsearch;
var
    guess: integer;
begin
    writeln('Think of a number x >= 0');
    guess := linear_search;
    writeln('Your number was ', guess);
end;

end.
