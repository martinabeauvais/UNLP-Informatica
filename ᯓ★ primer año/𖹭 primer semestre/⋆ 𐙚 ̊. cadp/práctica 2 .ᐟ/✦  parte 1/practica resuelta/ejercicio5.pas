{Dado el siguiente programa, indicar cuál es el error:}

program alcance4;
function cuatro:integer;
begin
    cuatro:= 4;
end;

var
    a: integer;
begin
    cuatro;
    writeln(a);
end.

{Respuesta:
    - La variable 'a' no se encuentra inicializada; por lo que imprimirá basura.}