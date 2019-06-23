{$MODE OBJFPC}

unit UFracLinear;

interface

procedure perform_fraclsearch;

implementation

uses UUser, SysUtils;

function gcd(a, b: integer): integer;
var
  temp: integer;
begin
  while b <> 0 do begin
    temp := b;
    b := a mod b;
    a := temp;
  end;
  gcd := a
end;

procedure linear_search(out o_x: integer;
                        out o_y: integer);
var
    x: integer = 0;
    y: integer = 0;
begin
    while (y = 0) or (gcd(x, y) <> 1) or
      (not oracle('Is your number equal to ' + IntToStr(x) + '/' + IntToStr(y) + '? ')) do
        if (x >= 0) and (y = 0) then begin
            x := x + 1;
            y := y + 1;
        end else if (x > 0) and (-x <= y) and (y < x) then
            y := y + 1
        else if (y > 0) and (-y < x) and (x <= y) then
            x := x - 1
        else if (x < 0) and (x < y) and (y <= -x) then
            y := y - 1
        else
            x := x + 1;
    o_x := x;
    o_y := y;
end;

procedure perform_fraclsearch;
var
    guessx, guessy: integer;
begin
    writeln('Think of a rational number');
    linear_search(guessx, guessy);
    writeln('Your number was ', guessx, '/', guessy);
end;
end.
