{$MODE OBJFPC}

unit UFracBinary;

interface

procedure perform_fracbsearch;

implementation

uses UUser, SysUtils;

// Binary search on a rational using a Stern-Brocot tree.
procedure binary_search(out o_x: integer;
                        out o_y: integer);
var
    mid_x, mid_y: integer;
    lo_x: integer = 0;
    lo_y: integer = 1;
    hi_x: integer = 1;
    hi_y: integer = 0;
    is_ge: boolean;
begin
    if oracle('Is your number equal to 0? ') then begin
        o_x := 0;
        o_y := 1;
    end else begin
        repeat
            mid_x := lo_x + hi_x;
            mid_y := lo_y + hi_y;
            is_ge := oracle('is your number q such that '
                          + IntToStr(mid_x) + '/' + IntToStr(mid_y)
                          + ' <= |q|? ');
            if is_ge then begin
                lo_x := mid_x;
                lo_y := mid_y;
            end else begin
                hi_x := mid_x;
                hi_y := mid_y;
            end;
        until is_ge and oracle('is your number q such that |q| = '
                          + IntToStr(mid_x) + '/' + IntToStr(mid_y) + '? ');
        o_x := mid_x;
        o_y := mid_y;
        if oracle('Is your number less than 0? ') then
            o_x := -mid_x;
    end;
end;

procedure perform_fracbsearch;
var
    guess_x, guess_y: integer;
begin
    writeln('Welcome to the binary search game! Think of a rational number.');
    binary_search(guess_x, guess_y);
    writeln('your number was ', guess_x, '/', guess_y);
end;

end.
