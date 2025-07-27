{Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón A$B#, donde:
    • A es una secuencia de solo tres vocales.
    • B es una secuencia de solo caracteres alfabéticos sin letras vocales.
    • Los caracteres $ y # seguro existen.

    Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program diez; 
function vocales(c: char): boolean;
begin
    if((c = 'a') or (c = 'e') or (c = 'i') or (c = 'o') or (c = 'u')) then
        vocal:= true
    else 
        vocal:= false;
end;

procedure cumpleA(var cumple: boolean);
var 
    sec: char;
    cant: integer;
begin
    cant:= 0;
    readln(sec);
    if(vocal(sec) = true) then begin
        cant:= cant + 1;
        readln(sec);
    end
    else cumple:= false;
    while(sec <> '$') and (sec <> '#') and (cant < 4) do begin
        if(vocal(sec) = true) then begin
            cant:= cant + 1;
            readln(sec);
        end
        else cumple:= false;
    end;
end;

procedure cumpleB(var cumple: boolean);
var
    sec: char;
begin
    readln(sec);
    if(vocal(sec) = false) then
        readln(sec)
    else
        cumple:= false;
    while(sec <> '#') do begin
        if(vocal(sec) = false) do
            readln(sec)
        else
            cumple:= false;
    end;
end;

procedure verificar;
var 
    cumple: boolean;
begin
    cumple:= true;
    cumpleA(cumple);
    if(cumple) then begin
        cumpleB(cumple);
        if(cumple) then 
            writeln('Cumplen ambos')
        else
            writeln('No cumple B');
    end
    else writeln('No cumple A');
end;

begin
    verificar();
end.