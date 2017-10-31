{$MODE OBJFPC}

unit PUser;

interface

function oracle(msg: string): boolean;
procedure read_lohi(lo_default, hi_default: integer;
                    out low_val, hi_val: integer);

implementation

uses SysUtils;

type
    OracleFunction = function(query: integer): boolean;

// 'oracle' function to ask a boolean question of a user
function oracle(msg: string): boolean;
var
    usr_input: string;
begin
    write(msg);
    readln(usr_input);
    if (length(usr_input) > 0) and (LowerCase(usr_input)[1] = 'y') then
        oracle := true
    else
        oracle := false;
end;

procedure read_lohi(lo_default, hi_default: integer;
                    out low_val, hi_val: integer);
begin
    try
        if ParamCount >= 1 then
            low_val := StrToInt(ParamStr(1))
        else
            low_val := lo_default;
        if ParamCount >= 2 then
            hi_val := StrToInt(ParamStr(2))
        else
            hi_val := hi_default;
    except
        on E: EConvertError do begin
            writeln('Conversion error occurred, reverting to defaults');
            low_val := lo_default;
            hi_val := hi_default;
        end;
    end;
end;

initialization
begin   
    writeln('To answer affirmatively, you should write anything starting with '
          , 'a "y". Anything else will be considered negative. Lower and upper'
          , ' bounds can be provided in argv');
end;

end.
