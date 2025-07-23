{Dado el siguiente programa, indicar cuál es el error y su causa:}

program alcance3;
var
    a: integer;
procedure uno;
var
    b: integer;
begin
    b:= 2;
    writeln(b);
end;

begin   
    a:= 1;
    uno;
    writeln(a, b);
end.

{Respuesta:
    - El error se trata de la variable 'b', debido a que no se encuentra identificada. Por lo que, el programa no la encontrará.}