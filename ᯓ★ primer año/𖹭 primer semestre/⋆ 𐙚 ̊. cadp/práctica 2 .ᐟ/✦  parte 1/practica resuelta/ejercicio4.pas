{Dado los siguientes programas, explicar la diferencia}

{Programa a}
program alcance4a;
var 
    a, b: integer;
procedure uno;
begin
    a:= 1;
    writeln(a);
end;

begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.

{Programa b}
program alcance4b;
procedure uno;
begin
    a:= 1;
    writeln(a);
end;

var
    a, b: integer;
begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.


{Respuesta:
    - El programa A tiene variables globales, mientras que el programa B tiene variables locales. Por lo que, en el programa B, no se ejecutará ya que no encontrará a la variable 'a', ni como una variable local al procedure ni como una global.}