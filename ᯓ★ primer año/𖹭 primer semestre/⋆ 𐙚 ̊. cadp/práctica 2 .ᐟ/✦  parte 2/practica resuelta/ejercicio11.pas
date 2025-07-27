{Realizar un program modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón A%B*, donde: 
    • A es una secuencia de caracteres en la que no existe el caracter '$'.
    • B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparecen a lo sumo 3 veces el caracter '@'.
    • Los caracteres % y * seguro existen.
    
    Nota: En caso de no cumplir, informar que parte del patrón no se cumplió.}

program once;
procedure cumpleA(var cumple: boolean; var cant: integer);
var 
    sec: char;
begin
    cant:= 0;
    readln(sec);
    while(sec <> '$') and (cumple) do begin
        cant:= cant + 1;
        readln(sec);
    end;
end;

procedure cumpleB(cant: integer; var cumple: boolean);
var
    sec: char;
    cantAt, cant2: integer;
begin
    cantAt, cant2:= 0;
    readln(sec);
    while(sec <> '*') and (cant2 < cant) and (cantAt < 3) and (cumple) do begin
        if( sec = '@') then
            cantAt:= cantAt + 1;
        cant2:= cant2 + 1;
        readln(sec);
    end;
end;

procedure verificar;
var
    cumple: boolean;
    cant: integer;
begin
    cumple:= true;
    cumpleA(cumple, cant);
    if(cumple) then begin
        cumpleB(cant, cumple);
        if(cumple) then 
            writeln('Ambos cumplen')
        else
            writeln('No cumple B');
    end
    else writeln('No cumple A');
end;

begin
    verificar();
end.