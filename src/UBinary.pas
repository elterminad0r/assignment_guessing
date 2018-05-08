{$MODE OBJFPC}

unit UBinary;

interface

procedure perform_bsearch;

implementation

uses UUser, SysUtils;

function binary_search(lower, upper: integer): integer;
var
    mid: integer;
    is_ge: boolean;
begin
    // the upper bound is a strict bound
    while upper - lower > 1 do begin
        mid := (upper + lower) div 2;
        is_ge := oracle('Is your number greater than or equal to ' + IntToStr(mid) + '? ');
        if is_ge then
            lower := mid
        else
            upper := mid;
    end;
    binary_search := lower;
end;

procedure binary_find_bounds(out o_lower: integer;
                             out o_upper: integer);
var
    lower: integer = 1;
    upper: integer = 2;
begin
    writeln('This is the stage where I determine some bounds on your number. I'
           , ' will be asking questions about the *magnitude* of your number,'
           , ' so watch out.');
    if oracle('Is your number 0? ') then begin
        o_lower := 0;
        o_upper := 1;
    end else begin
        while not oracle('Is your number some x such that ' +
          IntToStr(lower) + ' <= |x| < ' + IntToStr(upper) + '? ') do begin
            lower := lower * 2;
            upper := upper * 2;
        end;
        if oracle('Is your number greater than or equal to 0? ') then begin
            o_lower := lower;
            o_upper := upper;
        end else begin
            o_lower := - upper + 1;
            o_upper := - lower - 1;
        end;
    end;
end;

procedure perform_bsearch;
var
    guess: integer;
    lower, upper: integer;
begin
    writeln('welcome to the binary search game! Think of an integer.');
    binary_find_bounds(lower, upper);
    guess := binary_search(lower, upper);
    writeln('your number was ', guess);
end;

end.
